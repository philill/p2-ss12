# epslatex
set terminal epslatex color
set output "temp.tex"

# define axis 
set xrange [0:4]
set yrange [-12:-0]

# axis labels
set xlabel '$\ln(U_2)$ in $\ln(\si{V})$'
set ylabel '$\ln(I)$ in $\ln(\si{mA})$'	

# display legend
set key at 3.75,-1

# linear regression
f(x) = m*x + b	
fit f(x) "anodenstromkurve-logarithmisch.csv" using 1:2 via m,b

plot "anodenstromkurve-logarithmisch.csv" notitle lc 7 pointsize 2.5, f(x) title 'Regressionsgerade' lt 1

set output #Closes the temporary output files.
!sed 's|includegraphics{temp}|includegraphics{Diagramme/anodenstromkurve-logarithmisch}|' < temp.tex > anodenstromkurve-logarithmisch.tex
!epstopdf temp.eps --outfile='anodenstromkurve-logarithmisch.pdf'

