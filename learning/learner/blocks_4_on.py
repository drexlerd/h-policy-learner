from learner.src.util.misc import update_dict
from learner.src.driver import BENCHMARK_DIR


def experiments():
    base = dict(
        pipeline="hierarchy",
    )

    exps = dict()

    strips_base_blocks_4_on = update_dict(
        base,
        domain_filename=BENCHMARK_DIR / "blocks_4_on" / "domain.pddl",
        task_dir=BENCHMARK_DIR / "blocks_4_on" / "instances",
        task_dir_debug=BENCHMARK_DIR / "blocks_4_on" / "instances_debug",
    )

    exps["release"] = update_dict(
        strips_base_blocks_4_on,
        instance_filenames=list(strips_base_blocks_4_on["task_dir"].iterdir()),
    )

    exps["debug"] = update_dict(
        strips_base_blocks_4_on,
        instance_filenames=list(strips_base_blocks_4_on["task_dir_debug"].iterdir()),
        generate_features=False,
        add_features=["b_nullary(arm-empty)",  # 2
                      "n_count(c_not(c_primitive(clear,0)))",
                      "n_count(r_primitive(on,0,1))",
                      "n_count(c_primitive(on-table,0))",
                      "n_count(c_primitive(clear,0))",
                      "n_count(c_some(r_inverse(r_primitive(on_g,0,1)),c_primitive(holding,0)))",
                      "b_empty(c_and(c_not(c_equal(r_primitive(on,0,1),r_primitive(on_g,0,1))),c_primitive(clear,0)))",
                      "b_empty(r_and(r_primitive(on,0,1),r_primitive(on_g,0,1)))",  # goal separating feature
        ],
    )
    return exps


# Learning solution for width 2 requires instance of 4 blocks
# Potential solutions for width 2
# (:policy
# (:rule (:conditions (:c_n_eq "n_count(c_not(c_primitive(on-table,0)))")) (:effects (:e_b_neg "b_empty(r_and(r_primitive(on,0,1),r_primitive(on_g,0,1)))")))
# (:rule (:conditions (:c_n_gt "n_count(c_not(c_primitive(on-table,0)))")) (:effects (:e_n_dec "n_count(c_not(c_primitive(on-table,0)))")))
# )

# Potential solution for width 2
# (:policy
# (:rule (:conditions (:c_b_pos "b_nullary(arm-empty)") (:c_n_eq "n_count(r_primitive(on,0,1))")) (:effects (:e_b_neg "b_empty(r_and(r_primitive(on,0,1),r_primitive(on_g,0,1)))")))
# (:rule (:conditions (:c_b_pos "b_nullary(arm-empty)") (:c_n_gt "n_count(r_primitive(on,0,1))")) (:effects (:e_n_dec "n_count(r_primitive(on,0,1))")))
# (:rule (:conditions (:c_b_neg "b_nullary(arm-empty)")) (:effects (:e_n_inc "n_count(c_primitive(on-table,0))")))
# )

