
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of cpu is

   component buf40
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component reg_cluster
      port( reg_in : in std_logic_vector (7 downto 0);  reg_clk, reg_rst : in 
            std_logic;  reg_select, buf_select : in std_logic_vector (4 downto 
            0);  buf_in : in std_logic_vector (7 downto 0);  buf_out, reg_out :
            out std_logic_vector (7 downto 0));
   end component;
   
   component buf_a
      port( buf_in : in std_logic_vector (7 downto 0);  buf_oe : in std_logic; 
            buf_out : out std_logic_vector (7 downto 0));
   end component;
   
   component reg_a
      port( reg_in : in std_logic_vector (7 downto 0);  reg_clk, reg_rst, 
            reg_ld : in std_logic;  reg_out : out std_logic_vector (7 downto 0)
            );
   end component;
   
   component alu
      port( alu_A, alu_B : in std_logic_vector (7 downto 0);  opcode : in 
            std_logic_vector (2 downto 0);  alu_clk : in std_logic;  alu_c, 
            alu_z : out std_logic;  alu_y : out std_logic_vector (7 downto 0));
   end component;
   
   component pc_counter
      port( pc_in : in std_logic_vector (7 downto 0);  pc_inc, pc_ld, pc_rst, 
            pc_clk : in std_logic;  pc_out : out std_logic_vector (7 downto 0)
            );
   end component;
   
   component buf_arg
      port( buf_in : in std_logic_vector (7 downto 0);  buf_oe : in std_logic; 
            buf_out : out std_logic_vector (7 downto 0));
   end component;
   
   component decoder
      port( decoder_in : in std_logic_vector (11 downto 0);  decoder_c, 
            decoder_z : in std_logic;  decoder_pc_inc, decoder_pc_ld, 
            decoder_ibufoe, decoder_aregld, decoder_abufoe : out std_logic;  
            decoder_bregld, decoder_bbufoe : out std_logic_vector (4 downto 0);
            decoder_alu : out std_logic_vector (2 downto 0);  decoder_argout : 
            out std_logic_vector (7 downto 0));
   end component;
   
   component instr_buf
      port( buf_in : in std_logic_vector (11 downto 0);  buf_oe : in std_logic;
            buf_out : out std_logic_vector (11 downto 0));
   end component;
   
   signal cpu_test_inc_port, cpu_test_ld_port, cpu_test_data_7_port, 
      cpu_test_data_6_port, cpu_test_data_5_port, cpu_test_data_4_port, 
      cpu_test_data_3_port, cpu_test_data_2_port, cpu_test_data_1_port, 
      cpu_test_data_0_port, cpu_alu_c, cpu_alu_z, cpu_dec_ibufoe, 
      cpu_dec_aregld, cpu_dec_abufoe, cpu_dec_bregld_4_port, 
      cpu_dec_bregld_3_port, cpu_dec_bregld_2_port, cpu_dec_bregld_1_port, 
      cpu_dec_bregld_0_port, cpu_dec_bbufoe_4_port, cpu_dec_bbufoe_3_port, 
      cpu_dec_bbufoe_2_port, cpu_dec_bbufoe_1_port, cpu_dec_bbufoe_0_port, 
      cpu_alu_op_2_port, cpu_alu_op_1_port, cpu_alu_op_0_port, cpu_dec_o_7_port
      , cpu_dec_o_6_port, cpu_dec_o_5_port, cpu_dec_o_4_port, cpu_dec_o_3_port,
      cpu_dec_o_2_port, cpu_dec_o_1_port, cpu_dec_o_0_port, cpu_areg_out_7_port
      , cpu_areg_out_6_port, cpu_areg_out_5_port, cpu_areg_out_4_port, 
      cpu_areg_out_3_port, cpu_areg_out_2_port, cpu_areg_out_1_port, 
      cpu_areg_out_0_port, cpu_alu_out_7_port, cpu_alu_out_6_port, 
      cpu_alu_out_5_port, cpu_alu_out_4_port, cpu_alu_out_3_port, 
      cpu_alu_out_2_port, cpu_alu_out_1_port, cpu_alu_out_0_port, n1, n2, n3, 
      n4, n5, n6, n7, n8, n9, n10, n11, n12, n_1000, n_1001, n_1002, n_1003, 
      n_1004, n_1005, n_1006, n_1007, n_1008, n_1009, n_1010, n_1011 : 
      std_logic;

begin
   cpu_test_inc <= cpu_test_inc_port;
   cpu_test_ld <= cpu_test_ld_port;
   cpu_test_data <= ( cpu_test_data_7_port, cpu_test_data_6_port, 
      cpu_test_data_5_port, cpu_test_data_4_port, cpu_test_data_3_port, 
      cpu_test_data_2_port, cpu_test_data_1_port, cpu_test_data_0_port );
   
   lbl_instrbuf : instr_buf port map( buf_in(11) => cpu_instr(11), buf_in(10) 
                           => cpu_instr(10), buf_in(9) => cpu_instr(9), 
                           buf_in(8) => cpu_instr(8), buf_in(7) => cpu_instr(7)
                           , buf_in(6) => cpu_instr(6), buf_in(5) => 
                           cpu_instr(5), buf_in(4) => cpu_instr(4), buf_in(3) 
                           => cpu_instr(3), buf_in(2) => cpu_instr(2), 
                           buf_in(1) => cpu_instr(1), buf_in(0) => cpu_instr(0)
                           , buf_oe => cpu_en, buf_out(11) => n_1000, 
                           buf_out(10) => n_1001, buf_out(9) => n_1002, 
                           buf_out(8) => n_1003, buf_out(7) => n_1004, 
                           buf_out(6) => n_1005, buf_out(5) => n_1006, 
                           buf_out(4) => n_1007, buf_out(3) => n_1008, 
                           buf_out(2) => n_1009, buf_out(1) => n_1010, 
                           buf_out(0) => n_1011);
   lbl_decoder : decoder port map( decoder_in(11) => cpu_instr(11), 
                           decoder_in(10) => cpu_instr(10), decoder_in(9) => 
                           cpu_instr(9), decoder_in(8) => cpu_instr(8), 
                           decoder_in(7) => cpu_instr(7), decoder_in(6) => 
                           cpu_instr(6), decoder_in(5) => cpu_instr(5), 
                           decoder_in(4) => cpu_instr(4), decoder_in(3) => 
                           cpu_instr(3), decoder_in(2) => cpu_instr(2), 
                           decoder_in(1) => cpu_instr(1), decoder_in(0) => 
                           cpu_instr(0), decoder_c => cpu_alu_c, decoder_z => 
                           cpu_alu_z, decoder_pc_inc => cpu_test_inc_port, 
                           decoder_pc_ld => cpu_test_ld_port, decoder_ibufoe =>
                           cpu_dec_ibufoe, decoder_aregld => cpu_dec_aregld, 
                           decoder_abufoe => cpu_dec_abufoe, decoder_bregld(4) 
                           => cpu_dec_bregld_4_port, decoder_bregld(3) => 
                           cpu_dec_bregld_3_port, decoder_bregld(2) => 
                           cpu_dec_bregld_2_port, decoder_bregld(1) => 
                           cpu_dec_bregld_1_port, decoder_bregld(0) => 
                           cpu_dec_bregld_0_port, decoder_bbufoe(4) => 
                           cpu_dec_bbufoe_4_port, decoder_bbufoe(3) => 
                           cpu_dec_bbufoe_3_port, decoder_bbufoe(2) => 
                           cpu_dec_bbufoe_2_port, decoder_bbufoe(1) => 
                           cpu_dec_bbufoe_1_port, decoder_bbufoe(0) => 
                           cpu_dec_bbufoe_0_port, decoder_alu(2) => 
                           cpu_alu_op_2_port, decoder_alu(1) => 
                           cpu_alu_op_1_port, decoder_alu(0) => 
                           cpu_alu_op_0_port, decoder_argout(7) => 
                           cpu_dec_o_7_port, decoder_argout(6) => 
                           cpu_dec_o_6_port, decoder_argout(5) => 
                           cpu_dec_o_5_port, decoder_argout(4) => 
                           cpu_dec_o_4_port, decoder_argout(3) => 
                           cpu_dec_o_3_port, decoder_argout(2) => 
                           cpu_dec_o_2_port, decoder_argout(1) => 
                           cpu_dec_o_1_port, decoder_argout(0) => 
                           cpu_dec_o_0_port);
   lbl_cpu_ibuf : buf_arg port map( buf_in(7) => cpu_dec_o_7_port, buf_in(6) =>
                           cpu_dec_o_6_port, buf_in(5) => cpu_dec_o_5_port, 
                           buf_in(4) => cpu_dec_o_4_port, buf_in(3) => 
                           cpu_dec_o_3_port, buf_in(2) => cpu_dec_o_2_port, 
                           buf_in(1) => cpu_dec_o_1_port, buf_in(0) => 
                           cpu_dec_o_0_port, buf_oe => cpu_dec_ibufoe, 
                           buf_out(7) => cpu_test_data_7_port, buf_out(6) => 
                           cpu_test_data_6_port, buf_out(5) => 
                           cpu_test_data_5_port, buf_out(4) => 
                           cpu_test_data_4_port, buf_out(3) => 
                           cpu_test_data_3_port, buf_out(2) => 
                           cpu_test_data_2_port, buf_out(1) => 
                           cpu_test_data_1_port, buf_out(0) => 
                           cpu_test_data_0_port);
   lbl_cpu_pc : pc_counter port map( pc_in(7) => cpu_test_data_7_port, pc_in(6)
                           => cpu_test_data_6_port, pc_in(5) => 
                           cpu_test_data_5_port, pc_in(4) => 
                           cpu_test_data_4_port, pc_in(3) => 
                           cpu_test_data_3_port, pc_in(2) => 
                           cpu_test_data_2_port, pc_in(1) => 
                           cpu_test_data_1_port, pc_in(0) => 
                           cpu_test_data_0_port, pc_inc => cpu_test_inc_port, 
                           pc_ld => cpu_test_ld_port, pc_rst => cpu_rst, pc_clk
                           => cpu_clk, pc_out(7) => cpu_pc(7), pc_out(6) => 
                           cpu_pc(6), pc_out(5) => cpu_pc(5), pc_out(4) => 
                           cpu_pc(4), pc_out(3) => cpu_pc(3), pc_out(2) => 
                           cpu_pc(2), pc_out(1) => cpu_pc(1), pc_out(0) => 
                           cpu_pc(0));
   lbl_cpu_alu : alu port map( alu_A(7) => cpu_test_data_7_port, alu_A(6) => 
                           cpu_test_data_6_port, alu_A(5) => 
                           cpu_test_data_5_port, alu_A(4) => 
                           cpu_test_data_4_port, alu_A(3) => 
                           cpu_test_data_3_port, alu_A(2) => 
                           cpu_test_data_2_port, alu_A(1) => 
                           cpu_test_data_1_port, alu_A(0) => 
                           cpu_test_data_0_port, alu_B(7) => 
                           cpu_areg_out_7_port, alu_B(6) => cpu_areg_out_6_port
                           , alu_B(5) => cpu_areg_out_5_port, alu_B(4) => 
                           cpu_areg_out_4_port, alu_B(3) => cpu_areg_out_3_port
                           , alu_B(2) => cpu_areg_out_2_port, alu_B(1) => 
                           cpu_areg_out_1_port, alu_B(0) => cpu_areg_out_0_port
                           , opcode(2) => cpu_alu_op_2_port, opcode(1) => 
                           cpu_alu_op_1_port, opcode(0) => cpu_alu_op_0_port, 
                           alu_clk => cpu_clk, alu_c => cpu_alu_c, alu_z => 
                           cpu_alu_z, alu_y(7) => cpu_alu_out_7_port, alu_y(6) 
                           => cpu_alu_out_6_port, alu_y(5) => 
                           cpu_alu_out_5_port, alu_y(4) => cpu_alu_out_4_port, 
                           alu_y(3) => cpu_alu_out_3_port, alu_y(2) => 
                           cpu_alu_out_2_port, alu_y(1) => cpu_alu_out_1_port, 
                           alu_y(0) => cpu_alu_out_0_port);
   lbl_cpu_reg_A : reg_a port map( reg_in(7) => cpu_alu_out_7_port, reg_in(6) 
                           => cpu_alu_out_6_port, reg_in(5) => 
                           cpu_alu_out_5_port, reg_in(4) => cpu_alu_out_4_port,
                           reg_in(3) => cpu_alu_out_3_port, reg_in(2) => 
                           cpu_alu_out_2_port, reg_in(1) => cpu_alu_out_1_port,
                           reg_in(0) => cpu_alu_out_0_port, reg_clk => cpu_clk,
                           reg_rst => cpu_rst, reg_ld => cpu_dec_aregld, 
                           reg_out(7) => cpu_areg_out_7_port, reg_out(6) => 
                           cpu_areg_out_6_port, reg_out(5) => 
                           cpu_areg_out_5_port, reg_out(4) => 
                           cpu_areg_out_4_port, reg_out(3) => 
                           cpu_areg_out_3_port, reg_out(2) => 
                           cpu_areg_out_2_port, reg_out(1) => 
                           cpu_areg_out_1_port, reg_out(0) => 
                           cpu_areg_out_0_port);
   lbl_cpu_buf_A : buf_a port map( buf_in(7) => cpu_areg_out_7_port, buf_in(6) 
                           => cpu_areg_out_6_port, buf_in(5) => 
                           cpu_areg_out_5_port, buf_in(4) => 
                           cpu_areg_out_4_port, buf_in(3) => 
                           cpu_areg_out_3_port, buf_in(2) => 
                           cpu_areg_out_2_port, buf_in(1) => 
                           cpu_areg_out_1_port, buf_in(0) => 
                           cpu_areg_out_0_port, buf_oe => n4, buf_out(7) => 
                           cpu_test_data_7_port, buf_out(6) => 
                           cpu_test_data_6_port, buf_out(5) => 
                           cpu_test_data_5_port, buf_out(4) => 
                           cpu_test_data_4_port, buf_out(3) => 
                           cpu_test_data_3_port, buf_out(2) => 
                           cpu_test_data_2_port, buf_out(1) => 
                           cpu_test_data_1_port, buf_out(0) => 
                           cpu_test_data_0_port);
   lbl_bregs : reg_cluster port map( reg_in(7) => n7, reg_in(6) => n12, 
                           reg_in(5) => n6, reg_in(4) => n11, reg_in(3) => n5, 
                           reg_in(2) => n10, reg_in(1) => n9, reg_in(0) => n8, 
                           reg_clk => cpu_clk, reg_rst => cpu_rst, 
                           reg_select(4) => n2, reg_select(3) => 
                           cpu_dec_bregld_3_port, reg_select(2) => 
                           cpu_dec_bregld_2_port, reg_select(1) => 
                           cpu_dec_bregld_1_port, reg_select(0) => 
                           cpu_dec_bregld_0_port, buf_select(4) => n1, 
                           buf_select(3) => cpu_dec_bbufoe_3_port, 
                           buf_select(2) => cpu_dec_bbufoe_2_port, 
                           buf_select(1) => cpu_dec_bbufoe_1_port, 
                           buf_select(0) => cpu_dec_bbufoe_0_port, buf_in(7) =>
                           cpu_in(7), buf_in(6) => cpu_in(6), buf_in(5) => 
                           cpu_in(5), buf_in(4) => cpu_in(4), buf_in(3) => 
                           cpu_in(3), buf_in(2) => cpu_in(2), buf_in(1) => 
                           cpu_in(1), buf_in(0) => cpu_in(0), buf_out(7) => 
                           cpu_test_data_7_port, buf_out(6) => 
                           cpu_test_data_6_port, buf_out(5) => 
                           cpu_test_data_5_port, buf_out(4) => 
                           cpu_test_data_4_port, buf_out(3) => 
                           cpu_test_data_3_port, buf_out(2) => 
                           cpu_test_data_2_port, buf_out(1) => 
                           cpu_test_data_1_port, buf_out(0) => 
                           cpu_test_data_0_port, reg_out(7) => cpu_out(7), 
                           reg_out(6) => cpu_out(6), reg_out(5) => cpu_out(5), 
                           reg_out(4) => cpu_out(4), reg_out(3) => cpu_out(3), 
                           reg_out(2) => cpu_out(2), reg_out(1) => cpu_out(1), 
                           reg_out(0) => cpu_out(0));
   U1 : buf40 port map( A => cpu_dec_bbufoe_4_port, Y => n1);
   U2 : buf40 port map( A => cpu_dec_bregld_4_port, Y => n2);
   U3 : iv110 port map( A => cpu_dec_abufoe, Y => n3);
   U4 : iv110 port map( A => n3, Y => n4);
   U5 : buf40 port map( A => cpu_test_data_3_port, Y => n5);
   U6 : buf40 port map( A => cpu_test_data_5_port, Y => n6);
   U7 : buf40 port map( A => cpu_test_data_7_port, Y => n7);
   U8 : buf40 port map( A => cpu_test_data_0_port, Y => n8);
   U9 : buf40 port map( A => cpu_test_data_1_port, Y => n9);
   U10 : buf40 port map( A => cpu_test_data_2_port, Y => n10);
   U11 : buf40 port map( A => cpu_test_data_4_port, Y => n11);
   U12 : buf40 port map( A => cpu_test_data_6_port, Y => n12);

end synthesised;



