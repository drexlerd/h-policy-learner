#include <pybind11/pybind11.h>
#include <pybind11/stl.h>  // Necessary for automatic conversion of e.g. std::vectors
#include <pybind11/iostream.h>
#include <pybind11/functional.h>
#include <pybind11/embed.h> // everything needed for embedding

#define STRINGIFY(x) #x
#define MACRO_STRINGIFY(x) STRINGIFY(x)

#include "../../../include/dlplan/state_space.h"
#include "../../../src/state_space/reader.h"


namespace py = pybind11;

using namespace dlplan::core;
using namespace dlplan::state_space;

/**
 * We need to wrap state space into its holder type.
*/
struct GeneratorResultWrapper {
    GeneratorExitCode exit_code;
    std::shared_ptr<StateSpace> state_space;
};

void init_state_space(py::module_ &m) {
    py::class_<StateSpace, std::shared_ptr<StateSpace>>(m, "StateSpace")
        .def(py::init<std::shared_ptr<const InstanceInfo>, StateMapping, StateIndex, AdjacencyList, StateIndicesSet>())
        .def(py::init<const StateSpace&, const StateIndicesSet&>())
        .def("__copy__", [](const StateSpace& state_space, py::object){ return StateSpace(state_space); })
        .def("__deepcopy__", [](const StateSpace& state_space, py::object){ return StateSpace(state_space); })
        .def("compute_distances", &StateSpace::compute_distances)
        .def("compute_goal_distances", &StateSpace::compute_goal_distances)
        .def("is_goal", &StateSpace::is_goal)
        .def("is_nongoal", &StateSpace::is_nongoal)
        .def("print", &StateSpace::print)
        .def("to_dot", &StateSpace::to_dot)
        .def("set_initial_state_index", &StateSpace::set_initial_state_index)
        .def("set_goal_state_indices", &StateSpace::set_goal_state_indices)
        .def("get_states", &StateSpace::get_states, py::return_value_policy::reference)
        .def("get_initial_state_index", &StateSpace::get_initial_state_index)
        .def("get_forward_successor_state_indices", &StateSpace::get_forward_successor_state_indices, py::return_value_policy::reference)
        .def("get_backward_successor_state_indices", &StateSpace::get_backward_successor_state_indices, py::return_value_policy::reference)
        .def("get_goal_state_indices", &StateSpace::get_goal_state_indices, py::return_value_policy::reference)
        .def("get_instance_info", &StateSpace::get_instance_info)
    ;

    py::enum_<GeneratorExitCode>(m, "GeneratorExitCode")
        .value("COMPLETE", GeneratorExitCode::COMPLETE)
        .value("INCOMPLETE", GeneratorExitCode::INCOMPLETE)
        .value("FAIL", GeneratorExitCode::FAIL);

    py::class_<GeneratorResultWrapper>(m, "GeneratorResult")
        .def_readwrite("exit_code", &GeneratorResultWrapper::exit_code)
        .def_readwrite("state_space", &GeneratorResultWrapper::state_space)
    ;

    m.def("generate_state_space", [](
        const std::string& domain_file,
        const std::string& instance_file,
        std::shared_ptr<const VocabularyInfo> vocabulary_info,
        int index,
        int max_time){
            auto result = generate_state_space(domain_file, instance_file, vocabulary_info, index, max_time);
            return GeneratorResultWrapper{result.exit_code, std::make_shared<StateSpace>(result.state_space) };
        }, py::arg("domain_file"), py::arg("instance_file"), py::arg("vocabulary_info") = nullptr, py::arg("index") = -1, py::arg("max_time") = std::numeric_limits<int>::max())
    ;
}
