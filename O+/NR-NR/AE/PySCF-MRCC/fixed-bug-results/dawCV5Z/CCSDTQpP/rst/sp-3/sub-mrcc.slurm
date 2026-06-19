#!/bin/bash
#SBATCH --account=def-nike-ab
#SBATCH --mem=480G      # memory; default unit is megabytes.
#SBATCH --time=6-23:00           # time (DD-HH:MM).
#SBATCH --cpus-per-task=32
#SBATCH --output=out.%j
#SBATCH --error=err.%j

module load StdEnv/2023
module load intel/2023.2.1
module load openmpi/4.1.5

export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}

echo "Starting run at: `date`"
export PATH="/home/jaafar1/projects/def-nike-ab/share/software/MRCC-MRCC/mrcc-skipcc:$PATH"
dmrcc
echo "Program finished with exit code $? at: `date`"
