#!/bin/bash
#SBATCH --nodes=1
#SBATCH --account=def-jlalonde
#SBATCH --gres=gpu:v100l:1             # Number of GPU(s) per node
#SBATCH --cpus-per-task=8          # CPU cores/threads
#SBATCH --mem=32000M            # memory per node
#SBATCH --time=4-00:00           # time (DD-HH:MM)
#SBATCH --array=0-1 #included

OPTIONS_WHITE=(True False)
ALPHA_WHITE=(0.5 1.0)
OPTIONS_COLOR=(False True)
ALPHA_COLOR=(1.0 0.5)



CHOICE_WHITE="${OPTIONS_WHITE[$SLURM_ARRAY_TASK_ID]}"
CHOICE_COLOR="${OPTIONS_COLOR[$SLURM_ARRAY_TASK_ID]}"


export EXPR="learn_alpha_white_${CHOICE_WHITE}_color_${CHOICE_COLOR}"

source train_expr.sh --learn_alpha_white "$CHOICE_WHITE" \
      --learn_alpha_color "$CHOICE_COLOR" \
      --alpha_white "${ALPHA_WHITE[$SLURM_ARRAY_TASK_ID]}" \
      --alpha_color "${ALPHA_COLOR[$SLURM_ARRAY_TASK_ID]}" \
      "$@"