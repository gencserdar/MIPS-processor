transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/cla_level2_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/cla_level1_8bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/and_4bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/and_8bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/and_16bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/and_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/or_4bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/or_8bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/or_16bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/or_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/xor_4bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/xor_8bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/xor_16bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/xor_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/nor_4bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/nor_8bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/nor_16bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/nor_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/mux_2x1.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/mux_8x1.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/control_unit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/alu_control.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/sign_extend.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/shift_left_2.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/mips.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/mod_cu.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/mod.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/mod_dp.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/mux_5bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/and_5bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/or_5bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/concat.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/shift_left_2_jump.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/cla_4bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/register_block.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/instruction_block.v}
vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/memory_block.v}

vlog -vlog01compat -work work +incdir+C:/Users/serdar/Desktop/mips {C:/Users/serdar/Desktop/mips/mips_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  mips_tb

add wave *
view structure
view signals
run -all
