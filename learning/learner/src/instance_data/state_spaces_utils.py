import logging

from typing import List, Tuple

from dlplan.core import DenotationsCaches

from learner.src.domain_data.domain_data import DomainData
from learner.src.domain_data.domain_data_utils import compute_domain_data
from learner.src.instance_data.instance_data import InstanceData
from learner.src.instance_data.state_spaces import StateSpaces


def compute_instance_datas(config, state_spaces: StateSpaces) -> Tuple[List[InstanceData], DomainData]:
    """ Reparses StateSpaces into InstanceDatas. """
    if not state_spaces.state_spaces:
        return []
    vocabulary_info = state_spaces.state_spaces[0].get_instance_info().get_vocabulary_info()
    domain_data = compute_domain_data(config, vocabulary_info)
    instance_datas = []
    for i, (state_space, instance_information, goal_distances) in enumerate(zip(state_spaces.state_spaces, state_spaces.instance_informations, state_spaces.goal_distances)):
        logging.info("Parsing InstanceData of filename %s", instance_information.filename)
        print("Num states:", len(state_space.get_states()))
        instance_data = InstanceData(i, domain_data, DenotationsCaches(), instance_information)
        instance_data.set_state_space(state_space, create_dump=True)
        instance_data.set_goal_distances(goal_distances)
        if config.closed_Q:
            instance_data.initial_s_idxs = [s_idx for s_idx in state_space.get_states().keys() if instance_data.is_alive(s_idx)]
        else:
            instance_data.initial_s_idxs = [state_space.get_initial_state_index(),]
        instance_datas.append(instance_data)
    return instance_datas, domain_data
