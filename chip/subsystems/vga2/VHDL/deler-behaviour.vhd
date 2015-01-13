library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

entity deler is 
port ( 
clk : in std_logic; 
deler_out : out std_logic); 
end entity deler;

architecture behaviour of deler is
 begin -- Dit process genereert het register 

process(clk)
variable cnt : integer range 0 to 4; 
begin
if(clk'event and clk='1') then
if(cnt=4) then --Het ding telt tot vijf en gaat daarna weer naar nul
cnt:=0;
deler_out<='1';
else
cnt := cnt+1;
deler_out<='0';
end if;
end if;
end process;

end behaviour;







