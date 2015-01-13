library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_2 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity reg_2;

architecture behaviour of reg_2 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0))=2)) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;


