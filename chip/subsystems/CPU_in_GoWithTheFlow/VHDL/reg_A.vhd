library IEEE;
use IEEE.std_logic_1164.ALL;

entity reg_a is
   port(reg_in :in    std_logic_vector(7 downto 0);
        reg_clk:in    std_logic;
        reg_rst:in    std_logic;
        reg_ld :in    std_logic;
        reg_out:out   std_logic_vector(7 downto 0));
end reg_a;

architecture behaviour of reg_a is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld='1') then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;




