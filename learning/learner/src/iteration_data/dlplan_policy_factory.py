from abc import ABC, abstractmethod

import dlplan
from clingo import Symbol
from typing import  List

from learner.src.domain_data.domain_data import DomainData


class DlplanPolicyFactory(ABC):
    @abstractmethod
    def make_dlplan_policy_from_answer_set(self, symbols: List[Symbol], domain_data: DomainData):
        """
        Parses the facts of an answer set into a dlplan policy.
        """


class ExplicitDlplanPolicyFactory(DlplanPolicyFactory):
    """
    Encoding where rules are explicit in the ASP encoding (ICAPS2022)
    """
    def make_dlplan_policy_from_answer_set(self, symbols: List[Symbol], domain_data: DomainData):
        policy_builder = domain_data.policy_builder
        f_idx_to_policy_feature = self._add_features(policy_builder, symbols, domain_data)
        rules = self._add_rules(policy_builder, symbols, f_idx_to_policy_feature)
        return policy_builder.add_policy(rules)

    def _add_features(self, policy_builder: dlplan.PolicyBuilder, symbols: List[Symbol], domain_data: DomainData):
        f_idx_to_policy_feature = dict()
        #print("Num booleans:", len(domain_data.domain_feature_data.boolean_features.features_by_index))
        #print("Num numericals:", len(domain_data.domain_feature_data.numerical_features.features_by_index))
        for symbol in symbols:
            if symbol.name == "select":
                f_idx = symbol.arguments[0].number
                if f_idx < len(domain_data.domain_feature_data.boolean_features.features_by_index):
                    #print(f_idx, domain_data.domain_feature_data.boolean_features.features_by_index[f_idx].dlplan_feature.compute_repr())
                    f_idx_to_policy_feature[f_idx] = domain_data.domain_feature_data.boolean_features.features_by_index[f_idx].dlplan_feature
                else:
                    #print(f_idx, domain_data.domain_feature_data.numerical_features.features_by_index[f_idx - len(domain_data.domain_feature_data.boolean_features.features_by_index)].dlplan_feature.compute_repr())
                    f_idx_to_policy_feature[f_idx] = domain_data.domain_feature_data.numerical_features.features_by_index[f_idx - len(domain_data.domain_feature_data.boolean_features.features_by_index)].dlplan_feature
        return f_idx_to_policy_feature

    def _add_rules(self, policy_builder: dlplan.PolicyBuilder, symbols: List[Symbol], f_idx_to_policy_feature):
        rules_dict = dict()
        for symbol in symbols:
            if symbol.name == "rule":
                r_idx = symbol.arguments[0].number
                rules_dict[r_idx] = [set(), set()]  # conditions and effects
        for symbol in symbols:
            try:
                r_idx = symbol.arguments[0].number
                f_idx = symbol.arguments[1].number
            except IndexError:
                continue
            if f_idx not in f_idx_to_policy_feature: continue
            if symbol.name == "c_eq":
                rules_dict[r_idx][0].add(policy_builder.add_eq_condition(f_idx_to_policy_feature[f_idx]))
            elif symbol.name == "c_gt":
                rules_dict[r_idx][0].add(policy_builder.add_gt_condition(f_idx_to_policy_feature[f_idx]))
            elif symbol.name == "c_pos":
                rules_dict[r_idx][0].add(policy_builder.add_pos_condition(f_idx_to_policy_feature[f_idx]))
            elif symbol.name == "c_neg":
                rules_dict[r_idx][0].add(policy_builder.add_neg_condition(f_idx_to_policy_feature[f_idx]))
            elif symbol.name == "e_inc":
                rules_dict[r_idx][1].add(policy_builder.add_inc_effect(f_idx_to_policy_feature[f_idx]))
            elif symbol.name == "e_dec":
                rules_dict[r_idx][1].add(policy_builder.add_dec_effect(f_idx_to_policy_feature[f_idx]))
            elif symbol.name == "e_bot":
                rules_dict[r_idx][1].add(policy_builder.add_bot_effect(f_idx_to_policy_feature[f_idx]))
            elif symbol.name == "e_pos":
                rules_dict[r_idx][1].add(policy_builder.add_pos_effect(f_idx_to_policy_feature[f_idx]))
            elif symbol.name == "e_neg":
                rules_dict[r_idx][1].add(policy_builder.add_neg_effect(f_idx_to_policy_feature[f_idx]))
            elif symbol.name == "e_bot":
                rules_dict[r_idx][1].add(policy_builder.add_bot_effect(f_idx_to_policy_feature[f_idx]))
        rules = set()
        for _, (conditions, effects) in rules_dict.items():
            rules.add(policy_builder.add_rule(conditions, effects))
        return rules


class D2sepDlplanPolicyFactory(DlplanPolicyFactory):
    """
    Encoding where rules are implicit in the D2-separation.
    """
    def make_dlplan_policy_from_answer_set(self, symbols: List[Symbol], domain_data: DomainData):
        policy_builder = domain_data.policy_builder
        selected_feature_reprs = set()
        for symbol in symbols:
            if symbol.name == "select":
                f_idx = symbol.arguments[0].number
                if f_idx < len(domain_data.domain_feature_data.boolean_features.features_by_index):
                    selected_feature_reprs.add(domain_data.domain_feature_data.boolean_features.features_by_index[f_idx].dlplan_feature.compute_repr())
                else:
                    selected_feature_reprs.add(domain_data.domain_feature_data.numerical_features.features_by_index[f_idx - len(domain_data.domain_feature_data.boolean_features.features_by_index)].dlplan_feature.compute_repr())
        rules = set()
        for symbol in symbols:
            if symbol.name == "good":
                r_idx = symbol.arguments[0].number
                rule = domain_data.domain_state_pair_equivalence.rules[r_idx]
                conditions = []
                for condition in rule.get_conditions():
                    if condition.get_base_feature().compute_repr() in selected_feature_reprs:
                        new_condition = condition.copy_to_builder(policy_builder)
                        conditions.append(new_condition)
                effects = []
                for effect in rule.get_effects():
                    if effect.get_base_feature().compute_repr() in selected_feature_reprs:
                        new_effect = effect.copy_to_builder(policy_builder)
                        effects.append(new_effect)
                rules.add(policy_builder.add_rule(conditions, effects))
        return policy_builder.add_policy(rules)
