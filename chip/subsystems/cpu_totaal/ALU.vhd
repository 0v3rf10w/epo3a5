library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity alu is
  port ( alu_A  : in  std_logic_vector(7 downto 0);     -- input A
         alu_B  : in  std_logic_vector(7 downto 0);     -- input B
         opcode : in  std_logic_vector(2 downto 0);     -- opcode
         alu_clk: in  std_logic;                        -- clk
         alu_c  : out std_logic;                        -- flag C
         alu_z  : out std_logic;                        -- flag Z
         alu_y  : out std_logic_vector(7 downto 0));    -- Output result y
end entity alu;

architecture behaviour of alu is
signal op0, op1, op2, c: std_logic;
signal alu_add: std_logic_vector(8 downto 0);

begin
  with opcode select
  alu_y <=  alu_A                                                         	when "000",     -- pass input_A
            alu_A xor alu_B                                               	when "001",     -- xor
            alu_A and alu_B                                              	when "010",     -- and
            "00000000"                                                    	when "011",     -- set C
            "00000000"                                                    	when "100",     -- clr C
            alu_A + alu_B						 							when "101",     -- add
            "00000000"                                                    	when others;
  
  op0 <= opcode(0);
  op1 <= opcode(1);
  op2 <= opcode(2);
  
  alu_add <= (("0" & (alu_A)) + (alu_B));
  
  process(alu_clk)
  begin
    if (alu_clk'event and alu_clk='1') then
      if ((op2='1') and (op1='0') and (op0='0')) or
          ((op2='1') and (op1='0') and (op0='1') and
          ((alu_add) <= "11111111")) then
        alu_c <= '0';
      elsif  ((op2='0') and (op1='1') and (op0='1')) or
              ((op2='1') and (op1='0') and (op0='1') and
              ((alu_add) > "11111111")) then
        alu_c <= '1';
      end if;
    end if;
  end process;
  
  process(alu_clk)
  begin
    if (alu_clk'event and alu_clk='1') then
      if (((alu_A and alu_B) = "00000000") and (op0='0') and (op1='1') and (op2='0')) then
        alu_z <= '1';
      else
        alu_z <= '0';
      end if;
    end if;
  end process;
  
end architecture;
