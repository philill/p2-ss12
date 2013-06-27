# epslatex
set terminal epslatex color
set output "temp.tex"

# define axis
set xrange [0:10]
set yrange [0:5.5]

# axis labels
set xlabel '$n$'
set ylabel '$y_n$ in $\si{\cm}$'

# display legend
set key at 9.5,0.5

# linear regression
f(x) = m*x + b
fit f(x) "2_1.csv" using 1:2 via m,b

plot "2_1.csv" notitle lc 7 pointsize 2.5, f(x) title 'Regressionsgerade' lt 1

set output #Closes the temporary output files.
!sed 's|includegraphics{temp}|includegraphics{Diagramme/2_1}|' < temp.tex > 2_1.tex
!epstopdf temp.eps --outfile='2_1.pdf'

