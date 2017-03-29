#!/bin/bash
# Meta­repetitions

temp=`date '+%d%b%H%M%S'`

warmup=10
kernel=10
nb_it=$warmup+$kernel

for i in $(seq 1 $1)
do
	./progG $warmup $kernel >> ./results/res_$temp.txt 
done

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
set xrange [0:$1]

set title "Evolution des performances"
set grid

set output "./results/png_$temp.png"

set style data linespoints

plot "./results/res_$temp.txt" u 1 title "hohoho"
EOF


echo "Affichage ..."
eog ./results/png_$temp.png&
