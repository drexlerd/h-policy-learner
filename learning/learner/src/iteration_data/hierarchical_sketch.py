from dlplan.core import Boolean, Numerical

import copy
import logging

from termcolor import colored
from pathlib import Path
from typing import List

from learner.src.instance_data.instance_data import InstanceData
from learner.src.domain_data.domain_data import DomainData
from learner.src.iteration_data.sketch import Sketch
from learner.src.iteration_data.learning_statistics import LearningStatistics
from learner.src.instance_data.instance_data_utils import compute_subproblems
from learner.src.iteration_data.feature_pool import Feature, FeaturePool
from learner.src.util.command import create_experiment_workspace, write_file
from learner.src.iteration_data.learn_sketch_explicit import learn_sketch
from learner.src.iteration_data.learn_goal_separating_features import learn_goal_separating_features


def add_zero_cost_features(feature_pool: FeaturePool, booleans: List[Boolean], numericals: List[Numerical]):
    #for boolean in booleans:
    #    domain_feature_data.boolean_features.add_feature(Feature(boolean, 1))
    for numerical in numericals:
        feature_pool.numerical_features.add_feature(Feature(numerical, 1))


class HierarchicalSketch:
    def __init__(self,
        workspace_learning: Path,
        workspace_output: Path,
        config,
        domain_data: DomainData,
        instance_datas: List[InstanceData],
        zero_cost_feature_pool: FeaturePool,
        width: int,
        rule: Sketch=None):
        assert width >= 0
        create_experiment_workspace(str(workspace_learning), rm_if_existed=False)
        create_experiment_workspace(str(workspace_output), rm_if_existed=False)
        self.workspace_learning = workspace_learning
        self.workspace_output = workspace_output
        self.config = config
        self.domain_data = domain_data
        self.instance_datas = instance_datas  # Q_n0
        self.zero_cost_feature_pool = zero_cost_feature_pool  # features that are used in sketches of the parents
        self.width = width  # width k of the subproblems in the current node. In the root we use config.width+1 such that first decompositions yields problems with width config.width
        self.rule = rule
        if rule is None:
            self._initialize_goal_separating_features()
        else:
            write_file(self.workspace_output / "rule_str.txt", str(self.rule.dlplan_policy))
            write_file(self.workspace_output / "rule_repr.txt", repr(self.rule.dlplan_policy))

        self.sketch = None
        self.sketch_minimized = None
        self.statistics: LearningStatistics = None
        self.children = []

    def _initialize_goal_separating_features(self):
        """ Instead of computing rule {-G}->{G} consisting of goal separating features,
            we only compute the goal separating features to be reused in subsequent refinements. """
        booleans, numericals = learn_goal_separating_features(self.config, self.domain_data, self.instance_datas, self.zero_cost_feature_pool, self.workspace_learning)
        if self.config.add_parent_features:
            add_zero_cost_features(self.zero_cost_feature_pool, booleans, numericals)

    def refine(self):
        """ Decomposes Q_n `self.instance_datas` at current node into subproblems of width `self.width` """
        # Base case: leaf node
        if self.width == 0:
            # with of current decomposition is 0 => cannot decompose further
            return []

        logging.info(colored("Started refining", "red", "on_grey"))
        if self.rule is not None:
            print(repr(self.rule.dlplan_policy))

        # Learn sketch for width k-1
        self.sketch, self.sketch_minimized, self.statistics = learn_sketch(self.config, self.domain_data, self.instance_datas, self.zero_cost_feature_pool, self.workspace_learning, self.width - 1)
        write_file(self.workspace_output / "sketch_str.txt", str(self.sketch.dlplan_policy))
        write_file(self.workspace_output / "sketch_repr.txt", repr(self.sketch.dlplan_policy))
        child_zero_cost_feature_pool = copy.copy(self.zero_cost_feature_pool)
        if self.config.add_parent_features:
            add_zero_cost_features(child_zero_cost_feature_pool, self.sketch.dlplan_policy.get_booleans(), self.sketch.dlplan_policy.get_numericals())
        # Inductive case: compute children n' of n
        for r_idx, rule in enumerate(self.sketch.dlplan_policy.get_rules()):
            # compute Q_n' of width k-1
            subproblem_instance_datas = compute_subproblems(self.config, self.instance_datas, self.sketch, rule, r_idx, self.width - 1)

            rule_sketch = Sketch(self.domain_data.policy_builder.add_policy({rule}), self.width - 1)

            child = HierarchicalSketch(
                self.workspace_learning / f"rule_{r_idx}",
                self.workspace_output / f"rule_{r_idx}",
                self.config,
                self.domain_data,
                subproblem_instance_datas,
                child_zero_cost_feature_pool,
                self.width - 1,
                rule_sketch)
            self.children.append(child)

        return self.children

    def print(self):
        """ Prints the hierarchical policy with indentation depending on the level of a node in the tree. """
        print("HierarchicalPolicy:")
        self.print_rec(level=0)
        print("HierarchicalPolicyStatistics:")
        print("    Max feature complexity (C):", max([feature.compute_complexity() for feature in self.collect_features()]))
        print("    Num features (|Phi|):", len(set([repr(feature) for feature in self.collect_features()])))
        print("    Num rules (R):", len(set([repr(rule) for rule in self.collect_rules()])))
        print("    Max rules (m):", self.collect_max_rules())
        self.compute_overall_learning_statistics().print()

    def print_rec(self, level):
        """ Print helper function. """
        if self.sketch is not None:
            print(colored("    " * level + f"Level {level} sketch:", "green", "on_grey"))
            if self.sketch is not None:
                print(str(self.sketch.dlplan_policy))
                for child in self.children:
                    child.print_rec(level+1)
            else:
                print("No sketch found.")

    def collect_features(self):
        """ Returns all features in the hierarchical policy. """
        if self.sketch is None:
            return []
        features = []
        if self.children:
            for child in self.children:
                features.extend(child.collect_features())
        features.extend(self.sketch.dlplan_policy.get_booleans())
        features.extend(self.sketch.dlplan_policy.get_numericals())
        return features

    def collect_rules(self):
        """ Returns all rules in the hierarchical policy. """
        if self.sketch is None:
            return []
        rules = []
        if self.children:
            for child in self.children:
                rules.extend(child.collect_rules())
        rules.extend(self.sketch.dlplan_policy.get_rules())
        return rules

    def collect_max_rules(self):
        """ Returns maximum number of rules in a sketch in the hierarchical policy. """
        if self.sketch is None:
            return 0
        assert self.children
        m = 0
        for child in self.children:
            m = max(m, child.collect_max_rules())
        return max(m, len(self.children))

    def compute_overall_learning_statistics(self):
        """ Returns accumulated statistics of the hierarchical policy. """
        if self.sketch is None:
            return LearningStatistics()
        statistics = copy.deepcopy(self.statistics)
        for child in self.children:
            child_statistics = child.compute_overall_learning_statistics()
            statistics.num_training_instances += child_statistics.num_training_instances
            statistics.num_selected_training_instances = max(statistics.num_selected_training_instances, child_statistics.num_selected_training_instances)
            statistics.num_states_in_selected_training_instances = max(statistics.num_states_in_selected_training_instances, child_statistics.num_states_in_selected_training_instances)
            statistics.num_features_in_pool = max(statistics.num_features_in_pool, child_statistics.num_features_in_pool)
        return statistics
