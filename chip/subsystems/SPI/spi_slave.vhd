library IEEE;
use IEEE.std_logic_1164.all;

entity spi_slave is
	port (	reset		: in	std_logic;
		read_out	: out	std_logic_vector (7 downto 0);
		
		sclk		: in	std_logic;
		mosi		: in	std_logic;
		miso		: out	std_logic;
		ss			: in	std_logic
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
	signal count_reset : std_logic;
	signal shift, shift_in : std_logic;
	
begin

cnt1:  counter port map (sclk,count_reset,count);
shft1: shift_reg port map (sclk,reset,shift,shift_in,'0',"11111111",shift_output);
	
	read_out <= output_buffer;
	miso <= '1'; -- we are not sending anything from the slave
	
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
	
	process(sclk,reset)
	begin
		if(reset = '1') then
			output_buffer <= (others => '0');
		else
			if(falling_edge(sclk)) then
				output_buffer <= new_output_buffer;
			end if;
		end if;
	end process;

	process(count,reset)
	begin
		if(reset = '1') then
			shift <= '0';
			count_reset <= '1';
			new_output_buffer <= (others => '0');
		else
			shift <= '1';
			if(count = "1000") then
				new_output_buffer <= shift_output;
				count_reset <= '1';
			else
				new_output_buffer <= output_buffer;
				count_reset <= '0';
			end if;
		end if;
	end process;

end behavioural;
