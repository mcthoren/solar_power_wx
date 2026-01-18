set title "Solar Power Conditons over the Last \\~48 Hours"
set xtics 7200 rotate by 30 offset -6.2, -3.0
set y2tics 
set link y2
set mytics
set key outside below
set xlabel "Time (UTC)" offset 0.0, -2.6;
set xdata time;
set format x "%F\n%TZ"
set timefmt "%Y%m%d%H%M%S"
set grid
set term svg size 1900, 700 font ",13" background '0xffffff'

set format y "%.2f"
set format y2 "%.2f"

set ylabel "(V)"
set y2label "(V)"

dat_f='/home/ghz/solar_power_wx/data/solar_power.2-3_day'

set output '/home/ghz/solar_power_wx/plots/batt_voltage.svg'
plot dat_f using 1:6 title 'Battery Voltage (V)' with lines linecolor rgb "#00aa00"

set ylabel "(A)"
set y2label "(A)"

set output '/home/ghz/solar_power_wx/plots/battery_current.svg'
plot dat_f using 1:($3 / 1000) title 'Battery Current (A)' with lines linecolor rgb "#00bbbb"

set ylabel "(W)"
set y2label "(W)"
set format y "%.1f"
set format y2 "%.1f"

set output '/home/ghz/solar_power_wx/plots/power.svg'
# plot dat_f using 1:($9 / 1000) title 'Power Use (W)' with lines linecolor rgb "#0000bb"
plot dat_f using 1:(($3 * $6) / 1000) title 'Battery Power (W)' with lines linecolor rgb "#0000bb"

set ylabel "(°C)"
set y2label "(°C)"

set output '/home/ghz/solar_power_wx/plots/pitemp.svg'
plot dat_f using 1:12 title 'Pi Temp (°C)' with lines linecolor rgb "#ff0000" smooth bezier
