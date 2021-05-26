#include "instance_info.h"

namespace dlp {
namespace core {

const AtomImpl& InstanceInfoImpl::add_atom(const std::string &predicate_name, const Name_Vec &object_names, bool is_static, bool add_goal_version) {

}

bool InstanceInfoImpl::exists_predicate_name(const std::string& name) const {
    return m_predicate_name_to_predicate_idx.find(name) != m_predicate_name_to_predicate_idx.end();
}

bool InstanceInfoImpl::predicate_idx(const std::string& name) const {
    return m_predicate_name_to_predicate_idx.at(name);
}

unsigned InstanceInfoImpl::predicate_arity(unsigned predicate_idx) const {
    return m_predicate_arities[predicate_idx];
}

const Index_Vec& InstanceInfoImpl::goal_atom_idxs() const {
    return m_goal_atom_idxs;
}

const std::vector<AtomImpl>& InstanceInfoImpl::atoms() const {
    return m_atoms;
}

}
}
