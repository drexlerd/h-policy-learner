#!/bin/bash
#
#SBATCH -J gripper_hierarchy_1
#SBATCH -t 1-00:00:00
#SBATCH -C thin --exclusive
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=dominik.drexler@liu.se

bash ./gripper.sh hierarchy 1
