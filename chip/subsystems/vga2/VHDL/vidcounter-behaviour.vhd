library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

entity vidcounter is 
port ( 
nline_in : in std_logic; 
reset : in std_logic; 
vidcount_out : out std_logic_vector (9 downto 0) ); 
end entity vidcounter;

architecture behavioural of vidcounter is
signal count, new_count : unsigned (9 downto 0);
 begin -- Dit process genereert het register 


process (nline_in, reset) --Kijk of de reset aan staat
begin 
if (rising_edge (nline_in)) then 
	if (reset = '1') then 
	count <= (others => '0'); 
	else 
	count <= new_count; 
	end if; 
end if; 
end process;

process (count) --Het daadwerkelijke tellen
begin 

if(count<525) then 
new_count <= count + 1; 
else new_count <= (others => '0'); 
end if; 
end process;
vidcount_out <= std_logic_vector (count);
end architecture;











