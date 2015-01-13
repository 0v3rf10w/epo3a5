library IEEE;
use IEEE.std_logic_1164.ALL;

entity hsync is
   port(hsync_in    :in    std_logic_vector(4 downto 0);
        deler_out_in:in    std_logic;
        reset       :in    std_logic;
        hsync_out   :out   std_logic;
        nline_out   :out   std_logic;
        line_on_in  :in    std_logic;
        von         :out   std_logic);
end hsync;


