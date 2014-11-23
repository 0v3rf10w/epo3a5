
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

package CONV_PACK_shift_reg is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_shift_reg;

library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

use work.CONV_PACK_shift_reg.all;

entity shift_reg is

   port( clk, reset, enable, shift_in, reg_set : in std_logic;  reg_write : in 
         std_logic_vector (7 downto 0);  output : out std_logic_vector (7 
         downto 0));

end shift_reg;

architecture synthesised of shift_reg is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component SYNOP_BASIC_FF
      port( next_state, clocked_on, force_00, force_01, force_10, force_11 : in
            std_logic;  Q, QN : out std_logic);
   end component;
   
   signal output_7_port, output_6_port, output_5_port, output_4_port, 
      output_3_port, output_2_port, output_1_port, output_0_port, n54, n57, n60
      , n63, n66, n69, n72, n75, n74, n73, n71, n70, n68, n67, n65, n64, n62, 
      n61, n59, n58, n56, n55, n53, n52, n76, n77, n78, n79, n80, n81, n82, n83
      , n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, 
      n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, 
      n_1000, n_1001, n_1002, n_1003, n_1004, n_1005, n_1006, n_1007 : 
      std_logic;

begin
   output <= ( output_7_port, output_6_port, output_5_port, output_4_port, 
      output_3_port, output_2_port, output_1_port, output_0_port );
   
   reg_shift_reg_0_inst : SYNOP_BASIC_FF port map( next_state => n75, 
                           clocked_on => clk, force_00 => n102, force_01 => n73
                           , force_10 => n74, force_11 => n101, Q => 
                           output_0_port, QN => n_1000);
   reg_shift_reg_1_inst : SYNOP_BASIC_FF port map( next_state => n72, 
                           clocked_on => clk, force_00 => n103, force_01 => n70
                           , force_10 => n71, force_11 => n100, Q => 
                           output_1_port, QN => n_1001);
   reg_shift_reg_2_inst : SYNOP_BASIC_FF port map( next_state => n69, 
                           clocked_on => clk, force_00 => n104, force_01 => n67
                           , force_10 => n68, force_11 => n99, Q => 
                           output_2_port, QN => n_1002);
   reg_shift_reg_3_inst : SYNOP_BASIC_FF port map( next_state => n66, 
                           clocked_on => clk, force_00 => n105, force_01 => n64
                           , force_10 => n65, force_11 => n98, Q => 
                           output_3_port, QN => n_1003);
   reg_shift_reg_4_inst : SYNOP_BASIC_FF port map( next_state => n63, 
                           clocked_on => clk, force_00 => n106, force_01 => n61
                           , force_10 => n62, force_11 => n97, Q => 
                           output_4_port, QN => n_1004);
   reg_shift_reg_5_inst : SYNOP_BASIC_FF port map( next_state => n60, 
                           clocked_on => clk, force_00 => n107, force_01 => n58
                           , force_10 => n59, force_11 => n96, Q => 
                           output_5_port, QN => n_1005);
   reg_shift_reg_6_inst : SYNOP_BASIC_FF port map( next_state => n57, 
                           clocked_on => clk, force_00 => n108, force_01 => n55
                           , force_10 => n56, force_11 => n95, Q => 
                           output_6_port, QN => n_1006);
   reg_shift_reg_7_inst : SYNOP_BASIC_FF port map( next_state => n54, 
                           clocked_on => clk, force_00 => n109, force_01 => n52
                           , force_10 => n53, force_11 => n94, Q => 
                           output_7_port, QN => n_1007);
   U77 : mu111 port map( A => output_0_port, B => shift_in, S => enable, Y => 
                           n75);
   U78 : no210 port map( A => n76, B => n77, Y => n74);
   U79 : na210 port map( A => n78, B => n79, Y => n73);
   U80 : na210 port map( A => reg_set, B => n77, Y => n79);
   U81 : iv110 port map( A => reg_write(0), Y => n77);
   U82 : mu111 port map( A => output_1_port, B => output_0_port, S => enable, Y
                           => n72);
   U83 : no210 port map( A => n76, B => n80, Y => n71);
   U84 : na210 port map( A => n78, B => n81, Y => n70);
   U85 : na210 port map( A => reg_set, B => n80, Y => n81);
   U86 : iv110 port map( A => reg_write(1), Y => n80);
   U87 : mu111 port map( A => output_2_port, B => output_1_port, S => enable, Y
                           => n69);
   U88 : no210 port map( A => n76, B => n82, Y => n68);
   U89 : na210 port map( A => n78, B => n83, Y => n67);
   U90 : na210 port map( A => reg_set, B => n82, Y => n83);
   U91 : iv110 port map( A => reg_write(2), Y => n82);
   U92 : mu111 port map( A => output_3_port, B => output_2_port, S => enable, Y
                           => n66);
   U93 : no210 port map( A => n76, B => n84, Y => n65);
   U94 : na210 port map( A => n78, B => n85, Y => n64);
   U95 : na210 port map( A => reg_set, B => n84, Y => n85);
   U96 : iv110 port map( A => reg_write(3), Y => n84);
   U97 : mu111 port map( A => output_4_port, B => output_3_port, S => enable, Y
                           => n63);
   U98 : no210 port map( A => n76, B => n86, Y => n62);
   U99 : na210 port map( A => n78, B => n87, Y => n61);
   U100 : na210 port map( A => reg_set, B => n86, Y => n87);
   U101 : iv110 port map( A => reg_write(4), Y => n86);
   U102 : mu111 port map( A => output_5_port, B => output_4_port, S => enable, 
                           Y => n60);
   U103 : no210 port map( A => n76, B => n88, Y => n59);
   U104 : na210 port map( A => n78, B => n89, Y => n58);
   U105 : na210 port map( A => reg_set, B => n88, Y => n89);
   U106 : iv110 port map( A => reg_write(5), Y => n88);
   U107 : mu111 port map( A => output_6_port, B => output_5_port, S => enable, 
                           Y => n57);
   U108 : no210 port map( A => n76, B => n90, Y => n56);
   U109 : na210 port map( A => n78, B => n91, Y => n55);
   U110 : na210 port map( A => reg_set, B => n90, Y => n91);
   U111 : iv110 port map( A => reg_write(6), Y => n90);
   U112 : mu111 port map( A => output_7_port, B => output_6_port, S => enable, 
                           Y => n54);
   U113 : no210 port map( A => n76, B => n92, Y => n53);
   U114 : na210 port map( A => reg_set, B => n78, Y => n76);
   U115 : na210 port map( A => n78, B => n93, Y => n52);
   U116 : na210 port map( A => reg_set, B => n92, Y => n93);
   U117 : iv110 port map( A => reg_write(7), Y => n92);
   U118 : iv110 port map( A => reset, Y => n78);
   n94 <= '0';
   n95 <= '0';
   n96 <= '0';
   n97 <= '0';
   n98 <= '0';
   n99 <= '0';
   n100 <= '0';
   n101 <= '0';
   n102 <= '0';
   n103 <= '0';
   n104 <= '0';
   n105 <= '0';
   n106 <= '0';
   n107 <= '0';
   n108 <= '0';
   n109 <= '0';

end synthesised;

-- This is the basic technology-independent flip-flop.
-- All flip-flops and latches are written in terms of this.

library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;
entity SYNOP_BASIC_FF is

   port(next_state, clocked_on, force_00, force_01, force_10, force_11: in 
         std_logic;
         Q, QN: out std_logic);

end SYNOP_BASIC_FF;

architecture RTL of SYNOP_BASIC_FF is
   signal t_q: std_logic;
begin
   process ( force_00, force_01, force_10, force_11, clocked_on )
   begin
      if ( force_00 = '1' or force_01 = '1' ) then
         t_q <= '0';
      elsif ( force_10 = '1' or force_11 = '1' ) then
         t_q <= '1';
      elsif ( clocked_on'event and clocked_on = '1' ) then
         t_q <= next_state;
      end if;
   end process;
   
   process ( t_q, force_00, force_11 )
   begin
      Q <= t_q;
      if ( force_00 = '1' or force_11 = '1' ) then
         QN <= t_q;
      else
         QN <= not t_q;
      end if;
   end process;
end RTL;
