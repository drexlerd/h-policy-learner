#!/bin/bash
set -euo pipefail

#SBATCH -J visitall_2
#SBATCH -t 3-00:00:00
#SBATCH -C thin --exclusive
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=dominik.drexler@liu.se

bash ./runner.sh visitall hierarchy 2
