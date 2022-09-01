#include "effect.h"


namespace dlplan::policy {

BooleanEffect::BooleanEffect(std::shared_ptr<const core::Boolean> boolean)
    : BaseEffect(boolean), m_boolean(boolean) { }


NumericalEffect::NumericalEffect(std::shared_ptr<const core::Numerical> numerical)
    : BaseEffect(numerical), m_numerical(numerical) { }


PositiveBooleanEffect::PositiveBooleanEffect(std::shared_ptr<const core::Boolean> boolean_feature)
    : BooleanEffect(boolean_feature) {}

bool PositiveBooleanEffect::evaluate(evaluator::EvaluationContext&, evaluator::EvaluationContext& target_context) const {
    return target_context.cache.retrieve_or_evaluate(*m_boolean, target_context);
}

std::string PositiveBooleanEffect::compute_repr() const{
    return "(:e_b_pos " + std::to_string(m_boolean->get_index()) + ")";
}

std::shared_ptr<const BaseEffect> PositiveBooleanEffect::visit(PolicyBuilder& policy_builder) const {
    return policy_builder.add_pos_effect(policy_builder.add_boolean_feature(*m_boolean));
}


NegativeBooleanEffect::NegativeBooleanEffect(std::shared_ptr<const core::Boolean> boolean_feature)
    : BooleanEffect(boolean_feature) {}

bool NegativeBooleanEffect::evaluate(evaluator::EvaluationContext&, evaluator::EvaluationContext& target_context) const {
    return !target_context.cache.retrieve_or_evaluate(*m_boolean, target_context);
}

std::string NegativeBooleanEffect::compute_repr() const{
    return "(:e_b_neg " + std::to_string(m_boolean->get_index()) + ")";
}

std::shared_ptr<const BaseEffect> NegativeBooleanEffect::visit(PolicyBuilder& policy_builder) const {
    return policy_builder.add_neg_effect(policy_builder.add_boolean_feature(*m_boolean));
}


UnchangedBooleanEffect::UnchangedBooleanEffect(std::shared_ptr<const core::Boolean> boolean_feature)
    : BooleanEffect(boolean_feature) {}

bool UnchangedBooleanEffect::evaluate(evaluator::EvaluationContext& source_context, evaluator::EvaluationContext& target_context) const {
    return source_context.cache.retrieve_or_evaluate(*m_boolean, source_context) == target_context.cache.retrieve_or_evaluate(*m_boolean, target_context);
}

std::string UnchangedBooleanEffect::compute_repr() const{
    return "(:e_b_bot " + std::to_string(m_boolean->get_index()) + ")";
}

std::shared_ptr<const BaseEffect> UnchangedBooleanEffect::visit(PolicyBuilder& policy_builder) const {
    return policy_builder.add_bot_effect(policy_builder.add_boolean_feature(*m_boolean));
}


IncrementNumericalEffect::IncrementNumericalEffect(std::shared_ptr<const core::Numerical> numerical_feature)
    : NumericalEffect(numerical_feature) {}

bool IncrementNumericalEffect::evaluate(evaluator::EvaluationContext& source_context, evaluator::EvaluationContext& target_context) const {
    return source_context.cache.retrieve_or_evaluate(*m_numerical, source_context) < target_context.cache.retrieve_or_evaluate(*m_numerical, target_context);
}

std::string IncrementNumericalEffect::compute_repr() const{
    return "(:e_n_inc " + std::to_string(m_numerical->get_index()) + ")";
}

std::shared_ptr<const BaseEffect> IncrementNumericalEffect::visit(PolicyBuilder& policy_builder) const {
    return policy_builder.add_inc_effect(policy_builder.add_numerical_feature(*m_numerical));
}


DecrementNumericalEffect::DecrementNumericalEffect(std::shared_ptr<const core::Numerical> numerical_feature)
    : NumericalEffect(numerical_feature) {}

bool DecrementNumericalEffect::evaluate(evaluator::EvaluationContext& source_context, evaluator::EvaluationContext& target_context) const {
    return source_context.cache.retrieve_or_evaluate(*m_numerical, source_context) > target_context.cache.retrieve_or_evaluate(*m_numerical, target_context);
}

std::string DecrementNumericalEffect::compute_repr() const{
    return "(:e_n_dec " + std::to_string(m_numerical->get_index()) + ")";
}

std::shared_ptr<const BaseEffect> DecrementNumericalEffect::visit(PolicyBuilder& policy_builder) const {
    return policy_builder.add_dec_effect(policy_builder.add_numerical_feature(*m_numerical));
}


UnchangedNumericalEffect::UnchangedNumericalEffect(std::shared_ptr<const core::Numerical> numerical_feature)
    : NumericalEffect(numerical_feature) {}

bool UnchangedNumericalEffect::evaluate(evaluator::EvaluationContext& source_context, evaluator::EvaluationContext& target_context) const {
    return source_context.cache.retrieve_or_evaluate(*m_numerical, source_context) == target_context.cache.retrieve_or_evaluate(*m_numerical, target_context);
}

std::string UnchangedNumericalEffect::compute_repr() const{
    return "(:e_n_bot " + std::to_string(m_numerical->get_index()) + ")";
}

std::shared_ptr<const BaseEffect> UnchangedNumericalEffect::visit(PolicyBuilder& policy_builder) const {
    return policy_builder.add_bot_effect(policy_builder.add_numerical_feature(*m_numerical));
}

}
