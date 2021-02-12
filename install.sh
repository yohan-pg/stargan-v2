#! /bin/bash

echo "👉 Creating environment"
pip3 install virtualenv
virtualenv --no-download ~/stargan-v2-env
source $HOME/stargan-v2-env/bin/activate

echo "👉 Installing dependencies"
pip install torch==1.7.1+cu101 torchvision==0.8.2+cu101 torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html
pip3 install opencv-python ffmpeg-python scikit-image
pip3 install pillow==7.0.0 scipy==1.2.1 tqdm==4.43.0 munch==2.5.0
