import logging

from collections import  deque
from termcolor import colored

from learner.src.returncodes import ExitCode
from learner.src.iteration_data.hierarchical_sketch import HierarchicalSketch
from learner.src.iteration_data.feature_pool import FeaturePool


def run(config, data, rng):
    logging.info(colored("Parsing InstanceDatas...", "blue", "on_grey"))
    serialization_data = data["generate_state_space"]
    domain_data = serialization_data.domain_data
    instance_datas = serialization_data.instance_datas
    logging.info(colored("..done", "blue", "on_grey"))

    root_hierarchical_sketch = HierarchicalSketch(
        config.workspace / "learning" / "hierarchical_sketch",  # learning workspace
        config.workspace / "output" / "hierarchical_sketch",  # output workspace
        config,
        domain_data,
        instance_datas,  # Q_n
        FeaturePool(),
        config.width + 1,  # Assume Q_n has width k+1, s.t. in first sketch computation sketch has width k+1-1=k
    )
    # Learn sketches in BrFS mode, i.e., refine sketches with largest width first
    queue = deque()
    queue.append(root_hierarchical_sketch)
    while queue:
        current_hierarchical_sketch = queue.popleft()
        children = current_hierarchical_sketch.refine()
        queue.extend(children)

    logging.info(colored("Summary:", "yellow", "on_grey"))
    logging.info(colored("Hierarchical sketch:", "green", "on_grey"))
    root_hierarchical_sketch.print()
    return ExitCode.Success, None
