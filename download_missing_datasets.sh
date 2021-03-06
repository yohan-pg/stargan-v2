#! /bin/bash

echo "👉 Downloading datasets"

if [ ! -d "data/afhq" ]; then 
    bash download.sh afhq-dataset
else
    echo "  👍 AFHQ already downloaded."
fi

if [ ! -d "data/celeba_hq" ]; then 
    bash download.sh celeba-hq-dataset
else
    echo "  👍 CELEBA already downloaded."
fi

if [ ! -d "expr/checkpoints/wing.ckpt" ]; then 
    bash download.sh wing
else
    echo "  👍 WING already downloaded."
fi
