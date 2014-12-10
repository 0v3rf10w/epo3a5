library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pc_counter is
port ( pc_in  : in  std_logic_vector(7 downto 0);
      pc_inc  : in  std_logic;
      pc_ld   : in  std_logic;
      pc_rst  : in  std_logic;
      pc_clk  : in  std_logic;
      pc_out  : out std_logic_vector(7 downto 0));
end entity pc_counter;

architecture behaviour of pc_counter is
signal count : std_logic_vector(7 downto 0);
begin
  process(pc_in, pc_inc, pc_ld, pc_rst, pc_clk)
  begin
    if (pc_rst='1') then
      count <= "00000000";
    else
      if (pc_clk'event AND pc_clk='1') then
        if (pc_inc='1') then
          count <= count + 1;
        elsif (pc_ld='1') then
          count <= pc_in;
        end if;
      end if;
    end if;
  end process;
  
  pc_out <= count;
  
end architecture;