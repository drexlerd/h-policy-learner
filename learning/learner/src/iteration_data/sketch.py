import dlplan
import math
from termcolor import colored
from typing import Dict, MutableSet, List
from collections import defaultdict, deque

from learner.src.util.enum import ReachabilityType
from learner.src.instance_data.instance_data import InstanceData


class Sketch:
    def __init__(self, dlplan_policy: dlplan.Policy, width: int):
        self.dlplan_policy = dlplan_policy
        self.width = width

    def _verify_r_reachable_states(self, instance_data: InstanceData, reachable_states: MutableSet[int]):
        """
        Returns true iff every r-reachable state is solvable.
        """
        for s_idx in reachable_states:
            if instance_data.goal_distance_information.is_deadend(s_idx):
                print(colored(f"An r-reachable state is a deadend.", "red", "on_grey"))
                print("Instance:", instance_data.id, instance_data.instance_information.name)
                print("State:", instance_data.state_information.get_state(s_idx))
                return False
        return True

    def _verify_bounded_width(self, instance_data: InstanceData, reachable_states: MutableSet[int], compatible_states_by_group: List[MutableSet[int]], compatible_successors_by_group: List[Dict[int, MutableSet[int]]], require_optimal_width=False):
        """
        Returns true iff w(P[s,G_r^*(s)])<= k where r is one of the given groups.
        """
        for s_idx in reachable_states:
            if not instance_data.goal_distance_information.is_alive(s_idx):
                continue
            bounded = False
            for group_id, (compatible_states, compatible_successors) in enumerate(zip(compatible_states_by_group, compatible_successors_by_group)):
                if s_idx not in compatible_states:
                    continue
                # need to prove that width is bounded because s |= C(r)
                bounded_by_group = False
                min_compatible_distance = math.inf
                for tuple_distance, tuple_nodes in enumerate(instance_data.tuple_graphs[s_idx].get_tuple_nodes_by_distance()):
                    for tuple_node in tuple_nodes:
                        subgoal = True
                        for s_prime_idx in tuple_node.get_state_indices():
                            if not s_prime_idx in compatible_successors[s_idx]:
                                subgoal = False
                                break
                            else:
                                min_compatible_distance = min(min_compatible_distance, tuple_distance)
                        if subgoal:
                            bounded_by_group = True
                            if require_optimal_width and min_compatible_distance < tuple_distance:
                                print(colored(f"Optimal width disproven.", "red", "on_grey"))
                                print("Closest subgoal state distance:", min_compatible_distance)
                                print("Closest subgoal tuple distance:", tuple_distance)
                                return False
                            break
                    if bounded_by_group:
                        bounded = True
                        break
                if not bounded_by_group:
                    print(colored(f"Group fails to bound width of a state", "red", "on_grey"))
                    print("Group:", group_id)
                    print("Instance:", instance_data.id, instance_data.instance_information.name)
                    print("State:", instance_data.state_information.get_state(s_idx))
                    return False
            if not bounded:
                print(colored(f"Sketch fails to bound width of a state", "red", "on_grey"))
                print("Instance:", instance_data.id, instance_data.instance_information.name)
                print("State:", instance_data.state_information.get_state(s_idx))
                return False
        return True


    def _verify_acyclicity(self, instance_data: InstanceData, reachable_states: MutableSet[int], compatible_successors_by_group: List[Dict[int, MutableSet[int]]]):
        """
        Returns True iff sketch is acyclic, i.e., no infinite trajectories s1,s2,... are possible.
        """
        for s_idx in reachable_states:
            # The depth-first search is the iterative version where the current path is explicit in the stack.
            # https://en.wikipedia.org/wiki/Depth-first_search
            stack = []
            for compatible_successors in compatible_successors_by_group:
                stack.append((s_idx, iter(compatible_successors.get(s_idx, []))))
            s_idxs_on_path = set()
            frontier = set()  # the generated states, to ensure that they are only added once to the stack
            while stack:
                source_idx, iterator = stack[-1]
                s_idxs_on_path.add(source_idx)
                try:
                    target_idx = next(iterator)
                    if target_idx not in reachable_states:
                        continue
                    if instance_data.goal_distance_information.is_goal(target_idx):
                        continue
                    if target_idx in s_idxs_on_path:
                        print(colored("Sketch cycles", "red", "on_grey"))
                        print("Instance:", instance_data.id, instance_data.instance_information.name)
                        for s_idx in s_idxs_on_path:
                            print(f"{s_idx} {str(instance_data.state_information.get_state(s_idx))}")
                        print(f"{target_idx} {str(instance_data.state_information.get_state(target_idx))}")
                        return False
                    if target_idx not in frontier:
                        frontier.add(target_idx)
                        for compatible_successors in compatible_successors_by_group:
                            stack.append((target_idx, iter(compatible_successors.get(target_idx, []))))
                except StopIteration:
                    s_idxs_on_path.discard(source_idx)
                    stack.pop(-1)
        return True

    def _verify_goal_separating_features(self, instance_data: InstanceData):
        """
        Returns True iff sketch features separate goal from nongoal states.
        """
        dlplan_policy_features = self.dlplan_policy.get_boolean_features() + self.dlplan_policy.get_numerical_features()
        s_idx_to_feature_valuations = dict()
        for s_idx in instance_data.state_space.get_state_indices():
            s_idx_to_feature_valuations[s_idx] = tuple([feature.evaluate(instance_data.state_information.get_state(s_idx)) for feature in dlplan_policy_features])
        for s_idx_1 in instance_data.state_space.get_state_indices():
            for s_idx_2 in instance_data.state_space.get_state_indices():
                if (instance_data.goal_distance_information.is_goal(s_idx_1) and \
                    not instance_data.goal_distance_information.is_goal(s_idx_2)):
                    if (s_idx_to_feature_valuations[s_idx_1] == s_idx_to_feature_valuations[s_idx_2]):
                        print(colored("Selected features do not separate goals from non goals.", "red", "on_grey"))
                        print("Instance:", instance_data.id, instance_data.instance_information.name)
                        print("Goal state:", s_idx_1, str(instance_data.state_information.get_state(s_idx_1)), s_idx_to_feature_valuations[s_idx_1])
                        print("Nongoal state:", s_idx_2, str(instance_data.state_information.get_state(s_idx_2)), s_idx_to_feature_valuations[s_idx_2])
                        return False
        return True

    def _compute_compatible_successors(self, instance_data: InstanceData):
        """ Computes subgoal states. """
        R_compatible_states = set()
        r_compatible_states_by_rule = []
        R_compatible_successors = defaultdict(set)
        r_compatible_successors_by_rule = []
        for rule in self.dlplan_policy.get_rules():
            r_compatible_states = set()
            r_compatible_successors = defaultdict(set)
            for s_idx, tuple_graph in instance_data.tuple_graphs.items():
                if not rule.evaluate_conditions(instance_data.state_information.get_state(s_idx), instance_data.denotations_caches):
                    continue
                r_compatible_states.add(s_idx)
                R_compatible_states.add(s_idx)
                for s_prime_idxs in tuple_graph.get_state_indices_by_distance():
                    for s_prime_idx in s_prime_idxs:
                        if rule.evaluate_effects(instance_data.state_information.get_state(s_idx), instance_data.state_information.get_state(s_prime_idx), instance_data.denotations_caches):
                            r_compatible_successors[s_idx].add(s_prime_idx)
                            R_compatible_successors[s_idx].add(s_prime_idx)
            r_compatible_states_by_rule.append(r_compatible_states)
            r_compatible_successors_by_rule.append(r_compatible_successors)
        return r_compatible_states_by_rule, R_compatible_states, R_compatible_successors, r_compatible_successors_by_rule

    def _compute_reachable_states(self, instance_data: InstanceData, reachability: ReachabilityType, compatible_states_by_group : List[MutableSet[int]], compatible_successors_by_group: List[Dict[int, MutableSet[int]]]):
        """
        Computes all states from which the sketch should apply:
            - All-reachability: all states reachable from the initial state,
            - R-reachability: all R-reachable states from the initial state,
            - r-reachability: all r-reachable states for all r in R from the initial state.
        """
        reachable_s_idxs = set()
        if reachability == ReachabilityType.All:
            reachable_s_idxs = self._compute_all_reachable_states(instance_data)
        else:
            reachable_s_idxs = self._compute_r_reachable_states(instance_data, compatible_states_by_group, compatible_successors_by_group)
        return reachable_s_idxs

    def _compute_all_reachable_states(self, instance_data: InstanceData):
        """ """
        all_reachable_s_idxs = set()
        for s_idx in instance_data.state_space.get_state_indices():
            if instance_data.goal_distance_information.is_deadend(s_idx):
                continue
            all_reachable_s_idxs.add(s_idx)
        return all_reachable_s_idxs

    def _compute_r_reachable_states(self, instance_data: InstanceData, compatible_states_by_group : List[MutableSet[int]], compatible_successors_by_group: List[Dict[int, MutableSet[int]]]):
        """ """
        r_reachable_s_idxs = set()
        queue = deque()
        for s_idx in instance_data.initial_s_idxs:
            queue.append(s_idx)
            r_reachable_s_idxs.add(s_idx)
        while queue:
            s_idx = queue.pop()
            for compatible_states, compatible_successors in zip(compatible_states_by_group, compatible_successors_by_group):
                if not compatible_successors[s_idx]:
                    continue
                assert s_idx in compatible_states
                for distance, tuple_nodes in enumerate(instance_data.tuple_graphs[s_idx].get_tuple_nodes_by_distance()):
                    subgoal_distance = None
                    for tuple_node in tuple_nodes:
                        subgoal = True
                        for s_prime_idx in tuple_node.get_state_indices():
                            if s_prime_idx not in compatible_successors[s_idx]:
                                subgoal = False
                            else:
                                if s_prime_idx not in r_reachable_s_idxs:
                                    r_reachable_s_idxs.add(s_prime_idx)
                                    queue.append(s_prime_idx)
                        if subgoal:
                            subgoal_distance = distance
                    if subgoal_distance is not None:
                        break
        return r_reachable_s_idxs

    def solves(self, config, instance_data: InstanceData):
        """
        Returns True iff the sketch solves the instance, i.e.,
            (1) subproblems have bounded width,
            (2) sketch only classifies delta optimal state pairs as good,
            (3) sketch is acyclic, and
            (4) sketch features separate goals from nongoal states. """
        r_compatible_states_by_rule, R_compatible_states, R_compatible_successors, r_compatible_successors_by_rule = self._compute_compatible_successors(instance_data)
        if config.reachability == ReachabilityType.r:
            compatible_states_by_group = r_compatible_states_by_rule
            compatible_successors_by_group = r_compatible_successors_by_rule
        else:
            compatible_states_by_group = [R_compatible_states,]
            compatible_successors_by_group = [R_compatible_successors,]
        reachable_s_idxs = self._compute_reachable_states(instance_data, config.reachability, compatible_states_by_group, compatible_successors_by_group)

        if not self._verify_r_reachable_states(instance_data, reachable_s_idxs):
            return False
        if not self._verify_acyclicity(instance_data, reachable_s_idxs, compatible_successors_by_group):
            return False
        if not self._verify_bounded_width(instance_data, reachable_s_idxs, compatible_states_by_group, compatible_successors_by_group):
            return False

        # if not self._verify_goal_separating_features(instance_data):
        #     return False
        # We do not care about the degree of suboptimality and use delta optimality just for pruning the state space.
        return True

    def print(self):
        print(self.dlplan_policy.compute_repr())
        print("Numer of sketch rules:", len(self.dlplan_policy.get_rules()))
        print("Number of selected features:", len(self.dlplan_policy.get_boolean_features()) + len(self.dlplan_policy.get_numerical_features()))
        print("Maximum complexity of selected feature:", max([0] + [boolean_feature.compute_complexity() for boolean_feature in self.dlplan_policy.get_boolean_features()] + [numerical_feature.compute_complexity() for numerical_feature in self.dlplan_policy.get_numerical_features()]))
