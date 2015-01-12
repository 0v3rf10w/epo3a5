library IEEE;
use IEEE.std_logic_1164.all;

entity ROM is
port
(
    rom_a:    in std_logic_vector (7 DOWNTO 0);     -- address
    rom_d:    out std_logic_vector (11 DOWNTO 0)    -- instruction
);
end ROM;

architecture behavioural OF ROM IS
begin
    with rom_a select
    rom_d <=
"010101000001" when "00000000", -- 		Load 010000001
"011100000001" when "00000001",	--		Set R1 
"010110000001" when "00000010", --		load 100000001
"011100000001" when "00000010",	--		Set R1
"010100000000" when "00000011", -- 		load 000000000
"011100000001" when "00000100";	--		Set R1
end behavioural;

