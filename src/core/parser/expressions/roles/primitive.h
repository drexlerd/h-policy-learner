#ifndef DLP_SRC_CORE_PARSER_EXPRESSIONS_ROLES_PRIMITIVE_H_
#define DLP_SRC_CORE_PARSER_EXPRESSIONS_ROLES_PRIMITIVE_H_

#include "../role.h"
#include "../../utils.h"
#include "../../../elements/roles/primitive.h"

namespace dlp {
namespace core {
namespace parser {

class PrimitiveRoleExpression : public RoleExpression {
protected:
    virtual element::RoleElement_Ptr parse_role_element_impl(ElementCache &cache) const override {
        if (m_children.size() != 2) {
            throw std::runtime_error("PrimitiveRoleExpression::parse_role_element_impl - number of children ("s + std::to_string(m_children.size()) + " != 2).");
        }
        // 1. Parse children
        unsigned pos_1 = try_parse(m_children[0]->name());
        unsigned pos_2 = try_parse(m_children[0]->name());
        // 2. Construct element
        return std::make_shared<element::PrimitiveRoleElement>(m_name, pos_1, pos_2);
    }

public:
    PrimitiveRoleExpression(const std::string &name, std::vector<std::unique_ptr<Expression>> &&children)
    : RoleExpression(name, std::move(children)) { }
};

}
}
}

#endif
