import dlplan
import math

from collections import defaultdict, deque
from typing import  List, Dict

from learner.src.instance_data.instance_information import InstanceInformation
from learner.src.instance_data.instance_data import InstanceData
from learner.src.instance_data.tuple_graph_factory import TupleGraphFactory
from learner.src.iteration_data.sketch import Sketch


class SubproblemInstanceDataFactory:
    def make_subproblems(self, config, instance_datas: List[InstanceData], sketch: Sketch, rule: dlplan.Rule, width: int):
        features = list(sketch.booleans) + list(sketch.numericals)
        subproblem_instance_datas = []
        for instance_data in instance_datas:
            state_space = instance_data.state_space
            covered_initial_s_idxs = set()
            # 1. Group initial states with same feature valuation together
            # such that we can compute their "potential" goals in a single iteration
            # "potential" in the sense that reachability must still be checked.
            feature_valuation_to_initial_s_idxs = defaultdict(set)
            for s_idx in sketch.compute_r_reachable_states(instance_data):
                if instance_data.is_goal(s_idx):
                    # We do not want to drive goal states to other goal states
                    # However, goal states in this instance can be initial states in other instances.
                    continue
                state = state_space.get_states()[s_idx]
                feature_valuation = tuple([feature.evaluate(state) for feature in features])
                feature_valuation_to_initial_s_idxs[feature_valuation].add(s_idx)
            # 2. Group target states with same feature valuation together
            feature_valuation_to_target_s_idxs = defaultdict(set)
            for s_idx, state in instance_data.state_space.get_states().items():
                feature_valuation = tuple([feature.evaluate(state) for feature in features])
                feature_valuation_to_target_s_idxs[feature_valuation].add(s_idx)
            # 3. Compute goals for each group.
            for _, initial_s_idxs in feature_valuation_to_initial_s_idxs.items():
                # 3.1. Compute set of initial states, i.e., all s such that f(s) = f,
                if not rule.evaluate_conditions(state_space.get_states()[next(iter(initial_s_idxs))], instance_data.denotations_caches):
                    continue
                # 3.2. Compute set of goal states, i.e., all s' such that (f(s), f(s')) satisfies E.
                goal_s_idxs = set()
                for _, target_s_idxs in feature_valuation_to_target_s_idxs.items():
                    if not rule.evaluate_effects(state_space.get_states()[next(iter(initial_s_idxs))], state_space.get_states()[next(iter(target_s_idxs))], instance_data.denotations_caches):
                        continue
                    goal_s_idxs.update(target_s_idxs)
                if not goal_s_idxs:
                    continue

                # 4. Compute goal distances of all initial states.
                old_goal_distances = instance_data.goal_distances
                old_goal_state_indices = instance_data.state_space.get_goal_state_indices()
                instance_data.state_space.set_goal_state_indices(goal_s_idxs)
                instance_data.goal_distances = instance_data.state_space.compute_goal_distances()
                # 4. Sort initial states by distance and then instantiate the subproblem
                sorted_initial_s_idxs = sorted(initial_s_idxs, key=lambda x : -instance_data.goal_distances.get(x, math.inf))
                for initial_s_idx in sorted_initial_s_idxs:
                    if initial_s_idx in covered_initial_s_idxs:
                        continue
                    if not instance_data.is_alive(initial_s_idx):
                        continue
                    name = f"{instance_data.instance_information.name}-{initial_s_idx}"

                    # 5. Compute states and initial states covered by these states.
                    initial_state_distances = instance_data.state_space.compute_distances({initial_s_idx}, True, True)
                    state_indices = set(initial_state_distances.keys())
                    subproblem_initial_s_idxs = set()
                    for initial_s_prime_idx in initial_s_idxs:
                        if initial_s_prime_idx in state_indices and instance_data.is_alive(initial_s_prime_idx):
                            subproblem_initial_s_idxs.add(initial_s_prime_idx)
                    assert initial_s_idx in subproblem_initial_s_idxs
                    covered_initial_s_idxs.update(subproblem_initial_s_idxs)

                    # 6. Instantiate subproblem for initial state and subgoals.
                    subproblem_state_space = dlplan.StateSpace(
                        instance_data.state_space,
                        state_indices)
                    subproblem_state_space.set_initial_state_index(initial_s_idx)
                    subproblem_state_space.set_goal_state_indices(goal_s_idxs.intersection(state_indices))
                    subproblem_goal_distances = subproblem_state_space.compute_goal_distances()
                    subproblem_instance_information = InstanceInformation(
                        name,
                        instance_data.instance_information.filename,
                        instance_data.instance_information.workspace / f"rule_{rule.get_index()}" / name)
                    subproblem_instance_data = InstanceData(
                        len(subproblem_instance_datas),
                        instance_data.domain_data,
                        instance_data.denotations_caches,
                        subproblem_instance_information)
                    subproblem_instance_data.set_state_space(subproblem_state_space)
                    subproblem_instance_data.set_goal_distances(subproblem_goal_distances)
                    subproblem_instance_data.initial_s_idxs = subproblem_initial_s_idxs
                    if not subproblem_instance_data.is_alive(initial_s_idx):
                        continue
                    assert all([subproblem_instance_data.is_alive(initial_s_idx) for initial_s_idx in subproblem_instance_data.initial_s_idxs])
                    # 2.2.1. Recompute tuple graph for restricted state space
                    subproblem_instance_data.set_tuple_graphs(TupleGraphFactory(width).make_tuple_graphs(subproblem_instance_data))
                    subproblem_instance_datas.append(subproblem_instance_data)
                instance_data.state_space.set_goal_state_indices(old_goal_state_indices)
                instance_data.goal_distances = old_goal_distances
        subproblem_instance_datas = sorted(subproblem_instance_datas, key=lambda x : len(x.state_space.get_states()))
        for instance_idx, instance_data in enumerate(subproblem_instance_datas):
            instance_data.id = instance_idx
            instance_data.state_space.get_instance_info().set_index(instance_idx)
        print("Number of problems:", len(instance_datas))
        print("Number of subproblems:", len(subproblem_instance_datas))
        print("Highest number of states in problem:", max([len(instance_data.state_space.get_states()) for instance_data in instance_datas]))
        print("Highest number of states in subproblem:", max([len(instance_data.state_space.get_states()) for instance_data in subproblem_instance_datas]))
        return subproblem_instance_datas

