import dlplan
import math
from termcolor import colored
from typing import Dict, MutableSet, List
from collections import defaultdict, deque

from learner.src.util.enum import ReachabilityType
from learner.src.instance_data.instance_data import InstanceData


class Sketch:
    def __init__(self, booleans: List[dlplan.Boolean], numericals: List[dlplan.Numerical], dlplan_policy: dlplan.Policy, width: int):
        self.booleans = booleans
        self.numericals = numericals
        self.dlplan_policy = dlplan_policy
        self.width = width

    def _verify_bounded_width_of_state(self, instance_data: InstanceData, root_idx: int):
        bounded = False
        for rule in self.dlplan_policy.get_rules():
            source_state = instance_data.state_space.get_states()[root_idx]
            bounded_by_rule = False
            if not rule.evaluate_conditions(source_state, instance_data.denotations_caches):
                continue
            min_compatible_distance = math.inf
            for tuple_distance, tuple_nodes in enumerate(instance_data.tuple_graphs[root_idx].get_tuple_nodes_by_distance()):
                for tuple_node in tuple_nodes:
                    subgoal = True
                    for s_prime_idx in tuple_node.get_state_indices():
                        target_state = instance_data.state_space.get_states()[s_prime_idx]
                        if not rule.evaluate_effects(source_state, target_state, instance_data.denotations_caches):
                            subgoal = False
                            break
                        else:
                            min_compatible_distance = min(min_compatible_distance, tuple_distance)
                    if subgoal:
                        bounded_by_rule = True
                        if min_compatible_distance < tuple_distance:
                            print(colored(f"Optimal width disproven.", "red", "on_grey"))
                            print("Closest subgoal state distance:", min_compatible_distance)
                            print("Closest subgoal tuple distance:", tuple_distance)
                            return False
                        break
                if bounded_by_rule:
                    bounded = True
                    break
            if not bounded_by_rule:
                print(colored(f"State has unbounded width for a rule", "red", "on_grey"))
                print("Rule:", rule)
                print("Instance:", instance_data.id, instance_data.instance_information.name)
                print("State:", instance_data.state_space.get_states()[root_idx])
                return False
        if not bounded:
            print(colored(f"State has unbounded width", "red", "on_grey"))
            print("Instance:", instance_data.id, instance_data.instance_information.name)
            print("State:", instance_data.state_space.get_states()[root_idx])
            return False
        return True

    def _compute_subgoal_states_of_state(self, instance_data: InstanceData, root_idx: int):
        subgoal_states = set()
        forward_successors = instance_data.state_space.get_forward_successor_state_indices()
        for rule in self.dlplan_policy.get_rules():
            queue = deque()
            queue.append(root_idx)
            root_state = instance_data.state_space.get_states()[root_idx]
            if not rule.evaluate_conditions(root_state, instance_data.denotations_caches):
                continue
            # with tg
            for tuple_distance, tuple_nodes in enumerate(instance_data.tuple_graphs[root_idx].get_tuple_nodes_by_distance()):
                for tuple_node in tuple_nodes:
                    for s_prime_idx in tuple_node.get_state_indices():
                        target_state = instance_data.state_space.get_states()[s_prime_idx]
                        if rule.evaluate_effects(root_state, target_state, instance_data.denotations_caches):
                            subgoal_states.add(s_prime_idx)
            # without tg
            #visited = set()
            #visited.add(root_idx)
            #while queue:
            #    s_idx = queue.popleft()  # BrFS
            #    target_state = instance_data.state_space.get_states()[s_idx]
            #    if rule.evaluate_effects(root_state, target_state, instance_data.denotations_caches):
            #        subgoal_states.add(s_idx)
            #        continue  # prune states that are only reachable through subgoals
            #    for s_prime_idx in forward_successors.get(s_idx, []):
            #        if s_prime_idx not in visited:
            #            visited.add(s_prime_idx)
            #            queue.append(s_prime_idx)
        return subgoal_states


    def _verify_bounded_modular_width(self, instance_data: InstanceData):
        """
        Args:
            instance_data(InstanceData): the instance
        """
        queue = deque()
        queue.extend(instance_data.initial_s_idxs)
        visited = set()
        visited.update(instance_data.initial_s_idxs)
        # byproduct for acyclicity check
        subgoal_states_per_r_reachable_state = defaultdict(set)
        while queue:
            root_idx = queue.popleft()  # BrFS
            if instance_data.is_deadend(root_idx):
                print("Deadend state is r_reachable")
                print("State:", instance_data.state_space.get_states()[root_idx])
                return False, None
            if instance_data.is_goal(root_idx):
                continue
            # Step 1 verify bounded width
            bounded = self._verify_bounded_width_of_state(instance_data, root_idx)
            if not bounded:
                return False, None
            # Step 2 compute compatible state pairs, not necessarily closest
            # prunes states only reachable through goals
            subgoal_states = self._compute_subgoal_states_of_state(instance_data, root_idx)
            subgoal_states_per_r_reachable_state[root_idx] = subgoal_states
            for subgoal_state in subgoal_states:
                if subgoal_state not in visited:
                    queue.append(subgoal_state)
                    visited.add(subgoal_state)
        return True, subgoal_states_per_r_reachable_state


    def _verify_acyclicity(self, instance_data: InstanceData, subgoal_states_per_r_reachable_state: Dict[int, MutableSet[int]]):
        """
        Returns True iff sketch is acyclic, i.e., no infinite trajectories s1,s2,... are possible.
        """
        for s_idx in subgoal_states_per_r_reachable_state.keys():
            # The depth-first search is the iterative version where the current path is explicit in the stack.
            # https://en.wikipedia.org/wiki/Depth-first_search
            stack = []
            stack.append((s_idx, iter(subgoal_states_per_r_reachable_state.get(s_idx, []))))
            s_idxs_on_path = set()
            frontier = set()  # the generated states, to ensure that they are only added once to the stack
            while stack:
                source_idx, iterator = stack[-1]
                s_idxs_on_path.add(source_idx)
                try:
                    target_idx = next(iterator)
                    if target_idx not in subgoal_states_per_r_reachable_state:
                        continue
                    if instance_data.is_goal(target_idx):
                        continue
                    if target_idx in s_idxs_on_path:
                        print(colored("Sketch cycles", "red", "on_grey"))
                        print("Instance:", instance_data.id, instance_data.instance_information.name)
                        for s_idx in s_idxs_on_path:
                            print(f"{s_idx} {str(instance_data.state_space.get_states()[s_idx])}")
                        print(f"{target_idx} {str(instance_data.state_space.get_states()[target_idx])}")
                        return False
                    if target_idx not in frontier:
                        frontier.add(target_idx)
                        stack.append((target_idx, iter(subgoal_states_per_r_reachable_state.get(target_idx, []))))
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

    def solves(self, config, instance_data: InstanceData):
        """
        Returns True iff the sketch solves the instance, i.e.,
            (1) subproblems have bounded width,
            (2) sketch only classifies delta optimal state pairs as good,
            (3) sketch is acyclic, and
            (4) sketch features separate goals from nongoal states. """
        bounded, subgoal_states_per_r_reachable_state = self._verify_bounded_modular_width(instance_data)
        if not bounded:
            return False
        if not self._verify_acyclicity(instance_data, subgoal_states_per_r_reachable_state):
            return False

        # if not self._verify_goal_separating_features(instance_data):
        #     return False
        # We do not care about the degree of suboptimality and use delta optimality just for pruning the state space.
        return True

    def print(self):
        print(self.dlplan_policy.str())
        print("Numer of sketch rules:", len(self.dlplan_policy.get_rules()))
        print("Number of selected features:", len(self.booleans) + len(self.booleans))
        print("Maximum complexity of selected feature:", max([0] + [boolean.compute_complexity() for boolean in self.booleans] + [numerical.compute_complexity() for numerical in self.numericals]))
