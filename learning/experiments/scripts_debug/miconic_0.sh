#!/bin/bash
set -euo pipefail

#SBATCH -J miconic_0
#SBATCH -t 0-06:00:00
#SBATCH -C thin --exclusive
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=dominik.drexler@liu.se

bash ./runner.sh miconic hierarchy_debug 0
