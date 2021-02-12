#! /bin/bash

set -e

echo "👉 Creating environment"
module load python
virtualenv --no-download ~/stargan-v2-env
source $HOME/stargan-v2-env/bin/activate

echo "👉 Installing dependencies"
pip install -e ../adaiw
pip install torch torchvision
pip install opencv-python ffmpeg-python scikit-image
pip install pillow==7.0.0 scipy==1.2.1 tqdm==4.43.0 munch==2.5.0

echo "👉 Downloading datasets"
bash download_missing_datasets.sh