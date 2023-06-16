quit -sim
.main clear
vlog cpu_top.v
vlog tb.v
vsim -novopt tb
add wave  -hex tb/*
run -all

