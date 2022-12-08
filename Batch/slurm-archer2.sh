#!/bin/bash

#SBATCH --job-name=sharpen
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=00:01:00

# Replace [budget code] below with your project code (e.g. t01)
#SBATCH --account=[budget code]
#SBATCH --partition=standard
#SBATCH --qos=standard

# Setup the batch environment
module load epcc-job-env

source [path-to-exercises]/EPCC-Exercises/Env/env-archer2.sh

# Set the number of threads to the CPUs per task
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

EXE=[executable]

# Launch the parallel job
srun --hint=nomultithread --distribution=block:block $EXE
