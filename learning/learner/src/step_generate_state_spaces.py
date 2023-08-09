from dlplan.serialization import Data, serialize

import logging

from termcolor import colored
from pathlib import Path

from learner.src.returncodes import ExitCode
from learner.src.instance_data.instance_data_utils import compute_instance_datas


def run(config, data, rng):
    logging.info(colored("Initializing InstanceDatas...", "blue", "on_grey"))
    if not Path(config.workspace / "input" / "dlplan_serialization_data.serialized").is_file():
        instance_datas, domain_data = compute_instance_datas(config)
        data = Data()
        data.state_spaces = [instance_data.state_space for instance_data in instance_datas]
        with open(config.workspace / "input" / "dlplan_serialization_data.serialized", "w", encoding="iso-8859-1") as file:
            file.write(serialize(data))
    else:
        print("State spaced were previously generated.")
    logging.info(colored("..done", "blue", "on_grey"))
    return ExitCode.Success, None