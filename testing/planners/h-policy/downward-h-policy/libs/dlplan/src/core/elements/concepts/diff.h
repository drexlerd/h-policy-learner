#ifndef DLPLAN_SRC_CORE_ELEMENTS_CONCEPTS_DIFF_H_
#define DLPLAN_SRC_CORE_ELEMENTS_CONCEPTS_DIFF_H_

#include "../../../../include/dlplan/core.h"

#include <sstream>

using namespace std::string_literals;


namespace dlplan::core {

class DiffConcept : public Concept {
private:
    void compute_result(const ConceptDenotation& left_denot, const ConceptDenotation& right_denot, ConceptDenotation& result) const {
        result = left_denot;
        result -= right_denot;
    }

    std::unique_ptr<ConceptDenotation> evaluate_impl(const State& state, DenotationsCaches& caches) const override {
        auto denotation = std::make_unique<ConceptDenotation>(
            ConceptDenotation(state.get_instance_info()->get_objects().size()));
        compute_result(
            *m_concept_left->evaluate(state, caches),
            *m_concept_right->evaluate(state, caches),
            *denotation);
        return denotation;
    }

    std::unique_ptr<ConceptDenotations> evaluate_impl(const States& states, DenotationsCaches& caches) const override {
        auto denotations = std::make_unique<ConceptDenotations>();
        denotations->reserve(states.size());
        auto concept_left_denotations = m_concept_left->evaluate(states, caches);
        auto concept_right_denotations = m_concept_right->evaluate(states, caches);
        for (size_t i = 0; i < states.size(); ++i) {
            auto denotation = std::make_unique<ConceptDenotation>(
                ConceptDenotation(states[i].get_instance_info()->get_objects().size()));
            compute_result(
                *(*concept_left_denotations)[i],
                *(*concept_right_denotations)[i],
                *denotation);
            denotations->push_back(caches.m_c_denot_cache.insert(std::move(denotation)).first->get());
        }
        return denotations;
    }

protected:
    const std::shared_ptr<const Concept> m_concept_left;
    const std::shared_ptr<const Concept> m_concept_right;

public:
    DiffConcept(std::shared_ptr<const VocabularyInfo> vocabulary_info, std::shared_ptr<const Concept> concept_1, std::shared_ptr<const Concept> concept_2)
    : Concept(vocabulary_info, concept_1->is_static() && concept_2->is_static()), m_concept_left(concept_1), m_concept_right(concept_2) {
        if (!(concept_1 && concept_2)) {
            throw std::runtime_error("DiffConcept::DiffConcept - at least one child is a nullptr.");
        }
    }

    ConceptDenotation evaluate(const State& state) const override {
        ConceptDenotation result(state.get_instance_info()->get_objects().size());
        compute_result(
            m_concept_left->evaluate(state),
            m_concept_right->evaluate(state),
            result);
        return result;
    }

    int compute_complexity() const override {
        return m_concept_left->compute_complexity() + m_concept_right->compute_complexity() + 1;
    }

    void compute_repr(std::stringstream& out) const override {
        out << get_name() << "(";
        m_concept_left->compute_repr(out);
        out << ",";
        m_concept_right->compute_repr(out);
        out << ")";
    }

    static std::string get_name() {
        return "c_diff";
    }
};

}

#endif
