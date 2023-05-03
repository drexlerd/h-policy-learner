#!/bin/bash
set -euo pipefail

#SBATCH -J grid_1
#SBATCH -t 3-00:00:00
#SBATCH -C thin --exclusive
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=dominik.drexler@liu.se

bash ./runner.sh grid hierarchy 1
