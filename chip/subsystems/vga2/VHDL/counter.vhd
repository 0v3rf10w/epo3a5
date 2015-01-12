library IEEE;
use IEEE.std_logic_1164.ALL;

entity counter is
   port(clk_in     :in    std_logic;
        reset      :in    std_logic;
        counter_out:out   std_logic_vector(4 downto 0));
end counter;


