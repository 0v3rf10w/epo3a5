library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sdcard is
port(	clk:			in std_logic;
		div_clk:		in std_logic; --between 100kHz and 400kHz
		reset:			in std_logic;
		address:		in std_logic_vector(7 downto 0);
		output:			out std_logic_vector(11 downto 0);
		busy:			out std_logic;
		
		sclk:			out std_logic;
		mosi:			out std_logic;
		miso:			in std_logic;
		ss:				out std_logic;
		
		state_debug:	out std_logic_vector(7 downto 0);
		next_state:		in std_logic;
		spi_output_debug: out std_logic_vector(7 downto 0)
		
	);
end entity sdcard;

architecture behavioural of sdcard is

	component spi is
	port (	clk		: in	std_logic;
		send		: in	std_logic;
		reset		: in	std_logic;
		write_enable	: in 	std_logic;
		write_in	: in	std_logic_vector (7 downto 0);
		read_out	: out	std_logic_vector (7 downto 0);
		busy		: out	std_logic;
		sclk		: out	std_logic;
		mosi		: out	std_logic;
		miso		: in	std_logic;
		ss			: out	std_logic
	);
	end component spi;

	type trans_state is (
				reset_state,
				dummy_count,start_dummy_send,dummy_send,
				start_init_count,init_cmd,start_init_send,init_send,
				init_read,start_init_receive,init_receive,
				load_cmd55,start_send_cmd55,send_cmd55,
				read_response_cmd55,start_receive_response_cmd55,receive_response_cmd55,
				load_acmd41,start_send_acmd41,send_acmd41,
				read_response_acmd41,start_receive_response_acmd41,receive_response_acmd41,
				
				send_reset_sd_clk_rampup,start_sd_clk_rampup,sd_clk_rampup,
				
				load_cmd16,start_send_cmd16,send_cmd16,
				read_response_cmd16,start_receive_response_cmd16,receive_response_cmd16,
				idle,
				load_cmd,start_send_part,send_part,
				read_response,start_receive_response,receive_response,
				wait_data,start_read_data_part,read_data_part,
				start_read_data,read_data,
				buffer_data,
				start_read_data2,read_data2,
				buffer_data2,
				failure_state);
	signal state : trans_state;
	signal send,write_enable,busy_spi,mosi_spi,slave_select,dummy_signal : std_logic;
	signal write_in, spi_output : std_logic_vector(7 downto 0);
	signal output_reg,new_output_reg : std_logic_vector(11 downto 0);
	signal new_data,mosi_high,sig_send,send_switch,send_reset : std_logic;
	signal address_buf : std_logic_vector(7 downto 0);
	signal send_cnt,new_send_cnt : unsigned(3 downto 0);
	signal address_change,data_read : std_logic;
	signal sd_clk,divide_clock : std_logic;
	signal went_to_next, go_to_next : std_logic;
	signal state_debug_sig : std_logic_vector(6 downto 0);
	signal in_failure : std_logic;
begin

	state_debug(7) <= in_failure;

	state_debug(6 downto 0) <= state_debug_sig;

	spi_output_debug <= spi_output;

spi5:	spi port map(sd_clk,send,reset,write_enable,write_in,spi_output,busy_spi,sclk,mosi_spi,miso,dummy_signal);

	output <= output_reg;
	
	sd_clk <= div_clk when (divide_clock = '1') else clk;
	--sd_clk <= div_clk;
	
	address_change <= '0' when (((address_buf and address) = address) and ((not address_buf and not address) = not address)) else
				'1';

	process(data_read,sd_clk)
	begin
	if(data_read = '1') then
		new_data <= '0';
	else
		if(rising_edge(sd_clk)) then
			if(address_change = '1') then
				new_data <= '1';
			else
				new_data <= new_data;
			end if;
		end if;
	end if;
	end process;
	
	send <= sig_send and (not send_switch);
	
	process(busy_spi,send_reset)
	begin
		if(send_reset = '1') then
			send_switch <= '0';
		else	
			if(rising_edge(busy_spi)) then
				send_switch <= '1';
			end if;
		end if;
	end process;

	mosi <= '1' when (mosi_high = '1') else	mosi_spi;
	--mosi <= '1' when (mosi_high = '1') else sd_clk;
	ss <= slave_select;
	
	process(sd_clk,reset)
	begin
		if(reset = '1') then
			output_reg <= (others => '0');
		else
			if(rising_edge(sd_clk)) then
				output_reg <= new_output_reg;
			end if;
		end if;
	end process;
	
	process(next_state,went_to_next)
	begin
	if(went_to_next = '1') then
		go_to_next <= '0';
	else
		if(rising_edge(next_state)) then
			go_to_next <= '1';
		end if;
	end if;
	end process;
	
	process(sd_clk,reset)
	begin
		if(reset = '1') then
			send_cnt <= (others => '0');
		else
			if(rising_edge(sd_clk)) then
			--if(go_to_next = '1' or state_debug_sig(6) = '0') then
			if(go_to_next = '1') then
				send_cnt <= new_send_cnt;
			end if;
			end if;
		end if;
	end process;
	
	process(sd_clk,reset,go_to_next)
		begin
		if(reset = '1') then
			state <= reset_state;
			address_buf <= (others => '0');
			went_to_next <= '0';
		else
		--if(go_to_next = '1' or state_debug_sig(6) = '0') then
		--if(go_to_next = '1') then
			if rising_edge(sd_clk)  then
				went_to_next <= '1';
				address_buf <= address;
				case state is 
					when reset_state =>
						if(reset = '0') then
							state <= dummy_count;
						else
							state <= reset_state;
						end if;
					when dummy_count =>
						if(send_cnt = "1010") then 
							state <= start_init_count;
						else
							state <= start_dummy_send;
						end if;
					when start_dummy_send =>
						state <= dummy_send;
					when dummy_send =>
						if(busy_spi = '0') then 
							state <= dummy_count;
						else
							state <= dummy_send;
						end if;
					when start_init_count =>
						state <= init_cmd;
					when init_cmd =>
						if(send_cnt = "0110") then
							state <= init_read;
						else
							state <= start_init_send;
						end if;
					when start_init_send =>
						state <= init_send;
					when init_send => 
						if(busy_spi = '0') then
							state <= init_cmd;
						else
							state <= init_send;
						end if;
					when init_read => 
						if(spi_output = "00000001") then
							state <= load_cmd55;
						elsif(spi_output = "11111111") then
							state <= start_init_receive;
						else
							state <= failure_state;
						end if;
					when start_init_receive =>
						state <= init_receive;
					when init_receive =>
						if(busy_spi = '0') then
							state <= init_read;
						else
							state <= init_receive;
						end if;
						
					when load_cmd55 =>
						if(send_cnt = "0101") then
							state <= read_response_cmd55;
						else
							state <= start_send_cmd55;
						end if;
					when start_send_cmd55 =>
						state <= send_cmd55;
					when send_cmd55 =>
						if(busy_spi = '0') then
							state <= load_cmd55;
						else
							state <= send_cmd55;
						end if;
					when read_response_cmd55 =>
						if(spi_output = "00000001") then
							state <= load_acmd41;
						elsif(spi_output = "00000000") then
							state <= load_acmd41;
						elsif(spi_output = "11111111") then
							state <= start_receive_response_cmd55;
						else
							state <= failure_state;
						end if;
					when start_receive_response_cmd55 =>
						state <= receive_response_cmd55;
					when receive_response_cmd55 =>
						if(busy_spi = '0') then
							state <= read_response_cmd55;
						else
							state <= receive_response_cmd55;
						end if;
						
					when load_acmd41 =>
						if(send_cnt = "0101") then
							state <= read_response_acmd41;
						else
							state <= start_send_acmd41;
						end if;
					when start_send_acmd41 =>
						state <= send_acmd41;
					when send_acmd41 =>
						if(busy_spi = '0') then
							state <= load_acmd41;
						else
							state <= send_acmd41;
						end if;
					when read_response_acmd41 =>
						if(spi_output = "00000001") then
							state <= load_cmd55;
						elsif(spi_output = "00000000") then
							state <= send_reset_sd_clk_rampup;
						elsif(spi_output = "11111111") then
							state <= start_receive_response_acmd41;
						else
							state <= failure_state;
						end if;
					when start_receive_response_acmd41 =>
						state <= receive_response_acmd41;
					when receive_response_acmd41 =>
						if(busy_spi = '0') then
							state <= read_response_acmd41;
						else
							state <= receive_response_acmd41;
						end if;
						
					when send_reset_sd_clk_rampup =>
						state <= start_sd_clk_rampup;
					when start_sd_clk_rampup =>
						state <= sd_clk_rampup;						
					when sd_clk_rampup =>
						if(busy_spi = '0') then
							state <= load_cmd16;
						else
							state <= sd_clk_rampup;
						end if;
						
					when load_cmd16 =>
						if(send_cnt = "0101") then
							state <= read_response_cmd16;
						else
							state <= start_send_cmd16;
						end if;
					when start_send_cmd16 =>
						state <= send_cmd16;
					when send_cmd16 =>
						if(busy_spi = '0') then
							state <= load_cmd16;
						else
							state <= send_cmd16;
						end if;
					when read_response_cmd16 =>
						if(spi_output = "00000000") then
							state <= idle;
						elsif(spi_output = "11111111") then
							state <= start_receive_response_cmd16;
						else
							state <= failure_state;
						end if;
					when start_receive_response_cmd16 =>
						state <= receive_response_cmd16;
					when receive_response_cmd16 =>
						if(busy_spi = '0') then
							state <= read_response_cmd16;
						else
							state <= receive_response_cmd16;
						end if;
						
					when idle =>
						if(new_data = '1') then
							state <= load_cmd;
						else
							state <= idle;
						end if;
					when load_cmd =>
						if(send_cnt = "0101") then
							state <= read_response;
						else
							state <= start_send_part;
						end if;
					when start_send_part =>
						state <= send_part;
					when send_part =>
						if(busy_spi = '0') then
							state <= load_cmd;
						else
							state <= send_part;
						end if;
					when read_response =>
						if(spi_output = "00000000") then
							state <= start_read_data_part;
						elsif(spi_output = "11111111") then
							state <= start_receive_response;
						else
							state <= failure_state;
						end if;
					when start_receive_response =>
						state <= receive_response;
					when receive_response =>
						if(busy_spi = '0') then
							state <= read_response;
						else
							state <= receive_response;
						end if;
					when wait_data =>
						if(spi_output = "11111110") then
							state <= start_read_data;
						elsif(spi_output = "11111111") then
							state <= start_read_data_part;
						else
							state <= failure_state;
						end if;
					when start_read_data_part =>
						state <= read_data_part;
					when read_data_part =>
						if(busy_spi = '0') then
							state <= wait_data;
						else
							state <= read_data_part;
						end if;
					when start_read_data =>
						state <= read_data;
					when read_data =>
						if(busy_spi = '0') then
							state <= buffer_data;
						else
							state <= read_data;
						end if;
					when buffer_data =>
						state <= start_read_data2;
					when start_read_data2 =>
						state <= read_data2;
					when read_data2 =>
						if(busy_spi = '0') then
							state <= buffer_data2;
						else
							state <= read_data2;
						end if;
					when buffer_data2 =>
						state <= idle;
					when failure_state =>
						state <= failure_state;
				end case;	
			end if;	
		--else 
		--	state <= state;
		--	went_to_next <= '0';
		--end if;
		end if;
	end process;
	
	process(state,send_cnt,output_reg,address,spi_output,state_debug_sig)
	begin
		case state is 
			when reset_state =>
				slave_select <= '1';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= (others => '0');
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0000001";
				in_failure <= '0';
			when dummy_count =>
				slave_select <= '1';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '0';
				new_send_cnt <= send_cnt + 1;
				write_in <= "01000100";
				busy <= '1';
				new_output_reg <= (others => '0');
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0000010";
				in_failure <= '0';
			when start_dummy_send =>
				slave_select <= '1';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= send_cnt;
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= (others => '0');
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0000011";
				in_failure <= '0';
			when dummy_send =>
				slave_select <= '1';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= send_cnt;
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= (others => '0');
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0000100";
				in_failure <= '0';
			when start_init_count =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= (others => '0');
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0000101";
				in_failure <= '0';
			when init_cmd =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '1';
				new_send_cnt <= send_cnt + 1;
				case send_cnt is
					when "0000" =>
						write_in <= "01000000";
					when "0001" =>
						write_in <= "00000000";
					when "0010" =>
						write_in <= "00000000";
					when "0011" =>
						write_in <= "00000000";
					when "0100" =>
						write_in <= "00000000";
					when "0101" =>
						write_in <= "10010101";
					when "0110" =>
						write_in <= "11111111";
					when others =>
						write_in <= "01000010";
				end case;
				busy <= '1';
				new_output_reg <= (others => '0');
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0000110";
				in_failure <= '0';
			when start_init_send =>
				slave_select <= '0';
				mosi_high <= '0';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= send_cnt;
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg <= (others => '0');
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0000111";
				in_failure <= '0';
			when init_send =>
				slave_select <= '0';
				mosi_high <= '0';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= send_cnt;
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg <= (others => '0');
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0001000";
				in_failure <= '0';
			when init_read =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg <= (others => '0');
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0001001";
				in_failure <= '0';
			when start_init_receive =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg <= (others => '0');
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0001010";
				in_failure <= '0';
			when init_receive =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg <= (others => '0');
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0001011";
				in_failure <= '0';
				
			when load_cmd55 =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '1';
				new_send_cnt <= send_cnt + 1;
				case send_cnt is
					when "0000" =>
						write_in <= "01110111";
					when "0001" =>
						write_in <= "00000000";
					when "0010" =>
						write_in <= "00000000";
					when "0011" =>
						write_in <= "00000000";
					when "0100" =>
						write_in <= "00000000";
					when "0101" =>
						write_in <= "11111111";
					when others =>
						write_in <= "01000010";
				end case;
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0010101";
				in_failure <= '0';
			when start_send_cmd55 =>
				slave_select <= '0';
				mosi_high <= '0';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= send_cnt;
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0010110";
				in_failure <= '0';
			when send_cmd55 =>
				slave_select <= '0';
				mosi_high <= '0';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= send_cnt;
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0010111";
				in_failure <= '0';
			when read_response_cmd55 =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0011000";
				in_failure <= '0';
			when start_receive_response_cmd55 =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0011001";
				in_failure <= '0';
			when receive_response_cmd55 =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0011010";
				in_failure <= '0';
				
			when load_acmd41 =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '1';
				new_send_cnt <= send_cnt + 1;
				case send_cnt is
					when "0000" =>
						write_in <= "01101001";
					when "0001" =>
						write_in <= "01000000";
					when "0010" =>
						write_in <= "00000000";
					when "0011" =>
						write_in <= "00000000";
					when "0100" =>
						write_in <= "00000000";
					when "0101" =>
						write_in <= "11111111";
					when others =>
						write_in <= "01000010";
				end case;
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0011011";
				in_failure <= '0';
			when start_send_acmd41 =>
				slave_select <= '0';
				mosi_high <= '0';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= send_cnt;
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0011100";
				in_failure <= '0';
			when send_acmd41 =>
				slave_select <= '0';
				mosi_high <= '0';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= send_cnt;
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0011101";
				in_failure <= '0';
			when read_response_acmd41 =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0011110";
				in_failure <= '0';
			when start_receive_response_acmd41 =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0011111";
				in_failure <= '0';
			when receive_response_acmd41 =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= "0100000";
				in_failure <= '0';
				
				when send_reset_sd_clk_rampup =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '0';
				new_send_cnt <= send_cnt;
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= (others => '0');
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "0100010";
				in_failure <= '1';
			when start_sd_clk_rampup =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= send_cnt;
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= (others => '0');
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "0100010";
				in_failure <= '1';
			when sd_clk_rampup =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= send_cnt;
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= (others => '0');
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "0100001";
				in_failure <= '1';
				
			when load_cmd16 =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '1';
				new_send_cnt <= send_cnt + 1;
				case send_cnt is
					when "0000" =>
						write_in <= "01010000";
					when "0001" =>
						write_in <= "00000000";
					when "0010" =>
						write_in <= "00000000";
					when "0011" =>
						write_in <= "00000000";
					when "0100" =>
						write_in <= "00000010";
					when "0101" =>
						write_in <= "11111111";
					when others =>
						write_in <= "01000010";
				end case;
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "0100001";
				in_failure <= '0';
			when start_send_cmd16 =>
				slave_select <= '0';
				mosi_high <= '0';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= send_cnt;
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "0100010";
				in_failure <= '0';
			when send_cmd16 =>
				slave_select <= '0';
				mosi_high <= '0';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= send_cnt;
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "0100011";
				in_failure <= '0';
			when read_response_cmd16 =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "0100100";
				in_failure <= '0';
			when start_receive_response_cmd16 =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "0100101";
				in_failure <= '0';
			when receive_response_cmd16 =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "0100110";
				in_failure <= '0';
				
			when idle =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '0';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "1000001";
				in_failure <= '0';
			when load_cmd =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '1';
				new_send_cnt <= send_cnt + 1;
				case send_cnt is
					when "0000" =>
						write_in <= "01010001";
					when "0001" =>
						write_in <= "00000000";
					when "0010" =>
						write_in <= "00000000";
					when "0011" =>
						write_in <= "00000001";
					when "0100" =>
						write_in <= address;
					when "0101" =>
						write_in <= "11111111";
					when others =>
						write_in <= "01000010";
				end case;
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "1000010";
				in_failure <= '0';
			when start_send_part =>
				slave_select <= '0';
				mosi_high <= '0';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= send_cnt;
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "1000011";
				in_failure <= '0';
			when send_part =>
				slave_select <= '0';
				mosi_high <= '0';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= send_cnt;
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "1000100";
				in_failure <= '0';
			when read_response =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "1000101";
				in_failure <= '0';
			when start_receive_response =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "1000110";
				in_failure <= '0';
			when receive_response =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "1000111";
				in_failure <= '0';
			when wait_data =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "1001000";
				in_failure <= '0';
			when start_read_data_part =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "1001001";
				in_failure <= '0';
			when read_data_part =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "1001010";
				in_failure <= '0';
			when start_read_data =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "1001011";
				in_failure <= '0';
			when read_data =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "1001100";
				in_failure <= '0';
			when buffer_data =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg(11 downto 8) <= spi_output(3 downto 0);
				new_output_reg(7 downto 0) <= (others => '0');
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "1001101";
				in_failure <= '0';
			when start_read_data2 =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "1001110";
				in_failure <= '0';
			when read_data2 =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '1';
				send_reset <= '0';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";
				busy <= '1';
				new_output_reg <= output_reg;
				data_read <= '0';
				divide_clock <= '0';
				state_debug_sig <= "1001111";
				in_failure <= '0';
			when buffer_data2 =>
				slave_select <= '0';
				mosi_high <= '1';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg(11 downto 8) <= output_reg(11 downto 8);
				new_output_reg(7 downto 0) <= spi_output;
				data_read <= '1';
				divide_clock <= '0';
				state_debug_sig <= "1010000";
				in_failure <= '0';
			when failure_state =>
				slave_select <= '1';
				mosi_high <= '0';
				sig_send <= '0';
				send_reset <= '1';
				write_enable <= '0';
				new_send_cnt <= (others => '0');
				write_in <= "11111111";	
				busy <= '1';
				new_output_reg(11 downto 8) <= "0000";
				new_output_reg(7 downto 0) <= spi_output;
				data_read <= '0';
				divide_clock <= '1';
				state_debug_sig <= state_debug_sig;
				in_failure <= '1';
		end case;
	end process;

end behavioural;
