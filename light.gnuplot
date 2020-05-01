set title "Illuminance for the Last \\~48 Hours"
set xtics 7200 rotate by 30 offset -5.7, -2.2
set y2tics 
set key outside below
set xlabel "Time (UTC)" offset 0.0, -1.6;
set xdata time;
set format x "%F\n%TZ"
set timefmt "%Y%m%d%H%M%S"
set grid
set term png size 1300, 512 font ",10"

set ylabel "lx"
set y2label "lx"
set output 'light_all.png'
set format y "%.2f"
set format y2 "%.2f"
plot "light_levels.20200501" using 1:3 title 'Total Eye (lx)' with lines linecolor rgb "#ffff00", \
"light_levels.20200501" using 1:5 title 'UVA (counts)' with lines linecolor rgb "#0000ff", \
"light_levels.20200501" using 1:7 title 'BB (counts)' with lines linecolor rgb "#00ff00", \
"light_levels.20200501" using 1:9 title 'IR (counts)' with lines linecolor rgb "#ff0000"

set ylabel "count"
set y2label "count"

set output 'light_uva.png'
plot "light_levels.20200501" using 1:5 title 'UVA (counts)' with lines linecolor rgb "#0000ff"

set output 'light_bb.png'
plot "light_levels.20200501" using 1:7 title 'BB (counts)' with lines linecolor rgb "#00ff00"

set output 'light_ir.png'
plot "light_levels.20200501" using 1:9 title 'IR (counts)' with lines linecolor rgb "#ff0000"
