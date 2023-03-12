import dlplan
from dataclasses import dataclass
from typing import List, Dict

from learner.src.domain_data.domain_data import DomainData
from learner.src.instance_data.instance_information import InstanceInformation
from learner.src.instance_data.iteration_information import IterationInformation
from learner.src.iteration_data.feature_valuations import FeatureValuation
from learner.src.iteration_data.state_pair_equivalence import StatePairEquivalence
from learner.src.iteration_data.tuple_graph_equivalence import TupleGraphEquivalence


@dataclass
class InstanceData:
    """ """
    id: int
    domain_data: DomainData
    denotations_caches: dlplan.DenotationsCaches
    novelty_base: dlplan.NoveltyBase
    # Initialized before iteration
    instance_information: InstanceInformation
    state_space: dlplan.StateSpace = None
    goal_distance_information: dlplan.GoalDistanceInformation = None
    state_information: dlplan.StateInformation = None
    tuple_graphs: Dict[int, dlplan.TupleGraph] = None
    initial_s_idxs: List[int] = None  # in cases we need multiple initial states
    # Initialized in every iteration
    iteration_information:  IterationInformation = None
    feature_valuations: List[FeatureValuation] = None
    state_pair_equivalence: Dict[int, StatePairEquivalence] = None
    tuple_graph_equivalences: Dict[int, TupleGraphEquivalence] = None

    def set_state_space(self, state_space: dlplan.StateSpace):
        """ Set state space and writes it to a file. """
        self.state_space = state_space
        # write_file(self.instance_information.workspace / f"{self.instance_information.name}.dot", state_space.to_dot(1))

    def set_goal_distance_information(self, goal_distance_information: dlplan.GoalDistanceInformation):
        self.goal_distance_information =  goal_distance_information

    def set_state_information(self, state_information: dlplan.StateInformation):
        self.state_information = state_information

    def set_tuple_graphs(self, tuple_graphs: Dict[int, dlplan.TupleGraph]):
        """ Set tuple graphs and writes them to files. """
        self.tuple_graphs = tuple_graphs
        #for tuple_graph in tuple_graphs.values():
        #    write_file(self.instance_information.tuple_graph_workspace / f"{tuple_graph.get_root_state_index()}.dot", tuple_graph.to_dot(1))

    def set_iteration_information(self, iteration_information: IterationInformation):
        self.iteration_information = iteration_information
        # write_file(self.iteration_information.workspace / f"{self.instance_information.name}.dot", self.state_space.to_dot(1))
        #for tuple_graph in self.tuple_graphs.values():
        #    write_file(self.iteration_information.tuple_graph_workspace / f"{tuple_graph.get_root_state_index()}.dot", tuple_graph.to_dot(1))

    def set_feature_valuations(self, feature_valuations: List[FeatureValuation]):
        """ Set feature valuations and writes them to files. """
        self.feature_valuations = feature_valuations
        # write_file(self.iteration_information.feature_valuations_workspace / "feature_valuations.txt", str(self.feature_valuations))

    def set_state_pair_equivalences(self, state_pair_equivalences: Dict[int, StatePairEquivalence]):
        """ Set state pair equivalence and writes it to files. """
        self.state_pair_equivalences = state_pair_equivalences
