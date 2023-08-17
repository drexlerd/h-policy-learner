from dataclasses import dataclass
from typing import List, Dict

from dlplan.novelty import TupleGraph
from dlplan.state_space import StateSpace
from dlplan.serialization import Data, serialize, deserialize

from learner.src.instance_data.instance_information import InstanceInformation


@dataclass
class SerializationData:
    """ Stores all information necessary for serialization and deserialization of InstanceDatas. """
    instance_informations: List[InstanceInformation]
    state_spaces: Dict[str, StateSpace]
    # tuple_graphs: Dict[str, TupleGraph]
    goal_distances: List[Dict[int, int]]

    def __getstate__(self):
        state = dict()
        state["instance_informations"] = self.instance_informations
        state["goal_distances"] = self.goal_distances
        data = Data()
        data.state_spaces = self.state_spaces
        state["state_spaces"] = serialize(data)
        return state

    def __setstate__(self, state):
        self.instance_informations = state["instance_informations"]
        self.goal_distances = state["goal_distances"]
        data = deserialize(state["state_spaces"])
        self.state_spaces = data.state_spaces
