CHECKPOINTS=$HOME/.cache/torch/hub/checkpoints

INCEPTION_WEIGHTS=$CHECKPOINTS/pt_inception-2015-12-05-6726825d.pth
if [ -f "$INCEPTION_WEIGHTS" ]; then
    echo "$INCEPTION_WEIGHTS already exists."
else 
    wget https://download.pytorch.org/models/inception_v3_google-1a9a5a14.pth -P $CHECKPOINTS
fi

ALEXNET_WEIGHTS=$CHECKPOINTS/alexnet-owt-4df8aa71.pth
if [ -f "$ALEXNET_WEIGHTS" ]; then
    echo "$ALEXNET_WEIGHTS already exists."
else 
    wget https://download.pytorch.org/models/alexnet-owt-4df8aa71.pth -P $CHECKPOINTS
fi