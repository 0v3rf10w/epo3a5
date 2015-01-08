
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of sdcard is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component buf40
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component spi
      port( clk, send, reset, write_enable : in std_logic;  write_in : in 
            std_logic_vector (7 downto 0);  read_out : out std_logic_vector (7 
            downto 0);  busy, sclk, mosi : out std_logic;  miso : in std_logic;
            ss : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal X_Logic1_port, output_11_port, output_10_port, output_9_port, 
      output_8_port, output_7_port, output_6_port, output_5_port, output_4_port
      , output_3_port, output_2_port, output_1_port, output_0_port, 
      state_debug_6_port, state_debug_5_port, state_debug_3_port, 
      state_debug_2_port, state_debug_1_port, state_debug_0_port, 
      spi_output_debug_7_port, spi_output_debug_6_port, spi_output_debug_5_port
      , spi_output_debug_4_port, spi_output_debug_3_port, 
      spi_output_debug_2_port, spi_output_debug_1_port, spi_output_debug_0_port
      , sd_clk, send, write_enable, write_in_7_port, write_in_6_port, 
      write_in_5_port, write_in_4_port, write_in_3_port, write_in_2_port, 
      write_in_1_port, write_in_0_port, busy_spi, mosi_spi, address_buf_7_port,
      address_buf_6_port, address_buf_5_port, address_buf_4_port, 
      address_buf_3_port, address_buf_2_port, address_buf_1_port, 
      address_buf_0_port, new_data, N128, send_switch, send_reset, 
      send_cnt_3_port, send_cnt_2_port, send_cnt_1_port, send_cnt_0_port, 
      state_5_port, state_4_port, state_3_port, state_2_port, state_1_port, 
      state_0_port, N467, N468, N469, N470, N471, N472, n499, n500, n501, n502,
      n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, 
      n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, 
      n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538, 
      n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, 
      n551, n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562, 
      n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, 
      n575, n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586, 
      n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, 
      n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, 
      n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622, 
      n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, 
      n635, n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646, 
      n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658, 
      n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, 
      n671, n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, 
      n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693, n694, 
      n695, n696, n697, n698, n699, n700, n701, n702, n703, n704, n705, n706, 
      n707, n708, n709, n710, n711, n712, n713, n714, n715, n716, n717, n718, 
      n719, n720, n721, n722, n723, n724, n725, n726, n727, n728, n729, n730, 
      n731, n732, n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, 
      n743, n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754, 
      n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765, n766, 
      n767, n768, n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, 
      n779, n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790, 
      n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, n801, n802, 
      n803, n804, n805, n806, n807, n808, n809, n810, n811, n812, n813, n814, 
      n815, n816, n817, n818, n819, n820, n821, n822, n823, n824, n825, n826, 
      n827, n828, n829, n830, n831, n832, n833, n834, n835, n836, n837, n838, 
      n839, n840, n841, n842, n843, n844, n845, n846, n847, n848, n849, n850, 
      n851, n852, n853, n854, n855, n856, n857, n858, n859, n860, n861, n862, 
      n863, n864, n865, n866, n867, n868, n869, n870, n871, n872, n873, n874, 
      n875, n876, n877, n878, n879, n880, n881, n882, n883, n884, n885, n886, 
      n887, n888, n889, n890, n891, n892, n893, n894, n895, n896, n897, n898, 
      n899, n900, n901, n902, n903, n904, n905, n906, n907, n908, n909, n910, 
      n911, n912, n913, n914, n915, n916, n917, n918, n919, n920, n921, n922, 
      n923, n924, n925, n926, n927, n928, n929, n930, n931, n932, n933, n934, 
      n935, n936, n937, n938, n939, n940, n941, n942, n943, n944, n945, n946, 
      n947, n948, n949, n950, n951, n952, n953, n954, n955, n956, n957, n958, 
      n959, n960, n961, n962, n963, n964, n965, state_debug_4_port, n967, 
      n_1000 : std_logic;

begin
   output <= ( output_11_port, output_10_port, output_9_port, output_8_port, 
      output_7_port, output_6_port, output_5_port, output_4_port, output_3_port
      , output_2_port, output_1_port, output_0_port );
   state_debug <= ( state_debug_6_port, state_debug_5_port, state_debug_4_port,
      state_debug_3_port, state_debug_2_port, state_debug_1_port, 
      state_debug_0_port );
   spi_output_debug <= ( spi_output_debug_7_port, spi_output_debug_6_port, 
      spi_output_debug_5_port, spi_output_debug_4_port, spi_output_debug_3_port
      , spi_output_debug_2_port, spi_output_debug_1_port, 
      spi_output_debug_0_port );
   
   X_Logic1_port <= '1';
   address_buf_reg_0_inst : dfa11 port map( D => address(0), CK => n515, R => 
                           reset, Q => address_buf_0_port);
   new_data_reg : dfa11 port map( D => N128, CK => n515, R => n967, Q => 
                           new_data);
   state_reg_1_inst : dfa11 port map( D => N468, CK => n515, R => reset, Q => 
                           state_1_port);
   state_reg_2_inst : dfa11 port map( D => N469, CK => n515, R => reset, Q => 
                           state_2_port);
   state_reg_0_inst : dfa11 port map( D => N467, CK => n515, R => reset, Q => 
                           state_0_port);
   state_reg_4_inst : dfa11 port map( D => N471, CK => n515, R => reset, Q => 
                           state_4_port);
   state_reg_5_inst : dfa11 port map( D => N472, CK => n515, R => reset, Q => 
                           state_5_port);
   state_reg_3_inst : dfa11 port map( D => N470, CK => n515, R => reset, Q => 
                           state_3_port);
   send_cnt_reg_0_inst : dfa11 port map( D => n514, CK => n515, R => reset, Q 
                           => send_cnt_0_port);
   send_cnt_reg_1_inst : dfa11 port map( D => n513, CK => n515, R => reset, Q 
                           => send_cnt_1_port);
   send_cnt_reg_2_inst : dfa11 port map( D => n512, CK => n515, R => reset, Q 
                           => send_cnt_2_port);
   send_cnt_reg_3_inst : dfa11 port map( D => n511, CK => n515, R => reset, Q 
                           => send_cnt_3_port);
   send_switch_reg : dfa11 port map( D => X_Logic1_port, CK => busy_spi, R => 
                           send_reset, Q => send_switch);
   output_reg_reg_7_inst : dfa11 port map( D => n499, CK => n515, R => reset, Q
                           => output_7_port);
   output_reg_reg_6_inst : dfa11 port map( D => n500, CK => n515, R => reset, Q
                           => output_6_port);
   output_reg_reg_5_inst : dfa11 port map( D => n501, CK => n515, R => reset, Q
                           => output_5_port);
   output_reg_reg_4_inst : dfa11 port map( D => n502, CK => n515, R => reset, Q
                           => output_4_port);
   output_reg_reg_3_inst : dfa11 port map( D => n503, CK => n515, R => reset, Q
                           => output_3_port);
   output_reg_reg_2_inst : dfa11 port map( D => n504, CK => n515, R => reset, Q
                           => output_2_port);
   output_reg_reg_1_inst : dfa11 port map( D => n505, CK => n515, R => reset, Q
                           => output_1_port);
   output_reg_reg_0_inst : dfa11 port map( D => n506, CK => n515, R => reset, Q
                           => output_0_port);
   output_reg_reg_8_inst : dfa11 port map( D => n510, CK => n515, R => reset, Q
                           => output_8_port);
   output_reg_reg_9_inst : dfa11 port map( D => n509, CK => n515, R => reset, Q
                           => output_9_port);
   output_reg_reg_10_inst : dfa11 port map( D => n508, CK => n515, R => reset, 
                           Q => output_10_port);
   output_reg_reg_11_inst : dfa11 port map( D => n507, CK => n515, R => reset, 
                           Q => output_11_port);
   address_buf_reg_7_inst : dfa11 port map( D => address(7), CK => n515, R => 
                           reset, Q => address_buf_7_port);
   address_buf_reg_6_inst : dfa11 port map( D => address(6), CK => n515, R => 
                           reset, Q => address_buf_6_port);
   address_buf_reg_5_inst : dfa11 port map( D => address(5), CK => n515, R => 
                           reset, Q => address_buf_5_port);
   address_buf_reg_4_inst : dfa11 port map( D => address(4), CK => n515, R => 
                           reset, Q => address_buf_4_port);
   address_buf_reg_3_inst : dfa11 port map( D => address(3), CK => n515, R => 
                           reset, Q => address_buf_3_port);
   address_buf_reg_2_inst : dfa11 port map( D => address(2), CK => n515, R => 
                           reset, Q => address_buf_2_port);
   address_buf_reg_1_inst : dfa11 port map( D => address(1), CK => n515, R => 
                           reset, Q => address_buf_1_port);
   spi5 : spi port map( clk => n515, send => send, reset => reset, write_enable
                           => write_enable, write_in(7) => write_in_7_port, 
                           write_in(6) => write_in_6_port, write_in(5) => 
                           write_in_5_port, write_in(4) => write_in_4_port, 
                           write_in(3) => write_in_3_port, write_in(2) => 
                           write_in_2_port, write_in(1) => write_in_1_port, 
                           write_in(0) => write_in_0_port, read_out(7) => 
                           spi_output_debug_7_port, read_out(6) => 
                           spi_output_debug_6_port, read_out(5) => 
                           spi_output_debug_5_port, read_out(4) => 
                           spi_output_debug_4_port, read_out(3) => 
                           spi_output_debug_3_port, read_out(2) => 
                           spi_output_debug_2_port, read_out(1) => 
                           spi_output_debug_1_port, read_out(0) => 
                           spi_output_debug_0_port, busy => busy_spi, sclk => 
                           sclk, mosi => mosi_spi, miso => miso, ss => n_1000);
   U551 : buf40 port map( A => sd_clk, Y => n515);
   U552 : na310 port map( A => n516, B => n517, C => n518, Y => write_in_7_port
                           );
   U553 : iv110 port map( A => n519, Y => n518);
   U554 : na210 port map( A => n520, B => n521, Y => n519);
   U555 : na210 port map( A => n522, B => address(7), Y => n521);
   U556 : na210 port map( A => n523, B => write_enable, Y => n517);
   U557 : na310 port map( A => n524, B => n525, C => n526, Y => write_in_6_port
                           );
   U558 : no210 port map( A => n527, B => n528, Y => n526);
   U559 : no210 port map( A => n529, B => n530, Y => n528);
   U560 : no210 port map( A => send_cnt_1_port, B => n531, Y => n527);
   U561 : no210 port map( A => n532, B => n533, Y => n531);
   U562 : no210 port map( A => n534, B => n535, Y => n533);
   U563 : no310 port map( A => n536, B => n537, C => n538, Y => n532);
   U564 : iv110 port map( A => address(6), Y => n536);
   U565 : na210 port map( A => n539, B => n540, Y => n525);
   U566 : na310 port map( A => n541, B => n542, C => n543, Y => write_in_5_port
                           );
   U567 : na210 port map( A => address(5), B => n522, Y => n542);
   U568 : na310 port map( A => n544, B => n516, C => n545, Y => write_in_4_port
                           );
   U569 : no310 port map( A => n546, B => n547, C => n548, Y => n545);
   U570 : no210 port map( A => n549, B => n550, Y => n548);
   U571 : no210 port map( A => n551, B => n552, Y => n547);
   U572 : na310 port map( A => n543, B => n553, C => n554, Y => write_in_3_port
                           );
   U573 : iv110 port map( A => n555, Y => n554);
   U574 : na210 port map( A => n520, B => n556, Y => n555);
   U575 : na210 port map( A => n522, B => address(3), Y => n556);
   U576 : iv110 port map( A => n549, Y => n522);
   U577 : na210 port map( A => n557, B => n523, Y => n553);
   U578 : na310 port map( A => n544, B => n516, C => n558, Y => write_in_2_port
                           );
   U579 : no210 port map( A => n559, B => n560, Y => n558);
   U580 : no210 port map( A => n561, B => n562, Y => n560);
   U581 : no210 port map( A => n549, B => n563, Y => n559);
   U582 : iv110 port map( A => address(2), Y => n563);
   U583 : na310 port map( A => n564, B => n565, C => n524, Y => write_in_1_port
                           );
   U584 : iv110 port map( A => n566, Y => n524);
   U585 : na310 port map( A => n567, B => n568, C => n516, Y => n566);
   U586 : iv110 port map( A => n569, Y => n516);
   U587 : na210 port map( A => n570, B => n571, Y => n568);
   U588 : na210 port map( A => n572, B => n573, Y => n571);
   U589 : na210 port map( A => send_cnt_1_port, B => send_cnt_2_port, Y => n573
                           );
   U590 : na210 port map( A => n557, B => n539, Y => n567);
   U591 : na210 port map( A => n574, B => n530, Y => n539);
   U592 : na210 port map( A => send_cnt_2_port, B => n575, Y => n565);
   U593 : na210 port map( A => n576, B => n577, Y => n575);
   U594 : na210 port map( A => address(1), B => n578, Y => n577);
   U595 : na210 port map( A => n579, B => n540, Y => n564);
   U596 : iv110 port map( A => n574, Y => n579);
   U597 : no210 port map( A => send_cnt_3_port, B => n580, Y => n574);
   U598 : no210 port map( A => n537, B => n581, Y => n580);
   U599 : na310 port map( A => n544, B => n543, C => n582, Y => write_in_0_port
                           );
   U600 : no210 port map( A => n583, B => n584, Y => n582);
   U601 : no210 port map( A => n549, B => n585, Y => n584);
   U602 : na310 port map( A => n586, B => n587, C => n578, Y => n549);
   U603 : no310 port map( A => n588, B => n589, C => n538, Y => n583);
   U604 : no210 port map( A => n590, B => n581, Y => n589);
   U605 : na210 port map( A => n537, B => n572, Y => n588);
   U606 : iv110 port map( A => send_cnt_3_port, Y => n572);
   U607 : no310 port map( A => n591, B => n592, C => n569, Y => n543);
   U608 : na310 port map( A => n593, B => n594, C => n595, Y => n569);
   U609 : no210 port map( A => n562, B => n551, Y => n592);
   U610 : no210 port map( A => n535, B => n552, Y => n591);
   U611 : iv110 port map( A => n596, Y => n544);
   U612 : na210 port map( A => n541, B => n597, Y => n596);
   U613 : na210 port map( A => n523, B => n570, Y => n597);
   U614 : no210 port map( A => n598, B => n599, Y => n541);
   U615 : no210 port map( A => n600, B => n552, Y => n599);
   U616 : no210 port map( A => n523, B => n601, Y => n552);
   U617 : no210 port map( A => n530, B => send_cnt_3_port, Y => n601);
   U618 : na210 port map( A => n581, B => n537, Y => n530);
   U619 : no210 port map( A => send_cnt_0_port, B => send_cnt_1_port, Y => n581
                           );
   U620 : iv110 port map( A => n520, Y => n598);
   U621 : na310 port map( A => n602, B => n538, C => n603, Y => 
                           state_debug_6_port);
   U622 : no210 port map( A => n604, B => n605, Y => n603);
   U623 : na310 port map( A => n606, B => n607, C => n608, Y => 
                           state_debug_5_port);
   U624 : no210 port map( A => n609, B => n610, Y => n608);
   U625 : na310 port map( A => n611, B => n612, C => n613, Y => 
                           state_debug_2_port);
   U626 : no310 port map( A => n614, B => n615, C => n616, Y => n613);
   U627 : na310 port map( A => n602, B => n617, C => n618, Y => n614);
   U628 : na210 port map( A => n619, B => n620, Y => n618);
   U629 : no310 port map( A => n621, B => n622, C => n570, Y => n612);
   U630 : no210 port map( A => n623, B => n624, Y => n611);
   U631 : iv110 port map( A => n625, Y => n623);
   U632 : na310 port map( A => n626, B => n627, C => n628, Y => 
                           state_debug_1_port);
   U633 : no310 port map( A => n629, B => n624, C => n630, Y => n628);
   U634 : na310 port map( A => n535, B => n529, C => n631, Y => n629);
   U635 : no310 port map( A => n632, B => n633, C => n634, Y => n627);
   U636 : no210 port map( A => n635, B => n636, Y => n626);
   U637 : na310 port map( A => n637, B => n638, C => n639, Y => 
                           state_debug_0_port);
   U638 : no310 port map( A => n640, B => n616, C => n641, Y => n639);
   U639 : na310 port map( A => n642, B => n643, C => n644, Y => n616);
   U640 : no310 port map( A => n645, B => n646, C => n647, Y => n644);
   U641 : na210 port map( A => n648, B => n649, Y => n645);
   U642 : no210 port map( A => n650, B => n632, Y => n643);
   U643 : no210 port map( A => n651, B => n652, Y => n642);
   U644 : na210 port map( A => n653, B => n654, Y => n640);
   U645 : iv110 port map( A => n655, Y => n654);
   U646 : no310 port map( A => n656, B => n657, C => n658, Y => n638);
   U647 : iv110 port map( A => n659, Y => n657);
   U648 : no210 port map( A => n660, B => n661, Y => n637);
   U649 : na210 port map( A => n662, B => n607, Y => ss);
   U650 : na310 port map( A => n663, B => n664, C => n665, Y => send_reset);
   U651 : iv110 port map( A => n666, Y => n665);
   U652 : na310 port map( A => n667, B => n668, C => n669, Y => n666);
   U653 : no210 port map( A => n670, B => n661, Y => n667);
   U654 : no210 port map( A => n604, B => n671, Y => n663);
   U655 : no210 port map( A => send_switch, B => n672, Y => send);
   U656 : no310 port map( A => n673, B => n674, C => n675, Y => n672);
   U657 : na210 port map( A => n676, B => n677, Y => n675);
   U658 : iv110 port map( A => n678, Y => n673);
   U659 : no310 port map( A => n679, B => n680, C => n681, Y => n678);
   U660 : na210 port map( A => n682, B => n683, Y => n681);
   U661 : mu111 port map( A => div_clk, B => clk, S => n684, Y => sd_clk);
   U662 : no310 port map( A => n685, B => n686, C => n687, Y => n684);
   U663 : na210 port map( A => n688, B => n689, Y => n687);
   U664 : iv110 port map( A => n690, Y => n689);
   U665 : na310 port map( A => n691, B => n529, C => n692, Y => n685);
   U666 : na310 port map( A => n693, B => n595, C => n694, Y => 
                           state_debug_4_port);
   U667 : no310 port map( A => n695, B => n624, C => n696, Y => n694);
   U668 : iv110 port map( A => n686, Y => n693);
   U669 : na310 port map( A => n697, B => n698, C => n699, Y => n686);
   U670 : no210 port map( A => n622, B => n557, Y => n699);
   U671 : mu111 port map( A => n700, B => n674, S => send_cnt_0_port, Y => n514
                           );
   U672 : mu111 port map( A => n701, B => n702, S => send_cnt_1_port, Y => n513
                           );
   U673 : no210 port map( A => n664, B => n534, Y => n701);
   U674 : iv110 port map( A => n703, Y => n512);
   U675 : mu111 port map( A => n704, B => n705, S => send_cnt_2_port, Y => n703
                           );
   U676 : na210 port map( A => n700, B => n590, Y => n704);
   U677 : na210 port map( A => n706, B => n707, Y => n511);
   U678 : na310 port map( A => n586, B => n700, C => n590, Y => n707);
   U679 : no210 port map( A => n534, B => n587, Y => n590);
   U680 : na210 port map( A => send_cnt_3_port, B => n708, Y => n706);
   U681 : na210 port map( A => n705, B => n709, Y => n708);
   U682 : na210 port map( A => n700, B => n537, Y => n709);
   U683 : iv110 port map( A => n664, Y => n700);
   U684 : no210 port map( A => n702, B => n710, Y => n705);
   U685 : no210 port map( A => n664, B => send_cnt_1_port, Y => n710);
   U686 : iv110 port map( A => n711, Y => n702);
   U687 : no210 port map( A => n674, B => n712, Y => n711);
   U688 : no210 port map( A => n664, B => send_cnt_0_port, Y => n712);
   U689 : no210 port map( A => n713, B => write_enable, Y => n664);
   U690 : na210 port map( A => n594, B => n714, Y => n674);
   U691 : na210 port map( A => n619, B => n715, Y => n714);
   U692 : no310 port map( A => n716, B => n717, C => n718, Y => n594);
   U693 : na310 port map( A => n719, B => n720, C => n692, Y => n718);
   U694 : na210 port map( A => n602, B => n653, Y => n716);
   U695 : na210 port map( A => n721, B => n722, Y => n510);
   U696 : na210 port map( A => output_8_port, B => n723, Y => n722);
   U697 : na210 port map( A => spi_output_debug_0_port, B => n670, Y => n721);
   U698 : na210 port map( A => n724, B => n725, Y => n509);
   U699 : na210 port map( A => output_9_port, B => n723, Y => n725);
   U700 : na210 port map( A => spi_output_debug_1_port, B => n670, Y => n724);
   U701 : na210 port map( A => n726, B => n727, Y => n508);
   U702 : na210 port map( A => output_10_port, B => n723, Y => n727);
   U703 : na210 port map( A => spi_output_debug_2_port, B => n670, Y => n726);
   U704 : na210 port map( A => n728, B => n729, Y => n507);
   U705 : na210 port map( A => output_11_port, B => n723, Y => n729);
   U706 : na210 port map( A => n730, B => n731, Y => n723);
   U707 : iv110 port map( A => n732, Y => n730);
   U708 : na210 port map( A => spi_output_debug_3_port, B => n670, Y => n728);
   U709 : iv110 port map( A => n649, Y => n670);
   U710 : na210 port map( A => n733, B => n734, Y => n506);
   U711 : na210 port map( A => output_0_port, B => n732, Y => n734);
   U712 : na210 port map( A => spi_output_debug_0_port, B => n735, Y => n733);
   U713 : na210 port map( A => n736, B => n737, Y => n505);
   U714 : na210 port map( A => output_1_port, B => n732, Y => n737);
   U715 : na210 port map( A => spi_output_debug_1_port, B => n735, Y => n736);
   U716 : na210 port map( A => n738, B => n739, Y => n504);
   U717 : na210 port map( A => output_2_port, B => n732, Y => n739);
   U718 : na210 port map( A => spi_output_debug_2_port, B => n735, Y => n738);
   U719 : na210 port map( A => n740, B => n741, Y => n503);
   U720 : na210 port map( A => output_3_port, B => n732, Y => n741);
   U721 : na210 port map( A => spi_output_debug_3_port, B => n735, Y => n740);
   U722 : na210 port map( A => n742, B => n743, Y => n502);
   U723 : na210 port map( A => output_4_port, B => n732, Y => n743);
   U724 : na210 port map( A => spi_output_debug_4_port, B => n735, Y => n742);
   U725 : na210 port map( A => n744, B => n745, Y => n501);
   U726 : na210 port map( A => output_5_port, B => n732, Y => n745);
   U727 : na210 port map( A => spi_output_debug_5_port, B => n735, Y => n744);
   U728 : na210 port map( A => n746, B => n747, Y => n500);
   U729 : na210 port map( A => output_6_port, B => n732, Y => n747);
   U730 : na210 port map( A => spi_output_debug_6_port, B => n735, Y => n746);
   U731 : na210 port map( A => n748, B => n749, Y => n499);
   U732 : na210 port map( A => output_7_port, B => n732, Y => n749);
   U733 : na210 port map( A => n750, B => n751, Y => n732);
   U734 : no310 port map( A => n752, B => n680, C => n753, Y => n751);
   U735 : na210 port map( A => n754, B => n755, Y => n752);
   U736 : no310 port map( A => n756, B => n757, C => n758, Y => n750);
   U737 : na210 port map( A => spi_output_debug_7_port, B => n735, Y => n748);
   U738 : na310 port map( A => n593, B => n731, C => n759, Y => mosi);
   U739 : no210 port map( A => mosi_spi, B => write_enable, Y => n759);
   U740 : na310 port map( A => n600, B => n529, C => n561, Y => write_enable);
   U741 : iv110 port map( A => n540, Y => n561);
   U742 : na210 port map( A => n551, B => n535, Y => n540);
   U743 : no210 port map( A => n578, B => n760, Y => n551);
   U744 : iv110 port map( A => n761, Y => n593);
   U745 : na210 port map( A => n762, B => n763, Y => n761);
   U746 : no310 port map( A => n764, B => n765, C => n757, Y => n763);
   U747 : na310 port map( A => n683, B => n766, C => n668, Y => n757);
   U748 : na210 port map( A => n677, B => n682, Y => n764);
   U749 : no310 port map( A => n767, B => n768, C => n690, Y => n762);
   U750 : iv110 port map( A => n669, Y => n768);
   U751 : na210 port map( A => n769, B => n770, Y => n767);
   U752 : na310 port map( A => n771, B => n772, C => n773, Y => busy);
   U753 : no310 port map( A => n756, B => n774, C => n690, Y => n773);
   U754 : na210 port map( A => n662, B => n648, Y => n690);
   U755 : no310 port map( A => n775, B => n661, C => n634, Y => n662);
   U756 : iv110 port map( A => n776, Y => n634);
   U757 : no210 port map( A => n660, B => n713, Y => n776);
   U758 : no210 port map( A => n777, B => n778, Y => n661);
   U759 : no210 port map( A => n779, B => n780, Y => n775);
   U760 : na310 port map( A => n781, B => n782, C => n783, Y => n756);
   U761 : no310 port map( A => n609, B => n784, C => n633, Y => n783);
   U762 : iv110 port map( A => n653, Y => n633);
   U763 : no210 port map( A => state_debug_3_port, B => n967, Y => n772);
   U764 : iv110 port map( A => n731, Y => n967);
   U765 : na310 port map( A => n688, B => n769, C => n697, Y => 
                           state_debug_3_port);
   U766 : iv110 port map( A => n758, Y => n697);
   U767 : na310 port map( A => n535, B => n720, C => n677, Y => n758);
   U768 : no210 port map( A => n630, B => n785, Y => n677);
   U769 : no210 port map( A => n786, B => n787, Y => n785);
   U770 : no310 port map( A => n788, B => n765, C => n632, Y => n688);
   U771 : na210 port map( A => n607, B => n683, Y => n632);
   U772 : no210 port map( A => n570, B => n647, Y => n771);
   U773 : iv110 port map( A => n692, Y => n647);
   U774 : na310 port map( A => n789, B => n790, C => n791, Y => N472);
   U775 : no310 port map( A => n605, B => n792, C => n793, Y => n791);
   U776 : no210 port map( A => n538, B => n562, Y => n793);
   U777 : no210 port map( A => n602, B => n794, Y => n792);
   U778 : na310 port map( A => n769, B => n653, C => n795, Y => n605);
   U779 : no210 port map( A => n796, B => n646, Y => n795);
   U780 : na210 port map( A => n797, B => n798, Y => n653);
   U781 : no310 port map( A => n753, B => n680, C => n799, Y => n769);
   U782 : na210 port map( A => n755, B => n649, Y => n799);
   U783 : na310 port map( A => n625, B => n659, C => n631, Y => n680);
   U784 : na210 port map( A => n800, B => n801, Y => n790);
   U785 : na210 port map( A => n802, B => n803, Y => n800);
   U786 : na210 port map( A => n804, B => n805, Y => n803);
   U787 : iv110 port map( A => n806, Y => n789);
   U788 : na210 port map( A => n607, B => n807, Y => n806);
   U789 : na310 port map( A => n808, B => n809, C => n810, Y => N471);
   U790 : no310 port map( A => n811, B => n695, C => n812, Y => n810);
   U791 : no210 port map( A => n813, B => n814, Y => n812);
   U792 : no210 port map( A => n815, B => n816, Y => n814);
   U793 : iv110 port map( A => n804, Y => n813);
   U794 : na210 port map( A => n617, B => n817, Y => n804);
   U795 : na210 port map( A => n624, B => n818, Y => n817);
   U796 : na310 port map( A => n720, B => n731, C => n819, Y => n811);
   U797 : na210 port map( A => n619, B => n820, Y => n720);
   U798 : na210 port map( A => n821, B => n822, Y => n820);
   U799 : no310 port map( A => n609, B => n823, C => n824, Y => n809);
   U800 : no210 port map( A => n794, B => n825, Y => n824);
   U801 : no210 port map( A => n826, B => n827, Y => n823);
   U802 : no210 port map( A => n815, B => n828, Y => n826);
   U803 : iv110 port map( A => n770, Y => n609);
   U804 : no210 port map( A => n679, B => n621, Y => n770);
   U805 : na210 port map( A => n691, B => n829, Y => n679);
   U806 : no210 port map( A => n641, B => n830, Y => n808);
   U807 : na310 port map( A => n831, B => n606, C => n832, Y => n641);
   U808 : iv110 port map( A => n833, Y => n832);
   U809 : na310 port map( A => n766, B => n535, C => n576, Y => n833);
   U810 : na210 port map( A => n797, B => n834, Y => n831);
   U811 : na310 port map( A => n835, B => n836, C => n837, Y => N470);
   U812 : no310 port map( A => n838, B => n655, C => n650, Y => n837);
   U813 : na310 port map( A => n649, B => n520, C => n625, Y => n838);
   U814 : na210 port map( A => n570, B => n839, Y => n520);
   U815 : iv110 port map( A => n529, Y => n570);
   U816 : no310 port map( A => n610, B => n840, C => n841, Y => n836);
   U817 : no210 port map( A => n794, B => n606, Y => n841);
   U818 : no210 port map( A => n816, B => n842, Y => n840);
   U819 : no210 port map( A => n843, B => n844, Y => n842);
   U820 : no210 port map( A => n845, B => n755, Y => n844);
   U821 : no210 port map( A => n815, B => n846, Y => n843);
   U822 : no210 port map( A => n646, B => n624, Y => n846);
   U823 : iv110 port map( A => n847, Y => n646);
   U824 : na310 port map( A => n576, B => n819, C => n617, Y => n610);
   U825 : iv110 port map( A => n848, Y => n819);
   U826 : iv110 port map( A => n760, Y => n576);
   U827 : no210 port map( A => n636, B => n849, Y => n835);
   U828 : iv110 port map( A => n676, Y => n636);
   U829 : no310 port map( A => n753, B => n621, C => n765, Y => n676);
   U830 : iv110 port map( A => n850, Y => n765);
   U831 : no210 port map( A => n851, B => n658, Y => n850);
   U832 : no210 port map( A => n779, B => n852, Y => n658);
   U833 : na310 port map( A => n853, B => n854, C => n855, Y => n753);
   U834 : iv110 port map( A => n656, Y => n854);
   U835 : no310 port map( A => n780, B => n856, C => n857, Y => n656);
   U836 : na210 port map( A => state_5_port, B => state_1_port, Y => n857);
   U837 : na310 port map( A => n858, B => n859, C => n860, Y => N469);
   U838 : no310 port map( A => n861, B => n546, C => n862, Y => n860);
   U839 : no210 port map( A => n828, B => n754, Y => n862);
   U840 : iv110 port map( A => n818, Y => n828);
   U841 : no210 port map( A => n562, B => n535, Y => n546);
   U842 : na310 port map( A => n863, B => n807, C => n864, Y => n861);
   U843 : na210 port map( A => n774, B => n801, Y => n864);
   U844 : na310 port map( A => n818, B => n801, C => n655, Y => n807);
   U845 : na210 port map( A => n865, B => n713, Y => n863);
   U846 : no210 port map( A => n777, B => n780, Y => n713);
   U847 : iv110 port map( A => n866, Y => n865);
   U848 : no310 port map( A => n867, B => n671, C => n849, Y => n859);
   U849 : na310 port map( A => n868, B => n869, C => n870, Y => n849);
   U850 : no310 port map( A => n604, B => n622, C => n871, Y => n870);
   U851 : iv110 port map( A => n802, Y => n871);
   U852 : na310 port map( A => n805, B => n818, C => n696, Y => n802);
   U853 : na210 port map( A => n595, B => n766, Y => n604);
   U854 : iv110 port map( A => n735, Y => n595);
   U855 : iv110 port map( A => n651, Y => n869);
   U856 : na210 port map( A => n600, B => n829, Y => n651);
   U857 : na210 port map( A => n798, B => n619, Y => n829);
   U858 : iv110 port map( A => n557, Y => n600);
   U859 : iv110 port map( A => n872, Y => n858);
   U860 : na210 port map( A => n873, B => n874, Y => n872);
   U861 : mu111 port map( A => n855, B => n875, S => busy_spi, Y => n874);
   U862 : na310 port map( A => n876, B => n877, C => n878, Y => N468);
   U863 : no210 port map( A => n879, B => n880, Y => n878);
   U864 : na310 port map( A => n881, B => n873, C => n882, Y => n880);
   U865 : mu111 port map( A => n875, B => n883, S => busy_spi, Y => n882);
   U866 : no310 port map( A => n867, B => n884, C => n652, Y => n883);
   U867 : na310 port map( A => n885, B => n855, C => n886, Y => n652);
   U868 : na210 port map( A => n887, B => n620, Y => n886);
   U869 : na210 port map( A => n888, B => n619, Y => n885);
   U870 : no310 port map( A => n779, B => state_4_port, C => n889, Y => n884);
   U871 : iv110 port map( A => n890, Y => n889);
   U872 : na310 port map( A => n631, B => n691, C => n719, Y => n867);
   U873 : na210 port map( A => n797, B => n891, Y => n691);
   U874 : na310 port map( A => n892, B => state_1_port, C => n893, Y => n631);
   U875 : no210 port map( A => n856, B => n894, Y => n893);
   U876 : no210 port map( A => n650, B => n621, Y => n875);
   U877 : no210 port map( A => n895, B => n896, Y => n621);
   U878 : iv110 port map( A => n698, Y => n650);
   U879 : no310 port map( A => n897, B => n898, C => n899, Y => n873);
   U880 : na310 port map( A => n692, B => n659, C => n683, Y => n899);
   U881 : iv110 port map( A => n695, Y => n683);
   U882 : no210 port map( A => n822, B => n896, Y => n695);
   U883 : na210 port map( A => n900, B => n620, Y => n659);
   U884 : no210 port map( A => n529, B => n839, Y => n898);
   U885 : iv110 port map( A => n901, Y => n839);
   U886 : na310 port map( A => n586, B => n534, C => send_cnt_1_port, Y => n901
                           );
   U887 : iv110 port map( A => send_cnt_0_port, Y => n534);
   U888 : na210 port map( A => n902, B => n620, Y => n529);
   U889 : no210 port map( A => n606, B => busy_spi, Y => n897);
   U890 : mu111 port map( A => n535, B => n781, S => n523, Y => n881);
   U891 : iv110 port map( A => n562, Y => n523);
   U892 : no210 port map( A => n760, B => n557, Y => n781);
   U893 : no210 port map( A => n779, B => n787, Y => n557);
   U894 : no210 port map( A => n822, B => n786, Y => n760);
   U895 : iv110 port map( A => n888, Y => n822);
   U896 : na210 port map( A => n888, B => n903, Y => n535);
   U897 : no310 port map( A => n904, B => state_3_port, C => n905, Y => n888);
   U898 : na310 port map( A => n868, B => n906, C => n907, Y => n879);
   U899 : no210 port map( A => n908, B => n909, Y => n907);
   U900 : no210 port map( A => n766, B => n910, Y => n909);
   U901 : no210 port map( A => n754, B => n805, Y => n908);
   U902 : iv110 port map( A => n815, Y => n805);
   U903 : no210 port map( A => n911, B => spi_output_debug_0_port, Y => n815);
   U904 : iv110 port map( A => n615, Y => n906);
   U905 : na310 port map( A => n912, B => n853, C => n913, Y => n615);
   U906 : na210 port map( A => n892, B => n887, Y => n913);
   U907 : na210 port map( A => n891, B => n619, Y => n912);
   U908 : no210 port map( A => n830, B => n914, Y => n868);
   U909 : no210 port map( A => n825, B => busy_spi, Y => n914);
   U910 : iv110 port map( A => n630, Y => n825);
   U911 : no210 port map( A => n777, B => n821, Y => n630);
   U912 : iv110 port map( A => n891, Y => n821);
   U913 : na210 port map( A => n915, B => n916, Y => n830);
   U914 : na210 port map( A => n784, B => n794, Y => n916);
   U915 : iv110 port map( A => busy_spi, Y => n794);
   U916 : iv110 port map( A => n602, Y => n784);
   U917 : na210 port map( A => n917, B => n892, Y => n602);
   U918 : na210 port map( A => n578, B => n562, Y => n915);
   U919 : na310 port map( A => n586, B => n587, C => send_cnt_0_port, Y => n562
                           );
   U920 : iv110 port map( A => send_cnt_1_port, Y => n587);
   U921 : no210 port map( A => n537, B => send_cnt_3_port, Y => n586);
   U922 : iv110 port map( A => send_cnt_2_port, Y => n537);
   U923 : no310 port map( A => n918, B => n851, C => n660, Y => n877);
   U924 : no210 port map( A => n779, B => n778, Y => n660);
   U925 : no210 port map( A => n777, B => n787, Y => n851);
   U926 : iv110 port map( A => n834, Y => n787);
   U927 : na210 port map( A => n919, B => n649, Y => n918);
   U928 : na210 port map( A => n917, B => n834, Y => n649);
   U929 : na310 port map( A => n866, B => n905, C => n920, Y => n919);
   U930 : no210 port map( A => n904, B => n777, Y => n920);
   U931 : na310 port map( A => send_cnt_3_port, B => send_cnt_1_port, C => n921
                           , Y => n866);
   U932 : no210 port map( A => send_cnt_2_port, B => send_cnt_0_port, Y => n921
                           );
   U933 : no310 port map( A => n922, B => n923, C => n924, Y => n876);
   U934 : no210 port map( A => n669, B => n818, Y => n924);
   U935 : na210 port map( A => n925, B => spi_output_debug_0_port, Y => n818);
   U936 : iv110 port map( A => n911, Y => n925);
   U937 : na310 port map( A => n926, B => n927, C => n928, Y => n911);
   U938 : no310 port map( A => spi_output_debug_1_port, B => 
                           spi_output_debug_3_port, C => 
                           spi_output_debug_2_port, Y => n928);
   U939 : no210 port map( A => spi_output_debug_7_port, B => 
                           spi_output_debug_6_port, Y => n927);
   U940 : no210 port map( A => spi_output_debug_5_port, B => 
                           spi_output_debug_4_port, Y => n926);
   U941 : no310 port map( A => n755, B => spi_output_debug_0_port, C => n929, Y
                           => n923);
   U942 : iv110 port map( A => n845, Y => n929);
   U943 : no210 port map( A => n668, B => n801, Y => n922);
   U944 : no210 port map( A => n774, B => n696, Y => n668);
   U945 : iv110 port map( A => n827, Y => n696);
   U946 : na210 port map( A => n847, B => n617, Y => n774);
   U947 : na310 port map( A => n930, B => n931, C => n932, Y => N467);
   U948 : no310 port map( A => n933, B => n671, C => n934, Y => n932);
   U949 : iv110 port map( A => n935, Y => n934);
   U950 : mu111 port map( A => n625, B => n855, S => busy_spi, Y => n935);
   U951 : na210 port map( A => n887, B => n834, Y => n855);
   U952 : na210 port map( A => n917, B => n936, Y => n625);
   U953 : na210 port map( A => n648, B => n755, Y => n671);
   U954 : na210 port map( A => n892, B => n900, Y => n755);
   U955 : na210 port map( A => n892, B => n902, Y => n648);
   U956 : iv110 port map( A => n937, Y => n933);
   U957 : no310 port map( A => n788, B => n735, C => n635, Y => n937);
   U958 : na210 port map( A => n782, B => n692, Y => n635);
   U959 : na210 port map( A => n797, B => n892, Y => n692);
   U960 : no310 port map( A => n578, B => n796, C => n717, Y => n782);
   U961 : na310 port map( A => n698, B => n606, C => n938, Y => n717);
   U962 : no210 port map( A => n622, B => n848, Y => n938);
   U963 : no210 port map( A => n777, B => n895, Y => n848);
   U964 : no210 port map( A => n852, B => n896, Y => n622);
   U965 : iv110 port map( A => n902, Y => n896);
   U966 : na210 port map( A => n903, B => n798, Y => n606);
   U967 : na210 port map( A => n834, B => n902, Y => n698);
   U968 : iv110 port map( A => n682, Y => n796);
   U969 : na210 port map( A => n887, B => n715, Y => n682);
   U970 : na210 port map( A => n778, B => n780, Y => n715);
   U971 : iv110 port map( A => n620, Y => n780);
   U972 : iv110 port map( A => n538, Y => n578);
   U973 : na210 port map( A => n797, B => n939, Y => n538);
   U974 : na210 port map( A => n607, B => n731, Y => n735);
   U975 : na210 port map( A => n936, B => n900, Y => n731);
   U976 : na210 port map( A => n834, B => n900, Y => n607);
   U977 : no310 port map( A => n856, B => state_1_port, C => n894, Y => n900);
   U978 : no210 port map( A => n890, B => state_4_port, Y => n834);
   U979 : na310 port map( A => n719, B => n827, C => n669, Y => n788);
   U980 : no210 port map( A => n624, B => n655, Y => n669);
   U981 : no210 port map( A => n777, B => n852, Y => n655);
   U982 : iv110 port map( A => n903, Y => n777);
   U983 : no210 port map( A => n940, B => state_2_port, Y => n903);
   U984 : iv110 port map( A => n754, Y => n624);
   U985 : na210 port map( A => n891, B => n902, Y => n754);
   U986 : no310 port map( A => state_0_port, B => state_3_port, C => n905, Y =>
                           n891);
   U987 : na210 port map( A => n797, B => n936, Y => n827);
   U988 : na210 port map( A => n797, B => n620, Y => n719);
   U989 : iv110 port map( A => n786, Y => n797);
   U990 : na310 port map( A => state_2_port, B => n894, C => state_1_port, Y =>
                           n786);
   U991 : iv110 port map( A => n941, Y => n931);
   U992 : na310 port map( A => n942, B => n853, C => n617, Y => n941);
   U993 : na210 port map( A => n619, B => n939, Y => n617);
   U994 : iv110 port map( A => n895, Y => n939);
   U995 : na310 port map( A => state_3_port, B => n904, C => state_4_port, Y =>
                           n895);
   U996 : iv110 port map( A => n779, Y => n619);
   U997 : na210 port map( A => n887, B => n936, Y => n853);
   U998 : iv110 port map( A => n852, Y => n936);
   U999 : na310 port map( A => n904, B => n905, C => state_3_port, Y => n852);
   U1000 : no310 port map( A => n894, B => state_2_port, C => n943, Y => n887);
   U1001 : iv110 port map( A => n944, Y => n942);
   U1002 : no310 port map( A => n778, B => reset, C => n940, Y => n944);
   U1003 : iv110 port map( A => n892, Y => n778);
   U1004 : no310 port map( A => state_3_port, B => state_4_port, C => 
                           state_0_port, Y => n892);
   U1005 : no310 port map( A => n945, B => n946, C => n947, Y => n930);
   U1006 : no210 port map( A => n816, B => n847, Y => n947);
   U1007 : na210 port map( A => n917, B => n620, Y => n847);
   U1008 : no310 port map( A => state_3_port, B => state_4_port, C => n904, Y 
                           => n620);
   U1009 : iv110 port map( A => state_0_port, Y => n904);
   U1010 : no310 port map( A => state_1_port, B => state_2_port, C => n894, Y 
                           => n917);
   U1011 : iv110 port map( A => n801, Y => n816);
   U1012 : na210 port map( A => n845, B => spi_output_debug_0_port, Y => n801);
   U1013 : no210 port map( A => n948, B => n949, Y => n845);
   U1014 : na310 port map( A => n950, B => spi_output_debug_3_port, C => 
                           spi_output_debug_4_port, Y => n949);
   U1015 : iv110 port map( A => n951, Y => n950);
   U1016 : na210 port map( A => spi_output_debug_2_port, B => 
                           spi_output_debug_1_port, Y => n951);
   U1017 : na310 port map( A => spi_output_debug_7_port, B => 
                           spi_output_debug_5_port, C => 
                           spi_output_debug_6_port, Y => n948);
   U1018 : no210 port map( A => new_data, B => n766, Y => n946);
   U1019 : na210 port map( A => n798, B => n902, Y => n766);
   U1020 : no210 port map( A => n856, B => n940, Y => n902);
   U1021 : na210 port map( A => n943, B => n894, Y => n940);
   U1022 : iv110 port map( A => state_1_port, Y => n943);
   U1023 : no210 port map( A => n905, B => n890, Y => n798);
   U1024 : na210 port map( A => state_3_port, B => state_0_port, Y => n890);
   U1025 : iv110 port map( A => state_4_port, Y => n905);
   U1026 : no210 port map( A => state_3_port, B => n779, Y => n945);
   U1027 : na310 port map( A => n856, B => n894, C => state_1_port, Y => n779);
   U1028 : iv110 port map( A => state_5_port, Y => n894);
   U1029 : iv110 port map( A => state_2_port, Y => n856);
   U1030 : na210 port map( A => n952, B => n953, Y => N128);
   U1031 : no310 port map( A => n954, B => n955, C => n956, Y => n953);
   U1032 : ex210 port map( A => address_buf_3_port, B => address(3), Y => n956)
                           ;
   U1033 : ex210 port map( A => address_buf_2_port, B => address(2), Y => n955)
                           ;
   U1034 : na310 port map( A => n957, B => n910, C => n958, Y => n954);
   U1035 : ex210 port map( A => n585, B => address_buf_0_port, Y => n958);
   U1036 : iv110 port map( A => address(0), Y => n585);
   U1037 : iv110 port map( A => new_data, Y => n910);
   U1038 : ex210 port map( A => n959, B => address_buf_1_port, Y => n957);
   U1039 : iv110 port map( A => address(1), Y => n959);
   U1040 : no310 port map( A => n960, B => n961, C => n962, Y => n952);
   U1041 : ex210 port map( A => address_buf_7_port, B => address(7), Y => n962)
                           ;
   U1042 : ex210 port map( A => address_buf_6_port, B => address(6), Y => n961)
                           ;
   U1043 : na210 port map( A => n963, B => n964, Y => n960);
   U1044 : ex210 port map( A => n550, B => address_buf_4_port, Y => n964);
   U1045 : iv110 port map( A => address(4), Y => n550);
   U1046 : ex210 port map( A => n965, B => address_buf_5_port, Y => n963);
   U1047 : iv110 port map( A => address(5), Y => n965);

end synthesised;



