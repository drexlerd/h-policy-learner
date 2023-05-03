#!/bin/bash
#
#SBATCH -J childsnack_1
#SBATCH -t 0-06:00:00
#SBATCH -C thin --exclusive
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=dominik.drexler@liu.se

bash ./runner.sh childsnack hierarchy 1
