from learner.src.util.misc import update_dict
from learner.src.driver import BENCHMARK_DIR


def experiments():
    base = dict(
        pipeline="hierarchy",
    )

    exps = dict()

    strips_base_blocks_3 = update_dict(
        base,
        domain_filename=BENCHMARK_DIR / "blocks_3" / "domain.pddl",
        task_dir=BENCHMARK_DIR / "blocks_3" / "instances",
        task_dir_debug=BENCHMARK_DIR / "blocks_3" / "instances_debug",
    )

    exps["release"] = update_dict(
        strips_base_blocks_3,
        instance_filenames=list(strips_base_blocks_3["task_dir"].iterdir()),
    )

    exps["debug"] = update_dict(
        strips_base_blocks_3,
        instance_filenames=list(strips_base_blocks_3["task_dir_debug"].iterdir()),
        generate_features=False,
        add_features=[#"n_count(c_primitive(clear,0))",  # number of clear blocks
                      #"n_count(c_not(c_equal(r_primitive(on_g,0,1), r_primitive(on,0,1))))",  # number of objects that are not on their final target
                      "n_count(c_all(r_transitive_closure(r_primitive(on,0,1)),c_equal(r_primitive(on_g,0,1), r_primitive(on,0,1))))",  # number of objects s.t. all objects below are well-placed, i.e., in its goal configuration.
                      "b_empty(c_not(c_all(r_inverse(r_primitive(on_g,0,1)),c_equal(r_primitive(on,0,1),r_primitive(on_g,0,1)))))",  # goal separating feature
        ],
        max_num_rules=16,
    )
    return exps
