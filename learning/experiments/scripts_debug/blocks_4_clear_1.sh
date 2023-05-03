#!/bin/bash
set -euo pipefail

#SBATCH -J blocks_4_clear_1
#SBATCH -t 0-06:00:00
#SBATCH -C thin --exclusive
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=dominik.drexler@liu.se

bash ./runner.sh blocks_4_clear hierarchy_debug 1
