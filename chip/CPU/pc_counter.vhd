library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity pc_counter is
port ( pc_in  : in  std_logic_vector(7 downto 0);
      pc_inc  : in  std_logic;
      pc_ld   : in  std_logic;
      pc_rst  : in  std_logic;
      pc_en  : in  std_logic;
      pc_out  : out std_logic_vector(7 downto 0));
end entity pc_counter;

architecture behaviour of pc_counter is
signal count : std_logic_vector(7 downto 0);
begin
  process(pc_rst, pc_en)
  begin
    if (pc_rst='1') then
      count <= "00000000";
    else
      if (pc_en'event AND pc_en='1') then
        if (pc_inc='1') then
          count <= unsigned(count) + 1;
        elsif (pc_ld='1') then
          count <= pc_in;
        end if;
      end if;
    end if;
  end process;
  
  pc_out <= count;
  
end architecture;


