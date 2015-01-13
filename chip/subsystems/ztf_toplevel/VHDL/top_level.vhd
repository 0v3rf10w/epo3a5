library IEEE;
use IEEE.std_logic_1164.ALL;

entity top_level is
   port(clk    :in    std_logic;
        reset  :in    std_logic;
        miso_sd:in    std_logic;
        sclk_sd:out   std_logic;
        mosi_sd:out   std_logic;
        ss_sd  :out   std_logic;
        mosi_ar:in    std_logic;
        sclk_ar:in    std_logic;
        h_sync :out   std_logic;
        v_sync :out   std_logic;
        rgb    :out   std_logic_vector(2 downto 0);
	sclk_sram_0	:inout	std_logic;
	mosi_sram_0	:inout	std_logic;
	miso_sram_0	:inout	std_logic;
	ss_sram_0	:inout	std_logic;
	sclk_sram_1	:inout	std_logic;
	mosi_sram_1	:inout	std_logic;
	miso_sram_1	:inout	std_logic;
	ss_sram_1	:inout	std_logic);
end top_level;








