library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buf_9 is
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end entity buf_9;

architecture behaviour of buf_9 is
begin
  process (buf_in, buf_oe)
  begin
    if (buf_oe(4) = '1' AND (unsigned(buf_oe(3 downto 0))=9)) then
      buf_out <= buf_in;
    else
      buf_out <= "ZZZZZZZZ";
    end if;
  end process;
end architecture;



