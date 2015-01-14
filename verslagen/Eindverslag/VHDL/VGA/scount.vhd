library IEEE;
use IEEE.std_logic_1164.ALL;

entity scount is
   port(clk   :in    std_logic;
        reset :in    std_logic;
        ssync :in    std_logic;
        scount:out   std_logic_vector(4 downto 0));
end scount;


