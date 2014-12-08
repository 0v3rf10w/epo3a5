
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of blackbox is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component stream
      port( IN_0, IN_1 : in std_logic;  OUT_0, OUT_1 : out std_logic;  E, notE 
            : in std_logic);
   end component;
   
   signal n1, n2, n3, n4 : std_logic;

begin
   
   stream0 : stream port map( IN_0 => sclk_m_0, IN_1 => sclk_m_1, OUT_0 => 
                           sclk_s_0, OUT_1 => sclk_s_1, E => s, notE => n1);
   stream1 : stream port map( IN_0 => mosi_m_0, IN_1 => mosi_m_1, OUT_0 => 
                           mosi_s_0, OUT_1 => mosi_s_1, E => s, notE => n4);
   stream2 : stream port map( IN_0 => ss_m_0, IN_1 => ss_m_1, OUT_0 => ss_s_0, 
                           OUT_1 => ss_s_1, E => s, notE => n3);
   stream3 : stream port map( IN_0 => miso_s_0, IN_1 => miso_s_1, OUT_0 => 
                           miso_m_0, OUT_1 => miso_m_1, E => s, notE => n2);
   U2 : iv110 port map( A => s, Y => n2);
   U3 : iv110 port map( A => s, Y => n3);
   U4 : iv110 port map( A => s, Y => n4);
   U5 : iv110 port map( A => s, Y => n1);

end synthesised;



