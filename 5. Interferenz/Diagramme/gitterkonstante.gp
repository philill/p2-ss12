# epslatex
set terminal epslatex color
set output "temp.tex"

# define axis 
set xrange [0:1.2]
set yrange [0:8]

# axis labels
set xlabel '$\frac{\sin\left( \frac{\Delta\alpha}{2} \right)}{\lambda}$'
set ylabel '$N$'	

# display legend
#set key at 3.75,-1

# linear regression
f(x) = m*x + b	
fit f(x) "gitterkonstante.csv" using 1:2 via m,b

plot "gitterkonstante.csv" notitle lc 7 pointsize 2.5, f(x) title 'Regressionsgerade' lt 1

set output #Closes the temporary output files.
!sed 's|includegraphics{temp}|includegraphics{Diagramme/gitterkonstante}|' < temp.tex > gitterkonstante.tex
!epstopdf temp.eps --outfile='gitterkonstante.pdf'


