import copy
import dlplan

from copy import deepcopy
from termcolor import colored
from pathlib import Path
from typing import List

from learner.src.instance_data.instance_data import InstanceData
from learner.src.domain_data.domain_data import DomainData
from learner.src.iteration_data.sketch import Sketch
from learner.src.learning_statistics import LearningStatistics
from learner.src.instance_data.subproblem_instance_data_factory import SubproblemInstanceDataFactory
from learner.src.iteration_data.domain_feature_data import DomainFeatureData, Features, Feature
from learner.src.util.command import create_experiment_workspace, read_file, write_file
from learner.src.learn_sketch_explicit import learn_sketch



class HierarchicalSketch:
    def __init__(self,
        workspace_learning: Path,
        workspace_output: Path,
        config,
        domain_data: DomainData,
        instance_datas: List[InstanceData],
        zero_cost_domain_feature_data: DomainFeatureData,
        width: int,
        rule: Sketch=None):
        assert width >= 0
        self.workspace_learning = workspace_learning
        self.workspace_output = workspace_output
        self.config = config
        self.domain_data = domain_data
        self.instance_datas = instance_datas
        self.zero_cost_domain_feature_data = zero_cost_domain_feature_data
        self.width = width
        self.rule = rule  # None represents {-G}->{G}
        create_experiment_workspace(str(self.workspace_learning), rm_if_existed=True)
        create_experiment_workspace(str(self.workspace_output), rm_if_existed=True)

        self.sketch = None
        self.sketch_minimized = None
        self.statistics: LearningStatistics = None
        self.children = []


    def refine(self):
        """ Learns a sketch for the width. """
        self.sketch, self.sketch_minimized, self.statistics = learn_sketch(self.config, self.domain_data, self.instance_datas, self.zero_cost_domain_feature_data, self.workspace_learning, self.width)

        zero_cost_domain_feature_data = deepcopy(self.zero_cost_domain_feature_data)
        for boolean in self.sketch.booleans:
            zero_cost_domain_feature_data.boolean_features.add_feature(Feature(boolean, 1))
        for numerical in self.sketch.numericals:
            zero_cost_domain_feature_data.numerical_features.add_feature(Feature(numerical, 1))

        for rule in self.sketch.dlplan_policy.get_rules():
            # create sketch consisting of single rule
            rule_sketch = self._make_rule_sketch(rule, self.width)

            if self.width == 0:
                continue

            # create subproblems
            subproblem_instance_datas = SubproblemInstanceDataFactory().make_subproblems(self.config, self.instance_datas, self.sketch, rule, self.width - 1)

            child = HierarchicalSketch(
                self.workspace_learning / f"rule_{rule.get_index()}",
                self.workspace_output / f"rule_{rule.get_index()}",
                self.config,
                self.domain_data,
                subproblem_instance_datas,
                zero_cost_domain_feature_data,
                self.width - 1,
                rule_sketch)
            self.children.append(child)

        return self.children

    def _make_rule_sketch(self, rule: dlplan.Rule, width: int):
        builder = dlplan.PolicyBuilder()
        rule.copy_to_builder(builder)
        return Sketch(builder.get_booleans(), builder.get_numericals(), builder.get_result(), width)


    def add_sketch(self, sketch: Sketch):
        self.sketch = sketch
        write_file(self.workspace / f"sketch_{self.sketch.width}.txt", self.sketch.dlplan_policy.str())

    def add_rule(self, rule: Sketch):
        self.rule = rule
        write_file(self.workspace / f"rule_{self.rule.width}.txt", self.rule.dlplan_policy.str())

    def add_statistics(self, statistics):
        self.statistics = statistics

    def add_child(self, folder):
        child = HierarchicalSketch(self.workspace / folder, parent=self)
        self.children.append(child)
        return child

    def print(self):
        self.print_rec(level=0)
        print("Num features:", len(set([feature.compute_repr() for feature in self.collect_features()])))
        print("Max feature complexity", max([feature.compute_complexity() for feature in self.collect_features()]))
        print("Num rules:", len(set([rule.compute_repr() for rule in self.collect_rules()])))
        self.compute_overall_statistics().print()

    def print_rec(self, level):
        print(colored("    " * level + f"Level {level} sketch:", "green", "on_grey"))
        if self.sketch is not None:
            print(self.sketch.dlplan_policy.str())
            for child in self.children:
                child.print_rec(level+1)
        else:
            print("No sketch found.")

    def collect_features(self):
        if self.sketch is None:
            return []
        features = []
        if self.children:
            for child in self.children:
                features.extend(child.collect_features())
        features.extend(self.sketch.booleans)
        features.extend(self.sketch.numericals)
        return features

    def collect_rules(self):
        if self.sketch is None:
            return []
        rules = []
        if self.children:
            for child in self.children:
                rules.extend(child.collect_rules())
        rules.extend(self.sketch.dlplan_policy.get_rules())
        return rules

    def compute_overall_statistics(self):
        if self.sketch is None:
            return LearningStatistics()
        statistics = copy.deepcopy(self.statistics)
        for child in self.children:
            child_statistics = child.compute_overall_statistics()
            statistics.num_training_instances += child_statistics.num_training_instances
            statistics.num_selected_training_instances = max(statistics.num_selected_training_instances, child_statistics.num_selected_training_instances)
            statistics.num_states_in_selected_training_instances = max(statistics.num_states_in_selected_training_instances, child_statistics.num_states_in_selected_training_instances)
            statistics.num_features_in_pool = max(statistics.num_features_in_pool, child_statistics.num_features_in_pool)
            statistics.num_cpu_seconds += child_statistics.num_cpu_seconds
            statistics.num_peak_memory_mb = max(statistics.num_peak_memory_mb, child_statistics.num_peak_memory_mb)
        return statistics
