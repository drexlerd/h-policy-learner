import re

from clingo import Control, Number, Symbol
from typing import List

from learner.src.asp.returncodes import ClingoExitCode
from learner.src.domain_data.domain_data import DomainData
from learner.src.instance_data.instance_data import InstanceData


class ASPFactory:
    def __init__(self, max_num_rules=2):
        self.ctl = Control(arguments=["--const", f"max_num_rules={max_num_rules}", "--parallel-mode=32,split", "--opt-mode=optN"])
        # features
        self.ctl.add("select", ["f"], "select(f).")  # temp
        self.ctl.add("boolean", ["b"], "boolean(b).")
        self.ctl.add("numerical", ["n"], "numerical(n).")
        self.ctl.add("feature", ["f"], "feature(f).")
        self.ctl.add("complexity", ["f", "c"], "complexity(f,c).")
        self.ctl.add("value", ["i","s","f","v"], "value(i,s,f,v).")
        self.ctl.add("b_value", ["i", "s", "f", "v"], "b_value(i,s,f,v).")
        # state space
        self.ctl.add("state", ["i", "s"], "state(i,s).")
        self.ctl.add("initial", ["i", "s"], "initial(i,s).")
        self.ctl.add("solvable", ["i", "s"], "solvable(i,s).")
        self.ctl.add("unsolvable", ["i", "s"], "unsolvable(i,s).")
        self.ctl.add("goal", ["i", "s"], "goal(i,s).")
        self.ctl.add("nongoal", ["i", "s"], "nongoal(i,s).")
        self.ctl.add("alive", ["i", "s"], "alive(i,s).")
        self.ctl.add("expanded", ["i", "s"], "expanded(i,s).")
        # rule equivalences
        self.ctl.add("feature_condition", ["r", "f", "v"], "feature_condition(r,f,v).")
        self.ctl.add("feature_effect", ["r", "f", "v"], "feature_effect(r,f,v).")
        self.ctl.add("c_gt_rule", ["r", "f"], "c_gt_rule(r,f).")
        self.ctl.add("c_eq_rule", ["r", "f"], "c_eq_rule(r,f).")
        self.ctl.add("c_pos_rule", ["r", "f"], "c_pos_rule(r,f).")
        self.ctl.add("c_neg_rule", ["r", "f"], "c_neg_rule(r,f).")
        self.ctl.add("e_inc_rule", ["r", "f"], "e_inc_rule(r,f).")
        self.ctl.add("e_dec_rule", ["r", "f"], "e_dec_rule(r,f).")
        self.ctl.add("e_pos_rule", ["r", "f"], "e_pos_rule(r,f).")
        self.ctl.add("e_neg_rule", ["r", "f"], "e_neg_rule(r,f).")
        self.ctl.add("e_bot_rule", ["r", "f"], "e_bot_rule(r,f).")
        self.ctl.add("state_pair_class", ["r"], "state_pair_class(r).")
        # state pair equivalences
        self.ctl.add("cover", ["i", "s1", "s2", "r"], "cover(i,s1,s2,r).")
        # tuple graph
        self.ctl.add("tuple", ["i", "s", "t"], "tuple(i,s,t).")
        self.ctl.add("contain", ["i", "s", "t", "r"], "contain(i,s,t,r).")
        self.ctl.add("t_distance", ["i", "s", "t", "d"], "t_distance(i,s,t,d).")
        self.ctl.add("d_distance", ["i", "s", "r", "d"], "d_distance(i,s,r,d).")
        self.ctl.add("r_distance", ["i", "s", "r", "d"], "r_distance(i,s,r,d).")
        self.ctl.add("s_distance", ["i", "s1", "s2", "d"], "s_distance(i,s1,s2,d).")

    def load_problem_file(self, filename):
        self.ctl.load(str(filename))

    def make_state_space_facts(self, domain_data: DomainData, instance_datas: List[InstanceData]):
        facts = []
        # State space facts
        for instance_data in instance_datas:
            instance_idx = instance_data.id
            for s_idx in instance_data.initial_s_idxs:
                facts.append(("initial", [Number(instance_idx), Number(s_idx)]))
            for s_idx in instance_data.state_space.get_states().keys():
                facts.append(("state", [Number(instance_idx), Number(s_idx)]))
                if not instance_data.is_deadend(s_idx):
                    facts.append(("solvable", [Number(instance_idx), Number(s_idx)]))
                else:
                    facts.append(("unsolvable", [Number(instance_idx), Number(s_idx)]))
                if instance_data.is_goal(s_idx):
                    facts.append(("goal", [Number(instance_idx), Number(s_idx)]))
                else:
                    facts.append(("nongoal", [Number(instance_idx), Number(s_idx)]))
                if instance_data.is_alive(s_idx):
                    facts.append(("alive", [Number(instance_idx), Number(s_idx)]))
        return facts

    def make_domain_feature_data_facts(self, domain_data: DomainData, instance_datas: List[InstanceData]):
        facts = []
        # Domain feature facts
        for f_idx, boolean in enumerate(domain_data.domain_feature_data.boolean_features.features_by_index):
            facts.append(("boolean", [Number(f_idx)]))
            facts.append(("feature", [Number(f_idx)]))
            facts.append(("complexity", [Number(f_idx), Number(boolean.complexity)]))
        for f_idx, numerical in enumerate(domain_data.domain_feature_data.numerical_features.features_by_index):
            facts.append(("numerical", [Number(f_idx + len(domain_data.domain_feature_data.boolean_features.features_by_index))]))
            facts.append(("feature", [Number(f_idx + len(domain_data.domain_feature_data.boolean_features.features_by_index))]))
            facts.append(("complexity", [Number(f_idx + len(domain_data.domain_feature_data.boolean_features.features_by_index)), Number(numerical.complexity)]))
        return facts

    def make_instance_feature_data_facts(self, domain_data: DomainData, instance_datas: List[InstanceData]):
        facts = []
        # Instance feature valuation facts
        for instance_data in instance_datas:
            for s_idx in instance_data.state_space.get_states().keys():
                feature_valuation = instance_data.feature_valuations[s_idx]
                for f_idx, f_val in enumerate(feature_valuation.boolean_feature_valuations):
                    facts.append(("value", [Number(instance_data.id), Number(s_idx), Number(f_idx), Number(f_val)]))
                    facts.append(("b_value", [Number(instance_data.id), Number(s_idx), Number(f_idx), Number(f_val)]))
                for f_idx, f_val in enumerate(feature_valuation.numerical_feature_valuations):
                    facts.append(("value", [Number(instance_data.id), Number(s_idx), Number(f_idx + len(feature_valuation.boolean_feature_valuations)), Number(f_val)]))
                    facts.append(("b_value", [Number(instance_data.id), Number(s_idx), Number(f_idx + len(feature_valuation.boolean_feature_valuations)), Number(1 if f_val > 0 else 0)]))
        return facts

    def make_state_pair_equivalence_data_facts(self, domain_data: DomainData, instance_datas: List[InstanceData]):
        facts = []
        # State pair facts
        for r_idx, rule in enumerate(domain_data.domain_state_pair_equivalence.rules):
            facts.append(("state_pair_class", [Number(r_idx)]))
            for condition in rule.get_conditions():
                condition_str = condition.str()
                result = re.findall(r"\(.* (\d+)\)", condition_str)
                assert len(result) == 1
                f_idx = int(result[0])
                if condition_str.startswith("(:c_b_pos"):
                    facts.append(("feature_condition", [Number(r_idx), Number(f_idx), Number(0)]))
                    facts.append(("c_pos_rule", [Number(r_idx), Number(f_idx)]))
                elif condition_str.startswith("(:c_b_neg"):
                    facts.append(("feature_condition", [Number(r_idx), Number(f_idx), Number(1)]))
                    facts.append(("c_neg_rule", [Number(r_idx), Number(f_idx)]))
                elif condition_str.startswith("(:c_n_gt"):
                    facts.append(("feature_condition", [Number(r_idx), Number(f_idx + len(domain_data.domain_feature_data.boolean_features.features_by_index)), Number(2)]))
                    facts.append(("c_gt_rule", [Number(r_idx), Number(f_idx + len(domain_data.domain_feature_data.boolean_features.features_by_index))]))
                elif condition_str.startswith("(:c_n_eq"):
                    facts.append(("feature_condition", [Number(r_idx), Number(f_idx + len(domain_data.domain_feature_data.boolean_features.features_by_index)), Number(3)]))
                    facts.append(("c_eq_rule", [Number(r_idx), Number(f_idx + len(domain_data.domain_feature_data.boolean_features.features_by_index))]))
                else:
                    raise Exception(f"Cannot parse condition {condition_str}")
            for effect in rule.get_effects():
                effect_str = effect.str()
                result = re.findall(r"\(.* (\d+)\)", effect_str)
                assert len(result) == 1
                f_idx = int(result[0])
                if effect_str.startswith("(:e_b_pos"):
                    facts.append(("feature_effect", [Number(r_idx), Number(f_idx), Number(0)]))
                    facts.append(("e_pos_rule", [Number(r_idx), Number(f_idx)]))
                elif effect_str.startswith("(:e_b_neg"):
                    facts.append(("feature_effect", [Number(r_idx), Number(f_idx), Number(1)]))
                    facts.append(("e_neg_rule", [Number(r_idx), Number(f_idx)]))
                elif effect_str.startswith("(:e_b_bot"):
                    facts.append(("feature_effect", [Number(r_idx), Number(f_idx), Number(2)]))
                    facts.append(("e_bot_rule", [Number(r_idx), Number(f_idx)]))
                elif effect_str.startswith("(:e_n_inc"):
                    facts.append(("feature_effect", [Number(r_idx), Number(f_idx + len(domain_data.domain_feature_data.boolean_features.features_by_index)), Number(3)]))
                    facts.append(("e_inc_rule", [Number(r_idx), Number(f_idx + len(domain_data.domain_feature_data.boolean_features.features_by_index))]))
                elif effect_str.startswith("(:e_n_dec"):
                    facts.append(("feature_effect", [Number(r_idx), Number(f_idx + len(domain_data.domain_feature_data.boolean_features.features_by_index)), Number(4)]))
                    facts.append(("e_dec_rule", [Number(r_idx), Number(f_idx + len(domain_data.domain_feature_data.boolean_features.features_by_index))]))
                elif effect_str.startswith("(:e_n_bot"):
                    facts.append(("feature_effect", [Number(r_idx), Number(f_idx + len(domain_data.domain_feature_data.boolean_features.features_by_index)), Number(5)]))
                    facts.append(("e_bot_rule", [Number(r_idx), Number(f_idx + len(domain_data.domain_feature_data.boolean_features.features_by_index))]))
                else:
                    raise Exception(f"Cannot parse effect {effect_str}")
        # State pair equivalence facts
        #print("cover:")
        for instance_data in instance_datas:
            for s_idx, state_pair_equivalence in instance_data.state_pair_equivalences.items():
                if instance_data.is_deadend(s_idx):
                    continue
                for r_idx, d in state_pair_equivalence.r_idx_to_distance.items():
                    facts.append(("r_distance", [Number(instance_data.id), Number(s_idx), Number(r_idx), Number(d)]))
                for r_idx, s_prime_idxs in state_pair_equivalence.r_idx_to_subgoal_states.items():
                    for s_prime_idx in s_prime_idxs:
                        facts.append(("cover", [Number(instance_data.id), Number(s_idx), Number(s_prime_idx), Number(r_idx)]))
                        #print(instance_data.id, s_idx, s_prime_idx, r_idx)
        return facts

    def make_tuple_graph_equivalence_facts(self, domain_data: DomainData, instance_datas: List[InstanceData]):
        facts = []
        # Tuple graph equivalence facts (Perhaps deprecated since we now let rules imply subgoals)
        for instance_data in instance_datas:
            for s_idx, tuple_graph_equivalence in instance_data.tuple_graph_equivalences.items():
                if instance_data.is_deadend(s_idx):
                    continue
                for t_idx, r_idxs in tuple_graph_equivalence.t_idx_to_r_idxs.items():
                    facts.append(("tuple", [Number(instance_data.id), Number(s_idx), Number(t_idx)]))
                    for r_idx in r_idxs:
                        facts.append(("contain", [Number(instance_data.id), Number(s_idx), Number(t_idx), Number(r_idx)]))
                for t_idx, d in tuple_graph_equivalence.t_idx_to_distance.items():
                    facts.append(("t_distance", [Number(instance_data.id), Number(s_idx), Number(t_idx), Number(d)]))
                for r_idx, d in tuple_graph_equivalence.r_idx_to_deadend_distance.items():
                    facts.append(("d_distance", [Number(instance_data.id), Number(s_idx), Number(r_idx), Number(d)]))
        return facts

    def make_tuple_graph_facts(self, domain_data: DomainData, instance_datas: List[InstanceData]):
        facts = []
        for instance_data in instance_datas:
            for s_idx, tuple_graph in instance_data.tuple_graphs.items():
                for d, s_prime_idxs in enumerate(tuple_graph.get_state_indices_by_distance()):
                    for s_prime_idx in s_prime_idxs:
                        facts.append(("s_distance", [Number(instance_data.id), Number(s_idx), Number(s_prime_idx), Number(d)]))
        return facts

    def make_facts(self, domain_data: DomainData, instance_datas: List[InstanceData]):
        facts = []
        facts.extend(self.make_state_space_facts(domain_data, instance_datas))
        facts.extend(self.make_domain_feature_data_facts(domain_data, instance_datas))
        facts.extend(self.make_instance_feature_data_facts(domain_data, instance_datas))
        facts.extend(self.make_state_pair_equivalence_data_facts(domain_data, instance_datas))
        facts.extend(self.make_tuple_graph_equivalence_facts(domain_data, instance_datas))
        facts.extend(self.make_tuple_graph_facts(domain_data, instance_datas))
        return facts

    def ground(self, facts=[]):
        facts.append(("base", []))
        self.ctl.ground(facts)  # ground a set of facts

    def solve(self):
        with self.ctl.solve(yield_=True) as solve_handle:
            for model in solve_handle:
                if model.optimality_proven:
                    return model.symbols(shown=True), ClingoExitCode.SATISFIABLE
            if solve_handle.get().unsatisfiable:
                return None, ClingoExitCode.UNSATISFIABLE
            return None, ClingoExitCode.UNKNOWN

    def print_statistics(self):
        print("Clingo statistics:")
        print(self.ctl.statistics["summary"])
        print("Solution cost:", self.ctl.statistics["summary"]["costs"])  # Note: we add +1 cost to each feature
        print("Total time:", self.ctl.statistics["summary"]["times"]["total"])
        print("CPU time:", self.ctl.statistics["summary"]["times"]["cpu"])
        print("Solve time:", self.ctl.statistics["summary"]["times"]["solve"])
