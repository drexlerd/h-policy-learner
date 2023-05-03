#!/bin/bash
set -euo pipefail

#SBATCH -J spanner_2
#SBATCH -t 0-06:00:00
#SBATCH -C thin --exclusive
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=dominik.drexler@liu.se

bash ./runner.sh spanner hierarchy_debug 2
