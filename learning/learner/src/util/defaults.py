""" Module description: initialize workspace and domain config, instance configs
"""

import os
from pathlib import Path
from typing import List

from learner.src.util.command import create_experiment_workspace, change_working_directory, create_sym_link
from learner.src.util.enum import ReachabilityType, EncodingType

from learner.src.driver import Experiment, BENCHMARK_DIR, BASEDIR
from learner.src.steps import generate_pipeline
from learner.src.instance_data.instance_information import InstanceInformation


def generate_experiment(domain_filename: str, instance_filenames: List[str], workspace: str, **kwargs):
    """ """
    defaults = dict(
        pipeline="sketch_pipeline",

        # The overall time limit in seconds
        timeout=6*24*60*60,

        # The maximum states that we allows in each complete state space.
        max_states_per_instance=2000,

        # Feature generator settings
        concept_complexity_limit=9,
        role_complexity_limit=9,
        boolean_complexity_limit=9,
        count_numerical_complexity_limit=9,
        distance_numerical_complexity_limit=9,
        time_limit=3600,
        feature_limit=1000000,
        num_threads_feature_generator=1,


        # Require goal separating features
        goal_separation=False,

        # try optimal solution before finding suboptimal solutions
        optimal=False,

        reachability=ReachabilityType.R,
        encoding=EncodingType.EXPLICIT,

        width=2,

        max_num_rules=4,

        # The degree of suboptimality used for pruning from the initial state.
        # In the paper by Frances et. al, it is also used to encode acyclicity
        delta=1.0,

        # allow to select subgoal tuples with underlying states that require multiple rules.
        allow_multi_rule_subgoals=False,

        debug_features=[],
        use_debug_features=True,

        quiet=False,
        random_seed=0,
    )
    parameters = {**defaults, **kwargs}  # Copy defaults, overwrite with user-specified parameters

    workspace = Path(workspace).resolve()
    parameters["workspace"] = workspace
    parameters["domain_filename"] = domain_filename

    # root level 0 directory for experimental data
    create_experiment_workspace(workspace, rm_if_existed=False)
    change_working_directory(workspace)
    create_sym_link(BASEDIR / Path("learner/libs/dlplan/libs/downward-sse/planners/downward-sse") / Path("fast-downward.py"), workspace / "fast-downward.py", overwrite=True)

    # level 1 directory to store information of each iteration
    parameters["iterations_dir"] = workspace / "iterations"

    # Initialize instances
    parameters["instance_informations"] = []
    for instance_filename in instance_filenames:
        instance_filename = Path(instance_filename)
        parameters["instance_informations"].append(
            InstanceInformation(
                instance_filename.stem,
                instance_filename,
                workspace / "input" / instance_filename.name))

    steps, config = generate_pipeline(**parameters)

    # The location of the asp problem file
    config["asp_location"] = BASEDIR / "learner/src/asp/"

    return Experiment(steps, parameters)
