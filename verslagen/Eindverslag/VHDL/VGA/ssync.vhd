library IEEE;
use IEEE.std_logic_1164.ALL;

entity ssync is
   port(clk      :in    std_logic;
        reset    :in    std_logic;
        scount   :in    std_logic_vector(4 downto 0);
        ssync_out:out   std_logic);
end ssync;


