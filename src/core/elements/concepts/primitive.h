#ifndef DLP_SRC_CORE_ELEMENTS_CONCEPTS_PRIMITIVE_H_
#define DLP_SRC_CORE_ELEMENTS_CONCEPTS_PRIMITIVE_H_

#include <algorithm>

#include "../concept.h"

namespace dlp {
namespace core {
namespace element {

class PrimitiveConcept : public Concept {
protected:
    const int m_predicate_idx;
    const int m_pos;

protected:
    const ConceptDenotation& evaluate_impl(const State& state) override {
        const InstanceInfo& info = *state.get_instance_info();
        ConceptDenotation_Set result_set;
        for (int atom_idx : state.get_atom_idxs()) {
            const Atom& atom = info.get_atom(atom_idx);
            if (atom.get_predicate().get_index() == m_predicate_idx) {
                result_set.insert(atom.get_object(m_pos).get_index());
            }
        }
        m_result.clear();
        m_result.insert(m_result.end(), result_set.begin(), result_set.end());
        return m_result;
    }

public:
    PrimitiveConcept(const VocabularyInfo& vocabulary, const std::string& name, int pos)
    : Concept(vocabulary, name), m_predicate_idx(vocabulary.get_predicate_idx(m_name)), m_pos(pos) {
        int predicate_arity = vocabulary.get_predicate(m_predicate_idx).get_arity();
        if (m_pos >= predicate_arity) {
            throw std::runtime_error("PrimitiveConcept::PrimitiveConcept - object index does not match predicate arity ("s + std::to_string(m_pos) + " > " + std::to_string(predicate_arity) + ").");
        }
    }

    int compute_complexity() const override {
        return 1;
    }


    std::string compute_repr() const override {
        std::stringstream ss;
        ss << m_name << "(" << std::to_string(m_pos) << ")";
        return ss.str();
    }
};

}
}
}

#endif
