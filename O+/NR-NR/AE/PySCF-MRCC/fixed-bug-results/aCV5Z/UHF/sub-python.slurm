#!/bin/bash
#SBATCH --account=def-nike-ab
#SBATCH --mem=32G      # memory; default unit is megabytes.
#SBATCH --time=0-23:50           # time (DD-HH:MM).
#SBATCH --cpus-per-task=4

module load python/3.12.4
module load StdEnv/2023
module load intel/2023.2.1
module load openmpi/4.1.5

export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}
export PYTHONPATH=/home/jaafar1/projects/def-nike-ab/jaafar1/VENV/MRCCInterface/lib/python3.12/site-packages:$PYTHONPATH

virtualenv --system-site-packages $SLURM_TMPDIR/env
source $SLURM_TMPDIR/env/bin/activate

echo "Starting run at: `date`"
python3.12 input.py
echo "Program finished with exit code $? at: `date`"
