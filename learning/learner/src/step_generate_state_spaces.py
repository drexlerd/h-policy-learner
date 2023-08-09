from dlplan.serialization import Data, serialize

import logging

from termcolor import colored
from pathlib import Path

from learner.src.returncodes import ExitCode
from learner.src.instance_data.instance_data_utils import compute_instance_datas
from learner.src.instance_data.state_spaces import StateSpaces


def run(config, data, rng):
    output = dict()
    logging.info(colored("Initializing InstanceDatas...", "blue", "on_grey"))
    instance_datas, domain_data = compute_instance_datas(config)
    instance_informations = [instance_data.instance_information for instance_data in instance_datas]
    state_spaces = [instance_data.state_space for instance_data in instance_datas]
    goal_distances = [instance_data.goal_distances for instance_data in instance_datas]
    output["state_spaces"] = StateSpaces(instance_informations, state_spaces, goal_distances)
    logging.info(colored("..done", "blue", "on_grey"))
    return ExitCode.Success, output