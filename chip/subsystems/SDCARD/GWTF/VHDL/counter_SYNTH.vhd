
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of counter is

   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal count_out_3_port, count_out_2_port, count_out_1_port, 
      count_out_0_port, N2, N3, N4, n2_port, n5, n6, n7 : std_logic;

begin
   count_out <= ( count_out_3_port, count_out_2_port, count_out_1_port, 
      count_out_0_port );
   
   count_reg_0_inst : dfa11 port map( D => n2_port, CK => clk, R => reset, Q =>
                           count_out_0_port);
   count_reg_1_inst : dfa11 port map( D => N2, CK => clk, R => reset, Q => 
                           count_out_1_port);
   count_reg_2_inst : dfa11 port map( D => N3, CK => clk, R => reset, Q => 
                           count_out_2_port);
   count_reg_3_inst : dfa11 port map( D => N4, CK => clk, R => reset, Q => 
                           count_out_3_port);
   U10 : iv110 port map( A => count_out_0_port, Y => n2_port);
   U11 : ex210 port map( A => count_out_3_port, B => n5, Y => N4);
   U12 : no210 port map( A => n6, B => n7, Y => n5);
   U13 : ex210 port map( A => n7, B => n6, Y => N3);
   U14 : na210 port map( A => count_out_1_port, B => count_out_0_port, Y => n6)
                           ;
   U15 : iv110 port map( A => count_out_2_port, Y => n7);
   U16 : ex210 port map( A => count_out_1_port, B => count_out_0_port, Y => N2)
                           ;

end synthesised;



