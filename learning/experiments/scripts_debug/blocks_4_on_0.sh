#!/bin/bash
#
#SBATCH -J blocks_4_on_0
#SBATCH -t 0-06:00:00
#SBATCH -C thin --exclusive
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=dominik.drexler@liu.se

bash ./runner.sh blocks_4_on hierarchy_debug 0
