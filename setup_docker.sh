#! /bin/bash

set -e

bash download_missing_datasets.sh
bash download_missing_weights.sh

echo "👉 Building Docker image"
docker-compose build