#!/bin/bash
#SBATCH --nodes=1
#SBATCH --account=def-jlalonde
#SBATCH --gres=gpu:v100l:1             # Number of GPU(s) per node
#SBATCH --cpus-per-task=8          # CPU cores/threads
#SBATCH --mem=32000M            # memory per node
#SBATCH --time=0-24:00           # time (DD-HH:MM)




set -e

echo "👉 Activating environment"
cd $SCRATCH/stargan-v2
source load_slurm_modules.sh
source $HOME/stargan-v2-env/bin/activate

echo "👉 Starting training"
if [ -z "$SLURM_ARRAY_TASK_ID" ]; then
    export SLURM_ARRAY_TASK_ID=0
fi

export MKL_NUM_THREADS=1 # *** important else scipy `sqrtm` takes ∞ time
export SLURM_ARRAY_TASK_ID=0
# IMG_SIZE=(256 256 256 256 256 256 256 256 256) #"${IMG_SIZE[$SLURM_ARRAY_TASK_ID]}"
# LIST_BLOCK_SIZES=(32 32 32 32 32 32 32 32 32) #"${LIST_BLOCK_SIZES[$SLURM_ARRAY_TASK_ID]}"
ALPHA_WHITE=(1.0)
ALPHA_COLOR=(1.0)
# EXPR="block_size_${LIST_BLOCK_SIZES[$SLURM_ARRAY_TASK_ID]}_${LIST_NO[$SLURM_ARRAY_TASK_ID]}"
EXPR="tanh_DB_${ALPHA_WHITE[$SLURM_ARRAY_TASK_ID]}_${ALPHA_COLOR[$SLURM_ARRAY_TASK_ID]}"
python main.py --mode train --num_domains 3 --w_hpf 0 \
               --lambda_reg 1 --lambda_sty 1 --lambda_ds 2 --lambda_cyc 1 \
               --train_img_dir data/afhq/train \
               --val_img_dir data/afhq/val \
               --img_size 256 \
               --checkpoint_dir expr/"$EXPR"/checkpoints/afhq \
               --result_dir expr/"$EXPR"/results/afhq \
               --sample_dir expr/"$EXPR"/samples/afhq \
               --eval_dir expr/"$EXPR"/eval/afhq \
               --wing_path expr/"$EXPR"/checkpoints/wing.ckpt \
               --lm_path expr/"$EXPR"/checkpoints/celeba_lm_mean.npz \
               --alpha_white "${ALPHA_WHITE[$SLURM_ARRAY_TASK_ID]}" \
               --alpha_color "${ALPHA_COLOR[$SLURM_ARRAY_TASK_ID]}" \
               --alpha_path expr/"$EXPR" \
               --block_size 32 \
               "$@"