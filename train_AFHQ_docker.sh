#! /bin/bash

echo "👉 Activating environment"
source $HOME/stargan-v2-env/bin/activate

echo "👉 Starting training"
export CUDA_VISIBLE_DEVICES=1
python main.py --mode train --num_domains 3 --w_hpf 0 \
               --lambda_reg 1 --lambda_sty 1 --lambda_ds 2 --lambda_cyc 1 \
               --train_img_dir data/afhq/train \
               --img_size 256 \
               --eval_every 5000 \
               --val_img_dir data/afhq/val 