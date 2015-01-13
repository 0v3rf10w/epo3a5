library IEEE;
use IEEE.std_logic_1164.ALL;

entity vsync is
   port(reset      :in    std_logic;
        vidcount_in:in    std_logic_vector(9 downto 0);
        line_on_out:out   std_logic;
        vsync_out      :out   std_logic);
end vsync;




