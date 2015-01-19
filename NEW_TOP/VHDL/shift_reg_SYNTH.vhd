
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of shift_reg is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal output_7_port, output_6_port, output_5_port, output_4_port, 
      output_3_port, output_2_port, output_1_port, output_0_port, n1 : 
      std_logic;

begin
   output <= ( output_7_port, output_6_port, output_5_port, output_4_port, 
      output_3_port, output_2_port, output_1_port, output_0_port );
   
   reg_shift_reg_0_inst : dfa11 port map( D => shift_in, CK => n1, R => reset, 
                           Q => output_0_port);
   reg_shift_reg_1_inst : dfa11 port map( D => output_0_port, CK => n1, R => 
                           reset, Q => output_1_port);
   reg_shift_reg_2_inst : dfa11 port map( D => output_1_port, CK => n1, R => 
                           reset, Q => output_2_port);
   reg_shift_reg_3_inst : dfa11 port map( D => output_2_port, CK => n1, R => 
                           reset, Q => output_3_port);
   reg_shift_reg_4_inst : dfa11 port map( D => output_3_port, CK => n1, R => 
                           reset, Q => output_4_port);
   reg_shift_reg_5_inst : dfa11 port map( D => output_4_port, CK => n1, R => 
                           reset, Q => output_5_port);
   reg_shift_reg_6_inst : dfa11 port map( D => output_5_port, CK => n1, R => 
                           reset, Q => output_6_port);
   reg_shift_reg_7_inst : dfa11 port map( D => output_6_port, CK => n1, R => 
                           reset, Q => output_7_port);
   U4 : iv110 port map( A => clk, Y => n1);

end synthesised;



