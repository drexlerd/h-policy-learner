#ifndef DLPLAN_SRC_CORE_PARSER_EXPRESSIONS_NUMERICAL_H_
#define DLPLAN_SRC_CORE_PARSER_EXPRESSIONS_NUMERICAL_H_

#include "expression.h"

namespace dlplan::core {
class Numerical;
}


namespace dlplan::core::parser {

class Numerical : public Expression {
protected:
    /**
     * Construct the Numerical.
     */
    virtual std::unique_ptr<dlplan::core::Numerical> parse_numerical_impl(std::shared_ptr<const VocabularyInfo> vocabulary_info, Caches &caches) const = 0;

public:
    Numerical(const std::string &name, std::vector<std::unique_ptr<Expression>> &&children)
    : Expression(name, std::move(children)) { }

    /**
     * Construct or retrieve the Numerical.
     */
    virtual std::shared_ptr<const dlplan::core::Numerical> parse_numerical(std::shared_ptr<const VocabularyInfo> vocabulary_info, Caches &caches) const {
        return caches.m_numerical_cache->insert(parse_numerical_impl(vocabulary_info, caches)).first;
    }
};

}

#endif
