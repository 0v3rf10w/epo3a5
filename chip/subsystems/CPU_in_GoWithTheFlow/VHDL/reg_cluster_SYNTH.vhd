
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of reg_cluster is

   component buf_10
      port( buf_in : in std_logic_vector (7 downto 0);  buf_oe : in 
            std_logic_vector (4 downto 0);  buf_out : out std_logic_vector (7 
            downto 0));
   end component;
   
   component buf_9
      port( buf_in : in std_logic_vector (7 downto 0);  buf_oe : in 
            std_logic_vector (4 downto 0);  buf_out : out std_logic_vector (7 
            downto 0));
   end component;
   
   component buf_8
      port( buf_in : in std_logic_vector (7 downto 0);  buf_oe : in 
            std_logic_vector (4 downto 0);  buf_out : out std_logic_vector (7 
            downto 0));
   end component;
   
   component buf_7
      port( buf_in : in std_logic_vector (7 downto 0);  buf_oe : in 
            std_logic_vector (4 downto 0);  buf_out : out std_logic_vector (7 
            downto 0));
   end component;
   
   component buf_6
      port( buf_in : in std_logic_vector (7 downto 0);  buf_oe : in 
            std_logic_vector (4 downto 0);  buf_out : out std_logic_vector (7 
            downto 0));
   end component;
   
   component buf_5
      port( buf_in : in std_logic_vector (7 downto 0);  buf_oe : in 
            std_logic_vector (4 downto 0);  buf_out : out std_logic_vector (7 
            downto 0));
   end component;
   
   component buf_4
      port( buf_in : in std_logic_vector (7 downto 0);  buf_oe : in 
            std_logic_vector (4 downto 0);  buf_out : out std_logic_vector (7 
            downto 0));
   end component;
   
   component buf_3
      port( buf_in : in std_logic_vector (7 downto 0);  buf_oe : in 
            std_logic_vector (4 downto 0);  buf_out : out std_logic_vector (7 
            downto 0));
   end component;
   
   component buf_2
      port( buf_in : in std_logic_vector (7 downto 0);  buf_oe : in 
            std_logic_vector (4 downto 0);  buf_out : out std_logic_vector (7 
            downto 0));
   end component;
   
   component buf_i
      port( buf_in : in std_logic_vector (7 downto 0);  buf_oe : in 
            std_logic_vector (4 downto 0);  buf_out : out std_logic_vector (7 
            downto 0));
   end component;
   
   component reg_10
      port( reg_in : in std_logic_vector (7 downto 0);  reg_clk, reg_rst : in 
            std_logic;  reg_ld : in std_logic_vector (4 downto 0);  reg_out : 
            out std_logic_vector (7 downto 0));
   end component;
   
   component reg_9
      port( reg_in : in std_logic_vector (7 downto 0);  reg_clk, reg_rst : in 
            std_logic;  reg_ld : in std_logic_vector (4 downto 0);  reg_out : 
            out std_logic_vector (7 downto 0));
   end component;
   
   component reg_8
      port( reg_in : in std_logic_vector (7 downto 0);  reg_clk, reg_rst : in 
            std_logic;  reg_ld : in std_logic_vector (4 downto 0);  reg_out : 
            out std_logic_vector (7 downto 0));
   end component;
   
   component reg_7
      port( reg_in : in std_logic_vector (7 downto 0);  reg_clk, reg_rst : in 
            std_logic;  reg_ld : in std_logic_vector (4 downto 0);  reg_out : 
            out std_logic_vector (7 downto 0));
   end component;
   
   component reg_6
      port( reg_in : in std_logic_vector (7 downto 0);  reg_clk, reg_rst : in 
            std_logic;  reg_ld : in std_logic_vector (4 downto 0);  reg_out : 
            out std_logic_vector (7 downto 0));
   end component;
   
   component reg_5
      port( reg_in : in std_logic_vector (7 downto 0);  reg_clk, reg_rst : in 
            std_logic;  reg_ld : in std_logic_vector (4 downto 0);  reg_out : 
            out std_logic_vector (7 downto 0));
   end component;
   
   component reg_4
      port( reg_in : in std_logic_vector (7 downto 0);  reg_clk, reg_rst : in 
            std_logic;  reg_ld : in std_logic_vector (4 downto 0);  reg_out : 
            out std_logic_vector (7 downto 0));
   end component;
   
   component reg_3
      port( reg_in : in std_logic_vector (7 downto 0);  reg_clk, reg_rst : in 
            std_logic;  reg_ld : in std_logic_vector (4 downto 0);  reg_out : 
            out std_logic_vector (7 downto 0));
   end component;
   
   component reg_2
      port( reg_in : in std_logic_vector (7 downto 0);  reg_clk, reg_rst : in 
            std_logic;  reg_ld : in std_logic_vector (4 downto 0);  reg_out : 
            out std_logic_vector (7 downto 0));
   end component;
   
   component reg_o
      port( reg_in : in std_logic_vector (7 downto 0);  reg_clk, reg_rst : in 
            std_logic;  reg_ld : in std_logic_vector (4 downto 0);  reg_out : 
            out std_logic_vector (7 downto 0));
   end component;
   
   signal reg_buf_2_7_port, reg_buf_2_6_port, reg_buf_2_5_port, 
      reg_buf_2_4_port, reg_buf_2_3_port, reg_buf_2_2_port, reg_buf_2_1_port, 
      reg_buf_2_0_port, reg_buf_3_7_port, reg_buf_3_6_port, reg_buf_3_5_port, 
      reg_buf_3_4_port, reg_buf_3_3_port, reg_buf_3_2_port, reg_buf_3_1_port, 
      reg_buf_3_0_port, reg_buf_4_7_port, reg_buf_4_6_port, reg_buf_4_5_port, 
      reg_buf_4_4_port, reg_buf_4_3_port, reg_buf_4_2_port, reg_buf_4_1_port, 
      reg_buf_4_0_port, reg_buf_5_7_port, reg_buf_5_6_port, reg_buf_5_5_port, 
      reg_buf_5_4_port, reg_buf_5_3_port, reg_buf_5_2_port, reg_buf_5_1_port, 
      reg_buf_5_0_port, reg_buf_6_7_port, reg_buf_6_6_port, reg_buf_6_5_port, 
      reg_buf_6_4_port, reg_buf_6_3_port, reg_buf_6_2_port, reg_buf_6_1_port, 
      reg_buf_6_0_port, reg_buf_7_7_port, reg_buf_7_6_port, reg_buf_7_5_port, 
      reg_buf_7_4_port, reg_buf_7_3_port, reg_buf_7_2_port, reg_buf_7_1_port, 
      reg_buf_7_0_port, reg_buf_8_7_port, reg_buf_8_6_port, reg_buf_8_5_port, 
      reg_buf_8_4_port, reg_buf_8_3_port, reg_buf_8_2_port, reg_buf_8_1_port, 
      reg_buf_8_0_port, reg_buf_9_7_port, reg_buf_9_6_port, reg_buf_9_5_port, 
      reg_buf_9_4_port, reg_buf_9_3_port, reg_buf_9_2_port, reg_buf_9_1_port, 
      reg_buf_9_0_port, reg_buf_10_7_port, reg_buf_10_6_port, reg_buf_10_5_port
      , reg_buf_10_4_port, reg_buf_10_3_port, reg_buf_10_2_port, 
      reg_buf_10_1_port, reg_buf_10_0_port : std_logic;

begin
   
   r_o : reg_o port map( reg_in(7) => reg_in(7), reg_in(6) => reg_in(6), 
                           reg_in(5) => reg_in(5), reg_in(4) => reg_in(4), 
                           reg_in(3) => reg_in(3), reg_in(2) => reg_in(2), 
                           reg_in(1) => reg_in(1), reg_in(0) => reg_in(0), 
                           reg_clk => reg_clk, reg_rst => reg_rst, reg_ld(4) =>
                           reg_select(4), reg_ld(3) => reg_select(3), reg_ld(2)
                           => reg_select(2), reg_ld(1) => reg_select(1), 
                           reg_ld(0) => reg_select(0), reg_out(7) => reg_out(7)
                           , reg_out(6) => reg_out(6), reg_out(5) => reg_out(5)
                           , reg_out(4) => reg_out(4), reg_out(3) => reg_out(3)
                           , reg_out(2) => reg_out(2), reg_out(1) => reg_out(1)
                           , reg_out(0) => reg_out(0));
   r2 : reg_2 port map( reg_in(7) => reg_in(7), reg_in(6) => reg_in(6), 
                           reg_in(5) => reg_in(5), reg_in(4) => reg_in(4), 
                           reg_in(3) => reg_in(3), reg_in(2) => reg_in(2), 
                           reg_in(1) => reg_in(1), reg_in(0) => reg_in(0), 
                           reg_clk => reg_clk, reg_rst => reg_rst, reg_ld(4) =>
                           reg_select(4), reg_ld(3) => reg_select(3), reg_ld(2)
                           => reg_select(2), reg_ld(1) => reg_select(1), 
                           reg_ld(0) => reg_select(0), reg_out(7) => 
                           reg_buf_2_7_port, reg_out(6) => reg_buf_2_6_port, 
                           reg_out(5) => reg_buf_2_5_port, reg_out(4) => 
                           reg_buf_2_4_port, reg_out(3) => reg_buf_2_3_port, 
                           reg_out(2) => reg_buf_2_2_port, reg_out(1) => 
                           reg_buf_2_1_port, reg_out(0) => reg_buf_2_0_port);
   r3 : reg_3 port map( reg_in(7) => reg_in(7), reg_in(6) => reg_in(6), 
                           reg_in(5) => reg_in(5), reg_in(4) => reg_in(4), 
                           reg_in(3) => reg_in(3), reg_in(2) => reg_in(2), 
                           reg_in(1) => reg_in(1), reg_in(0) => reg_in(0), 
                           reg_clk => reg_clk, reg_rst => reg_rst, reg_ld(4) =>
                           reg_select(4), reg_ld(3) => reg_select(3), reg_ld(2)
                           => reg_select(2), reg_ld(1) => reg_select(1), 
                           reg_ld(0) => reg_select(0), reg_out(7) => 
                           reg_buf_3_7_port, reg_out(6) => reg_buf_3_6_port, 
                           reg_out(5) => reg_buf_3_5_port, reg_out(4) => 
                           reg_buf_3_4_port, reg_out(3) => reg_buf_3_3_port, 
                           reg_out(2) => reg_buf_3_2_port, reg_out(1) => 
                           reg_buf_3_1_port, reg_out(0) => reg_buf_3_0_port);
   r4 : reg_4 port map( reg_in(7) => reg_in(7), reg_in(6) => reg_in(6), 
                           reg_in(5) => reg_in(5), reg_in(4) => reg_in(4), 
                           reg_in(3) => reg_in(3), reg_in(2) => reg_in(2), 
                           reg_in(1) => reg_in(1), reg_in(0) => reg_in(0), 
                           reg_clk => reg_clk, reg_rst => reg_rst, reg_ld(4) =>
                           reg_select(4), reg_ld(3) => reg_select(3), reg_ld(2)
                           => reg_select(2), reg_ld(1) => reg_select(1), 
                           reg_ld(0) => reg_select(0), reg_out(7) => 
                           reg_buf_4_7_port, reg_out(6) => reg_buf_4_6_port, 
                           reg_out(5) => reg_buf_4_5_port, reg_out(4) => 
                           reg_buf_4_4_port, reg_out(3) => reg_buf_4_3_port, 
                           reg_out(2) => reg_buf_4_2_port, reg_out(1) => 
                           reg_buf_4_1_port, reg_out(0) => reg_buf_4_0_port);
   r5 : reg_5 port map( reg_in(7) => reg_in(7), reg_in(6) => reg_in(6), 
                           reg_in(5) => reg_in(5), reg_in(4) => reg_in(4), 
                           reg_in(3) => reg_in(3), reg_in(2) => reg_in(2), 
                           reg_in(1) => reg_in(1), reg_in(0) => reg_in(0), 
                           reg_clk => reg_clk, reg_rst => reg_rst, reg_ld(4) =>
                           reg_select(4), reg_ld(3) => reg_select(3), reg_ld(2)
                           => reg_select(2), reg_ld(1) => reg_select(1), 
                           reg_ld(0) => reg_select(0), reg_out(7) => 
                           reg_buf_5_7_port, reg_out(6) => reg_buf_5_6_port, 
                           reg_out(5) => reg_buf_5_5_port, reg_out(4) => 
                           reg_buf_5_4_port, reg_out(3) => reg_buf_5_3_port, 
                           reg_out(2) => reg_buf_5_2_port, reg_out(1) => 
                           reg_buf_5_1_port, reg_out(0) => reg_buf_5_0_port);
   r6 : reg_6 port map( reg_in(7) => reg_in(7), reg_in(6) => reg_in(6), 
                           reg_in(5) => reg_in(5), reg_in(4) => reg_in(4), 
                           reg_in(3) => reg_in(3), reg_in(2) => reg_in(2), 
                           reg_in(1) => reg_in(1), reg_in(0) => reg_in(0), 
                           reg_clk => reg_clk, reg_rst => reg_rst, reg_ld(4) =>
                           reg_select(4), reg_ld(3) => reg_select(3), reg_ld(2)
                           => reg_select(2), reg_ld(1) => reg_select(1), 
                           reg_ld(0) => reg_select(0), reg_out(7) => 
                           reg_buf_6_7_port, reg_out(6) => reg_buf_6_6_port, 
                           reg_out(5) => reg_buf_6_5_port, reg_out(4) => 
                           reg_buf_6_4_port, reg_out(3) => reg_buf_6_3_port, 
                           reg_out(2) => reg_buf_6_2_port, reg_out(1) => 
                           reg_buf_6_1_port, reg_out(0) => reg_buf_6_0_port);
   r7 : reg_7 port map( reg_in(7) => reg_in(7), reg_in(6) => reg_in(6), 
                           reg_in(5) => reg_in(5), reg_in(4) => reg_in(4), 
                           reg_in(3) => reg_in(3), reg_in(2) => reg_in(2), 
                           reg_in(1) => reg_in(1), reg_in(0) => reg_in(0), 
                           reg_clk => reg_clk, reg_rst => reg_rst, reg_ld(4) =>
                           reg_select(4), reg_ld(3) => reg_select(3), reg_ld(2)
                           => reg_select(2), reg_ld(1) => reg_select(1), 
                           reg_ld(0) => reg_select(0), reg_out(7) => 
                           reg_buf_7_7_port, reg_out(6) => reg_buf_7_6_port, 
                           reg_out(5) => reg_buf_7_5_port, reg_out(4) => 
                           reg_buf_7_4_port, reg_out(3) => reg_buf_7_3_port, 
                           reg_out(2) => reg_buf_7_2_port, reg_out(1) => 
                           reg_buf_7_1_port, reg_out(0) => reg_buf_7_0_port);
   r8 : reg_8 port map( reg_in(7) => reg_in(7), reg_in(6) => reg_in(6), 
                           reg_in(5) => reg_in(5), reg_in(4) => reg_in(4), 
                           reg_in(3) => reg_in(3), reg_in(2) => reg_in(2), 
                           reg_in(1) => reg_in(1), reg_in(0) => reg_in(0), 
                           reg_clk => reg_clk, reg_rst => reg_rst, reg_ld(4) =>
                           reg_select(4), reg_ld(3) => reg_select(3), reg_ld(2)
                           => reg_select(2), reg_ld(1) => reg_select(1), 
                           reg_ld(0) => reg_select(0), reg_out(7) => 
                           reg_buf_8_7_port, reg_out(6) => reg_buf_8_6_port, 
                           reg_out(5) => reg_buf_8_5_port, reg_out(4) => 
                           reg_buf_8_4_port, reg_out(3) => reg_buf_8_3_port, 
                           reg_out(2) => reg_buf_8_2_port, reg_out(1) => 
                           reg_buf_8_1_port, reg_out(0) => reg_buf_8_0_port);
   r9 : reg_9 port map( reg_in(7) => reg_in(7), reg_in(6) => reg_in(6), 
                           reg_in(5) => reg_in(5), reg_in(4) => reg_in(4), 
                           reg_in(3) => reg_in(3), reg_in(2) => reg_in(2), 
                           reg_in(1) => reg_in(1), reg_in(0) => reg_in(0), 
                           reg_clk => reg_clk, reg_rst => reg_rst, reg_ld(4) =>
                           reg_select(4), reg_ld(3) => reg_select(3), reg_ld(2)
                           => reg_select(2), reg_ld(1) => reg_select(1), 
                           reg_ld(0) => reg_select(0), reg_out(7) => 
                           reg_buf_9_7_port, reg_out(6) => reg_buf_9_6_port, 
                           reg_out(5) => reg_buf_9_5_port, reg_out(4) => 
                           reg_buf_9_4_port, reg_out(3) => reg_buf_9_3_port, 
                           reg_out(2) => reg_buf_9_2_port, reg_out(1) => 
                           reg_buf_9_1_port, reg_out(0) => reg_buf_9_0_port);
   r10 : reg_10 port map( reg_in(7) => reg_in(7), reg_in(6) => reg_in(6), 
                           reg_in(5) => reg_in(5), reg_in(4) => reg_in(4), 
                           reg_in(3) => reg_in(3), reg_in(2) => reg_in(2), 
                           reg_in(1) => reg_in(1), reg_in(0) => reg_in(0), 
                           reg_clk => reg_clk, reg_rst => reg_rst, reg_ld(4) =>
                           reg_select(4), reg_ld(3) => reg_select(3), reg_ld(2)
                           => reg_select(2), reg_ld(1) => reg_select(1), 
                           reg_ld(0) => reg_select(0), reg_out(7) => 
                           reg_buf_10_7_port, reg_out(6) => reg_buf_10_6_port, 
                           reg_out(5) => reg_buf_10_5_port, reg_out(4) => 
                           reg_buf_10_4_port, reg_out(3) => reg_buf_10_3_port, 
                           reg_out(2) => reg_buf_10_2_port, reg_out(1) => 
                           reg_buf_10_1_port, reg_out(0) => reg_buf_10_0_port);
   bin : buf_i port map( buf_in(7) => buf_in(7), buf_in(6) => buf_in(6), 
                           buf_in(5) => buf_in(5), buf_in(4) => buf_in(4), 
                           buf_in(3) => buf_in(3), buf_in(2) => buf_in(2), 
                           buf_in(1) => buf_in(1), buf_in(0) => buf_in(0), 
                           buf_oe(4) => buf_select(4), buf_oe(3) => 
                           buf_select(3), buf_oe(2) => buf_select(2), buf_oe(1)
                           => buf_select(1), buf_oe(0) => buf_select(0), 
                           buf_out(7) => buf_out(7), buf_out(6) => buf_out(6), 
                           buf_out(5) => buf_out(5), buf_out(4) => buf_out(4), 
                           buf_out(3) => buf_out(3), buf_out(2) => buf_out(2), 
                           buf_out(1) => buf_out(1), buf_out(0) => buf_out(0));
   b2 : buf_2 port map( buf_in(7) => reg_buf_2_7_port, buf_in(6) => 
                           reg_buf_2_6_port, buf_in(5) => reg_buf_2_5_port, 
                           buf_in(4) => reg_buf_2_4_port, buf_in(3) => 
                           reg_buf_2_3_port, buf_in(2) => reg_buf_2_2_port, 
                           buf_in(1) => reg_buf_2_1_port, buf_in(0) => 
                           reg_buf_2_0_port, buf_oe(4) => buf_select(4), 
                           buf_oe(3) => buf_select(3), buf_oe(2) => 
                           buf_select(2), buf_oe(1) => buf_select(1), buf_oe(0)
                           => buf_select(0), buf_out(7) => buf_out(7), 
                           buf_out(6) => buf_out(6), buf_out(5) => buf_out(5), 
                           buf_out(4) => buf_out(4), buf_out(3) => buf_out(3), 
                           buf_out(2) => buf_out(2), buf_out(1) => buf_out(1), 
                           buf_out(0) => buf_out(0));
   b3 : buf_3 port map( buf_in(7) => reg_buf_3_7_port, buf_in(6) => 
                           reg_buf_3_6_port, buf_in(5) => reg_buf_3_5_port, 
                           buf_in(4) => reg_buf_3_4_port, buf_in(3) => 
                           reg_buf_3_3_port, buf_in(2) => reg_buf_3_2_port, 
                           buf_in(1) => reg_buf_3_1_port, buf_in(0) => 
                           reg_buf_3_0_port, buf_oe(4) => buf_select(4), 
                           buf_oe(3) => buf_select(3), buf_oe(2) => 
                           buf_select(2), buf_oe(1) => buf_select(1), buf_oe(0)
                           => buf_select(0), buf_out(7) => buf_out(7), 
                           buf_out(6) => buf_out(6), buf_out(5) => buf_out(5), 
                           buf_out(4) => buf_out(4), buf_out(3) => buf_out(3), 
                           buf_out(2) => buf_out(2), buf_out(1) => buf_out(1), 
                           buf_out(0) => buf_out(0));
   b4 : buf_4 port map( buf_in(7) => reg_buf_4_7_port, buf_in(6) => 
                           reg_buf_4_6_port, buf_in(5) => reg_buf_4_5_port, 
                           buf_in(4) => reg_buf_4_4_port, buf_in(3) => 
                           reg_buf_4_3_port, buf_in(2) => reg_buf_4_2_port, 
                           buf_in(1) => reg_buf_4_1_port, buf_in(0) => 
                           reg_buf_4_0_port, buf_oe(4) => buf_select(4), 
                           buf_oe(3) => buf_select(3), buf_oe(2) => 
                           buf_select(2), buf_oe(1) => buf_select(1), buf_oe(0)
                           => buf_select(0), buf_out(7) => buf_out(7), 
                           buf_out(6) => buf_out(6), buf_out(5) => buf_out(5), 
                           buf_out(4) => buf_out(4), buf_out(3) => buf_out(3), 
                           buf_out(2) => buf_out(2), buf_out(1) => buf_out(1), 
                           buf_out(0) => buf_out(0));
   b5 : buf_5 port map( buf_in(7) => reg_buf_5_7_port, buf_in(6) => 
                           reg_buf_5_6_port, buf_in(5) => reg_buf_5_5_port, 
                           buf_in(4) => reg_buf_5_4_port, buf_in(3) => 
                           reg_buf_5_3_port, buf_in(2) => reg_buf_5_2_port, 
                           buf_in(1) => reg_buf_5_1_port, buf_in(0) => 
                           reg_buf_5_0_port, buf_oe(4) => buf_select(4), 
                           buf_oe(3) => buf_select(3), buf_oe(2) => 
                           buf_select(2), buf_oe(1) => buf_select(1), buf_oe(0)
                           => buf_select(0), buf_out(7) => buf_out(7), 
                           buf_out(6) => buf_out(6), buf_out(5) => buf_out(5), 
                           buf_out(4) => buf_out(4), buf_out(3) => buf_out(3), 
                           buf_out(2) => buf_out(2), buf_out(1) => buf_out(1), 
                           buf_out(0) => buf_out(0));
   b6 : buf_6 port map( buf_in(7) => reg_buf_6_7_port, buf_in(6) => 
                           reg_buf_6_6_port, buf_in(5) => reg_buf_6_5_port, 
                           buf_in(4) => reg_buf_6_4_port, buf_in(3) => 
                           reg_buf_6_3_port, buf_in(2) => reg_buf_6_2_port, 
                           buf_in(1) => reg_buf_6_1_port, buf_in(0) => 
                           reg_buf_6_0_port, buf_oe(4) => buf_select(4), 
                           buf_oe(3) => buf_select(3), buf_oe(2) => 
                           buf_select(2), buf_oe(1) => buf_select(1), buf_oe(0)
                           => buf_select(0), buf_out(7) => buf_out(7), 
                           buf_out(6) => buf_out(6), buf_out(5) => buf_out(5), 
                           buf_out(4) => buf_out(4), buf_out(3) => buf_out(3), 
                           buf_out(2) => buf_out(2), buf_out(1) => buf_out(1), 
                           buf_out(0) => buf_out(0));
   b7 : buf_7 port map( buf_in(7) => reg_buf_7_7_port, buf_in(6) => 
                           reg_buf_7_6_port, buf_in(5) => reg_buf_7_5_port, 
                           buf_in(4) => reg_buf_7_4_port, buf_in(3) => 
                           reg_buf_7_3_port, buf_in(2) => reg_buf_7_2_port, 
                           buf_in(1) => reg_buf_7_1_port, buf_in(0) => 
                           reg_buf_7_0_port, buf_oe(4) => buf_select(4), 
                           buf_oe(3) => buf_select(3), buf_oe(2) => 
                           buf_select(2), buf_oe(1) => buf_select(1), buf_oe(0)
                           => buf_select(0), buf_out(7) => buf_out(7), 
                           buf_out(6) => buf_out(6), buf_out(5) => buf_out(5), 
                           buf_out(4) => buf_out(4), buf_out(3) => buf_out(3), 
                           buf_out(2) => buf_out(2), buf_out(1) => buf_out(1), 
                           buf_out(0) => buf_out(0));
   b8 : buf_8 port map( buf_in(7) => reg_buf_8_7_port, buf_in(6) => 
                           reg_buf_8_6_port, buf_in(5) => reg_buf_8_5_port, 
                           buf_in(4) => reg_buf_8_4_port, buf_in(3) => 
                           reg_buf_8_3_port, buf_in(2) => reg_buf_8_2_port, 
                           buf_in(1) => reg_buf_8_1_port, buf_in(0) => 
                           reg_buf_8_0_port, buf_oe(4) => buf_select(4), 
                           buf_oe(3) => buf_select(3), buf_oe(2) => 
                           buf_select(2), buf_oe(1) => buf_select(1), buf_oe(0)
                           => buf_select(0), buf_out(7) => buf_out(7), 
                           buf_out(6) => buf_out(6), buf_out(5) => buf_out(5), 
                           buf_out(4) => buf_out(4), buf_out(3) => buf_out(3), 
                           buf_out(2) => buf_out(2), buf_out(1) => buf_out(1), 
                           buf_out(0) => buf_out(0));
   b9 : buf_9 port map( buf_in(7) => reg_buf_9_7_port, buf_in(6) => 
                           reg_buf_9_6_port, buf_in(5) => reg_buf_9_5_port, 
                           buf_in(4) => reg_buf_9_4_port, buf_in(3) => 
                           reg_buf_9_3_port, buf_in(2) => reg_buf_9_2_port, 
                           buf_in(1) => reg_buf_9_1_port, buf_in(0) => 
                           reg_buf_9_0_port, buf_oe(4) => buf_select(4), 
                           buf_oe(3) => buf_select(3), buf_oe(2) => 
                           buf_select(2), buf_oe(1) => buf_select(1), buf_oe(0)
                           => buf_select(0), buf_out(7) => buf_out(7), 
                           buf_out(6) => buf_out(6), buf_out(5) => buf_out(5), 
                           buf_out(4) => buf_out(4), buf_out(3) => buf_out(3), 
                           buf_out(2) => buf_out(2), buf_out(1) => buf_out(1), 
                           buf_out(0) => buf_out(0));
   b10 : buf_10 port map( buf_in(7) => reg_buf_10_7_port, buf_in(6) => 
                           reg_buf_10_6_port, buf_in(5) => reg_buf_10_5_port, 
                           buf_in(4) => reg_buf_10_4_port, buf_in(3) => 
                           reg_buf_10_3_port, buf_in(2) => reg_buf_10_2_port, 
                           buf_in(1) => reg_buf_10_1_port, buf_in(0) => 
                           reg_buf_10_0_port, buf_oe(4) => buf_select(4), 
                           buf_oe(3) => buf_select(3), buf_oe(2) => 
                           buf_select(2), buf_oe(1) => buf_select(1), buf_oe(0)
                           => buf_select(0), buf_out(7) => buf_out(7), 
                           buf_out(6) => buf_out(6), buf_out(5) => buf_out(5), 
                           buf_out(4) => buf_out(4), buf_out(3) => buf_out(3), 
                           buf_out(2) => buf_out(2), buf_out(1) => buf_out(1), 
                           buf_out(0) => buf_out(0));

end synthesised;



