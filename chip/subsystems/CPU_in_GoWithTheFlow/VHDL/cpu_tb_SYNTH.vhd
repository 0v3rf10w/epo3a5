
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of cpu_tb is

   component cpu
      port( cpu_clk, cpu_rst, cpu_en : in std_logic;  cpu_in : in 
            std_logic_vector (7 downto 0);  cpu_instr : in std_logic_vector (11
            downto 0);  cpu_pc, cpu_out : out std_logic_vector (7 downto 0);  
            cpu_test_inc, cpu_test_ld : out std_logic;  cpu_test_data : out 
            std_logic_vector (7 downto 0));
   end component;
   
   signal X_Logic1_port, X_Logic0_port, n_1000, n_1001, n_1002, n_1003, n_1004,
      n_1005, n_1006, n_1007, n_1008, n_1009, n_1010, n_1011, n_1012, n_1013, 
      n_1014, n_1015, n_1016, n_1017, n_1018, n_1019, n_1020, n_1021, n_1022, 
      n_1023, n_1024, n_1025 : std_logic;

begin
   
   lbl1 : cpu port map( cpu_clk => X_Logic1_port, cpu_rst => X_Logic1_port, 
                           cpu_en => X_Logic0_port, cpu_in(7) => X_Logic0_port,
                           cpu_in(6) => X_Logic0_port, cpu_in(5) => 
                           X_Logic0_port, cpu_in(4) => X_Logic0_port, cpu_in(3)
                           => X_Logic0_port, cpu_in(2) => X_Logic0_port, 
                           cpu_in(1) => X_Logic0_port, cpu_in(0) => 
                           X_Logic0_port, cpu_instr(11) => X_Logic0_port, 
                           cpu_instr(10) => X_Logic0_port, cpu_instr(9) => 
                           X_Logic0_port, cpu_instr(8) => X_Logic0_port, 
                           cpu_instr(7) => X_Logic0_port, cpu_instr(6) => 
                           X_Logic0_port, cpu_instr(5) => X_Logic0_port, 
                           cpu_instr(4) => X_Logic0_port, cpu_instr(3) => 
                           X_Logic0_port, cpu_instr(2) => X_Logic0_port, 
                           cpu_instr(1) => X_Logic0_port, cpu_instr(0) => 
                           X_Logic0_port, cpu_pc(7) => n_1000, cpu_pc(6) => 
                           n_1001, cpu_pc(5) => n_1002, cpu_pc(4) => n_1003, 
                           cpu_pc(3) => n_1004, cpu_pc(2) => n_1005, cpu_pc(1) 
                           => n_1006, cpu_pc(0) => n_1007, cpu_out(7) => n_1008
                           , cpu_out(6) => n_1009, cpu_out(5) => n_1010, 
                           cpu_out(4) => n_1011, cpu_out(3) => n_1012, 
                           cpu_out(2) => n_1013, cpu_out(1) => n_1014, 
                           cpu_out(0) => n_1015, cpu_test_inc => n_1016, 
                           cpu_test_ld => n_1017, cpu_test_data(7) => n_1018, 
                           cpu_test_data(6) => n_1019, cpu_test_data(5) => 
                           n_1020, cpu_test_data(4) => n_1021, cpu_test_data(3)
                           => n_1022, cpu_test_data(2) => n_1023, 
                           cpu_test_data(1) => n_1024, cpu_test_data(0) => 
                           n_1025);
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';

end synthesised;



