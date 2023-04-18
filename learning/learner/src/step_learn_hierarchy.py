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

    root_hierarchical_sketch = HierarchicalSketch(
        config.workspace / "learning" / "hierarchical_sketch",  # learning workspace
        config.workspace / "output" / "hierarchical_sketch",  # output workspace
        config,
        domain_data,
        instance_datas,  # Q_n
        DomainFeatureData(),
        config.width,
    )
    # Learn sketches in BrFS mode, i.e., refine sketches with largest width first
    queue = deque()
    queue.append(root_hierarchical_sketch)
    while queue:
        current_hierarchical_sketch = queue.popleft()
        children = current_hierarchical_sketch.refine()
        queue.extend(children)

        continue
        domain_data.zero_cost_domain_feature_data = parent_zero_cost_domain_feature_data
        sketch = parent_hierarchical_sketch.sketch
        for rule in sketch.dlplan_policy.get_rules():
            print("Sketch:")
            print(sketch.dlplan_policy.str())
            print("Sketch rule:", rule.get_index(), rule.str())
            # creates empty child subdirectory
            child_hierarchical_sketch = parent_hierarchical_sketch.add_child(f"rule_{rule.get_index()}")
            booleans, numericals, dlplan_policy = make_rule_policy(rule)
            child_hierarchical_sketch.add_rule(Sketch(booleans, numericals, dlplan_policy, parent_hierarchical_sketch.sketch.width))

            logging.info(colored(f"Initializing Subproblems...", "blue", "on_grey"))
            preprocessing_clock.set_start()
            # subproblem_instance_datas = make_subproblems(config, instance_datas, sketch, rule, sketch.width - 1)
            preprocessing_clock.set_accumulate()
            if not subproblem_instance_datas:
                print(colored("Sketch rule does not induce any subproblems!", "red", "on_grey"))
                continue
            logging.info(colored(f"..done", "blue", "on_grey"))

            rule_sketch, rule_sketch_minimized, rule_statistics = \
                learn_sketch(config, domain_data, subproblem_instance_datas, config.workspace / "learning" / f"rule_{rule.get_index()}", sketch.width - 1)
            if rule_sketch is None:
                logging.info(colored(f"No sketch found.", "red", "on_grey"))
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
