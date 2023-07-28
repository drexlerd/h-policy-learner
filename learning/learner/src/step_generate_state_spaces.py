import logging

from termcolor import colored

from learner.src.returncodes import ExitCode
from learner.src.instance_data.instance_data_factory import InstanceDataFactory


def run(config, data, rng):
    logging.info(colored("Initializing InstanceDatas...", "blue", "on_grey"))
    instance_datas, domain_data = InstanceDataFactory().make_instance_datas(config)
    logging.info(colored("..done", "blue", "on_grey"))
    return ExitCode.Success, None