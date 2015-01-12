library IEEE;
use IEEE.std_logic_1164.ALL;

entity rgb is
   port(von         :in    std_logic;
        deler_out_in :in    std_logic;
	counter_out_in :in std_logic;
        rgb_out     :out   std_logic_vector(2 downto 0));
end rgb;





