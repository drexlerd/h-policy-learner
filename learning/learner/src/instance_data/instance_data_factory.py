import logging
import dlplan

from learner.src.instance_data.instance_data import InstanceData


class InstanceDataFactory:
    def make_instance_datas(self, config, domain_data):
        instance_datas = []
        for instance_information in config.instance_informations:
            logging.info(f"Constructing InstanceData for filename {instance_information.filename}")
            state_space = dlplan.generate_state_space(str(domain_data.domain_filename), str(instance_information.filename), domain_data.vocabulary_info, len(instance_datas))
            if len(state_space.get_states()) > config.max_states_per_instance:
                continue
            goal_distances = state_space.compute_goal_distances()
            if goal_distances.get(state_space.get_initial_state_index(), None) is None:
                print("Unsolvable.")
                continue
            if set(state_space.get_states().keys()) == set(state_space.get_goal_state_indices()):
                print("Trivially solvable.")
                continue
            else:
                print("Num states:", len(state_space.get_states()))
                novelty_base = dlplan.NoveltyBase(len(state_space.get_instance_info().get_atoms()), max(1, config.width))
                instance_data = InstanceData(len(instance_datas), domain_data, dlplan.DenotationsCaches(), novelty_base, instance_information)
                instance_data.set_state_space(state_space)
                instance_data.set_goal_distances(goal_distances)
                instance_data.initial_s_idxs = [state_space.get_initial_state_index(),]
                instance_datas.append(instance_data)
        # Sort the instances according to size and fix the indices afterwards
        instance_datas = sorted(instance_datas, key=lambda x : len(x.state_space.get_states()))
        for instance_idx, instance_data in enumerate(instance_datas):
            instance_data.id = instance_idx
            instance_data.state_space.get_instance_info().set_index(instance_idx)
        return instance_datas
