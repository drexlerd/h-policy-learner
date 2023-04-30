from learner.src.util.misc import update_dict
from learner.src.driver import BENCHMARK_DIR


def experiments():
    base = dict(
        domain_dir="reward",
    )

    exps = dict()

    strips_base = update_dict(
        base,
        domain_filename=BENCHMARK_DIR / "reward" / "domain.pddl",
        task_dir = BENCHMARK_DIR / "reward" / "instances_debug"
    )

    exps["hierarchy"] = update_dict(
        strips_base,
        pipeline="hierarchy_pipeline",
        instance_filenames=list(strips_base["task_dir"].iterdir()),
    )

    exps["hierarchy_debug"] = update_dict(
        strips_base,
        pipeline="hierarchy_pipeline",
        instance_filenames=list(strips_base["task_dir"].iterdir()),
        generate_features=False,
        add_features=["b_empty(c_primitive(reward,0))",
                      "b_empty(c_primitive(picked,0))",
        ],
    )

    return exps
