library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of blackbox is

component stream is
   port(IN_0 :in    std_logic;
        IN_1 :in    std_logic;
        OUT_0:out   std_logic;
        OUT_1:out   std_logic;
        E    :in    std_logic);
end component;

signal scm0, mom0, mim0, ssm0, scm1, mom1, mim1, ssm1: std_logic;
signal scs0, mos0, mis0, sss0, scs1, mos1, mis1, sss1: std_logic; 
signal ss: std_logic;

begin
stream0: stream port map(scm0, scm1, scs0, scs1, ss);
stream1: stream port map(mom0, mom1, mos0, mos1, ss);
stream2: stream port map(ssm0, ssm1, sss0, sss1, ss);
stream3: stream port map(mis0, mis1, mim0, mim1, ss);

ss <= s;

scm0 <= sclk_m_0;
mom0 <= mosi_m_0;
miso_m_0 <= mim0;
ssm0 <= ss_m_0;
	
scm1 <= sclk_m_1;
mom1 <= mosi_m_1;
miso_m_1 <= mim1;
ssm1 <= ss_m_1;

sclk_s_0 <= scs0;
mosi_s_0 <= mos0;
mis0 <= miso_s_0;
ss_s_0 <= sss0;

sclk_s_1 <= scs1;
mosi_s_1 <= mos1;
mis1 <= miso_s_1;
ss_s_1 <= sss1;

end behaviour;


