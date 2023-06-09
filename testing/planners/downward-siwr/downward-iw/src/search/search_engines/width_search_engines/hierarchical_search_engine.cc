#include "hierarchical_search_engine.h"

#include "../../option_parser.h"
#include "../../plugin.h"
#include "../../tasks/root_task.h"
#include "../../tasks/propositional_task.h"
#include "../../utils/countdown_timer.h"

#include <string>
#include <deque>
#include <memory>
#include <vector>

using namespace std;


namespace width_search_engine {

static std::vector<std::shared_ptr<HierarchicalSearchEngine>>
to_hierarchical_search_engines(const std::vector<std::shared_ptr<SearchEngine>>& child_search_engines) {
    std::vector<std::shared_ptr<HierarchicalSearchEngine>> result;
    for (std::shared_ptr<SearchEngine> child_search_engine : child_search_engines) {
        result.push_back(std::dynamic_pointer_cast<HierarchicalSearchEngine>(child_search_engine));
    }
    return result;
}


HierarchicalSearchEngine::HierarchicalSearchEngine(
    const options::Options &opts)
    : SearchEngine(opts),
      m_state_registry(nullptr),
      m_propositional_task(nullptr),
      m_goal_test(opts.get<std::shared_ptr<goal_test::GoalTest>>("goal_test")),
      m_parent_search_engine(nullptr),
      m_child_search_engines(to_hierarchical_search_engines(opts.get_list<std::shared_ptr<SearchEngine>>("child_searches"))),
      m_initial_state_id(StateID::no_state),
      m_debug(opts.get<utils::Verbosity>("verbosity") == utils::Verbosity::DEBUG) {
      //m_debug(true) {
}

void HierarchicalSearchEngine::initialize() {
    utils::g_log << "Top level initialization of HierarchicalSearchEngine." << endl;
    set_state_registry(std::make_shared<StateRegistry>(task_proxy));
    set_propositional_task(std::make_shared<extra_tasks::PropositionalTask>(tasks::g_root_task, task_proxy));
    set_initial_state(m_state_registry->get_initial_state());
    set_parent_search_engine(nullptr);
}

bool HierarchicalSearchEngine::is_goal(const State &state) {
    utils::Timer timer;
    bool is_goal = m_goal_test->is_goal(state);
    timer.stop();
    statistics.inc_valuation_seconds(timer());
    return is_goal;
}

void HierarchicalSearchEngine::set_state_registry(std::shared_ptr<StateRegistry> state_registry) {
    m_state_registry = state_registry;
    for (const auto& child_search_engine_ptr : m_child_search_engines) {
        child_search_engine_ptr->set_state_registry(state_registry);
    }
}

void HierarchicalSearchEngine::set_propositional_task(
    std::shared_ptr<extra_tasks::PropositionalTask> propositional_task) {
    m_propositional_task = propositional_task;
    m_goal_test->set_propositional_task(propositional_task);
    for (const auto& child_search_engine_ptr : m_child_search_engines) {
        child_search_engine_ptr->set_propositional_task(propositional_task);
    }
}

void HierarchicalSearchEngine::set_parent_search_engine(
    HierarchicalSearchEngine* parent) {
    m_parent_search_engine = parent;
    for (const auto& child_search_engine_ptr : m_child_search_engines) {
        child_search_engine_ptr->set_parent_search_engine(this);
    }
}

bool HierarchicalSearchEngine::set_initial_state(const State &state)
{
    if (m_debug)
        std::cout << get_name() << " set_initial_state: " << m_propositional_task->compute_dlplan_state(state).str() << std::endl;

    m_initial_state_id = state.get_id();
    for (const auto& child_search_engine_ptr : m_child_search_engines) {
        child_search_engine_ptr->set_initial_state(state);
    }
    return m_goal_test->set_initial_state(state);
}

std::string HierarchicalSearchEngine::get_name() {
    std::stringstream ss;
    ss << this << " " << m_name;
    return ss.str();
}

void HierarchicalSearchEngine::collect_statistics() {
    for (const auto& child_search_engine : m_child_search_engines) {
        child_search_engine->collect_statistics();
        statistics.inc_generated(child_search_engine->statistics.get_generated());
        statistics.inc_expanded(child_search_engine->statistics.get_expanded());
        statistics.inc_valuation_seconds(child_search_engine->statistics.get_valuation_seconds());
    }
}

void HierarchicalSearchEngine::add_child_search_engine_option(OptionParser &parser) {
    parser.add_list_option<std::shared_ptr<SearchEngine>>(
        "child_searches",
        "The child searches to be executed.",
        "[]");
}

void HierarchicalSearchEngine::add_goal_test_option(OptionParser &parser) {
    parser.add_option<std::shared_ptr<goal_test::GoalTest>>(
        "goal_test",
        "The goal test to be executed.",
        "top_goal()");
}

static PluginTypePlugin<HierarchicalSearchEngine> _type_plugin(
    "HierarchicalSearchEngine",
    "Hierarchical search engine.");
}
