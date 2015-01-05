
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of reg_7 is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal reg_out_7_port, reg_out_6_port, reg_out_5_port, reg_out_4_port, 
      reg_out_3_port, reg_out_2_port, reg_out_1_port, reg_out_0_port, n22, n23,
      n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34 : std_logic;

begin
   reg_out <= ( reg_out_7_port, reg_out_6_port, reg_out_5_port, reg_out_4_port,
      reg_out_3_port, reg_out_2_port, reg_out_1_port, reg_out_0_port );
   
   reg_out_reg_7_inst : dfa11 port map( D => n29, CK => reg_clk, R => reg_rst, 
                           Q => reg_out_7_port);
   reg_out_reg_6_inst : dfa11 port map( D => n28, CK => reg_clk, R => reg_rst, 
                           Q => reg_out_6_port);
   reg_out_reg_5_inst : dfa11 port map( D => n27, CK => reg_clk, R => reg_rst, 
                           Q => reg_out_5_port);
   reg_out_reg_4_inst : dfa11 port map( D => n26, CK => reg_clk, R => reg_rst, 
                           Q => reg_out_4_port);
   reg_out_reg_3_inst : dfa11 port map( D => n25, CK => reg_clk, R => reg_rst, 
                           Q => reg_out_3_port);
   reg_out_reg_2_inst : dfa11 port map( D => n24, CK => reg_clk, R => reg_rst, 
                           Q => reg_out_2_port);
   reg_out_reg_1_inst : dfa11 port map( D => n23, CK => reg_clk, R => reg_rst, 
                           Q => reg_out_1_port);
   reg_out_reg_0_inst : dfa11 port map( D => n22, CK => reg_clk, R => reg_rst, 
                           Q => reg_out_0_port);
   U31 : na310 port map( A => reg_ld(4), B => reg_ld(2), C => n32, Y => n30);
   U32 : mu111 port map( A => reg_in(7), B => reg_out_7_port, S => n30, Y => 
                           n29);
   U33 : mu111 port map( A => reg_in(6), B => reg_out_6_port, S => n31, Y => 
                           n28);
   U34 : mu111 port map( A => reg_in(5), B => reg_out_5_port, S => n30, Y => 
                           n27);
   U35 : mu111 port map( A => reg_in(4), B => reg_out_4_port, S => n31, Y => 
                           n26);
   U36 : mu111 port map( A => reg_in(3), B => reg_out_3_port, S => n30, Y => 
                           n25);
   U37 : mu111 port map( A => reg_in(2), B => reg_out_2_port, S => n31, Y => 
                           n24);
   U38 : mu111 port map( A => reg_in(1), B => reg_out_1_port, S => n30, Y => 
                           n23);
   U39 : mu111 port map( A => reg_in(0), B => reg_out_0_port, S => n31, Y => 
                           n22);
   U40 : na310 port map( A => reg_ld(4), B => reg_ld(2), C => n32, Y => n31);
   U41 : no310 port map( A => n33, B => reg_ld(3), C => n34, Y => n32);
   U42 : iv110 port map( A => reg_ld(0), Y => n34);
   U43 : iv110 port map( A => reg_ld(1), Y => n33);

end synthesised;



