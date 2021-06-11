#ifndef DLP_SRC_CORE_PARSER_EXPRESSIONS_ROLES_PRIMITIVE_H_
#define DLP_SRC_CORE_PARSER_EXPRESSIONS_ROLES_PRIMITIVE_H_

#include "../role.h"
#include "../../utils.h"
#include "../../../elements/roles/primitive.h"

namespace dlp {
namespace core {
namespace parser {

class PrimitiveRole : public Role {
protected:
    element::Role_Ptr parse_role_impl(const VocabularyInfo& vocabulary, ElementCache &) const override {
        if (m_children.size() != 2) {
            throw std::runtime_error("PrimitiveRole::parse_role_impl - number of children ("s + std::to_string(m_children.size()) + " != 2).");
        }
        // 1. Parse children
        int pos_1 = try_parse_number(m_children[0]->get_name());
        int pos_2 = try_parse_number(m_children[1]->get_name());
        // 2. Construct element
        return std::make_shared<element::PrimitiveRole>(vocabulary, m_name, pos_1, pos_2);
    }

public:
    PrimitiveRole(const std::string &name, std::vector<std::unique_ptr<Expression>> &&children)
    : Role(name, std::move(children)) { }
};

}
}
}

#endif
