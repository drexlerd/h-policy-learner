from re import sub
from turtle import color
import dlplan
import logging
import math

from copy import deepcopy
from collections import defaultdict, deque
from typing import  List, Dict
from termcolor import colored

from learner.src.returncodes import ExitCode
from learner.src.util.command import create_experiment_workspace, read_file, write_file
from learner.src.util.clock import Clock
from learner.src.domain_data.domain_data_factory import DomainDataFactory
from learner.src.instance_data.instance_information import InstanceInformation
from learner.src.instance_data.instance_data import InstanceData
from learner.src.instance_data.instance_data_factory import InstanceDataFactory
from learner.src.instance_data.tuple_graph_factory import TupleGraphFactory
from learner.src.iteration_data.sketch import Sketch
from learner.src.iteration_data.hierarchical_sketch import HierarchicalSketch
from learner.src.iteration_data.domain_feature_data import DomainFeatureData, Features, Feature
from learner.src.learn_sketch_explicit import learn_sketch

def compute_delta_optimal_states(instance_data: InstanceData, delta: float, s_idx: int, goal_distances: Dict[int, int]):
    state_space = instance_data.state_space
    fringe_state_indices = set()
    state_indices = set()
    state_indices.add(s_idx)
    optimal_cost = goal_distances.get(s_idx, math.inf)
    assert optimal_cost != math.inf
    delta_optimal_cost = delta * optimal_cost
    queue = deque()
    queue.append(s_idx)
    forward_distances = dict()
    forward_distances[s_idx] = 0
    forward_successors = state_space.get_forward_successor_state_indices()
    while queue:
        source_idx = queue.popleft()
        source_cost = forward_distances.get(source_idx)
        for target_idx in forward_successors.get(source_idx, []):
            if target_idx not in forward_distances:
                forward_distances[target_idx] = source_cost + 1
                target_distance = goal_distances.get(target_idx, math.inf)
                if source_cost + target_distance <= delta_optimal_cost:
                    state_indices.add(target_idx)
                    if target_distance != 0:
                        # not not add states after the goal.
                        queue.append(target_idx)
                else:
                    fringe_state_indices.add(target_idx)
    return state_indices, fringe_state_indices


def make_subproblems(config, instance_datas: List[InstanceData], sketch: dlplan.Policy, rule: dlplan.Rule, width: int):
    features = sketch.get_boolean_features() + sketch.get_numerical_features()
    subproblem_instance_datas = []
    for instance_data in instance_datas:
        state_space = instance_data.state_space
        goal_distance_information = instance_data.goal_distance_information
        state_information = instance_data.state_information
        # 1. Compute feature valuations F over Phi for each state
        # We consider feature valuations of all states: solvable and unsolvable, goals and nongoals
        # to be able to instantiate subproblems with all of them.
        feature_valuation_to_s_idxs = defaultdict(set)
        for s_idx in state_space.get_state_indices():
            feature_valuation = tuple([feature.evaluate(state_information.get_state(s_idx)) for feature in features])
            feature_valuation_to_s_idxs[feature_valuation].add(s_idx)
        # 2. For each f in F with f satisfies C ...
        global_deadends = goal_distance_information.get_deadend_state_indices()
        covered_initial_s_idxs = set()
        novelty_base = dlplan.NoveltyBase(len(state_space.get_instance_info().get_atoms()), max(1, width))
        for _, initial_s_idxs in feature_valuation_to_s_idxs.items():
            # 2.1. Compute set of initial states, i.e., all s such that f(s) = f,
            if not rule.evaluate_conditions(state_information.get_state(next(iter(initial_s_idxs))), instance_data.denotations_caches):
                continue
            # 2.2. Compute set of goal states, i.e., all s' such that (f(s), f(s')) satisfies E.
            goal_s_idxs = set()
            for _, target_s_idxs in feature_valuation_to_s_idxs.items():
                if not rule.evaluate_effects(state_information.get_state(next(iter(initial_s_idxs))), state_information.get_state(next(iter(target_s_idxs))), instance_data.denotations_caches):
                    continue
                goal_s_idxs.update(target_s_idxs)
            if not goal_s_idxs:
                continue
            # 3. Compute goal distances of all initial states.
            # Do backward search from goal states until all initial states are reached.
            old_goal_distance_information = instance_data.goal_distance_information
            old_goal_state_indices = instance_data.state_space.get_goal_state_indices()
            instance_data.state_space.set_goal_state_indices(goal_s_idxs)
            instance_data.goal_distance_information = instance_data.state_space.compute_goal_distance_information()
            # sort initial states by distance
            sorted_initial_s_idxs = sorted(initial_s_idxs, key=lambda x : -instance_data.goal_distance_information.get_goal_distances().get(x, math.inf))
            for initial_s_idx in sorted_initial_s_idxs:
                if initial_s_idx in covered_initial_s_idxs:
                    continue
                if not instance_data.goal_distance_information.is_alive(initial_s_idx):
                    continue
                name = f"{instance_data.instance_information.name}-{initial_s_idx}"
                state_indices, fringe_state_indices = compute_delta_optimal_states(instance_data, config.delta, initial_s_idx, instance_data.goal_distance_information.get_goal_distances())
                state_indices_opt, fringe_state_indices_opt = compute_delta_optimal_states(instance_data, 1, initial_s_idx, instance_data.goal_distance_information.get_goal_distances())

                subproblem_initial_s_idxs = set()
                for initial_s_prime_idx in initial_s_idxs:
                    if initial_s_prime_idx in state_indices_opt:
                        if initial_s_prime_idx in goal_s_idxs:
                            # goal state in subproblem can still be initial state in other subproblem, e.g.,
                            # having delivered one package
                            continue
                        if not instance_data.goal_distance_information.is_alive(initial_s_prime_idx):
                            continue
                        subproblem_initial_s_idxs.add(initial_s_prime_idx)
                # subproblem_initial_s_idxs = {initial_s_idx}
                assert initial_s_idx in subproblem_initial_s_idxs
                covered_initial_s_idxs.update(subproblem_initial_s_idxs)
                # 6. Instantiate subproblem for initial state and subgoals.
                subproblem_state_space = dlplan.StateSpace(
                    instance_data.state_space,
                    state_indices,
                    state_indices.union(fringe_state_indices))
                subproblem_state_space.set_initial_state_index(initial_s_idx)
                subproblem_state_space.set_goal_state_indices(goal_s_idxs.intersection(state_indices).difference(global_deadends))
                subproblem_goal_distance_information = subproblem_state_space.compute_goal_distance_information()
                if not subproblem_goal_distance_information.is_solvable():
                    continue
                subproblem_instance_information = InstanceInformation(
                    name,
                    instance_data.instance_information.filename,
                    instance_data.instance_information.workspace / f"rule_{rule.get_index()}" / name)
                subproblem_state_information = subproblem_state_space.compute_state_information()
                subproblem_instance_data = InstanceData(
                    len(subproblem_instance_datas),
                    instance_data.domain_data,
                    instance_data.denotations_caches,
                    novelty_base,
                    subproblem_instance_information)
                subproblem_instance_data.set_state_space(subproblem_state_space)
                subproblem_instance_data.set_goal_distance_information(subproblem_goal_distance_information)
                subproblem_instance_data.set_state_information(subproblem_state_information)
                subproblem_instance_data.initial_s_idxs = subproblem_initial_s_idxs.difference(global_deadends)
                assert all([subproblem_goal_distance_information.is_alive(initial_s_idx) for initial_s_idx in subproblem_instance_data.initial_s_idxs])
                # 2.2.1. Recompute tuple graph for restricted state space
                # We might want to use the original tuple graphs without any pruning to capture potentially more deadend states.
                subproblem_instance_data.set_tuple_graphs(TupleGraphFactory(width).make_tuple_graphs(subproblem_instance_data))
                subproblem_instance_datas.append(subproblem_instance_data)
            instance_data.state_space.set_goal_state_indices(old_goal_state_indices)
            instance_data.goal_distance_information = old_goal_distance_information
    subproblem_instance_datas = sorted(subproblem_instance_datas, key=lambda x : x.state_space.get_num_states())
    for instance_idx, instance_data in enumerate(subproblem_instance_datas):
        instance_data.id = instance_idx
        instance_data.state_space.get_instance_info().set_index(instance_idx)
    print("Number of problems:", len(instance_datas))
    print("Number of subproblems:", len(subproblem_instance_datas))
    print("Highest number of states in problem:", max([instance_data.state_space.get_num_states() for instance_data in instance_datas]))
    print("Highest number of states in subproblem:", max([instance_data.state_space.get_num_states() for instance_data in subproblem_instance_datas]))
    return subproblem_instance_datas


def add_zero_cost_features(domain_feature_data: DomainFeatureData, sketch: Sketch):
    for boolean_feature in sketch.dlplan_policy.get_boolean_features():
        domain_feature_data.boolean_features.add_feature(Feature(boolean_feature, 1))
    for numerical_feature in sketch.dlplan_policy.get_numerical_features():
        domain_feature_data.numerical_features.add_feature(Feature(numerical_feature, 1))


def run(config, data, rng):
    preprocessing_clock = Clock("PREPROCESSING")
    preprocessing_clock.set_start()
    logging.info(colored(f"Initializing DomainData...", "blue", "on_grey"))
    domain_data = DomainDataFactory().make_domain_data(config)
    logging.info(colored(f"..done", "blue", "on_grey"))

    logging.info(colored(f"Initializing InstanceDatas...", "blue", "on_grey"))
    instance_datas = InstanceDataFactory().make_instance_datas(config, domain_data)
    logging.info(colored(f"..done", "blue", "on_grey"))
    preprocessing_clock.set_accumulate()

    # TODO: learn rule {} -> {G} where G is over goal separating features
    # Step 1: compute goal separating features
    root_sketch, root_sketch_minimized, root_statistics = \
        learn_sketch(config, domain_data, instance_datas, config.workspace / "learning", config.width)
    zero_cost_domain_feature_data = DomainFeatureData()
    add_zero_cost_features(zero_cost_domain_feature_data, root_sketch)
    root_hierarchical_sketch = HierarchicalSketch(config.workspace / "output" / "hierarchical_sketch")
    root_hierarchical_sketch.add_sketch(root_sketch)
    root_hierarchical_sketch.add_statistics(root_statistics)

    # Learn sketches in BrFS mode, i.e., refine sketches with largest width first
    queue = deque()
    if root_hierarchical_sketch.sketch.width > 0:
        queue.append((root_hierarchical_sketch, zero_cost_domain_feature_data))
    while queue:
        parent_hierarchical_sketch, parent_zero_cost_domain_feature_data = queue.popleft()
        domain_data.zero_cost_domain_feature_data = parent_zero_cost_domain_feature_data
        sketch = parent_hierarchical_sketch.sketch
        for rule in sketch.dlplan_policy.get_rules():
            print("Sketch:")
            print(sketch.dlplan_policy.compute_repr())
            print("Sketch rule:", rule.get_index(), rule.compute_repr())
            # creates empty child subdirectory
            child_hierarchical_sketch = parent_hierarchical_sketch.add_child(f"rule_{rule.get_index()}")
            child_hierarchical_sketch.add_rule(Sketch(make_rule_policy(rule), parent_hierarchical_sketch.sketch.width))

            logging.info(colored(f"Initializing Subproblems...", "blue", "on_grey"))
            preprocessing_clock.set_start()
            subproblem_instance_datas = make_subproblems(config, instance_datas, sketch.dlplan_policy, rule, sketch.width - 1)
            preprocessing_clock.set_accumulate()
            if not subproblem_instance_datas:
                print(colored("Sketch rule does not induce any subproblems!", "red", "on_grey"))
                continue
            logging.info(colored(f"..done", "blue", "on_grey"))

            rule_sketch, rule_sketch_minimized, rule_statistics = \
                learn_sketch(config, domain_data, subproblem_instance_datas, config.workspace / "learning" / f"rule_{rule.get_index()}", sketch.width - 1)
            if rule_sketch is None:
                logging.info(colored(f"No sketch found", "red", "on_grey"))
                continue
            child_zero_cost_domain_feature_data = deepcopy(parent_zero_cost_domain_feature_data)
            add_zero_cost_features(child_zero_cost_domain_feature_data, rule_sketch)

            # add the learned sketch into the directory
            child_hierarchical_sketch.add_sketch(rule_sketch)
            child_hierarchical_sketch.add_statistics(rule_statistics)

            if child_hierarchical_sketch.sketch.width > 0:
                queue.append((child_hierarchical_sketch, child_zero_cost_domain_feature_data))

    logging.info(colored("Summary:", "yellow", "on_grey"))
    logging.info(colored("Hierarchical sketch:", "green", "on_grey"))
    root_hierarchical_sketch.print()
    preprocessing_clock.print()
    return ExitCode.Success, None

def make_rule_policy(rule: dlplan.Rule):
    builder = dlplan.PolicyBuilder()
    rule.copy_to_builder(builder)
    return builder.get_result()
