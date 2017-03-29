#!/bin/bash
# Meta­repetitions

temp=`date '+%d%b%H%M%S'`

kernel=10
nb_it=$1+$kernel

./pWarmup $1 $kernel >> ./results/waup_$temp.txt

echo "---"
echo "Création de waup_$temp.txt ..."
echo "---"
echo "Création de waup_$temp.png ..."
/usr/bin/gnuplot <<EOF
reset
set terminal png

set ylabel "valeur en cycles"


set xlabel "Execution"
set xrange [0:$nb_it]

set title "Evolution des performances, warmup"
set grid

set output "./results/waup_$temp.png"

set style data linespoints

plot "./results/waup_$temp.txt" u 1 title "courbe warm up"
EOF

echo "Affichage ..."
eog ./results/waup_$temp.png&

