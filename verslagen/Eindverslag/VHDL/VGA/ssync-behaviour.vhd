library IEEE;
use IEEE.std_logic_1164.ALL;

entity ssync is
port(
ssync_in: in std_logic_vector(5 downto 0); --Komt van de counter
deler_out_in : in std_logic; --vertraagde klok van de deler
reset : in std_logic; --algemene reset
ssync_out_out : out std_logic --ssync naar buiten
);
end ssync;


architecture behaviour of ssync is
begin
process(ssync_in, deler_out_in, reset)
begin
if(rising_edge(deler_out_in)) then

if(reset = '1') then
	ssync_out_out <='0';
else

if (ssync_in = "000000") then
	ssync_out_out <= '0';
elsif (ssync_in = "010110") then
	ssync_out_out <= '1';
elsif (ssync_in = "011000") then
	ssync_out_out <= '0';


end if; --teller if
end if; --reset if
end if; --begin op klok if

end process;
end behaviour;








