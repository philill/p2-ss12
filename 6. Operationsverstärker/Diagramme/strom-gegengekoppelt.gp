# epslatex
set terminal epslatex color
set output "temp.tex"

# define axis 
set xrange [8:100000]
set yrange [0:5]

set logscale x

# axis labels
set xlabel '$f$ in $\si{\Hz}$'
set ylabel '$\beta$'	

# display legend
#set key at 3.75,-1


plot "1_4_strom-gegengekoppelt.dat" notitle lc 7 pointsize 2.5

set output #Closes the temporary output files.
!sed 's|includegraphics{temp}|includegraphics{Diagramme/frequenz-kopplung}|' < temp.tex > frequenz-kopplung.tex
!epstopdf temp.eps --outfile='frequenz-kopplung.pdf'


