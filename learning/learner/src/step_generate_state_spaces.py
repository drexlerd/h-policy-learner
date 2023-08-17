import logging

from termcolor import colored

from learner.src.returncodes import ExitCode
from learner.src.instance_data.instance_data_utils import compute_instance_datas
from learner.src.instance_data.serialization_data import SerializationData


def run(config, data, rng):
    output = dict()
    logging.info(colored("Constructing InstanceDatas...", "blue", "on_grey"))
    instance_datas, _ = compute_instance_datas(config)
    instance_informations = [instance_data.instance_information for instance_data in instance_datas]
    state_spaces = {str(i): instance_data.state_space for i, instance_data in enumerate(instance_datas)}
    goal_distances = [instance_data.goal_distances for instance_data in instance_datas]
    output["instance_serialization_data"] = SerializationData(instance_informations, state_spaces, goal_distances)
    logging.info(colored("..done", "blue", "on_grey"))
    return ExitCode.Success, output