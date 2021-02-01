#! /bin/bash

set -e

module load python

#setup the environment
virtualenv --no-download ~/stargan-v2-env
source $HOME/stargan-v2-env/bin/activate

#install dependencies
pip install -e ../adaiw
pip install torch==1.7.1+cu110 torchvision==0.8.2+cu110 -f https://download.pytorch.org/whl/torch_stable.html
pip install opencv-python ffmpeg-python scikit-image
pip install pillow==7.0.0 scipy==1.2.1 tqdm==4.43.0 munch==2.5.0

#download datasets
bash download.sh celeba-hq-dataset
bash download.sh wing
bash download.sh afhq-dataset


