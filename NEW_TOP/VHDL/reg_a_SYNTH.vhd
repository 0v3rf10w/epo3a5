
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of reg_a is

   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal reg_out_7_port, reg_out_6_port, reg_out_5_port, reg_out_4_port, 
      reg_out_3_port, reg_out_2_port, reg_out_1_port, reg_out_0_port, n18, n19,
      n20, n21, n22, n23, n24, n25 : std_logic;

begin
   reg_out <= ( reg_out_7_port, reg_out_6_port, reg_out_5_port, reg_out_4_port,
      reg_out_3_port, reg_out_2_port, reg_out_1_port, reg_out_0_port );
   
   reg_out_reg_7_inst : dfa11 port map( D => n25, CK => reg_clk, R => reg_rst, 
                           Q => reg_out_7_port);
   reg_out_reg_6_inst : dfa11 port map( D => n24, CK => reg_clk, R => reg_rst, 
                           Q => reg_out_6_port);
   reg_out_reg_5_inst : dfa11 port map( D => n23, CK => reg_clk, R => reg_rst, 
                           Q => reg_out_5_port);
   reg_out_reg_4_inst : dfa11 port map( D => n22, CK => reg_clk, R => reg_rst, 
                           Q => reg_out_4_port);
   reg_out_reg_3_inst : dfa11 port map( D => n21, CK => reg_clk, R => reg_rst, 
                           Q => reg_out_3_port);
   reg_out_reg_2_inst : dfa11 port map( D => n20, CK => reg_clk, R => reg_rst, 
                           Q => reg_out_2_port);
   reg_out_reg_1_inst : dfa11 port map( D => n19, CK => reg_clk, R => reg_rst, 
                           Q => reg_out_1_port);
   reg_out_reg_0_inst : dfa11 port map( D => n18, CK => reg_clk, R => reg_rst, 
                           Q => reg_out_0_port);
   U27 : mu111 port map( A => reg_out_7_port, B => reg_in(7), S => reg_ld, Y =>
                           n25);
   U28 : mu111 port map( A => reg_out_6_port, B => reg_in(6), S => reg_ld, Y =>
                           n24);
   U29 : mu111 port map( A => reg_out_5_port, B => reg_in(5), S => reg_ld, Y =>
                           n23);
   U30 : mu111 port map( A => reg_out_4_port, B => reg_in(4), S => reg_ld, Y =>
                           n22);
   U31 : mu111 port map( A => reg_out_3_port, B => reg_in(3), S => reg_ld, Y =>
                           n21);
   U32 : mu111 port map( A => reg_out_2_port, B => reg_in(2), S => reg_ld, Y =>
                           n20);
   U33 : mu111 port map( A => reg_out_1_port, B => reg_in(1), S => reg_ld, Y =>
                           n19);
   U34 : mu111 port map( A => reg_out_0_port, B => reg_in(0), S => reg_ld, Y =>
                           n18);

end synthesised;



