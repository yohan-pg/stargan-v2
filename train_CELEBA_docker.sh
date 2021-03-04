#! /bin/bash

echo "👉 Activating environment"
source $HOME/stargan-v2-env/bin/activate

echo "👉 Starting training"
export CUDA_VISIBLE_DEVICES=1
python main.py --mode train --num_domains 2 --w_hpf 1 \
               --lambda_reg 1 --lambda_sty 1 --lambda_ds 1 --lambda_cyc 1 \
               --train_img_dir data/celeba_hq/train \
               --img_size 64 \
               --eval_every 5000 \
               --val_img_dir data/celeba_hq/val "$@"
