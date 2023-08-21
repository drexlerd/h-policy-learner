import ast
from dataclasses import dataclass
from typing import List, Dict

from dlplan.core import SyntacticElementFactory, DenotationsCaches
from dlplan.novelty import TupleGraph
from dlplan.state_space import StateSpace
from dlplan.policy import PolicyBuilder
from dlplan.serialization import Data, serialize, deserialize

from learner.src.domain_data.domain_data import DomainData
from learner.src.domain_data.domain_data_utils import compute_domain_data
from learner.src.instance_data.instance_data import InstanceData


def parse_tuple(t: str):
    return ast.literal_eval(t)


@dataclass
class SerializationData:
    """ Stores all information necessary for serialization and deserialization of InstanceDatas. """
    domain_data: DomainData
    instance_datas: List[InstanceData]

    def __getstate__(self):
        """ Serializes the collection of InstanceData.
            Only attributes that remain constant in each iteration are serialized.
        """
        ids = []
        instance_informations = []
        goal_distances = []
        state_spaces = dict()
        tuple_graphs = dict()
        for i, instance_data in enumerate(self.instance_datas):
            ids.append(instance_data.id)
            instance_informations.append(instance_data.instance_information)
            goal_distances.append(instance_data.goal_distances)
            state_spaces[str(i)] = instance_data.state_space
            for s_idx, tuple_graph in instance_data.per_state_tuple_graphs.items():
                tuple_graphs[str((i, s_idx))] = tuple_graph

        state = dict()
        state["domain_filename"] = self.domain_data.domain_filename
        state["num_instances"] = len(self.instance_datas)
        state["instance_informations"] = instance_informations
        state["goal_distances"] = goal_distances
        data = Data()
        data.state_spaces = state_spaces
        data.tuple_graphs = tuple_graphs
        state["data"] = serialize(data)
        return state

    def __setstate__(self, state):
        """ Deserializes a collection of InstanceData.
            Only attributes that remain constant in each iteration are deserialized.
        """
        vocabulary_info = state["data"].state_spaces["0"].get_instance_info().get_vocabulary_info()
        domain_data = compute_domain_data(state["domain_filename"], vocabulary_info)
        self.instance_datas = []
        data = deserialize(state["state_spaces"])
        num_instances = state["num_instances"]
        for i in range(num_instances):
            tuple_graphs = { ast.literal_eval(key)[1] for key, tuple_graph in data.tuple_graphs if ast.literal_eval(key)[0] == i}
            self.instance_datas.append(
                InstanceData(
                    domain_data,
                    state["ids"][i],
                    DenotationsCaches(),
                    state["instance_informations"][i],
                    data.state_spaces[str(i)],
                    state["goal_distances"][i],
                    tuple_graphs))


