set vdd = h*~
set vss = l*~
set clk = (l*100 h*100)*5051\
          l*~
set reset = h*1000\
            l*999000\
            h*500 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 1010200

print \
      clk,\
      f2,\
      f4,\
      f8,\
      f16,\
      f32,\
      f64,\
      f128,\
      f256,\
      f512,\
      f1024,\
      f2048,\
      f4096,\
      f8192,\
      f16384,\
      f32768,\
      f65536,\
      f131072,\
      reset

plot \
      clk,\
      f2,\
      f4,\
      f8,\
      f16,\
      f32,\
      f64,\
      f128,\
      f256,\
      f512,\
      f1024,\
      f2048,\
      f4096,\
      f8192,\
      f16384,\
      f32768,\
      f65536,\
      f131072,\
      reset
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


