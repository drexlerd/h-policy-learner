#!/bin/bash
set -euo pipefail

#SBATCH -J gripper_0
#SBATCH -t 0-06:00:00
#SBATCH -C thin --exclusive
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=dominik.drexler@liu.se

bash ./runner.sh gripper hierarchy 0