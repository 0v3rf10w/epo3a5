library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of blackbox_tb is

component blackbox is
   port(sclk_m_0:in    std_logic;
        mosi_m_0:in    std_logic;
        miso_m_0:out   std_logic;
        ss_m_0  :in    std_logic;
	
	sclk_m_1:in    std_logic;
        mosi_m_1:in    std_logic;
        miso_m_1:out   std_logic;
        ss_m_1  :in    std_logic;

	sclk_s_0:out    std_logic;
        mosi_s_0:out    std_logic;
        miso_s_0:in   std_logic;
        ss_s_0  :out    std_logic;

	sclk_s_1:out    std_logic;
        mosi_s_1:out    std_logic;
        miso_s_1:in   std_logic;
        ss_s_1  :out    std_logic;

	s:	in	std_logic);
end component;

signal scm0, mom0, mim0, ssm0, scm1, mom1, mim1, ssm1: std_logic;
signal scs0, mos0, mis0, sss0, scs1, mos1, mis1, sss1: std_logic; 
signal ss: std_logic;

begin
bb: blackbox port map(scm0, mom0, mim0, ssm0, scm1, mom1, mim1, ssm1,
		      scs0, mos0, mis0, sss0, scs1, mos1, mis1, sss1, ss);

scm0 <= '0';
mom0 <= '0';
mis0 <= '0';
ssm0 <= '0';

scm1 <= '1';
mom1 <= '1';
mis1 <= '1';
ssm1 <= '1';

ss <= '0' after 10 ns, '1' after 50 ns;

end behaviour;





