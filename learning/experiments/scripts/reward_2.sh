#!/bin/bash
set -euo pipefail

#SBATCH -J reward_2
#SBATCH -t 0-06:00:00
#SBATCH -C thin --exclusive
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=dominik.drexler@liu.se

bash ./runner.sh reward hierarchy 2