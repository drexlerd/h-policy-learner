from dataclasses import dataclass
from typing import List, Dict

from dlplan.state_space import StateSpace
from dlplan.serialization import Data, serialize, deserialize

from learner.src.instance_data.instance_information import InstanceInformation


@dataclass
class SerializationData:
    """ Stores all information necessary for serialization and deserialization of InstanceDatas. """
    instance_informations: List[InstanceInformation]
    state_spaces: Dict[str, StateSpace]
    goal_distances: List[Dict[int, int]]

    def __getstate__(self):
        state = self.__dict__.copy()
        data = Data()
        data.state_spaces = self.state_spaces
        state["state_spaces"] = serialize(data)
        return state

    def __setstate__(self, state):
        self.__dict__.update(state)
        data = deserialize(state["state_spaces"])
        self.state_spaces = data.state_spaces