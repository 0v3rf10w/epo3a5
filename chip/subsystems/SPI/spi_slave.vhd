library IEEE;
use IEEE.std_logic_1164.all;

entity spi_slave is
	port (	reset		: in	std_logic;
		read_out	: out	std_logic_vector (7 downto 0);
		data_ready	: out	std_logic;
		
		sclk		: in	std_logic;
		mosi		: in	std_logic;
		miso		: out	std_logic;
		ss			: in	std_logic;
		
		debug_count		: out std_logic_vector(3 downto 0)
	);
end entity spi_slave;


architecture behavioural of spi_slave is

	component counter is
	port(	clk			: in	std_logic;
			reset		: in	std_logic;
			count_out	: out	std_logic_vector (3 downto 0)
	);
	end component counter;

	component shift_reg is
	port(	clk: 			in std_logic;
		reset:	 		in std_logic;
		enable: 		in std_logic;
		shift_in:		in std_logic;
		reg_set:		in std_logic;
		reg_write: 		in std_logic_vector (7 downto 0);
		output: 		out std_logic_vector (7 downto 0)
	);
	end component shift_reg;

	type control_state is (slave,read_data);
	signal state : control_state;
	signal count : std_logic_vector(3 downto 0);
	signal shift_output, output_buffer, new_output_buffer : std_logic_vector(7 downto 0);
	signal count_reset,inv_sclk : std_logic;
	signal shift, shift_in : std_logic;
	
begin

	debug_count <= count;

	inv_sclk <= not sclk;

cnt1:  counter port map (inv_sclk,count_reset,count);
shft1: shift_reg port map (sclk,reset,shift,shift_in,'0',"11111111",shift_output);
	
	read_out <= shift_output;
	miso <= '1'; -- we are not sending anything from the slave
	shift <= '1'; -- always shift because sclk determines when to shift
	
	data_ready <= '1' when (count = "0000") else '0';
	
	process(sclk,reset)
	begin
		if(reset = '1') then
			shift_in <= '0';
		else
			if(rising_edge(sclk)) then
				shift_in <= mosi;
			end if;
		end if;
	end process;
	
	process(reset,count)
	begin
		if(reset = '1') then
			count_reset <= '1';
		else
			if(count = "1000") then
				count_reset <= '1';
			else
				count_reset <= '0';
			end if;
		end if;
	end process;



end behavioural;
