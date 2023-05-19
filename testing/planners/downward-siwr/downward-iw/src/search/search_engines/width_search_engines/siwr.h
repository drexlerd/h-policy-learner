#ifndef SEARCH_ENGINES_SERIALIZED_SEARCH_ENGINE_H
#define SEARCH_ENGINES_SERIALIZED_SEARCH_ENGINE_H

#include "hierarchical_search_engine.h"


namespace options {
class Options;
}

namespace width_search_engine {
class SIWR : public HierarchicalSearchEngine {
private:
    IWSolutions m_partial_solutions;

    HierarchicalSearchEngine* m_child_search;

protected:
    /**
     * Executes a step of the single child search engine.
     */
    virtual SearchStatus step() override;

    virtual IWSolutions get_partial_solutions() const override;

public:
    explicit SIWR(const options::Options &opts);

    virtual void print_statistics() const override;
};
}

#endif
