#!/bin/bash
#
#SBATCH -J miconic_hierarchy_0
#SBATCH -t 7-00:00:00
#SBATCH -C thin --exclusive
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=dominik.drexler@liu.se

bash ./miconic.sh hierarchy 0
