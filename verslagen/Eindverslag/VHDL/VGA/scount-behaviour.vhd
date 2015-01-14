library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

entity scount is 
port ( 
clk_in : in std_logic; 
reset : in std_logic;
ssync_in_in : in std_logic; 
scount_out : out std_logic_vector (5 downto 0) );
end entity scount;

architecture behavioural of scount is
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

process (count, ssync_in_in) --Het daadwerkelijke tellen
begin
if(ssync_in_in = '0') then
	new_count <= (others => '0'); 
else

if(count<25) then --was 41
new_count <= count + 1; 
else new_count <= (others => '0'); 
end if; 
end if;

scount_out <= std_logic_vector (count);
end process;
end architecture;


















