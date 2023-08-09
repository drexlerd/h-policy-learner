from typing import Dict, MutableSet
from dataclasses import dataclass


@dataclass
class TupleGraphEquivalence:
    """
    TupleGraphEquivalence maps tuple information to rules over the feature pool F of a subproblem.

    This is necessary for constructing the constraints in the propositional encoding
    relevant to bound the width of the subproblem.
    """
    t_idx_to_r_idxs: Dict[int, MutableSet[int]]
    t_idx_to_distance: Dict[int, int]
    r_idx_to_deadend_distance: Dict[int, int]

    def __str__(self):
        return f"TupleGraphEquivalence(\
            t_idx_to_r_idxs={self.t_idx_to_r_idxs}, \
            t_idx_to_distance={self.t_idx_to_distance}, \
            r_idx_to_deadend_distance{self.r_idx_to_deadend_distance})"

