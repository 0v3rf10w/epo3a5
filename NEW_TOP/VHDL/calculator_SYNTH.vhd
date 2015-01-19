
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of calculator is

   component buf40
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component shift_reg
      port( clk, reset, shift_in : in std_logic;  output : out std_logic_vector
            (7 downto 0));
   end component;
   
   component rom
      port( rom_a : in std_logic_vector (7 downto 0);  rom_d : out 
            std_logic_vector (11 downto 0));
   end component;
   
   component gate
      port( input : in std_logic;  output : out std_logic;  sw : in std_logic);
   end component;
   
   component cpu
      port( cpu_rst, cpu_en : in std_logic;  cpu_in : in std_logic_vector (7 
            downto 0);  cpu_instr : in std_logic_vector (11 downto 0);  cpu_pc,
            cpu_out : out std_logic_vector (7 downto 0));
   end component;
   
   component osc10
      port( E, XI : in std_logic;  XO : inout std_logic;  F : out std_logic);
   end component;
   
   signal X_Logic1_port, osc_clk, cpu_enable, cpu_input_7_port, 
      cpu_input_6_port, cpu_input_5_port, cpu_input_4_port, cpu_input_3_port, 
      cpu_input_2_port, cpu_input_1_port, cpu_input_0_port, cpu_instr_11_port, 
      cpu_instr_10_port, cpu_instr_9_port, cpu_instr_8_port, cpu_instr_7_port, 
      cpu_instr_6_port, cpu_instr_5_port, cpu_instr_4_port, cpu_instr_3_port, 
      cpu_instr_2_port, cpu_instr_1_port, cpu_instr_0_port, cpu_addr_7_port, 
      cpu_addr_6_port, cpu_addr_5_port, cpu_addr_4_port, cpu_addr_3_port, 
      cpu_addr_2_port, cpu_addr_1_port, cpu_addr_0_port, n1, n2, n3, n4, n5, n6
      , n7, n8, n9 : std_logic;

begin
   
   lbl_osc : osc10 port map( E => X_Logic1_port, XI => XI, XO => XO, F => 
                           osc_clk);
   lbl_cpu : cpu port map( cpu_rst => top_reset, cpu_en => n9, cpu_in(7) => 
                           cpu_input_7_port, cpu_in(6) => cpu_input_6_port, 
                           cpu_in(5) => cpu_input_5_port, cpu_in(4) => 
                           cpu_input_4_port, cpu_in(3) => cpu_input_3_port, 
                           cpu_in(2) => cpu_input_2_port, cpu_in(1) => 
                           cpu_input_1_port, cpu_in(0) => cpu_input_0_port, 
                           cpu_instr(11) => n1, cpu_instr(10) => n2, 
                           cpu_instr(9) => n3, cpu_instr(8) => n8, cpu_instr(7)
                           => cpu_instr_7_port, cpu_instr(6) => 
                           cpu_instr_6_port, cpu_instr(5) => cpu_instr_5_port, 
                           cpu_instr(4) => cpu_instr_4_port, cpu_instr(3) => n7
                           , cpu_instr(2) => n6, cpu_instr(1) => n5, 
                           cpu_instr(0) => n4, cpu_pc(7) => cpu_addr_7_port, 
                           cpu_pc(6) => cpu_addr_6_port, cpu_pc(5) => 
                           cpu_addr_5_port, cpu_pc(4) => cpu_addr_4_port, 
                           cpu_pc(3) => cpu_addr_3_port, cpu_pc(2) => 
                           cpu_addr_2_port, cpu_pc(1) => cpu_addr_1_port, 
                           cpu_pc(0) => cpu_addr_0_port, cpu_out(7) => 
                           top_out(7), cpu_out(6) => top_out(6), cpu_out(5) => 
                           top_out(5), cpu_out(4) => top_out(4), cpu_out(3) => 
                           top_out(3), cpu_out(2) => top_out(2), cpu_out(1) => 
                           top_out(1), cpu_out(0) => top_out(0));
   lbl_gate : gate port map( input => osc_clk, output => cpu_enable, sw => 
                           top_ss);
   lbl_rom : rom port map( rom_a(7) => cpu_addr_7_port, rom_a(6) => 
                           cpu_addr_6_port, rom_a(5) => cpu_addr_5_port, 
                           rom_a(4) => cpu_addr_4_port, rom_a(3) => 
                           cpu_addr_3_port, rom_a(2) => cpu_addr_2_port, 
                           rom_a(1) => cpu_addr_1_port, rom_a(0) => 
                           cpu_addr_0_port, rom_d(11) => cpu_instr_11_port, 
                           rom_d(10) => cpu_instr_10_port, rom_d(9) => 
                           cpu_instr_9_port, rom_d(8) => cpu_instr_8_port, 
                           rom_d(7) => cpu_instr_7_port, rom_d(6) => 
                           cpu_instr_6_port, rom_d(5) => cpu_instr_5_port, 
                           rom_d(4) => cpu_instr_4_port, rom_d(3) => 
                           cpu_instr_3_port, rom_d(2) => cpu_instr_2_port, 
                           rom_d(1) => cpu_instr_1_port, rom_d(0) => 
                           cpu_instr_0_port);
   lbl_shift : shift_reg port map( clk => top_sclk, reset => top_reset, 
                           shift_in => top_mosi, output(7) => cpu_input_7_port,
                           output(6) => cpu_input_6_port, output(5) => 
                           cpu_input_5_port, output(4) => cpu_input_4_port, 
                           output(3) => cpu_input_3_port, output(2) => 
                           cpu_input_2_port, output(1) => cpu_input_1_port, 
                           output(0) => cpu_input_0_port);
   X_Logic1_port <= '1';
   U2 : buf40 port map( A => cpu_instr_11_port, Y => n1);
   U3 : buf40 port map( A => cpu_instr_10_port, Y => n2);
   U4 : buf40 port map( A => cpu_instr_9_port, Y => n3);
   U5 : buf40 port map( A => cpu_instr_0_port, Y => n4);
   U6 : buf40 port map( A => cpu_instr_1_port, Y => n5);
   U7 : buf40 port map( A => cpu_instr_2_port, Y => n6);
   U8 : buf40 port map( A => cpu_instr_3_port, Y => n7);
   U9 : buf40 port map( A => cpu_instr_8_port, Y => n8);
   U10 : buf40 port map( A => cpu_enable, Y => n9);

end synthesised;



