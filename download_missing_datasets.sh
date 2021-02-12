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

