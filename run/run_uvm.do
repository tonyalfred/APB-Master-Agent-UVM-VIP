vlog -cover bcest rtl/apb_v3_sram.v 
vopt +acc=a work.tb_top -o dbgver
vsim +UVM_TESTNAME=apb_test +UVM_VERBOSITY=UVM_HIGH -assertdebug -voptargs=+acc -msgmode both -coverage work.tb_top -logfile transcript.log

onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -position end sim:/tb_top/dut/PCLK
add wave -position end sim:/tb_top/dut/PRESETn

add wave -position end sim:/tb_top/dut/PSEL
add wave -position end sim:/tb_top/dut/PENABLE
add wave -position end sim:/tb_top/dut/PWRITE

add wave -position end sim:/tb_top/dut/PADDR
add wave -position end sim:/tb_top/dut/PWDATA
add wave -position end sim:/tb_top/dut/PRDATA

add wave -position end sim:/tb_top/dut/PREADY
add wave -position end sim:/tb_top/dut/PSLVERR

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {18884 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 152
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {61170 ps}

run -all