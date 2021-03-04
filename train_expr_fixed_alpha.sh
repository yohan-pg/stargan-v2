#!/bin/bash
#SBATCH --nodes=1
#SBATCH --account=def-jlalonde
#SBATCH --gres=gpu:v100l:1             # Number of GPU(s) per node
#SBATCH --cpus-per-task=8          # CPU cores/threads
#SBATCH --mem=32000M            # memory per node
#SBATCH --time=4-00:00           # time (DD-HH:MM)
#SBATCH --array=0-4 #included

ALPHA_WHITE=(0.0 0.5 1.0 1.0 1.0)
ALPHA_COLOR=(1.0 1.0 0.0 0.5 1.0)

CHOICE_WHITE="${ALPHA_WHITE[$SLURM_ARRAY_TASK_ID]}"
CHOICE_COLOR="${ALPHA_COLOR[$SLURM_ARRAY_TASK_ID]}"

export EXPR="learn_alpha_white_${CHOICE_WHITE}_color_${CHOICE_COLOR}"

source train_expr.sh \
      --alpha_white "$CHOICE_WHITE" \
      --alpha_color "$CHOICE_COLOR" \
      "$@"