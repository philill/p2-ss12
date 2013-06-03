set terminal latex
set output "anodenstromkurve.tex"

set xrange [0:34]
set yrange [0:2]

set xlabel '$U_2$ in $\si{\V}$'
set ylabel '\rotatebox{90}{$I$ in $\si{\micro\ampere}$}'	

set nokey

plot "anodenstromkurve.csv"


