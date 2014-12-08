library ieee;
use ieee.std_logic_1164.all;

entity cpu is
port(	cpu_clk	:	in	std_logic;
	cpu_rst	:	in	std_logic;
	cpu_en	:	in	std_logic;
	cpu_in	:	in	std_logic_vector(7 downto 0);
	cpu_instr:	in	std_logic_vector(11 downto 0);
	cpu_pc	:	out	std_logic_vector(7 downto 0);
	cpu_out	:	out	std_logic_vector(7 downto 0));
end entity cpu;

architecture behaviour of cpu is

-- components --

component instr_buf
port( buf_in  : in  std_logic_vector(11 downto 0);
      buf_oe  : in  std_logic;
      buf_out : out std_logic_vector(11 downto 0));
end component;

component decoder
port( decoder_in  : in std_logic_vector(11 downto 0);
      decoder_c   : in  std_logic;
      decoder_z   : in  std_logic;
      decoder_pc_inc  : out std_logic;
      decoder_pc_ld   : out std_logic;
      decoder_ibufoe : out std_logic;
      decoder_aregld   : out std_logic;
      decoder_abufoe  : out std_logic;
      decoder_bregld   : out std_logic_vector(4 downto 0);
      decoder_bbufoe  : out std_logic_vector(4 downto 0);
      decoder_alu       : out std_logic_vector(2 downto 0);
      decoder_argout    : out std_logic_vector(7 downto 0));
end component;

component alu
  port ( alu_A  : in  std_logic_vector(7 downto 0);     -- input A
         alu_B  : in  std_logic_vector(7 downto 0);     -- input B
         opcode : in  std_logic_vector(2 downto 0);     -- opcode
         alu_clk: in  std_logic;                        -- clk
         alu_c  : out std_logic;                        -- flag C
         alu_z  : out std_logic;                        -- flag Z
         alu_y  : out std_logic_vector(7 downto 0));    -- Output result y
end component;

component pc_counter
port ( pc_in  : in  std_logic_vector(7 downto 0);
      pc_inc  : in  std_logic;
      pc_ld   : in  std_logic;
      pc_rst  : in  std_logic;
      pc_clk  : in  std_logic;
      pc_out  : out std_logic_vector(7 downto 0));
end component;

component buf_i
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic;
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_A
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic;
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_1
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_2
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_3
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_4
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_5
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_6
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_7
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_8
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_9
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_10
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component reg_A
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic;
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_1
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_2
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_3
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_4
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_5
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_6
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_7
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_8
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_9
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_10
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

-- Signals --

signal cpu_dec_instr	:	std_logic_vector(11 downto 0);	-- instruction from SPI
signal cpu_dec_o	:	std_logic_vector(7 downto 0);	-- operand to buf_i
signal cpu_dec_ibufoe	:	std_logic;			-- ibuf_oe
signal cpu_dec_pc_inc	:	std_logic;			-- program counter increment
signal cpu_dec_pc_ld	:	std_logic;			-- program counter load
signal cpu_dec_abufoe	:	std_logic;			-- abuf_oe 
signal cpu_dec_aregld	:	std_logic;			-- areg_ld
signal cpu_dec_bbufoe	:	std_logic_vector(4 downto 0);	-- bbuf_oe
signal cpu_dec_bregld	:	std_logic_vector(4 downto 0);	-- breg_ld
signal cpu_bus		:	std_logic_vector(7 downto 0);	-- operand in bus
signal cpu_pc_out	:	std_logic_vector(7 downto 0);	-- pc_out adress of instruction
signal cpu_alu_c	:	std_logic;			-- alu carry
signal cpu_alu_z	:	std_logic;			-- alu z-flag
signal cpu_alu_out	:	std_logic_vector(7 downto 0);	-- alu output
signal cpu_alu_op	:	std_logic_vector(2 downto 0);	-- alu opcode
signal cpu_areg_out	:	std_logic_vector(7 downto 0);	-- output reg_A
signal cpu_buf_2	:	std_logic_vector(7 downto 0);	-- between register and buffer
signal cpu_buf_3	:	std_logic_vector(7 downto 0);	-- between register and buffer
signal cpu_buf_4	:	std_logic_vector(7 downto 0);	-- between register and buffer
signal cpu_buf_5	:	std_logic_vector(7 downto 0);	-- between register and buffer
signal cpu_buf_6	:	std_logic_vector(7 downto 0);	-- between register and buffer
signal cpu_buf_7	:	std_logic_vector(7 downto 0);	-- between register and buffer
signal cpu_buf_8	:	std_logic_vector(7 downto 0);	-- between register and buffer
signal cpu_buf_9	:	std_logic_vector(7 downto 0);	-- between register and buffer
signal cpu_buf_10	:	std_logic_vector(7 downto 0);	-- between register and buffer

begin

instrbuf:	instr_buf	port map(
					buf_in => cpu_instr,
					buf_oe => cpu_en,
					buf_out => cpu_dec_instr);

cpu_decoder:	decoder		port map(
					decoder_in => cpu_instr,
      					decoder_c => cpu_alu_c,
      					decoder_z => cpu_alu_z,
      					decoder_pc_inc => cpu_dec_pc_inc,
      					decoder_pc_ld => cpu_dec_pc_ld,
      					decoder_ibufoe => cpu_dec_ibufoe,
      					decoder_aregld => cpu_dec_aregld,
      					decoder_abufoe => cpu_dec_abufoe,
      					decoder_bregld => cpu_dec_bregld,
      					decoder_bbufoe => cpu_dec_bbufoe,
      					decoder_alu => cpu_alu_op,
      					decoder_argout => cpu_dec_o);

cpu_ibuf:	buf_i		port map(
					buf_in => cpu_dec_o,
					buf_oe => cpu_dec_ibufoe,
					buf_out => cpu_bus);

cpu_pc_counter:	pc_counter	port map(
					pc_in => cpu_bus,
     					pc_inc => cpu_dec_pc_inc,
      					pc_ld => cpu_dec_pc_ld,
      					pc_rst => cpu_rst,
      					pc_clk => cpu_clk,
      					pc_out => cpu_pc_out);

cpu_alu:	alu		port map(
					alu_A => cpu_bus,
         				alu_B => cpu_areg_out,
         				opcode => cpu_alu_op,
         				alu_clk => cpu_clk,
         				alu_c => cpu_alu_c,
         				alu_z => cpu_alu_z,
         				alu_y => cpu_alu_out);

cpu_reg_A:	reg_A		port map(
					reg_in => cpu_alu_out,
					reg_clk => cpu_clk,
					reg_rst => cpu_rst,
					reg_ld => cpu_dec_aregld,
					reg_out => cpu_areg_out);

cpu_buf_A:	buf_A		port map(
					buf_in => cpu_areg_out,
					buf_oe => cpu_dec_abufoe,
					buf_out => cpu_bus);

reg_out:	reg_1		port map(
					reg_in => cpu_bus,
					reg_clk => cpu_clk,
					reg_rst => cpu_rst,
					reg_ld => cpu_dec_bregld,
					reg_out => cpu_out);

buf_in:		buf_1		port map(
					buf_in => cpu_in,
					buf_oe => cpu_dec_bbufoe,
					buf_out => cpu_bus);

cpu_reg_2:	reg_2		port map(
					reg_in => cpu_bus,
					reg_clk => cpu_clk,
					reg_rst => cpu_rst,
					reg_ld => cpu_dec_bregld,
					reg_out => cpu_buf_2);
cpu_reg_3:	reg_3		port map(
					reg_in => cpu_bus,
					reg_clk => cpu_clk,
					reg_rst => cpu_rst,
					reg_ld => cpu_dec_bregld,
					reg_out => cpu_buf_3);

cpu_reg_4:	reg_4		port map(
					reg_in => cpu_bus,
					reg_clk => cpu_clk,
					reg_rst => cpu_rst,
					reg_ld => cpu_dec_bregld,
					reg_out => cpu_buf_4);

cpu_reg_5:	reg_5		port map(
					reg_in => cpu_bus,
					reg_clk => cpu_clk,
					reg_rst => cpu_rst,
					reg_ld => cpu_dec_bregld,
					reg_out => cpu_buf_5);

cpu_reg_6:	reg_6		port map(
					reg_in => cpu_bus,
					reg_clk => cpu_clk,
					reg_rst => cpu_rst,
					reg_ld => cpu_dec_bregld,
					reg_out => cpu_buf_6);

cpu_reg_7:	reg_7		port map(
					reg_in => cpu_bus,
					reg_clk => cpu_clk,
					reg_rst => cpu_rst,
					reg_ld => cpu_dec_bregld,
					reg_out => cpu_buf_7);

cpu_reg_8:	reg_8		port map(
					reg_in => cpu_bus,
					reg_clk => cpu_clk,
					reg_rst => cpu_rst,
					reg_ld => cpu_dec_bregld,
					reg_out => cpu_buf_8);

cpu_reg_9:	reg_9		port map(
					reg_in => cpu_bus,
					reg_clk => cpu_clk,
					reg_rst => cpu_rst,
					reg_ld => cpu_dec_bregld,
					reg_out => cpu_buf_9);

cpu_reg_10:	reg_10		port map(
					reg_in => cpu_bus,
					reg_clk => cpu_clk,
					reg_rst => cpu_rst,
					reg_ld => cpu_dec_bregld,
					reg_out => cpu_buf_10);

cpu_buf2:	buf_2		port map(
					buf_in => cpu_buf_2,
					buf_oe => cpu_dec_bbufoe,
					buf_out => cpu_bus);

cpu_buf3:	buf_3		port map(
					buf_in => cpu_buf_3,
					buf_oe => cpu_dec_bbufoe,
					buf_out => cpu_bus);

cpu_buf4:	buf_4		port map(
					buf_in => cpu_buf_4,
					buf_oe => cpu_dec_bbufoe,
					buf_out => cpu_bus);

cpu_buf5:	buf_5		port map(
					buf_in => cpu_buf_5,
					buf_oe => cpu_dec_bbufoe,
					buf_out => cpu_bus);

cpu_buf6:	buf_6		port map(
					buf_in => cpu_buf_6,
					buf_oe => cpu_dec_bbufoe,
					buf_out => cpu_bus);

cpu_buf7:	buf_7		port map(
					buf_in => cpu_buf_7,
					buf_oe => cpu_dec_bbufoe,
					buf_out => cpu_bus);

cpu_buf8:	buf_8		port map(
					buf_in => cpu_buf_8,
					buf_oe => cpu_dec_bbufoe,
					buf_out => cpu_bus);

cpu_buf9:	buf_9		port map(
					buf_in => cpu_buf_9,
					buf_oe => cpu_dec_bbufoe,
					buf_out => cpu_bus);

cpu_buf10:	buf_10		port map(
					buf_in => cpu_buf_10,
					buf_oe => cpu_dec_bbufoe,
					buf_out => cpu_bus);

end behaviour;