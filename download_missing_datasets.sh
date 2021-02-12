if [ ! -d "data/afq"]; then 
    bash download.sh celeba-hq-dataset
fi

if [ ! -d "data/celeba_hq"]; then 
    bash download.sh afhq-dataset
fi

