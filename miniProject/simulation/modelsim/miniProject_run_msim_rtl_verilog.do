transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/LogicDesign/miniProject {D:/LogicDesign/miniProject/separate.v}
vlog -vlog01compat -work work +incdir+D:/LogicDesign/miniProject {D:/LogicDesign/miniProject/second_counter.v}
vlog -vlog01compat -work work +incdir+D:/LogicDesign/miniProject {D:/LogicDesign/miniProject/minute_counter.v}
vlog -vlog01compat -work work +incdir+D:/LogicDesign/miniProject {D:/LogicDesign/miniProject/led7_decoder.v}
vlog -vlog01compat -work work +incdir+D:/LogicDesign/miniProject {D:/LogicDesign/miniProject/clock_counter.v}
vlog -vlog01compat -work work +incdir+D:/LogicDesign/miniProject {D:/LogicDesign/miniProject/hour_counter.v}

vlog -vlog01compat -work work +incdir+D:/LogicDesign/miniProject {D:/LogicDesign/miniProject/second_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  second_tb

add wave *
view structure
view signals
run -all
