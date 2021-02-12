#! /bin/bash

if [ -d $HOME/stargan-v2-env ]; then
    echo "❌ Environment already exists! ($HOME/stargan-v2-env)"
    exit 1
fi

IS_SLURM=$(command -v sbatch)

set -e

echo "👉 Creating environment"
if [ -z "$IS_SLURM" ]; then
    echo pip3 install virtualenv
else 
    echo bash load_slurm_modules.sh
fi
virtualenv --no-download ~/stargan-v2-env
source $HOME/stargan-v2-env/bin/activate

echo "👉 Installing python dependencies"
pip3 install torch==1.7.1+cu101 torchvision==0.8.2+cu101 -f https://download.pytorch.org/whl/torch_stable.html
pip3 install opencv-python 
pip3 install ffmpeg-python 
pip3 install scikit-image
pip3 install pillow==7.0.0 
pip3 install scipy==1.2.1 
pip3 install tqdm==4.43.0 
pip3 install munch==2.5.0
