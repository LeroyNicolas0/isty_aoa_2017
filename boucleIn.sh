#!/bin/bash
# Meta­repetitions

temp=`date '+%d%b%H%M%S'`

warmup=10

nb_it=$1
repet=1

./pBoucleIn $warmup $1 >> ./results/res_$temp.txt

echo "---"
echo "Création de res_$temp.txt ..."
echo "Calcul des indices ..."
echo "---"
./moy res_$temp.txt

echo "---"
echo "Création de png_$temp.png ..."
/usr/bin/gnuplot <<EOF
reset
set terminal png

set ylabel "valeur en cycles"

set xlabel "Execution"
set xrange [0:$nb_it]

set title "Evolution des performances, boucle interieure"
set grid

set output "./results/boin_$temp.png"

set style data linespoints

plot "./results/res_$temp.txt" u 1 title "boucle interieure"
EOF

echo "Affichage ..."
eog ./results/boin_$temp.png&

