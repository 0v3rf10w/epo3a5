library IEEE;
use IEEE.std_logic_1164.ALL;

entity alu_tb is
end entity alu_tb;

architecture behaviour of alu_tb is
component alu
  port ( alu_A  : in  std_logic_vector(7 downto 0);     -- input A
         alu_B  : in  std_logic_vector(7 downto 0);     -- input B
         opcode : in  std_logic_vector(2 downto 0);     -- opcode
         alu_clk: in  std_logic;                        -- clk
         alu_c  : out std_logic;                        -- flag C
         alu_z  : out std_logic;                        -- flag Z
         alu_y  : out std_logic_vector(7 downto 0));    -- Output result y
end component;

signal alu_A	:	std_logic_vector(7 downto 0);
signal alu_B	:	std_logic_vector(7 downto 0);
signal opcode	:	std_logic_vector(2 downto 0);
signal alu_clk	:	std_logic;
signal alu_c	:	std_logic;
signal alu_z	:	std_logic;
signal alu_y	:	std_logic_vector(7 downto 0);

begin
lbl1: alu port map (alu_A, alu_B, opcode, alu_clk, alu_c, alu_z, alu_y);

alu_clk <= '1' after 0 ns,
	'0' after 5 ns when alu_clk/= '0' else '1' after 5 ns;
alu_A <= "00000000" after 0 ns,
	"00000110" after 50 ns,
	"00001000" after 70 ns,
	"11111000" after 90 ns,
	"11111111" after 150 ns;
alu_B <= "00000000" after 0 ns,
	"00000110" after 65 ns,
	"00001110" after 90 ns,
	"11111000" after 110 ns,
	"00000001" after 150 ns;
opcode <= "000" after 0 ns,
	"100" after 10 ns,
	"011" after 20 ns,
	"100" after 30 ns,
	"001" after 70 ns,
	"101" after 90 ns,
	"101" after 150 ns;

end architecture;
