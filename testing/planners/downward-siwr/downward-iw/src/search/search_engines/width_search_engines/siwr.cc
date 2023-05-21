#include "siwr.h"

#include "../../option_parser.h"
#include "../../plugin.h"
#include "../../tasks/propositional_task.h"

#include <memory>

using namespace std;


namespace width_search_engine {

SIWR::SIWR(const options::Options &opts)
    : HierarchicalSearchEngine(opts) {
    assert(m_child_search_engines.size() == 1);
    m_child_search = m_child_search_engines[0].get();
    m_name = "siwr";
}

SearchStatus SIWR::step() {
    auto search_status = m_child_search->step();
    if (search_status == SOLVED) {
        IWSolutions child_partial_solutions = m_child_search->get_partial_solutions();
        m_partial_solutions.insert(m_partial_solutions.end(), child_partial_solutions.begin(), child_partial_solutions.end());
        if (is_goal(m_state_registry->lookup_state(m_partial_solutions.back().state_id))) {
            if (m_debug)
                std::cout << get_name() << " goal_state: " << m_propositional_task->compute_dlplan_state(m_state_registry->lookup_state(m_partial_solutions.back().state_id)).str() << std::endl;
            if (!m_parent_search_engine) {
                // set plan in the root.
                float aew = 0;
                int mew = 0;
                for (const auto& partial_solution : m_partial_solutions) {
                    plan.insert(plan.end(), partial_solution.plan.begin(), partial_solution.plan.end());
                    mew = max(mew, partial_solution.ew);
                    aew += partial_solution.ew;
                }
                if (m_partial_solutions.size() > 0) aew /= m_partial_solutions.size();
                solution_found = true;
                collect_statistics();
                cout << "Average effective width: " << aew << endl;
                cout << "Maximum effective width: " << mew << endl;
            }
            return SearchStatus::SOLVED;
        } else {
            // Search unfinished: update child search initial states
            m_child_search->set_initial_state(m_state_registry->lookup_state(m_partial_solutions.back().state_id));
            // we clear the cache to not fill it up too heavily.
            m_propositional_task->clear_denotations_caches();
            return SearchStatus::IN_PROGRESS;
        }
    }
    return IN_PROGRESS;
}

IWSolutions SIWR::get_partial_solutions() const {
    return m_partial_solutions;
}

void SIWR::print_statistics() const {
    statistics.print_detailed_statistics();
}


static shared_ptr<HierarchicalSearchEngine> _parse(OptionParser &parser) {
    parser.document_synopsis(
        "Serialized search engine",
        "");
    HierarchicalSearchEngine::add_child_search_engine_option(parser);
    HierarchicalSearchEngine::add_goal_test_option(parser);
    SearchEngine::add_options_to_parser(parser);

    Options opts = parser.parse();
    if (parser.dry_run())
        return nullptr;

    return make_shared<SIWR>(opts);
}

// ./fast-downward.py --keep-sas-file --build=debug domain.pddl instance_2_1_0.pddl --translate-options --dump-predicates --dump-constants --dump-static-atoms --dump-goal-atoms --search-options --search "serialized_search(child_searches=[iw(width=2, goal_test=increment_goal_count())], goal_test=top_goal())"
// valgrind ./downward --search "serialized_search(child_searches=[iw(width=2, goal_test=increment_goal_count())], goal_test=top_goal())" < output.sas

// ./fast-downward.py --keep-sas-file ../sketch-learner/testing/benchmarks/delivery/domain.pddl ../sketch-learner/testing/benchmarks/delivery/instance_3_3_0.pddl --translate-options --dump-predicates --dump-constants --dump-static-atoms --dump-goal-atoms --search-options --search "serialized_search(child_searches=[iw(width=2, goal_test=increment_goal_count())], goal_test=top_goal())"
static Plugin<SearchEngine> _plugin("siwr", _parse);
}
