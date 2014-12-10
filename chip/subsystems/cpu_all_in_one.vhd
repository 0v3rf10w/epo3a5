----------------------------------------------------------------------------------------------------
--------------------------------------Instruction decoder-------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity decoder is
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
end decoder;

architecture behaviour of decoder is
signal  opcode : std_logic_vector(3 downto 0);
signal  argument  : std_logic_vector(7 downto 0);
signal  o0, o1, o2, o3: std_logic;
begin
  opcode <= decoder_in(11 downto 8);
  argument <= decoder_in(7 downto 0);
  o0 <= opcode(0);
  o1 <= opcode(1);
  o2 <= opcode(2);
  o3 <= opcode(3); 

      decoder_pc_ld <=
                        ((NOT o3) AND (NOT o2) AND (NOT o1) AND o0) OR                  -- Jp #
                        ((NOT o3) AND (NOT o2) AND o1 AND (NOT o0)) OR                  -- Jp Ri
                        ((NOT o3) AND (NOT o2) AND o1 AND o0 AND decoder_z) OR          -- Bz
                        ((NOT o3) AND o2 AND (NOT o1) AND (NOT o0) AND decoder_c);      -- Bc
      decoder_pc_inc <= NOT(
                        ((NOT o3) AND (NOT o2) AND (NOT o1) AND o0) OR                  -- Not Jp #
                        ((NOT o3) AND (NOT o2) AND o1 AND (NOT o0)) OR                  -- Not Jp Ri
                        ((NOT o3) AND (NOT o2) AND o1 AND o0 AND decoder_z) OR          -- Not Bz
                        ((NOT o3) AND o2 AND (NOT o1) AND (NOT o0) AND decoder_c));     -- Not Bc
      decoder_ibufoe <=
                        ((NOT o3) AND (NOT o2) AND (NOT o1) and o0) OR                  -- Jp #
                        ((NOT o3) AND (NOT o2) AND o1 AND o0) OR                        -- Bz
                        ((NOT o3) AND o2 AND (NOT o1) AND (NOT o0)) OR                   -- Bc
                        ((NOT o3) AND o2 AND (NOT o1) AND o0) OR                        -- Ld #
                        (o3 AND (NOT o2) AND (NOT o1) AND (NOT o0)) OR                   -- ADD #
                        (o3 AND (NOT o2) AND o1 AND (NOT o0)) OR                         -- XOR #
                        (o3 AND o2 AND (NOT o1) AND (NOT o0));                           -- AND #
      decoder_aregld <=
                        ((NOT o3) AND o2 AND (NOT o1) AND o0) OR                        -- Ld #
                        ((NOT o3) AND o2 AND o1 AND (NOT o0)) OR                         -- Ld Ri
                        (o3 AND (NOT o2) AND (NOT o1) AND (NOT o0)) OR                   -- ADD #
                        (o3 AND (NOT o2) AND (NOT o1) AND o1) OR                        -- ADD Ri
                        (o3 AND (NOT o2) AND o1 AND (NOT o0)) OR                        -- XOR #
                        (o3 AND (NOT o2) AND o1 AND o0) OR                              -- XOR Ri
                        (o3 AND o2 AND (NOT o1) AND (NOT o0)) OR                        -- AND #
                        (o3 AND o2 AND (NOT o1) AND o0);                                -- AND Ri
      decoder_abufoe <=
                        ((NOT o3) AND o2 AND o1 AND o0);                                -- st Ri
      decoder_bregld(4) <=
                        ((NOT o3) AND o2 AND o1 AND o0);                                -- st Ri
      decoder_bregld(3) <= argument(3);
      decoder_bregld(2) <= argument(2);
      decoder_bregld(1) <= argument(1);
      decoder_bregld(0) <= argument(0);
      decoder_bbufoe(4) <=
                        ((NOT o3) AND (NOT o2) AND o1 AND (NOT o0)) OR                  -- jp Ri
                        ((NOT o3) AND o2 AND o1 AND (NOT o0)) OR                        -- ld Ri
                        (o3 AND (NOT o2) AND (NOT o1) AND o0) OR                        -- ADD Ri
                        (o3 AND (NOT o2) AND o1 AND o0) OR                              -- XOR Ri
                        (o3 AND o2 AND (NOT o1) AND o0);                                -- AND Ri
      decoder_bbufoe(3) <= argument(3);
      decoder_bbufoe(2) <= argument(2);
      decoder_bbufoe(1) <= argument(1);
      decoder_bbufoe(0) <= argument(0);
      decoder_alu(2) <= 
                        (o3 AND o2 AND o1 AND o0) OR                                      -- Clr c
                        (o3 AND (NOT o2) AND (NOT o1) AND (NOT o0)) OR                    -- ADD #
                        (o3 AND (NOT o2) AND (NOT o1) AND o0);                            -- ADD Ri
      decoder_alu(1) <=
                        (o3 AND o2 AND (NOT o1) AND (NOT o0)) OR                          -- AND #
                        (o3 AND o2 AND (NOT o1) AND o0) OR                                -- AND Ri
                        (o3 AND o2 AND o1 AND (NOT o0));                                  -- Set c
      decoder_alu(0) <=
                        (o3 AND (NOT o2) AND (NOT o1) AND (NOT o0)) OR                    -- ADD #
                        (o3 AND (NOT o2) AND (NOT o1) AND o0) OR                          -- ADD Ri
                        (o3 AND (NOT o2) AND o1 AND (NOT o0)) OR                          -- XOR #
                        (o3 AND (NOT o2) AND o1 AND o0) OR                                -- XOR Ri
                        (o3 AND o2 AND o1 AND (NOT o0));                                  -- Set c
	decoder_argout <= argument;
end architecture;
----------------------------------------------------------------------------------------------------
---------------------------------------------ALU----------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

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
signal op0, op1, op2: std_logic;
signal c: std_logic_vector(0 downto 0);
begin
  with opcode select
  alu_y <=  alu_A                                                         	when "000",     -- pass input_A
            alu_A xor alu_B                                               	when "001",     -- xor
            alu_A and alu_B                                              	when "010",     -- and
            "00000000"                                                    	when "011",     -- set C
            "00000000"                                                    	when "100",     -- clr C
            std_logic_vector(unsigned(alu_A) + unsigned(alu_B))		 	when "101",     -- add
            "00000000"                                                    	when others;
  
  op0 <= opcode(0);
  op1 <= opcode(1);
  op2 <= opcode(2);
  
  process(alu_clk)
  begin
    if (alu_clk'event and alu_clk='1') then
      if ((op2='1') and (op1='0') and (op0='0')) or
          ((op2='1') and (op1='0') and (op0='1') and
          (unsigned(alu_A)+unsigned(alu_B) < 256)) then
        alu_c <= '0';
      elsif  ((op2='0') and (op1='1') and (op0='1')) or
              ((op2='1') and (op1='0') and (op0='1') and
              (unsigned(alu_A)+unsigned(alu_B) > 255)) then
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
----------------------------------------------------------------------------------------------------
---------------------------------------------Program counter----------------------------------------
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pc_counter is
port ( pc_in  : in  std_logic_vector(7 downto 0);
      pc_inc  : in  std_logic;
      pc_ld   : in  std_logic;
      pc_rst  : in  std_logic;
      pc_clk  : in  std_logic;
      pc_out  : out std_logic_vector(7 downto 0));
end entity pc_counter;

architecture behaviour of pc_counter is
signal count : std_logic_vector(7 downto 0);
begin
  process(pc_in, pc_inc, pc_ld, pc_rst, pc_clk)
  begin
    if (pc_rst='1') then
      count <= "00000000";
    else
      if (pc_clk'event AND pc_clk='1') then
        if (pc_inc='1') then
          count <= count + 1;
        elsif (pc_ld='1') then
          count <= pc_in;
        end if;
      end if;
    end if;
  end process;
  
  pc_out <= count;
  
end architecture;
----------------------------------------------------------------------------------------------------
---------------------------------------------Buffers------------------------------------------------
----------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

----------------------------------------------------------------------------------------------------
--Buffer A (BA)-------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
entity buf_A is
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic;
      buf_out : out std_logic_vector(7 downto 0));
end entity buf_A;

architecture behaviour of buf_A is
begin
  process (buf_in, buf_oe)
  begin
    if (buf_oe = '1') then
      buf_out <= buf_in;
    else
      buf_out <= "ZZZZZZZZ";
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Buffer In (Bin)-------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity buf_i is
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic;
      buf_out : out std_logic_vector(7 downto 0));
end entity buf_i;

architecture behaviour of buf_i is
begin
  process (buf_in, buf_oe)
  begin
    if (buf_oe = '1') then
      buf_out <= buf_in;
    else
      buf_out <= "ZZZZZZZZ";
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Buffer 1 (B1)-------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buf_1 is
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end entity buf_1;

architecture behaviour of buf_1 is
begin
  process (buf_in, buf_oe)
  begin
    if (buf_oe(4) = '1' AND (unsigned(buf_oe(3 downto 0))=1)) then
      buf_out <= buf_in;
    else
      buf_out <= "ZZZZZZZZ";
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Buffer 2 (B2)-------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buf_2 is
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end entity buf_2;

architecture behaviour of buf_2 is
begin
  process (buf_in, buf_oe)
  begin
    if (buf_oe(4) = '1' AND (unsigned(buf_oe(3 downto 0))=2)) then
      buf_out <= buf_in;
    else
      buf_out <= "ZZZZZZZZ";
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Buffer 3 (B3)-------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buf_3 is
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end entity buf_3;

architecture behaviour of buf_3 is
begin
  process (buf_in, buf_oe)
  begin
    if (buf_oe(4) = '1' AND (unsigned(buf_oe(3 downto 0))=3)) then
      buf_out <= buf_in;
    else
      buf_out <= "ZZZZZZZZ";
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Buffer 4 (B4)-------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buf_4 is
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end entity buf_4;

architecture behaviour of buf_4 is
begin
  process (buf_in, buf_oe)
  begin
    if (buf_oe(4) = '1' AND (unsigned(buf_oe(3 downto 0))=4)) then
      buf_out <= buf_in;
    else
      buf_out <= "ZZZZZZZZ";
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Buffer 5 (B5)-------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buf_5 is
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end entity buf_5;

architecture behaviour of buf_5 is
begin
  process (buf_in, buf_oe)
  begin
    if (buf_oe(4) = '1' AND (unsigned(buf_oe(3 downto 0))=5)) then
      buf_out <= buf_in;
    else
      buf_out <= "ZZZZZZZZ";
    end if;
  end process;
end architecture;
 
  ----------------------------------------------------------------------------------------------------
--Buffer 6 (B6)-------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buf_6 is
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end entity buf_6;

architecture behaviour of buf_6 is
begin
  process (buf_in, buf_oe)
  begin
    if (buf_oe(4) = '1' AND (unsigned(buf_oe(3 downto 0))=6)) then
      buf_out <= buf_in;
    else
      buf_out <= "ZZZZZZZZ";
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Buffer 7 (B7)-------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buf_7 is
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end entity buf_7;

architecture behaviour of buf_7 is
begin
  process (buf_in, buf_oe)
  begin
    if (buf_oe(4) = '1' AND (unsigned(buf_oe(3 downto 0))=7)) then
      buf_out <= buf_in;
    else
      buf_out <= "ZZZZZZZZ";
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Buffer 8 (B8)-------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buf_8 is
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end entity buf_8;

architecture behaviour of buf_8 is
begin
  process (buf_in, buf_oe)
  begin
    if (buf_oe(4) = '1' AND (unsigned(buf_oe(3 downto 0))=8)) then
      buf_out <= buf_in;
    else
      buf_out <= "ZZZZZZZZ";
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Buffer 9 (B9)-------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buf_9 is
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end entity buf_9;

architecture behaviour of buf_9 is
begin
  process (buf_in, buf_oe)
  begin
    if (buf_oe(4) = '1' AND (unsigned(buf_oe(3 downto 0))=9)) then
      buf_out <= buf_in;
    else
      buf_out <= "ZZZZZZZZ";
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Buffer 10 (B10)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buf_10 is
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end entity buf_10;

architecture behaviour of buf_10 is
begin
  process (buf_in, buf_oe)
  begin
    if (buf_oe(4) = '1' AND (unsigned(buf_oe(3 downto 0))=10)) then
      buf_out <= buf_in;
    else
      buf_out <= "ZZZZZZZZ";
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Instruction buffer--------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity instr_buf is
port( buf_in  : in  std_logic_vector(11 downto 0);
      buf_oe  : in  std_logic;
      buf_out : out std_logic_vector(11 downto 0));
end entity instr_buf;

architecture behaviour of instr_buf is
begin
  process (buf_in, buf_oe)
  begin
    if (buf_oe = '1') then
      buf_out <= buf_in;
    else
      buf_out <= "ZZZZZZZZZZZZ";
    end if;
  end process;
end architecture;
----------------------------------------------------------------------------------------------------
---------------------------------------------Registers----------------------------------------------
----------------------------------------------------------------------------------------------------

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------------------------------------------------------------------
--Register A (RA)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
entity reg_A is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic;
        reg_out : out std_logic_vector(7 downto 0));
end entity reg_A;

architecture behaviour of reg_A is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld='1') then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 1 (R1)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_1 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity reg_1;

architecture behaviour of reg_1 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND (reg_clk='1') AND (reg_ld(4)='1') AND (unsigned(reg_ld(3 downto 0))=1)) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 2 (R2)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_2 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity reg_2;

architecture behaviour of reg_2 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0))=2)) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 3 (R3)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_3 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity reg_3;

architecture behaviour of reg_3 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0))=3)) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 4 (R4)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_4 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity reg_4;

architecture behaviour of reg_4 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0))=4)) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 5 (R5)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_5 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity reg_5;

architecture behaviour of reg_5 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0))=5)) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 6 (R6)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_6 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity reg_6;

architecture behaviour of reg_6 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0))=6)) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 7 (R7)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_7 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity reg_7;

architecture behaviour of reg_7 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0))=7)) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 8 (R8)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_8 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity reg_8;

architecture behaviour of reg_8 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0))=8)) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 9 (R9)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_9 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity reg_9;

architecture behaviour of reg_9 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0))=9)) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 10 (R10)---------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_10 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity reg_10;

architecture behaviour of reg_10 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0))=10)) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
---------------------------------------------CPU----------------------------------------------------
----------------------------------------------------------------------------------------------------

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