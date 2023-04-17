import copy

from termcolor import colored
from pathlib import Path

from learner.src.iteration_data.sketch import Sketch
from learner.src.learning_statistics import LearningStatistics
from learner.src.util.command import create_experiment_workspace, read_file, write_file


class HierarchicalSketch:
    def __init__(self, workspace: Path, parent=None):
        self.sketch = None
        self.rule = None
        self.statistics: LearningStatistics = None
        self.parent = parent
        self.children = []
        self.workspace = workspace
        create_experiment_workspace(str(self.workspace), rm_if_existed=True)

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
