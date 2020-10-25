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
set mxtics
set grid mxtics

dat_f='/home/ghz/solar_power_wx/data/solar_power.charge_bal'

# set boxwidth 0.90 relative
set style fill solid 0.50 border lt -1
set output '/home/ghz/solar_power_wx/plots/charge_bal.png'
plot dat_f using 1:4 t 'Charge (Ah)' with boxes lc rgb "#bb00ff"
