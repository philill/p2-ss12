# epslatex
set terminal epslatex color
set output "temp.tex"

# define axis
set xrange [0:5]
set yrange [0:8]

# axis labels
set xlabel '$n$'
set ylabel '$y_n$ in $\si{\cm}$'

# display legend
set key at 4.75,1

# linear regression
f(x) = m*x + b
fit f(x) "2_4.csv" using 1:2 via m,b

plot "2_4.csv" notitle lc 7 pointsize 2.5, f(x) title 'Regressionsgerade' lt 1

set output #Closes the temporary output files.
!sed 's|includegraphics{temp}|includegraphics{Diagramme/2_4}|' < temp.tex > 2_4.tex
!epstopdf temp.eps --outfile='2_4.pdf'

