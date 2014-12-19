
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

package CONV_PACK_sdcard is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_sdcard;

library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

use work.CONV_PACK_sdcard.all;

entity sdcard is

   port( clk, div_clk, reset : in std_logic;  address : in std_logic_vector (31
         downto 0);  output : out std_logic_vector (7 downto 0);  busy_out, 
         sclk, mosi, miso, ss : out std_logic);

end sdcard;

architecture synthesised of sdcard is

   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   component spi
      port( clk, send, reset, write_enable : in std_logic;  write_in : in 
            std_logic_vector (7 downto 0);  read_out : out std_logic_vector (7 
            downto 0);  busy, sclk, mosi : out std_logic;  miso : in std_logic
            );
   end component;
   
   signal write_in_7_port, write_in_6_port, write_in_5_port, write_in_4_port, 
      write_in_3_port, write_in_2_port, write_in_1_port, write_in_0_port, 
      spi_output_7_port, spi_output_6_port, spi_output_5_port, 
      spi_output_4_port, spi_output_3_port, spi_output_2_port, 
      spi_output_1_port, spi_output_0_port, mosi_spi, slave_select, 
      state_4_port, state_3_port, state_2_port, state_1_port, state_0_port, 
      send_cnt_3_port, send_cnt_2_port, send_cnt_1_port, send_cnt_0_port, N194,
      N195, N196, N197, N198, n11, n14, n226, n227, n228, n229, n230, n231, 
      n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, 
      n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, 
      n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, 
      n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, 
      n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, 
      n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, 
      n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, 
      n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, 
      n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, 
      n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, 
      n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, 
      n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, 
      n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, 
      n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, 
      n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, 
      n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, 
      n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, 
      n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, 
      n448 : std_logic;

begin
   
   spi5 : spi port map( clk => clk, send => n11, reset => reset, write_enable 
                           => n14, write_in(7) => write_in_7_port, write_in(6) 
                           => write_in_6_port, write_in(5) => write_in_5_port, 
                           write_in(4) => write_in_4_port, write_in(3) => 
                           write_in_3_port, write_in(2) => write_in_2_port, 
                           write_in(1) => write_in_1_port, write_in(0) => 
                           write_in_0_port, read_out(7) => spi_output_7_port, 
                           read_out(6) => spi_output_6_port, read_out(5) => 
                           spi_output_5_port, read_out(4) => spi_output_4_port,
                           read_out(3) => spi_output_3_port, read_out(2) => 
                           spi_output_2_port, read_out(1) => spi_output_1_port,
                           read_out(0) => spi_output_0_port, busy => sclk, sclk
                           => mosi_spi, mosi => miso, miso => slave_select);
   send_cnt_reg_0_inst : dfn10 port map( D => n229, CK => clk, Q => 
                           send_cnt_0_port);
   state_reg_1_inst : dfa11 port map( D => N195, CK => clk, R => reset, Q => 
                           state_1_port);
   send_cnt_reg_3_inst : dfn10 port map( D => n228, CK => clk, Q => 
                           send_cnt_3_port);
   state_reg_0_inst : dfa11 port map( D => N194, CK => clk, R => reset, Q => 
                           state_0_port);
   state_reg_2_inst : dfa11 port map( D => N196, CK => clk, R => reset, Q => 
                           state_2_port);
   state_reg_3_inst : dfa11 port map( D => N197, CK => clk, R => reset, Q => 
                           state_3_port);
   state_reg_4_inst : dfa11 port map( D => N198, CK => clk, R => reset, Q => 
                           state_4_port);
   send_cnt_reg_1_inst : dfn10 port map( D => n226, CK => clk, Q => 
                           send_cnt_1_port);
   send_cnt_reg_2_inst : dfn10 port map( D => n227, CK => clk, Q => 
                           send_cnt_2_port);
   U247 : na210 port map( A => n230, B => n231, Y => write_in_7_port);
   U248 : na210 port map( A => n232, B => n233, Y => n231);
   U249 : na310 port map( A => n234, B => n235, C => n236, Y => n233);
   U250 : iv110 port map( A => n237, Y => n236);
   U251 : na210 port map( A => n238, B => n239, Y => n237);
   U252 : na210 port map( A => n240, B => address(15), Y => n239);
   U253 : na210 port map( A => n241, B => address(7), Y => n238);
   U254 : na210 port map( A => address(31), B => n242, Y => n235);
   U255 : na210 port map( A => address(23), B => n243, Y => n234);
   U256 : na210 port map( A => n244, B => n245, Y => write_in_6_port);
   U257 : no210 port map( A => n246, B => n247, Y => n244);
   U258 : no210 port map( A => n248, B => n249, Y => n247);
   U259 : no210 port map( A => n250, B => n251, Y => n246);
   U260 : no210 port map( A => n252, B => n253, Y => n250);
   U261 : na210 port map( A => n254, B => n255, Y => n253);
   U262 : na210 port map( A => address(6), B => n241, Y => n255);
   U263 : na210 port map( A => address(14), B => n240, Y => n254);
   U264 : na210 port map( A => n256, B => n257, Y => n252);
   U265 : na210 port map( A => address(30), B => n242, Y => n257);
   U266 : na210 port map( A => address(22), B => n243, Y => n256);
   U267 : na210 port map( A => n258, B => n259, Y => write_in_5_port);
   U268 : na210 port map( A => n232, B => n260, Y => n259);
   U269 : na310 port map( A => n261, B => n262, C => n263, Y => n260);
   U270 : iv110 port map( A => n264, Y => n263);
   U271 : na210 port map( A => n265, B => n266, Y => n264);
   U272 : na210 port map( A => n240, B => address(13), Y => n266);
   U273 : na210 port map( A => n241, B => address(5), Y => n265);
   U274 : na210 port map( A => address(29), B => n242, Y => n262);
   U275 : na210 port map( A => address(21), B => n243, Y => n261);
   U276 : na210 port map( A => n230, B => n267, Y => write_in_4_port);
   U277 : na210 port map( A => n232, B => n268, Y => n267);
   U278 : na310 port map( A => n269, B => n270, C => n271, Y => n268);
   U279 : iv110 port map( A => n272, Y => n271);
   U280 : na310 port map( A => n273, B => n249, C => n274, Y => n272);
   U281 : na210 port map( A => n242, B => address(28), Y => n274);
   U282 : na210 port map( A => n243, B => address(20), Y => n273);
   U283 : na210 port map( A => address(4), B => n241, Y => n270);
   U284 : na210 port map( A => address(12), B => n240, Y => n269);
   U285 : na210 port map( A => n258, B => n275, Y => write_in_3_port);
   U286 : na210 port map( A => n232, B => n276, Y => n275);
   U287 : na310 port map( A => n277, B => n278, C => n279, Y => n276);
   U288 : iv110 port map( A => n280, Y => n279);
   U289 : na210 port map( A => n281, B => n282, Y => n280);
   U290 : na210 port map( A => n240, B => address(11), Y => n282);
   U291 : na210 port map( A => n241, B => address(3), Y => n281);
   U292 : na210 port map( A => address(27), B => n242, Y => n278);
   U293 : na210 port map( A => address(19), B => n243, Y => n277);
   U294 : no310 port map( A => n283, B => n284, C => n285, Y => n258);
   U295 : no210 port map( A => n286, B => n287, Y => n283);
   U296 : na210 port map( A => n230, B => n288, Y => write_in_2_port);
   U297 : na210 port map( A => n232, B => n289, Y => n288);
   U298 : na310 port map( A => n290, B => n291, C => n292, Y => n289);
   U299 : iv110 port map( A => n293, Y => n292);
   U300 : na210 port map( A => n294, B => n295, Y => n293);
   U301 : na210 port map( A => n240, B => address(10), Y => n295);
   U302 : na210 port map( A => n241, B => address(2), Y => n294);
   U303 : na210 port map( A => address(26), B => n242, Y => n291);
   U304 : na210 port map( A => address(18), B => n243, Y => n290);
   U305 : na210 port map( A => n245, B => n296, Y => write_in_1_port);
   U306 : na210 port map( A => n297, B => n298, Y => n296);
   U307 : na310 port map( A => n299, B => n300, C => n301, Y => n298);
   U308 : iv110 port map( A => n302, Y => n301);
   U309 : na210 port map( A => n303, B => n304, Y => n302);
   U310 : na210 port map( A => n240, B => address(9), Y => n304);
   U311 : na210 port map( A => n241, B => address(1), Y => n303);
   U312 : na210 port map( A => address(25), B => n242, Y => n300);
   U313 : na210 port map( A => address(17), B => n243, Y => n299);
   U314 : iv110 port map( A => n251, Y => n297);
   U315 : no310 port map( A => n285, B => n305, C => n306, Y => n245);
   U316 : iv110 port map( A => n307, Y => n306);
   U317 : no210 port map( A => n308, B => n309, Y => n307);
   U318 : no210 port map( A => n310, B => n251, Y => n309);
   U319 : no210 port map( A => n311, B => n312, Y => n310);
   U320 : no210 port map( A => n313, B => n287, Y => n308);
   U321 : no210 port map( A => n314, B => n248, Y => n305);
   U322 : iv110 port map( A => n14, Y => n248);
   U323 : na210 port map( A => n230, B => n315, Y => write_in_0_port);
   U324 : na210 port map( A => n232, B => n316, Y => n315);
   U325 : na310 port map( A => n317, B => n318, C => n319, Y => n316);
   U326 : iv110 port map( A => n320, Y => n319);
   U327 : na310 port map( A => n321, B => n249, C => n322, Y => n320);
   U328 : na210 port map( A => n242, B => address(24), Y => n322);
   U329 : no310 port map( A => send_cnt_1_port, B => send_cnt_2_port, C => n323
                           , Y => n242);
   U330 : na210 port map( A => n243, B => address(16), Y => n321);
   U331 : no310 port map( A => send_cnt_0_port, B => send_cnt_2_port, C => n324
                           , Y => n243);
   U332 : na210 port map( A => address(0), B => n241, Y => n318);
   U333 : no310 port map( A => send_cnt_0_port, B => send_cnt_1_port, C => n325
                           , Y => n241);
   U334 : na210 port map( A => address(8), B => n240, Y => n317);
   U335 : no310 port map( A => n326, B => n284, C => n285, Y => n230);
   U336 : na310 port map( A => n327, B => n328, C => n329, Y => n285);
   U337 : no210 port map( A => n330, B => n331, Y => n329);
   U338 : no210 port map( A => state_4_port, B => n332, Y => n331);
   U339 : iv110 port map( A => n333, Y => n330);
   U340 : iv110 port map( A => n334, Y => n284);
   U341 : no210 port map( A => n287, B => n335, Y => n326);
   U342 : no210 port map( A => n336, B => n337, Y => n335);
   U343 : iv110 port map( A => n286, Y => n337);
   U344 : iv110 port map( A => n338, Y => n229);
   U345 : mu111 port map( A => n327, B => n339, S => n323, Y => n338);
   U346 : mu111 port map( A => n340, B => n341, S => n314, Y => n228);
   U347 : no210 port map( A => n339, B => n342, Y => n341);
   U348 : na210 port map( A => n327, B => n343, Y => n340);
   U349 : na210 port map( A => n344, B => n342, Y => n343);
   U350 : na210 port map( A => n311, B => send_cnt_0_port, Y => n342);
   U351 : na210 port map( A => n345, B => n346, Y => n227);
   U352 : na210 port map( A => send_cnt_2_port, B => n347, Y => n346);
   U353 : na210 port map( A => n348, B => n349, Y => n347);
   U354 : na210 port map( A => n344, B => n324, Y => n349);
   U355 : iv110 port map( A => n350, Y => n348);
   U356 : na210 port map( A => n240, B => n344, Y => n345);
   U357 : no310 port map( A => n323, B => send_cnt_2_port, C => n324, Y => n240
                           );
   U358 : mu111 port map( A => n350, B => n351, S => n324, Y => n226);
   U359 : no210 port map( A => n339, B => n323, Y => n351);
   U360 : na210 port map( A => n327, B => n352, Y => n350);
   U361 : na210 port map( A => n344, B => n323, Y => n352);
   U362 : iv110 port map( A => n339, Y => n344);
   U363 : no210 port map( A => n353, B => n14, Y => n339);
   U364 : no310 port map( A => n354, B => n355, C => n356, Y => n327);
   U365 : na310 port map( A => n357, B => n358, C => n359, Y => n11);
   U366 : no210 port map( A => n360, B => n356, Y => n359);
   U367 : na210 port map( A => n361, B => n362, Y => n356);
   U368 : na210 port map( A => n363, B => n364, Y => n362);
   U369 : no210 port map( A => n365, B => n366, Y => n360);
   U370 : iv110 port map( A => n367, Y => n357);
   U371 : na310 port map( A => n368, B => n328, C => n369, Y => mosi);
   U372 : no310 port map( A => n370, B => mosi_spi, C => n14, Y => n369);
   U373 : na210 port map( A => n251, B => n287, Y => n14);
   U374 : no310 port map( A => n371, B => slave_select, C => n372, Y => n328);
   U375 : na210 port map( A => n373, B => n358, Y => n372);
   U376 : iv110 port map( A => n374, Y => n358);
   U377 : na210 port map( A => n375, B => n376, Y => n373);
   U378 : iv110 port map( A => n377, Y => slave_select);
   U379 : no210 port map( A => n353, B => n378, Y => n377);
   U380 : no210 port map( A => n366, B => n379, Y => n378);
   U381 : no210 port map( A => n364, B => n380, Y => n379);
   U382 : iv110 port map( A => n381, Y => n366);
   U383 : iv110 port map( A => n382, Y => n353);
   U384 : no210 port map( A => n383, B => n365, Y => n371);
   U385 : iv110 port map( A => n363, Y => n383);
   U386 : no210 port map( A => n355, B => n354, Y => n368);
   U387 : iv110 port map( A => n384, Y => n355);
   U388 : na210 port map( A => n333, B => n385, Y => N198);
   U389 : na210 port map( A => n386, B => n387, Y => n385);
   U390 : na210 port map( A => n388, B => n389, Y => n387);
   U391 : na210 port map( A => n370, B => n390, Y => n389);
   U392 : na310 port map( A => state_4_port, B => n364, C => n391, Y => n333);
   U393 : no210 port map( A => state_3_port, B => state_0_port, Y => n391);
   U394 : iv110 port map( A => n392, Y => N197);
   U395 : no310 port map( A => n393, B => n394, C => n395, Y => n392);
   U396 : na310 port map( A => n384, B => n361, C => n251, Y => n395);
   U397 : no210 port map( A => n388, B => n386, Y => n394);
   U398 : iv110 port map( A => n396, Y => n386);
   U399 : mu111 port map( A => n363, B => n370, S => n376, Y => n393);
   U400 : na310 port map( A => n397, B => n398, C => n399, Y => N196);
   U401 : iv110 port map( A => n400, Y => n399);
   U402 : na310 port map( A => n287, B => n401, C => n384, Y => n400);
   U403 : na210 port map( A => n370, B => n380, Y => n287);
   U404 : no210 port map( A => n402, B => n374, Y => n397);
   U405 : na210 port map( A => n403, B => n404, Y => n374);
   U406 : na210 port map( A => n381, B => n376, Y => n404);
   U407 : na210 port map( A => n363, B => n390, Y => n403);
   U408 : no210 port map( A => n388, B => n405, Y => n402);
   U409 : na310 port map( A => n406, B => n334, C => n407, Y => N195);
   U410 : no310 port map( A => n408, B => n409, C => n367, Y => n407);
   U411 : na210 port map( A => n410, B => n411, Y => n367);
   U412 : na210 port map( A => n381, B => n390, Y => n411);
   U413 : na210 port map( A => n363, B => n380, Y => n410);
   U414 : no310 port map( A => n384, B => spi_output_0_port, C => n412, Y => 
                           n409);
   U415 : na210 port map( A => n232, B => n312, Y => n334);
   U416 : no210 port map( A => n251, B => send_cnt_3_port, Y => n232);
   U417 : iv110 port map( A => n413, Y => n406);
   U418 : na210 port map( A => n382, B => n401, Y => n413);
   U419 : na310 port map( A => n390, B => n396, C => n370, Y => n401);
   U420 : na210 port map( A => n405, B => n414, Y => n396);
   U421 : na210 port map( A => spi_output_0_port, B => n415, Y => n414);
   U422 : na310 port map( A => n416, B => n417, C => n418, Y => N194);
   U423 : no310 port map( A => n419, B => n420, C => n421, Y => n418);
   U424 : no310 port map( A => n382, B => n314, C => n249, Y => n421);
   U425 : na310 port map( A => n324, B => n325, C => n323, Y => n249);
   U426 : iv110 port map( A => send_cnt_1_port, Y => n324);
   U427 : na210 port map( A => n370, B => n364, Y => n382);
   U428 : no310 port map( A => n286, B => n365, C => n422, Y => n420);
   U429 : iv110 port map( A => n380, Y => n365);
   U430 : na310 port map( A => n323, B => n314, C => n311, Y => n286);
   U431 : iv110 port map( A => n313, Y => n311);
   U432 : na210 port map( A => send_cnt_1_port, B => send_cnt_2_port, Y => n313
                           );
   U433 : na210 port map( A => n423, B => n424, Y => n419);
   U434 : na310 port map( A => n370, B => n390, C => n425, Y => n424);
   U435 : iv110 port map( A => n405, Y => n425);
   U436 : na210 port map( A => n426, B => n427, Y => n405);
   U437 : no310 port map( A => n428, B => spi_output_5_port, C => 
                           spi_output_4_port, Y => n427);
   U438 : iv110 port map( A => n429, Y => n428);
   U439 : no210 port map( A => spi_output_6_port, B => spi_output_7_port, Y => 
                           n429);
   U440 : no310 port map( A => n430, B => spi_output_1_port, C => 
                           spi_output_0_port, Y => n426);
   U441 : iv110 port map( A => n431, Y => n430);
   U442 : no210 port map( A => spi_output_2_port, B => spi_output_3_port, Y => 
                           n431);
   U443 : no210 port map( A => n422, B => n432, Y => n370);
   U444 : na210 port map( A => n381, B => n433, Y => n423);
   U445 : na210 port map( A => reset, B => n364, Y => n433);
   U446 : no210 port map( A => n422, B => state_0_port, Y => n381);
   U447 : na210 port map( A => n434, B => n375, Y => n422);
   U448 : iv110 port map( A => state_4_port, Y => n375);
   U449 : iv110 port map( A => n408, Y => n417);
   U450 : na210 port map( A => n398, B => n435, Y => n408);
   U451 : na310 port map( A => spi_output_0_port, B => n415, C => n354, Y => 
                           n435);
   U452 : iv110 port map( A => n388, Y => n354);
   U453 : na210 port map( A => n380, B => n436, Y => n388);
   U454 : no210 port map( A => n437, B => state_2_port, Y => n380);
   U455 : iv110 port map( A => n438, Y => n398);
   U456 : na210 port map( A => n361, B => n439, Y => n438);
   U457 : na210 port map( A => n376, B => n363, Y => n439);
   U458 : no310 port map( A => n434, B => state_4_port, C => n432, Y => n363);
   U459 : iv110 port map( A => state_0_port, Y => n432);
   U460 : na210 port map( A => n376, B => n436, Y => n361);
   U461 : no210 port map( A => n437, B => n440, Y => n376);
   U462 : iv110 port map( A => state_2_port, Y => n440);
   U463 : no210 port map( A => n441, B => n442, Y => n416);
   U464 : no210 port map( A => n336, B => n251, Y => n442);
   U465 : na210 port map( A => n364, B => n436, Y => n251);
   U466 : no210 port map( A => state_1_port, B => state_2_port, Y => n364);
   U467 : iv110 port map( A => n443, Y => n336);
   U468 : na210 port map( A => n312, B => n314, Y => n443);
   U469 : iv110 port map( A => send_cnt_3_port, Y => n314);
   U470 : no310 port map( A => n323, B => send_cnt_1_port, C => n325, Y => n312
                           );
   U471 : iv110 port map( A => send_cnt_2_port, Y => n325);
   U472 : iv110 port map( A => send_cnt_0_port, Y => n323);
   U473 : no210 port map( A => n444, B => n384, Y => n441);
   U474 : na210 port map( A => n390, B => n436, Y => n384);
   U475 : no310 port map( A => state_0_port, B => state_4_port, C => n434, Y =>
                           n436);
   U476 : iv110 port map( A => state_3_port, Y => n434);
   U477 : iv110 port map( A => n332, Y => n390);
   U478 : na210 port map( A => state_2_port, B => n437, Y => n332);
   U479 : iv110 port map( A => state_1_port, Y => n437);
   U480 : no210 port map( A => spi_output_0_port, B => n412, Y => n444);
   U481 : iv110 port map( A => n415, Y => n412);
   U482 : no210 port map( A => n445, B => n446, Y => n415);
   U483 : na310 port map( A => n447, B => spi_output_3_port, C => 
                           spi_output_4_port, Y => n446);
   U484 : iv110 port map( A => n448, Y => n447);
   U485 : na210 port map( A => spi_output_2_port, B => spi_output_1_port, Y => 
                           n448);
   U486 : na310 port map( A => spi_output_7_port, B => spi_output_5_port, C => 
                           spi_output_6_port, Y => n445);

end synthesised;
