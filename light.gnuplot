set title "Light levels over the Last \\~48 Hours"
set xtics 7200 rotate by 30 offset -5.7, -2.2
set ytics nomirror
set y2tics
set key outside below
set xlabel "Time (UTC)" offset 0.0, -1.6;
set xdata time;
set format x "%F\n%TZ"
set timefmt "%Y%m%d%H%M%S"
set grid
set term png size 1900, 512 font ",10"

set format y "%.0f"
set format y2 "%.0f"

set ylabel "(UVA sensor counts)"
set y2label "(BB/IR sensor counts)"

dat_f='/tmp/light_levels.20201011'

set output '/tmp/light.png'
plot dat_f using 1:5 axes x1y1 title 'UVA' with lines linecolor rgb "#0000ff", \
dat_f using 1:7 axes x1y2 title 'BB' with lines linecolor rgb "#00bb00", \
dat_f using 1:9 axes x1y2 title 'IR' with lines linecolor rgb "#ff0000"

set autoscale y
set autoscale y2
set output '/tmp/light.smooth.png'
plot dat_f using 1:5 axes x1y1 title 'UVA' with lines linecolor rgb "#0000ff" smooth sbezier, \
dat_f using 1:7 axes x1y2 title 'BB' with lines linecolor rgb "#00ff00" smooth bezier, \
dat_f using 1:9 axes x1y2 title 'IR' with lines linecolor rgb "#ff0000" smooth bezier
