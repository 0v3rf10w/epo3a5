
library IEEE;
use ieee.std_logic_1164.all;

entity reg_cluster is
port (  reg_in      : in std_logic_vector(7 downto 0);
        reg_clk     : in std_logic;
        reg_rst     : in std_logic;
        reg_select  : in std_logic_vector(4 downto 0);
        buf_select  : in std_logic_vector(4 downto 0);
        buf_in      : in std_logic_vector(7 downto 0);
        buf_out     : out std_logic_vector(7 downto 0);
        reg_out     : out std_logic_vector(7 downto 0));
end entity reg_cluster;

architecture behavioural of reg_cluster is

--components--

--registers--

component reg_o
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_2
port (  reg_in  : in std_logic_vector(7 downto 0);
        reg_clk : in std_logic;
        reg_rst : in std_logic;
        reg_ld  : in std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_3
port (  reg_in  : in std_logic_vector(7 downto 0);
        reg_clk : in std_logic;
        reg_rst : in std_logic;
        reg_ld  : in std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_4
port (  reg_in  : in std_logic_vector(7 downto 0);
        reg_clk : in std_logic;
        reg_rst : in std_logic;
        reg_ld  : in std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_5
port (  reg_in  : in std_logic_vector(7 downto 0);
        reg_clk : in std_logic;
        reg_rst : in std_logic;
        reg_ld  : in std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_6
port (  reg_in  : in std_logic_vector(7 downto 0);
        reg_clk : in std_logic;
        reg_rst : in std_logic;
        reg_ld  : in std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_7
port (  reg_in  : in std_logic_vector(7 downto 0);
        reg_clk : in std_logic;
        reg_rst : in std_logic;
        reg_ld  : in std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_8
port (  reg_in  : in std_logic_vector(7 downto 0);
        reg_clk : in std_logic;
        reg_rst : in std_logic;
        reg_ld  : in std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_9
port (  reg_in  : in std_logic_vector(7 downto 0);
        reg_clk : in std_logic;
        reg_rst : in std_logic;
        reg_ld  : in std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_10
port (  reg_in  : in std_logic_vector(7 downto 0);
        reg_clk : in std_logic;
        reg_rst : in std_logic;
        reg_ld  : in std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

--buffers--

component buf_i
port  ( buf_in  : in  std_logic_vector(7 downto 0);
        buf_oe  : in  std_logic_vector(4 downto 0);
        buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_2
port( buf_in  : in std_logic_vector(7 downto 0);
      buf_oe  : in std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_3
port( buf_in  : in std_logic_vector(7 downto 0);
      buf_oe  : in std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_4
port( buf_in  : in std_logic_vector(7 downto 0);
      buf_oe  : in std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_5
port( buf_in  : in std_logic_vector(7 downto 0);
      buf_oe  : in std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_6
port( buf_in  : in std_logic_vector(7 downto 0);
      buf_oe  : in std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_7
port( buf_in  : in std_logic_vector(7 downto 0);
      buf_oe  : in std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_8
port( buf_in  : in std_logic_vector(7 downto 0);
      buf_oe  : in std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_9
port( buf_in  : in std_logic_vector(7 downto 0);
      buf_oe  : in std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_10
port( buf_in  : in std_logic_vector(7 downto 0);
      buf_oe  : in std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;


--signals--
signal reg_buf_2  : std_logic_vector(7 downto 0);       --Output reg_2, input buf_2
signal reg_buf_3  : std_logic_vector(7 downto 0);       --Output reg_3, input buf_3
signal reg_buf_4  : std_logic_vector(7 downto 0);       --Output reg_4, input buf_4
signal reg_buf_5  : std_logic_vector(7 downto 0);       --Output reg_5, input buf_5
signal reg_buf_6  : std_logic_vector(7 downto 0);       --Output reg_6, input buf_6
signal reg_buf_7  : std_logic_vector(7 downto 0);       --Output reg_7, input buf_7
signal reg_buf_8  : std_logic_vector(7 downto 0);       --Output reg_8, input buf_8
signal reg_buf_9  : std_logic_vector(7 downto 0);       --Output reg_9, input buf_9
signal reg_buf_10 : std_logic_vector(7 downto 0);       --Output reg_10, input buf_10

begin

--registers--

r_o:          reg_o port map (
                              reg_in => reg_in,
                              reg_clk => reg_clk,
                              reg_rst => reg_rst,
                              reg_ld => reg_select,
                              reg_out => reg_out);

r2:           reg_2 port map (
                              reg_in => reg_in,
                              reg_clk => reg_clk,
                              reg_rst => reg_rst,
                              reg_ld => reg_select,
                              reg_out => reg_buf_2);
                              
r3:           reg_3 port map (
                              reg_in => reg_in,
                              reg_clk => reg_clk,
                              reg_rst => reg_rst,
                              reg_ld => reg_select,
                              reg_out => reg_buf_3);
r4:           reg_4 port map (
                              reg_in => reg_in,
                              reg_clk => reg_clk,
                              reg_rst => reg_rst,
                              reg_ld => reg_select,
                              reg_out => reg_buf_4);
                              
r5:           reg_5 port map (
                              reg_in => reg_in,
                              reg_clk => reg_clk,
                              reg_rst => reg_rst,
                              reg_ld => reg_select,
                              reg_out => reg_buf_5);
                              
r6:           reg_6 port map (
                              reg_in => reg_in,
                              reg_clk => reg_clk,
                              reg_rst => reg_rst,
                              reg_ld => reg_select,
                              reg_out => reg_buf_6);

r7:           reg_7 port map (
                              reg_in => reg_in,
                              reg_clk => reg_clk,
                              reg_rst => reg_rst,
                              reg_ld => reg_select,
                              reg_out => reg_buf_7);

r8:           reg_8 port map (
                              reg_in => reg_in,
                              reg_clk => reg_clk,
                              reg_rst => reg_rst,
                              reg_ld => reg_select,
                              reg_out => reg_buf_8);

r9:           reg_9 port map (
                              reg_in => reg_in,
                              reg_clk => reg_clk,
                              reg_rst => reg_rst,
                              reg_ld => reg_select,
                              reg_out => reg_buf_9);

r10:          reg_10 port map (
                              reg_in => reg_in,
                              reg_clk => reg_clk,
                              reg_rst => reg_rst,
                              reg_ld => reg_select,
                              reg_out => reg_buf_10);
                              
--buffers--           

bin:          buf_i port map (
                              buf_in => buf_in,
                              buf_oe => buf_select,
                              buf_out => buf_out); 
                              
b2:           buf_2 port map (
                              buf_in => reg_buf_2,
                              buf_oe => buf_select,
                              buf_out => buf_out);
                              
b3:           buf_3 port map (
                              buf_in => reg_buf_3,
                              buf_oe => buf_select,
                              buf_out => buf_out);
                              
b4:           buf_4 port map (
                              buf_in => reg_buf_4,
                              buf_oe => buf_select,
                              buf_out => buf_out);
                              
b5:           buf_5 port map (
                              buf_in => reg_buf_5,
                              buf_oe => buf_select,
                              buf_out => buf_out);
                              
b6:           buf_6 port map (
                              buf_in => reg_buf_6,
                              buf_oe => buf_select,
                              buf_out => buf_out);
                              
b7:           buf_7 port map (
                              buf_in => reg_buf_7,
                              buf_oe => buf_select,
                              buf_out => buf_out);
                              
b8:           buf_8 port map (
                              buf_in => reg_buf_8,
                              buf_oe => buf_select,
                              buf_out => buf_out);
                              
b9:           buf_9 port map (
                              buf_in => reg_buf_9,
                              buf_oe => buf_select,
                              buf_out => buf_out);                              
                              
b10:          buf_10 port map (
                              buf_in => reg_buf_10,
                              buf_oe => buf_select,
                              buf_out => buf_out);       
                              
end architecture;                              


