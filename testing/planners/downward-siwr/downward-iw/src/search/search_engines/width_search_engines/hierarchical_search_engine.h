#ifndef SEARCH_ENGINES_HIERARCHICAL_SEARCH_ENGINE_H
#define SEARCH_ENGINES_HIERARCHICAL_SEARCH_ENGINE_H

#include "goal_test.h"

#include "../../search_engine.h"
#include "../../state_id.h"

#include <memory>
#include <vector>


namespace options {
class Options;
class OptionParser;
}

namespace width_search_engine {
class IW;
class SIWR;

/**
 * Solution of an IW search.
 * In addition to plan, we also store
 * the target state to proceed search greedily,
 * the effective width used to solve the subproblem.
*/
struct IWSolution {
    // The applied actions
    Plan plan;
    // The reached state
    StateID state_id;
    // effective width;
    int ew;

    IWSolution() :
        state_id(StateID::no_state) { }

    IWSolution(Plan plan, StateID state_id, int ew)
        : plan(plan), state_id(state_id), ew(ew) { }
};
using IWSolutions = std::vector<IWSolution>;


class HierarchicalSearchEngine : public SearchEngine {
friend class SIWR;
friend class IW;

protected:
    std::string m_name;

    std::shared_ptr<StateRegistry> m_state_registry;
    std::shared_ptr<extra_tasks::PropositionalTask> m_propositional_task;
    std::shared_ptr<goal_test::GoalTest> m_goal_test;

    HierarchicalSearchEngine* m_parent_search_engine;
    std::vector<std::shared_ptr<HierarchicalSearchEngine>> m_child_search_engines;

    StateID m_initial_state_id;

    bool m_debug;

protected:
    /**
     * Performs task transformation to ModifiedInitialStateTask.
     */
    explicit HierarchicalSearchEngine(const options::Options &opts);

    /**
     * Top-level initialization.
     */
    virtual void initialize() override;

    virtual bool is_goal(const State &state);

    /**
     * Child-level initialization.
     */
    virtual void set_state_registry(std::shared_ptr<StateRegistry> state_registry);
    virtual void set_propositional_task(std::shared_ptr<extra_tasks::PropositionalTask> propositional_task);
    virtual void set_parent_search_engine(HierarchicalSearchEngine* parent);

    /**
     * Sets the new initial state.
     */
    virtual bool set_initial_state(const State& state);

    /**
     * Getters.
     */
    virtual std::string get_name();
    virtual IWSolutions get_partial_solutions() const = 0;
    virtual void collect_statistics();

public:
    static void add_child_search_engine_option(options::OptionParser &parser);
    static void add_goal_test_option(options::OptionParser &parser);
};
}

#endif
