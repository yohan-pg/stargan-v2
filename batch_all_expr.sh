#!/bin/bash

set -e

sbatch train_expr_method.sh
sbatch train_expr_block_size.sh
sbatch train_expr_denman_beavers.sh
sbatch train_expr_center_color_at_identity.sh
sbatch train_expr_learn_alpha.sh
sbatch train_expr_make_color_symmetric.sh
sbatch train_expr_mean_shift.sh
sbatch train_expr_use_mlp.sh