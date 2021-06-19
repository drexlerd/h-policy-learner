#ifndef DLPLAN_SRC_CORE_CACHE_H_
#define DLPLAN_SRC_CORE_CACHE_H_

#include <unordered_map>
#include <memory>
#include <iostream>
#include <cassert>
#include <mutex>

#include "../../include/dlplan/core.h"


namespace dlplan::core {

/*
Andrés:

Hey! Just some basic info on normal forms for description logic.
It seems that DL people often normalise KBs using negation normal forms (NNFs) or Tseitin’s transformations.
The latter requires only a linear increase in the size of the formulas but only preserves equisatisfiability,
so I don't think it'll do for this application.
NNFs are equivalence-preserving and the transformation of a concept into NNF can also be done in linear time.
You just push negation inwards, make use of de Morgan’s laws and the duality between existential and universal restrictions,
and between at-most and at-least number restrictions (<r.C, > n r.C). Basically, you follow the translation on the top of p.6 here:

https://arxiv.org/pdf/1202.0914.pdf

What's not so nice is that NNFs are not canonical,
so you can't detect if a concept C would be a duplicate by simply transforming it into NNF
and checking if C already occurs in the set of previously generated concepts.
If you insist on using canonical forms to check for duplicates,
then the NNFs can be transformed into CNF or DNF using distributivity.
But as you may know, this can be impractical, as the transformation may cause an exponential blowup in the size of the formulas.
*/

/**
 * A thread-safe reference-counted object cache.
 * Idea taken from Herb Sutter: https://channel9.msdn.com/Events/GoingNative/2013/My-Favorite-Cpp-10-Liner
 * Other sources: (1) https://stackoverflow.com/questions/49782011/herb-sutters-10-liner-with-cleanup
 */
template<typename KEY, typename VALUE>
class Cache : public std::enable_shared_from_this<Cache<KEY, VALUE>> {
private:
    std::unordered_map<KEY, std::weak_ptr<VALUE>> m_cache;
    std::mutex m_mutex;

public:
    /**
     * Retrieves a certain element.
     */
    std::shared_ptr<VALUE> at(const KEY& key) {
        return m_cache[key].lock();
    }

    /**
     * Inserts a new element and returns a shared reference.
     */
    std::shared_ptr<VALUE> insert(std::unique_ptr<VALUE>&& element) {
        KEY key = element->compute_repr();
        std::lock_guard<std::mutex> hold(m_mutex);
        auto& cached = m_cache[key];
        auto sp = cached.lock();
        if (!sp) {
            VALUE* ptr = element.get();
            cached = sp = std::shared_ptr<VALUE>(
                ptr,
                [parent=this->shared_from_this(), original=std::move(element)](VALUE* x)
                {
                    // Note that if the deleter is called during the insert operation
                    // we obtain a deadlock if the mutex was already held by the same process.
                    std::lock_guard<std::mutex> hold(parent->m_mutex);
                    parent->m_cache.erase(x->compute_repr());
                    // Note that the deleter of the unique_ptr takes care for destruction of the object
                    // s.t. we do not have to pass the ownership to the shared_ptr and call release() manually.
                    // This way we are absolutely sure that there cannot be a double free.
                }
            );
        }
        return sp;
    }
};

/**
 * One cache for each template instantiated element.
 */
struct Caches {
    std::shared_ptr<Cache<std::string, element::Concept>> m_concept_cache;
    std::shared_ptr<Cache<std::string, element::Role>> m_role_cache;
    std::shared_ptr<Cache<std::string, element::Numerical>> m_numerical_cache;
    std::shared_ptr<Cache<std::string, element::Boolean>> m_boolean_cache;

    Caches()
        : m_concept_cache(std::make_shared<Cache<std::string, element::Concept>>()),
          m_role_cache(std::make_shared<Cache<std::string, element::Role>>()),
          m_numerical_cache(std::make_shared<Cache<std::string, element::Numerical>>()),
          m_boolean_cache(std::make_shared<Cache<std::string, element::Boolean>>()) {
          }

};


}

#endif