#ifndef SEARCH_ENGINES_IW_H
#define SEARCH_ENGINES_IW_H

#include "hierarchical_search_engine.h"

#include "../../novelty/novelty_table.h"

#include <dlplan/novelty.h>

#include <deque>
#include <memory>
#include <vector>


namespace options {
class Options;
}


namespace width_search_engine {


class IW : public HierarchicalSearchEngine {
    const int m_width;
    const bool m_iterate;

    std::deque<StateID> m_open_list;
    int m_current_width;

    novelty::NoveltyTable m_novelty_table;

    std::unique_ptr<SearchSpace> m_search_space;

    IWSolution m_solution;

private:
    bool is_novel(const State &state);
    bool is_novel(const OperatorProxy& op, const State &state);

protected:

    /**
     * Generates next successor state and reacts upon.
     * Returns:
     *    - SOLVED if solution is found and can be retrieved with get_partial_solutions()
     *    - FAILED if either search terminated by bound of search space explored
     *    - IN_PROGRESS if search unfinished
     */
    virtual SearchStatus step() override;

    void set_state_registry(std::shared_ptr<StateRegistry> state_registry);
    void set_propositional_task(std::shared_ptr<extra_tasks::PropositionalTask> propositional_task);
    bool set_initial_state(const State& state);

public:
    explicit IW(const options::Options &opts);

    virtual void print_statistics() const override;

    void dump_search_space() const;

    virtual IWSolutions get_partial_solutions() const override;
};
}

#endif
