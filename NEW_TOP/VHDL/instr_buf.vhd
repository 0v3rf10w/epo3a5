library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity instr_buf is
port( buf_in  : in  std_logic_vector(11 downto 0);
      buf_oe  : in  std_logic;
      buf_out : out std_logic_vector(11 downto 0));
end entity instr_buf;

architecture behaviour of instr_buf is
begin
  process (buf_in, buf_oe)
  begin
    if (buf_oe = '1') then
      buf_out <= buf_in;
    else
      buf_out <= "ZZZZZZZZZZZZ";
    end if;
  end process;
end architecture;


