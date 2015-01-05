## Generated SDC file "top_de1.sdc"

## Copyright (C) 1991-2013 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

## DATE    "Tue Dec 23 20:10:29 2014"

##
## DEVICE  "EP2C20F484C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clock_50mhz}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name clock_5mhz -source [get_ports {clock_50mhz}] -divide_by 10 [get_nets {inst1|count[2]}]
create_generated_clock -source [get_ports {clock_50mhz}] -divide_by 2 [get_nets {inst9|lbl1|sig_q}]
create_generated_clock -source [get_ports {clock_50mhz}] -divide_by 4 [get_nets {inst9|lbl2|sig_q}]
create_generated_clock -source [get_ports {clock_50mhz}] -divide_by 8 [get_nets {inst9|lbl3|sig_q}]
create_generated_clock -source [get_ports {clock_50mhz}] -divide_by 16 [get_nets {inst9|lbl4|sig_q}]
create_generated_clock -source [get_ports {clock_50mhz}] -divide_by 32 [get_nets {inst9|lbl5|sig_q}]
create_generated_clock -source [get_ports {clock_50mhz}] -divide_by 64 [get_nets {inst9|lbl6|sig_q}]
create_generated_clock -source [get_ports {clock_50mhz}] -divide_by 128 [get_nets {inst9|lbl7|sig_q}]
create_generated_clock -name div_clock -source [get_ports {clock_50mhz}] -divide_by 256 [get_nets {inst9|lbl8|sig_q}]

#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -clock { clock_5mhz } -max 5 [get_ports {miso_in}]
set_input_delay -clock { clock_5mhz } -min 5 [get_ports {miso_in}]

#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -clock { clock_5mhz } -max 5 [get_ports {mosi_out}]
set_output_delay -clock { clock_5mhz } -min -5 [get_ports {mosi_out}]

set_output_delay -clock { clock_5mhz } -max 5 [get_ports {slave_select}]
set_output_delay -clock { clock_5mhz } -min -5 [get_ports {slave_select}]

#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

