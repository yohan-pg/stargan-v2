#!/bin/bash

set -e

sbatch train_expr_fixed_alpha.sh
sbatch train_expr_num_blocks.sh
sbatch train_expr_style_size.sh
sbatch train_expr_whitening_or_coloring.sh