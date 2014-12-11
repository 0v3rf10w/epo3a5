
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of klokdeler is

   component dff
      port( clk, d, reset : in std_logic;  q, qbar : out std_logic);
   end component;
   
   signal d2, d4, d8, d16, d32, d64, d128, d256, d512, d1024, d2048, d4096, 
      d8192, d16384, d32768, d65536, d131072 : std_logic;

begin
   
   lbl1 : dff port map( clk => clk, d => d2, reset => reset, q => f2, qbar => 
                           d2);
   lbl2 : dff port map( clk => d2, d => d4, reset => reset, q => f4, qbar => d4
                           );
   lbl3 : dff port map( clk => d4, d => d8, reset => reset, q => f8, qbar => d8
                           );
   lbl4 : dff port map( clk => d8, d => d16, reset => reset, q => f16, qbar => 
                           d16);
   lbl5 : dff port map( clk => d16, d => d32, reset => reset, q => f32, qbar =>
                           d32);
   lbl6 : dff port map( clk => d32, d => d64, reset => reset, q => f64, qbar =>
                           d64);
   lbl7 : dff port map( clk => d64, d => d128, reset => reset, q => f128, qbar 
                           => d128);
   lbl8 : dff port map( clk => d128, d => d256, reset => reset, q => f256, qbar
                           => d256);
   lbl9 : dff port map( clk => d256, d => d512, reset => reset, q => f512, qbar
                           => d512);
   lbl10 : dff port map( clk => d512, d => d1024, reset => reset, q => f1024, 
                           qbar => d1024);
   lbl11 : dff port map( clk => d1024, d => d2048, reset => reset, q => f2048, 
                           qbar => d2048);
   lbl12 : dff port map( clk => d2048, d => d4096, reset => reset, q => f4096, 
                           qbar => d4096);
   lbl13 : dff port map( clk => d4096, d => d8192, reset => reset, q => f8192, 
                           qbar => d8192);
   lbl14 : dff port map( clk => d8192, d => d16384, reset => reset, q => f16384
                           , qbar => d16384);
   lbl15 : dff port map( clk => d16384, d => d32768, reset => reset, q => 
                           f32768, qbar => d32768);
   lbl16 : dff port map( clk => d32768, d => d65536, reset => reset, q => 
                           f65536, qbar => d65536);
   lbl17 : dff port map( clk => d65536, d => d131072, reset => reset, q => 
                           f131072, qbar => d131072);

end synthesised;



