#!/usr/bin/env python3

import sys
from pathlib import Path
sys.path.append(str(Path(__file__).resolve().parent.parent))

import argparse
import dlplan
import logging

from termcolor import colored

from pathlib import Path

from learner.src.instance_data.instance_information import InstanceInformation
from learner.src.instance_data.instance_data_utils import compute_instance_datas
from learner.src.instance_data.tuple_graph_utils import compute_tuple_graphs
from learner.src.driver import Bunch
from learner.src.iteration_data.sketch import Sketch

from learner.src.driver import BENCHMARK_DIR
from learner.src.util.command import create_experiment_workspace, change_working_directory


if __name__ == "__main__":
    parser = argparse.ArgumentParser("Sketch verifier")
    parser.add_argument('--domain', type=str, help="The path to the domain file.", required=True)
    parser.add_argument('--task_dir', type=str, help="The path to the directory containing the instance.", required=True)
    parser.add_argument('--sketch-file', type=str, help="The path to the sketch file.", required=True)
    parser.add_argument('-w', '--width', type=int, help='Input related width parameter.', required=True)
    args = parser.parse_args()

    config = dict(
        domain_filename=Path(args.domain).resolve(),
        task_dir=Path(args.task_dir).resolve(),
        sketch_filename=Path(args.sketch_file).resolve(),
        max_states_per_instance=1000,
        max_time_per_instance=10,
        closed_Q=True,
        width=args.width,
    )

    workspace = Path("workspace_default").resolve()

    # Initialize instances
    config["instance_informations"] = []
    for instance_filename in list(Path(args.task_dir).iterdir()):
        instance_filename = Path(instance_filename).resolve()
        config["instance_informations"].append(
            InstanceInformation(
                instance_filename.stem,
                instance_filename,
                workspace / "input" / instance_filename.stem))
    config = Bunch(config)

    create_experiment_workspace(workspace)
    change_working_directory(workspace)

    logging.info(colored("Initializing InstanceDatas...", "blue", "on_grey"))
    instance_datas, domain_data = compute_instance_datas(config)
    logging.info(colored("..done", "blue", "on_grey"))

    logging.info(colored("Constructing TupleGraphs...", "blue", "on_grey"))
    compute_tuple_graphs(config["width"], instance_datas)
    logging.info(colored("..done", "blue", "on_grey"))

    with open(str(config["sketch_filename"]), "r") as file:
        sketch_data = file.read()
    dlplan_policy = dlplan.PolicyReader().read(sketch_data, domain_data.policy_builder, domain_data.syntactic_element_factory)
    sketch = Sketch(dlplan_policy, config["width"])

    sketch.print()

    for instance_data in instance_datas:
        if not sketch.solves(config, instance_data):
            print(instance_data.instance_information.name)


