library IEEE;
use IEEE.std_logic_1164.ALL;

entity vidcounter is
   port(nline_in     :in    std_logic;
        reset     :in    std_logic;
        vidcounter_out :out   std_logic_vector(9 downto 0));
end vidcounter;








