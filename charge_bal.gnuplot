set title "Daily Battery Charge Balance"
set y2tics
set key outside below
set xdata time;
set timefmt "%Y%m%d"
set xlabel "Time (UTC)" offset 0.0, -1.6;
set format x "%F"
set grid
set ylabel "Charge (Ah)"
set y2label "Charge (Ah)"
set term png size 1900, 512 font ",10"
set xtics auto rotate by 30 offset -6.8, -2.2
set xrange [:] noextend
set mxtics
set mytics
set grid mxtics
set grid mytics
set xtics out
set ytics out
set format y "%.1f"
set format y2 "%.1f"

dat_f='/home/ghz/solar_power_wx/data/solar_power.charge_bal'
dat_f_30='/home/ghz/solar_power_wx/data/solar_power.charge_bal.30'

set style fill solid 0.50 noborder
set output '/home/ghz/solar_power_wx/plots/charge_bal.png'
plot dat_f using 1:4 t 'Charge (Ah)' with boxes lc rgb "#bb00ff"

set title "Daily Battery Charge Balance for the Last 30 Days"
set output '/home/ghz/solar_power_wx/plots/charge_bal.30.png'
plot dat_f_30 using 1:4 t 'Charge (Ah)' with boxes lc rgb "#bb00ff"
