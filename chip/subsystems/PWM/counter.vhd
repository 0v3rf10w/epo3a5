library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

entity counter is 
port ( 
clk : in std_logic; 
reset : in std_logic; 
counter_out : out std_logic_vector (9 downto 0) ); 
end entity counter;

architecture behavioural of counter is
signal count, new_count : unsigned (9 downto 0);
 begin -- Dit process genereert het register 


process (clk) 
begin 
if (rising_edge (clk)) then 
	if (reset = '1') then 
	count <= (others => '0'); 
	else 
	count <= new_count; 
	end if; 
end if; 
end process;

process (count) 
begin 
if(count<1022) then 
new_count <= count + 1; 
else new_count <= (others => '0'); 
end if; 
end process;
counter_out <= std_logic_vector (count);
end architecture;




