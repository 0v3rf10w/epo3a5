library IEEE;
use IEEE.std_logic_1164.ALL;

entity blackbox is
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
end blackbox;


