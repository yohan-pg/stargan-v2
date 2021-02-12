#! /bin/bash

echo "👉 Creating environment"
pip3 install virtualenv
virtualenv --no-download ~/stargan-v2-env
source $HOME/stargan-v2-env/bin/activate

echo "👉 Installing dependencies"
pip3 install torch torchvision
pip3 install opencv-python ffmpeg-python scikit-image
pip3 install pillow==7.0.0 scipy==1.2.1 tqdm==4.43.0 munch==2.5.0
