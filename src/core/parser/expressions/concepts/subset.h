#ifndef DLP_SRC_CORE_PARSER_EXPRESSIONS_CONCEPTS_SUBSET_H_
#define DLP_SRC_CORE_PARSER_EXPRESSIONS_CONCEPTS_SUBSET_H_

#include "../concept.h"
#include "../../../elements/concepts/subset.h"

namespace dlp {
namespace core {
namespace parser {

class SubsetConcept : public Concept {
protected:
    element::Concept_Ptr parse_concept_impl(const VocabularyInfo& vocabulary, ElementCache &cache) const override {
        if (m_children.size() != 2) {
            throw std::runtime_error("SubsetConcept::parse_concept_impl - number of children ("s + std::to_string(m_children.size()) + " != 2).");
        }
        // 1. Parse children
        element::Role_Ptr role_left = m_children[0]->parse_role(vocabulary, cache);
        element::Role_Ptr role_right = m_children[1]->parse_role(vocabulary, cache);
        if (!(role_left && role_right)) {
            throw std::runtime_error("SubsetConcept::parse_concept_impl - at least one children is a nullptr");
        }
        // 2. Construct element
        return std::make_shared<element::SubsetConcept>(vocabulary, role_left, role_right);
    }

public:
    SubsetConcept(const std::string &name, std::vector<std::unique_ptr<Expression>> &&children)
    : Concept(name, std::move(children)) { }
};

}
}
}

#endif
