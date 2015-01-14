library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

entity rgb is
port(
deler_out_in : in std_logic; --vertraagde klok van de deler
von : in std_logic; --signaal naar rgb om aan te geven dat er vid geschreven mag worden
reset : in std_logic;
counter_out_in : in std_logic_vector (5 downto 0);
line_on_in : in std_logic;
--counter2_in : in std_logic_vector (5 downto 0);
vidcount_out_in : in std_logic_vector (9 downto 0);
rgb_out : out std_logic_vector (2 downto 0);
input : in std_logic

);

end rgb;

architecture behaviour of rgb is
begin



process(von, deler_out_in, vidcount_out_in, input) --Regel tekenen
begin
if(rising_edge(deler_out_in)) then
if(reset = '1') then
rgb_out <= "000";
else
if(von = '0') then --teken flag is laag, anders schrijven
	rgb_out <="000";
else
if(line_on_in = '0') then
	rgb_out <="000";
else


if (vidcount_out_in <= "0001000001") then
if (counter_out_in = "001001") then
	rgb_out <="100";	
elsif (counter_out_in = "001010") then
	rgb_out <="010";	
elsif (counter_out_in = "001011") then
	rgb_out <="100";	
elsif (counter_out_in = "001101") then
	rgb_out <="010";	
elsif (counter_out_in = "001111") then
	rgb_out <="100";	
elsif (counter_out_in = "010010") then
	rgb_out <="010";	
elsif (counter_out_in = "010011") then
	rgb_out <="100";
elsif (counter_out_in = "010100") then
	rgb_out <="010";
elsif (counter_out_in = "010101") then
	rgb_out <="100";
end if; --horizontaal regel

 elsif (vidcount_out_in <= "1000010001") then
if (counter_out_in = "001001") then
	if (input = '0') then
	rgb_out <="010";
	else
	rgb_out <="000";	
	end if;
elsif (counter_out_in = "001011") then
	if (input = '0') then
	rgb_out <="010";
	else
	rgb_out <="000";	
end if;
elsif (counter_out_in = "001111") then
	if (input = '0') then
	rgb_out <="010";
	else
	rgb_out <="000";		
end if;
elsif (counter_out_in = "010000") then
	if (input = '0') then
	rgb_out <="000";
	else
	rgb_out <="010";		
end if;
elsif (counter_out_in = "010001") then
	if (input = '0') then
	rgb_out <="000";
	else
	rgb_out <="010";		
end if;
elsif (counter_out_in = "010010") then
	if (input = '0') then
	rgb_out <="000";
	else
	rgb_out <="010";		
end if;
elsif (counter_out_in = "010011") then
	if (input = '0') then
	rgb_out <="000";
	else
	rgb_out <="010";	
end if;
elsif (counter_out_in = "010100") then
	if (input = '0') then
	rgb_out <="000";
	else
	rgb_out <="010";	
end if;
elsif (counter_out_in = "010111") then
	if (input = '0') then
	rgb_out <="001";
	else
	rgb_out <="010";
end if; --laatste ifje
end if; --horizontaal regel


end if; --vidcount
end if; --von
end if; --line on in
end if; --reset
end if; --deler_out_in
end process;
end architecture;


