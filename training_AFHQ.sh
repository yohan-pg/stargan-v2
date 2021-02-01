#!/bin/bash
#SBATCH --nodes=1
#SBATCH --account=def-jlalonde
#SBATCH --gres=gpu:1               # Number of GPU(s) per node
#SBATCH --cpus-per-task=8          # CPU cores/threads
#SBATCH --mem=16000M            # memory per node
#SBATCH --time=3-00:00           # time (DD-HH:MM)
#SBATCH --array=0-9 #included

cd $SCRATCH/stargan-v2
module load python
source $HOME/stargan-v2-env/bin/activate

LIST_BLOCK_SIZES=(1 2 4 8 16 32 64 128 256 512)

EXPR="block_size_${LIST_BLOCK_SIZES[$SLURM_ARRAY_TASK_ID]}"

python main.py --mode train --num_domains 3 --w_hpf 0 \
               --lambda_reg 1 --lambda_sty 1 --lambda_ds 2 --lambda_cyc 1 \
               --train_img_dir data/afhq/train \
               --val_img_dir data/afhq/val \
               --checkpoint_dir expr/"$EXPR"/checkpoints/afhq \
               --result_dir expr/"$EXPR"/results/afhq \
               --sample_dir expr/"$EXPR"/samples/afhq \
               --eval_dir expr/"$EXPR"/eval/afhq \
               --wing_path expr/"$EXPR"/checkpoints/wing.ckpt \
               --lm_path expr/"$EXPR"/checkpoints/celeba_lm_mean.npz \
               --img_size 64 \
               --block_size "${LIST_BLOCK_SIZES[$SLURM_ARRAY_TASK_ID]}"