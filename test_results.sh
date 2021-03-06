echo "👉 Activating environment"
source $HOME/stargan-v2-env/bin/activate

echo "👉 Starting training"
export CUDA_VISIBLE_DEVICES=1
python main.py --mode sample --num_domains 3 --w_hpf 0 \
               --resume_iter 50000 \
               --train_img_dir data/afhq/train \
               --block_size 8 \
               --val_img_dir data/afhq/val \
               --sample_dir expr/samples \
               --checkpoint_dir expr/checkpoints/afhq \
               --result_dir expr/results/afhq \
               --sample_dir expr/samples/afhq \
               --eval_dir expr/eval/afhq \
               --wing_path expr/checkpoints/wing.ckpt \
               --lm_path expr/checkpoints/celeba_lm_mean.npz \
               --notes_path expr \
               --src_dir assets/representative/afhq/src \
               --ref_dir assets/representative/afhq/ref

#050000_nets_ema.ckpt
