#ifndef STATE_ID_H
#define STATE_ID_H

#include <iostream>

// For documentation on classes relevant to storing and working with registered
// states see the file state_registry.h.

namespace breadth_first_search {
class BreadthFirstSearch;
}

namespace exhaustive_search {
class ExhaustiveSearch;
}

namespace width_search_engine {
struct IWSolution;
class HierarchicalSearchEngine;
class IW;
class SIWR;
}

namespace extra_tasks {
class PropositionalTask;
}

class StateID {
    friend class breadth_first_search::BreadthFirstSearch;
    friend class exhaustive_search::ExhaustiveSearch;
    friend struct width_search_engine::IWSolution;
    friend class width_search_engine::HierarchicalSearchEngine;
    friend class width_search_engine::IW;
    friend class width_search_engine::SIWR;
    friend class extra_tasks::PropositionalTask;
    friend class StateRegistry;
    friend std::ostream &operator<<(std::ostream &os, StateID id);
    template<typename>
    friend class PerStateInformation;
    template<typename>
    friend class PerStateArray;
    friend class PerStateBitset;

    int value;
    explicit StateID(int value_)
        : value(value_) {
    }

    // No implementation to prevent default construction
    StateID();
public:
    ~StateID() {
    }

    static const StateID no_state;

    bool operator==(const StateID &other) const {
        return value == other.value;
    }

    bool operator!=(const StateID &other) const {
        return !(*this == other);
    }
};


#endif
