set title "Solar Power over the Last \\~48 Hours"
set xtics 7200 rotate by 30 offset -5.7, -2.2
set y2tics 
set key outside below
set xlabel "Time (UTC)" offset 0.0, -1.6;
set xdata time;
set format x "%F\n%TZ"
set timefmt "%Y%m%d%H%M%S"
set grid
set term png size 1900, 512 font ",10"

set format y "%.2f"
set format y2 "%.2f"

set ylabel "(V)"
set y2label "(V)"

dat_f='/home/ghz/solar_power_wx/data/2-3_day.power'

set output '/home/ghz/solar_power_wx/plots/batt_voltage.png'
plot dat_f using 1:6 title 'Battery Voltage (V)' with lines linecolor rgb "#00ff00"

set ylabel "(mA)"
set y2label "(mA)"

set output '/home/ghz/solar_power_wx/plots/battery_current.png'
plot dat_f using 1:3 title 'Battery Current (mA)' with lines linecolor rgb "#00ffff"

set ylabel "(mW)"
set y2label "(mW)"

set output '/home/ghz/solar_power_wx/plots/power.png'
plot dat_f using 1:9 title 'Power Use (mW)' with lines linecolor rgb "#ff00ff"
