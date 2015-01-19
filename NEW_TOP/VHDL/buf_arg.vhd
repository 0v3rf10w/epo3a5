library IEEE;
use IEEE.std_logic_1164.all;

entity buf_arg is
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic;
      buf_out : out std_logic_vector(7 downto 0));
end entity buf_arg;

architecture behaviour of buf_arg is
begin
  process (buf_in, buf_oe)
  begin
    if (buf_oe = '1') then
      buf_out <= buf_in;
    else
      buf_out <= "ZZZZZZZZ";
    end if;
  end process;
end architecture;




