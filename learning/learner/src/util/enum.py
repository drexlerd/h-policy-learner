from enum import Enum


class ReachabilityType(Enum):
    All = 0  # all alive states
    R = 1  # G_R^*(s)
    r = 2  # G_r^*(s)


class EncodingType(Enum):
    EXPLICIT = 0
    D2SEPARATION = 1
