#!/bin/bash
set -euo pipefail

#SBATCH -J spanner_0
#SBATCH -t 3-00:00:00
#SBATCH -C thin --exclusive
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=dominik.drexler@liu.se

bash ./runner.sh spanner hierarchy 0
