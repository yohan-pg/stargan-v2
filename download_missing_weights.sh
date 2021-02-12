#! /bin/bash

echo "👉 Downloading weights"

CHECKPOINTS=$HOME/.cache/torch/hub/checkpoints

INCEPTION_WEIGHTS=$CHECKPOINTS/inception_v3_google-1a9a5a14.pth
if [ -f "$INCEPTION_WEIGHTS" ]; then
    echo "  👍 Inception weights already downloaded."
else 
    wget https://download.pytorch.org/models/inception_v3_google-1a9a5a14.pth -P $CHECKPOINTS
fi

ALEXNET_WEIGHTS=$CHECKPOINTS/alexnet-owt-4df8aa71.pth
if [ -f "$ALEXNET_WEIGHTS" ]; then
    echo "  👍 AlexNet weights already downloaded."
else 
    wget https://download.pytorch.org/models/alexnet-owt-4df8aa71.pth -P $CHECKPOINTS
fi