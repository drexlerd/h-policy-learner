import logging

from dlplan.core import VocabularyInfo, SyntacticElementFactory
from dlplan.generator import FeatureGenerator
from dlplan.policy import PolicyBuilder

from learner.src.domain_data.domain_data import DomainData


def compute_domain_data(config, vocabulary_info: VocabularyInfo) -> DomainData:
    logging.info(f"Constructing DomainData for filename {config.domain_filename}")
    domain_filename = config.domain_filename
    policy_builder = PolicyBuilder()
    syntactic_element_factory = SyntacticElementFactory(vocabulary_info)
    feature_generator = FeatureGenerator()
    feature_generator.set_generate_inclusion_boolean(False)
    feature_generator.set_generate_diff_concept(False)
    feature_generator.set_generate_or_concept(False)
    feature_generator.set_generate_projection_concept(False)
    feature_generator.set_generate_subset_concept(False)
    feature_generator.set_generate_compose_role(False)
    feature_generator.set_generate_diff_role(False)
    feature_generator.set_generate_identity_role(False)
    feature_generator.set_generate_not_role(False)
    feature_generator.set_generate_or_role(False)
    feature_generator.set_generate_top_role(False)
    feature_generator.set_generate_transitive_reflexive_closure_role(False)
    return DomainData(domain_filename, vocabulary_info, policy_builder, syntactic_element_factory, feature_generator)