library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
  port ( alu_A  : in  std_logic_vector(7 downto 0);     -- input A
         alu_B  : in  std_logic_vector(7 downto 0);     -- input B
         opcode : in  std_logic_vector(3 downto 0);     -- opcode
         alu_clk: in  std_logic;                        -- clk
         alu_c  : out std_logic;                        -- flag C
         alu_z  : out std_logic;                        -- flag Z
         alu_y  : out std_logic_vector(7 downto 0));    -- Output result y
end entity alu;

architecture behaviour of alu is
signal op0, op1, op2, op3: std_logic;
begin
  with opcode select
  alu_y <=  std_logic_vector((unsigned(alu_A) + unsigned(alu_B)))   			when "0000",     -- add
            alu_A xor alu_B                                               when "0001",     -- xor
            alu_A and alu_B                                               when "0010",     -- and
            alu_A or alu_B                                                when "0011",     -- or
            "00000000"                                                    when "0100",     -- set C
            "00000000"                                                    when "0101",     -- clr C
            alu_A                                                         when "0110",     -- input_A
            alu_B                                                         when "0111",     -- input_B
            "00000000"                                                    when others;
  
  op0 <= opcode(0);
  op1 <= opcode(1);
  op2 <= opcode(2);
  op3 <= opcode(3);
  
  process(alu_clk)
  begin
    if (alu_clk'event and alu_clk='1') then
      if (((op0='1') and (op1='0') and (op2='1') and (op3='0')) or
          ((op0='0') and (op1='0') and (op2='0') and (op3='0') and
          ((unsigned(alu_A)+unsigned(alu_B)) < 256))) then
        alu_c <= '0';
      elsif  (((op0='0') and (op1='0') and (op2='1') and (op3='0')) or
              ((op0='0') and (op1='0') and (op2='0') and (op3='0') and
              ((unsigned(alu_A)+unsigned(alu_B)) > 255))) then
        alu_c <= '1';
      end if;
    end if;
  end process;
  
  process(alu_clk)
  begin
    if (alu_clk'event and alu_clk='1') then
      if ((alu_A and alu_B) = "00000000") then
        alu_z <= '1';
      else
        alu_z <= '0';
      end if;
    end if;
  end process;
end architecture;
