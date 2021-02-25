#! /bin/bash

path=scratch/stargan-v2/expr

rm -r results
mkdir results

for expr in $(ssh cedar ls $path); do
    if [ -n "$expr" ]; then
        echo "$expr"
        mkdir "results/$expr"
        scp "cedar:$path/$expr/eval/afhq/FID_50000_latent.json" "results/$expr"
        scp "cedar:$path/$expr/eval/afhq/FID_50000_reference.json" "results/$expr"
        scp "cedar:$path/$expr/eval/afhq/LPIPS_50000_latent.json" "results/$expr"
        scp "cedar:$path/$expr/eval/afhq/LPIPS_50000_reference.json" "results/$expr"
        
        scp "cedar:$path/$expr/samples/afhq/050000_cycle_consistency.jpg" "results/$expr"
        scp "cedar:$path/$expr/samples/afhq/050000_latent_psi_0.5.jpg" "results/$expr"
        scp "cedar:$path/$expr/samples/afhq/050000_latent_psi_0.7.jpg" "results/$expr"
        scp "cedar:$path/$expr/samples/afhq/050000_latent_psi_1.0.jpg" "results/$expr"
        scp "cedar:$path/$expr/samples/afhq/050000_reference.jpg" "results/$expr"
    fi
done