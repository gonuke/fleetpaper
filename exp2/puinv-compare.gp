
set output "puinv-compare.eps"
set terminal epscairo

set yrange [3:5000]
set logscale y
set key at first 50,4000 top left reverse Left

set title "Pu Inventory Comparison"
set xlabel "Year"
set ylabel "Separated Pu (tonnes)"
plot \
  "puinv.dat" u ($1/12):($2/1000) w p lc 1 ps 0.6 pt 1 title "Case MI: monthly, individual", \
  "puinv.dat" u ($1/12):($3/1000) w p lc 7 ps 0.5 pt 2 title "Case MF: monthly, fleet", \
  "puinv.dat" u ($1/12):($4/1000) w p lc 2 ps 0.4 pt 6 title "Case QI: quarterly, individual", \
  "puinv.dat" u ($1/12):($5/1000) w p lc 4 ps 0.13 pt 4 title "Case QF: quarterly, fleet", \

