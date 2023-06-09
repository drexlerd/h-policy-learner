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


namespace hierarchical_search_engine {

HierarchicalSearchEngine::HierarchicalSearchEngine(
    const options::Options &opts)
    : SearchEngine(opts),
      m_state_registry(nullptr),
      m_propositional_task(nullptr),
      m_goal_test(opts.get<std::shared_ptr<goal_test::GoalTest>>("goal_test")),
      m_bound(std::numeric_limits<int>::max()),
      m_initial_state_id(StateID::no_state),
      m_debug(opts.get<utils::Verbosity>("verbosity") == utils::Verbosity::DEBUG) {
    //m_debug(true) {
    }

void HierarchicalSearchEngine::initialize() {
    utils::g_log << "Top level initialization of HierarchicalSearchEngine." << endl;
    set_state_registry(std::make_shared<StateRegistry>(task_proxy));
    set_propositional_task(std::make_shared<extra_tasks::PropositionalTask>(tasks::g_root_task, task_proxy));
}

bool HierarchicalSearchEngine::is_goal(const State &state) {
    utils::Timer timer;
    bool is_goal = m_goal_test->is_goal(state);
    timer.stop();
    statistics.inc_valuation_seconds(timer());
    return is_goal;
}

void HierarchicalSearchEngine::search() {
    initialize();
    utils::CountdownTimer timer(max_time);
    set_initial_state(m_state_registry->get_initial_state());
    if (is_goal(m_state_registry->get_initial_state())) {
        Plan plan;
        plan_manager.save_plan(plan, task_proxy);
        status = SOLVED;
    } else {
        while (status == IN_PROGRESS) {
            status = step();
            if (timer.is_expired()) {
                log << "Time limit reached. Abort search." << endl;
                status = TIMEOUT;
                break;
            }
        }
    }
    SearchStatistics result_statistics = collect_statistics();
    statistics.inc_generated(result_statistics.get_generated());
    statistics.inc_expanded(result_statistics.get_expanded());
    statistics.inc_valuation_seconds(result_statistics.get_valuation_seconds());
    if (status == SOLVED) {
        Plan plan;
        const auto partial_solutions = get_partial_solutions();
        for (const auto& partial_solution : partial_solutions) {
            plan.insert(plan.end(), partial_solution.plan.begin(), partial_solution.plan.end());
        }
        cout << "Total time for evaluation features: " << statistics.get_valuation_seconds() << endl;
        plan_manager.save_plan(plan, task_proxy);
    }
    // TODO: Revise when and which search times are logged.
    log << "Actual search time: " << timer.get_elapsed_time() << endl;
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

void HierarchicalSearchEngine::set_initial_state(const State &state)
{
    if (m_debug)
        std::cout << get_name() << " set_initial_state: " << m_propositional_task->compute_dlplan_state(state).str() << std::endl;

    statistics.inc_generated();
    m_initial_state_id = state.get_id();
    m_goal_test->set_initial_state(state);
    m_partial_solutions.clear();
}

std::string HierarchicalSearchEngine::get_name() {
    std::stringstream ss;
    ss << this << " " << m_name;
    return ss.str();
}

SearchStatistics HierarchicalSearchEngine::collect_statistics() const {
    SearchStatistics result_statistics(log);
    for (const auto& child_search_engine : m_child_search_engines) {
        SearchStatistics child_statistics = child_search_engine->collect_statistics();
        result_statistics.inc_generated(child_statistics.get_generated());
        result_statistics.inc_expanded(child_statistics.get_expanded());
        result_statistics.inc_valuation_seconds(child_statistics.get_valuation_seconds());
    }
    return result_statistics;
}

const goal_test::GoalTest& HierarchicalSearchEngine::get_goal_test() const {
    return *m_goal_test;
}

PartialSearchSolutions HierarchicalSearchEngine::get_partial_solutions() const {
    return m_partial_solutions;
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
