#!/bin/bash
# Meta­repetitions

temp=`date '+%d%b%H%M%S'`

warmup=150
kernel=200
nb_it=$warmup+$kernel

for i in $(seq 1 $31)
do
        ./progG $warmup $kernel >> ./results/res_$temp.txt
done
