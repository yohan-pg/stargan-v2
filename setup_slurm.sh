#! /bin/bash

set -e

echo "👉 Creating environment"
conda create -n stargan-v2 python=3.6.7
conda activate stargan-v2

echo "👉 Installing dependencies"
conda install -y pytorch=1.4.0 torchvision=0.5.0 cudatoolkit=10.0 -c pytorch
conda install x264=='1!152.20180717' ffmpeg=4.0.2 -c conda-forge
pip install opencv-python==4.1.2.30 ffmpeg-python==0.2.0 scikit-image==0.16.2
pip install pillow==7.0.0 scipy==1.2.1 tqdm==4.43.0 munch==2.5.0

echo "👉 Downloading datasets"
bash download_missing_datasets.sh