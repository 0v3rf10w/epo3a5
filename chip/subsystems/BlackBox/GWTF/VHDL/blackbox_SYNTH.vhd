
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of blackbox is

   component stream
      port( IN_0, IN_1 : in std_logic;  OUT_0, OUT_1 : out std_logic;  E : in 
            std_logic);
   end component;

begin
   
   stream0 : stream port map( IN_0 => sclk_m_0, IN_1 => sclk_m_1, OUT_0 => 
                           sclk_s_0, OUT_1 => sclk_s_1, E => s);
   stream1 : stream port map( IN_0 => mosi_m_0, IN_1 => mosi_m_1, OUT_0 => 
                           mosi_s_0, OUT_1 => mosi_s_1, E => s);
   stream2 : stream port map( IN_0 => ss_m_0, IN_1 => ss_m_1, OUT_0 => ss_s_0, 
                           OUT_1 => ss_s_1, E => s);
   stream3 : stream port map( IN_0 => miso_s_0, IN_1 => miso_s_1, OUT_0 => 
                           miso_m_0, OUT_1 => miso_m_1, E => s);

end synthesised;



