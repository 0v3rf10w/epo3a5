#*********************************************************
#  synthesize script for cell: sdcard                     *
#*********************************************************
set hdlin_vhdl_93 false
set hdlin_ff_always_async_set_reset true
set hdlin_ff_always_sync_set_reset true
set vhdlout_architecture_name "synthesised"
set vhdlout_use_packages {"ieee.std_logic_1164" "CellsLib.CellsLib_DECL_PACK"}
set company "ontwerp_practicum"
set designer "jtijhuis"
set target_library  {"/data/public/common/software/opprog/synth_libs/g_digilib5_99.db"}
set link_library [list "*" "/data/public/common/software/opprog/synth_libs/g_digilib5_99.db" "/data/public/common/software/opprog/synth_libs/g_analib8_00.db" "/data/public/common/software/opprog/synth_libs/buffers.db"]
define_design_lib MY_LIB -path /tmp/jtijhuis//home/jtijhuis/epo3a5/chip/subsystems/SDCARD/GWTF/syn_work
define_design_lib CELLSLIB -path /data/public/common/software/opprog/synth_libs/CellsLib
read_file -format vhdl -work MY_LIB {/tmp/jtijhuis//home/jtijhuis/epo3a5/chip/subsystems/SDCARD/GWTF/VHDL/sdcard.vhd }
set_dont_touch {g_analib8_00/*}
# set_max_fanout 1.8 all_inputs() 
# set_max_area 1000 
set compile_preserve_subdesign_interfaces true
compile
ungroup -all -flat
report_area
report_fsm
write_file -f ddc sdcard -output /tmp/jtijhuis//home/jtijhuis/epo3a5/chip/subsystems/SDCARD/GWTF/ADB/sdcard.ddc
write_file -f vhdl sdcard -output /tmp/jtijhuis//home/jtijhuis/epo3a5/chip/subsystems/SDCARD/GWTF/VHDL/sdcard_SYNTH.vhd
quit

