set vdd = h*~
set vss = l*~
set sclk_m_0 = l*~
set mosi_m_0 = l*~
set ss_m_0 = l*~
set sclk_m_1 = h*~
set mosi_m_1 = h*~
set ss_m_1 = h*~
set miso_s_0 = l*~
set miso_s_1 = h*~
set s = x*10\
        l*40 h*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 50

print \
      sclk_m_0,\
      mosi_m_0,\
      miso_m_0,\
      ss_m_0,\
      sclk_m_1,\
      mosi_m_1,\
      miso_m_1,\
      ss_m_1,\
      sclk_s_0,\
      mosi_s_0,\
      miso_s_0,\
      ss_s_0,\
      sclk_s_1,\
      mosi_s_1,\
      miso_s_1,\
      ss_s_1,\
      s

plot \
      sclk_m_0,\
      mosi_m_0,\
      miso_m_0,\
      ss_m_0,\
      sclk_m_1,\
      mosi_m_1,\
      miso_m_1,\
      ss_m_1,\
      sclk_s_0,\
      mosi_s_0,\
      miso_s_0,\
      ss_s_0,\
      sclk_s_1,\
      mosi_s_1,\
      miso_s_1,\
      ss_s_1,\
      s
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


