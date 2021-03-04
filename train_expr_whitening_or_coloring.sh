#!/bin/bash
#SBATCH --nodes=1
#SBATCH --account=def-jlalonde
#SBATCH --gres=gpu:v100l:1             # Number of GPU(s) per node
#SBATCH --cpus-per-task=8          # CPU cores/threads
#SBATCH --mem=32000M            # memory per node
#SBATCH --time=4-00:00           # time (DD-HH:MM)
#SBATCH --array=0-1 #included

OPTIONS=(BlockwiseWhiteningOnly BlockwiseColoringOnly)
CHOICE="${OPTIONS[$SLURM_ARRAY_TASK_ID]}"

export EXPR="whitening_or_coloring_$CHOICE"

source train_expr.sh --normalizer_type "$CHOICE" "$@"
