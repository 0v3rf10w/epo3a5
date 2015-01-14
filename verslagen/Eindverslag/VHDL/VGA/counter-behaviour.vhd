library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

entity counter is 
port ( 
clk_in : in std_logic; 
reset : in std_logic; 
counter_out : out std_logic_vector (5 downto 0) );
--counter_out_out : out std_logic_vector (5 downto 0)  ); 
end entity counter;

architecture behavioural of counter is
signal count, new_count : unsigned (5 downto 0);
 begin -- Dit process genereert het register 


process (clk_in, reset) --Kijk of de reset aan staat
begin 
if (rising_edge (clk_in)) then 
	if (reset = '1') then 
	count <= (others => '0'); 
	else 
	count <= new_count; 
	end if; 
end if; 
end process;

process (count) --Het daadwerkelijke tellen
begin 
if(count<41) then --was 41
new_count <= count + 1; 
else new_count <= (others => '0'); 
end if; 

counter_out <= std_logic_vector (count);
--counter_out_out <= std_logic_vector (count);
end process;
end architecture;











































