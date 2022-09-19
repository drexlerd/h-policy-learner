#ifndef DLPLAN_SRC_CORE_ELEMENTS_BOOLEANS_NULLARY_H_
#define DLPLAN_SRC_CORE_ELEMENTS_BOOLEANS_NULLARY_H_

#include "../boolean.h"



namespace dlplan::core::element {

class NullaryBoolean : public Boolean {
private:
    void compute_result(const State& state, bool& result) const {
        const auto& per_predicate_idx_atom_idxs = state.get_per_predicate_idx_atom_idxs_ref();
        auto it = per_predicate_idx_atom_idxs.find(m_predicate.get_index());
        if (it != per_predicate_idx_atom_idxs.end()) {
            result = !it->second.empty();
            return;
        }
        const auto& per_predicate_idx_static_atom_idxs = state.get_instance_info()->get_per_predicate_idx_static_atom_idxs_ref();
        it = per_predicate_idx_static_atom_idxs.find(m_predicate.get_index());
        if (it != per_predicate_idx_static_atom_idxs.end()) {
            result = !it->second.empty();
            return;
        }
        result = false;
    }

protected:
    const Predicate m_predicate;

public:
    NullaryBoolean(const VocabularyInfo& vocabulary, const Predicate& predicate)
    : Boolean(vocabulary), m_predicate(predicate) {
        if (predicate.get_arity() != 0) {
            throw std::runtime_error("NullaryBoolean::NullaryBoolean - expected predicate with arity 0.");
        }
        if (!vocabulary.exists_predicate(predicate)) {
            throw std::runtime_error("NullaryBoolean::NullaryBoolean - predicate does not exist in VocabularyInfo.");
        }
    }

    bool evaluate(const State& state) const override {
        bool denotation;
        compute_result(state, denotation);
        return denotation;
    }

    const bool* evaluate(const State& state, GeneratorEvaluationCaches& cache) const override {
        auto boolean_cache_entry = cache.m_boolean_denotation_cache.find(state, *this);
        auto& status = boolean_cache_entry->m_status;
        auto& denotation = boolean_cache_entry->m_denotation;
        if (status) {
            return &denotation;
        }
        compute_result(state, denotation);
        status = true;
        return &denotation;
    }

    int compute_complexity() const override {
        return 1;
    }

    void compute_repr(std::stringstream& out) const override {
        out << get_name() << "(" << m_predicate.get_name_ref() << ")";
    }

    static std::string get_name() {
        return "b_nullary";
    }
};

}

#endif
