set vdd = h*~
set vss = l*~
set clk = (l*50 h*50)*20\
          l*~
set send = l*500\
           h*200 l*~
set reset = h*100 l*~
set write_enable = l*200\
                   h*100 l*~
set write_in_7_0_7 = h*~
set write_in_7_0_6 = h*~
set write_in_7_0_5 = h*~
set write_in_7_0_4 = h*~
set write_in_7_0_3 = h*~
set write_in_7_0_2 = h*~
set write_in_7_0_1 = h*~
set write_in_7_0_0 = h*~
set miso = l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 2000

print \
      clk,\
      send,\
      reset,\
      write_enable,\
      write_in_7_0_7,\
      write_in_7_0_6,\
      write_in_7_0_5,\
      write_in_7_0_4,\
      write_in_7_0_3,\
      write_in_7_0_2,\
      write_in_7_0_1,\
      write_in_7_0_0,\
      read_out_7_0_7,\
      read_out_7_0_6,\
      read_out_7_0_5,\
      read_out_7_0_4,\
      read_out_7_0_3,\
      read_out_7_0_2,\
      read_out_7_0_1,\
      read_out_7_0_0,\
      sclk,\
      mosi,\
      miso

plot \
      clk,\
      send,\
      reset,\
      write_enable,\
      write_in_7_0_7,\
      write_in_7_0_6,\
      write_in_7_0_5,\
      write_in_7_0_4,\
      write_in_7_0_3,\
      write_in_7_0_2,\
      write_in_7_0_1,\
      write_in_7_0_0,\
      read_out_7_0_7,\
      read_out_7_0_6,\
      read_out_7_0_5,\
      read_out_7_0_4,\
      read_out_7_0_3,\
      read_out_7_0_2,\
      read_out_7_0_1,\
      read_out_7_0_0,\
      sclk,\
      mosi,\
      miso
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


