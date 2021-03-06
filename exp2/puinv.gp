
set output "puinv.eps"
set terminal epscairo size 5in,5in

set label at screen 0.40,0.98 "Pu Inventory and Flow" font ",14"
set multiplot layout 2,2 rowsfirst title "" offset -3 font ",14"
set key at first 3,2200 top left font ",10" reverse Left

set yrange [1:2750]
set logscale y
set ytics font ",10"

unset xlabel
set format x ''
set ylabel "Individual Reactors\n\nSeparated Pu (tonnes)" offset 1.5
set lmargin at screen 0.20
set rmargin at screen 0.53
set tmargin at screen 0.86
set bmargin at screen 0.51
set title "Monthly Time Steps\n\nCase MI" offset 0,-.8
plot \
  "puinv.dat" u ($1/12):($2/1000) w p lc 1 pt 1 ps 0.5 title "Inventory", \
  "puflow.dat" u ($1/12):($2/1000) w p lc 8 pt 5 ps .15 title "Monthly outflow", \

unset xlabel
set format x ''
unset ylabel
set format y ''
set lmargin at screen 0.57
set rmargin at screen 0.90
set tmargin at screen 0.86
set bmargin at screen 0.51
set title "Quarterly Time Steps\n\nCase QI"
plot \
  "puinv.dat" every 3 u ($1/12):($4/1000) w p lc 2 pt 6 ps 0.4 title "Inventory", \
  "puflow.dat" u ($1/12):($4/1000) w p lc 8 pt 5 ps .15 title "Quarterly outflow", \


set key at first 49,6 top left font ",10" reverse Left

set xtics rotate by 50 right font ",10"
set xlabel "Year"
set ylabel "Fleet Reactors\n\nSeparated Pu (tonnes)" offset 1.5
set format x
set format y
set lmargin at screen 0.20
set rmargin at screen 0.53
set tmargin at screen 0.45
set bmargin at screen 0.11
set title "Case MF"
plot \
  "puinv.dat" u ($1/12):($3/1000) w l lc 7 lw 4 title "Inventory", \
  "puflow.dat" u ($1/12):($3/1000) w p lc 8 pt 5 ps .15 title "Monthly outflow", \
  "puflowin.dat" u ($1/12):($3/1000) w l lc rgb "blue" title "Monthly inflow", \

set key at first 40,6 top left font ",10" reverse Left

set xtics rotate by 50 right font ",10"
set xlabel "Year"
unset ylabel
set format y ''
set lmargin at screen 0.57
set rmargin at screen 0.90
set tmargin at screen 0.45
set bmargin at screen 0.11
set title "Case QF"
plot \
  "puinv.dat" u ($1/12):($5/1000) w l lc 4 lw 4 title "Inventory", \
  "puflow.dat" u ($1/12):($5/1000) w p lc 8 pt 5 ps .15 title "Quarterly outflow", \
  "puflowin.dat" u ($1/12):($5/1000) w l lc rgb "blue" title "Quarterly inflow", \

