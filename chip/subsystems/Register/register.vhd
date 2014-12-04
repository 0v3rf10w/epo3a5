package IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

----------------------------------------------------------------------------------------------------
--Register A (RA)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
entity reg_A is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic;
        reg_out : out std_logic_vector(7 downto 0));
end entity register;

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
entity reg_1 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity register;

architecture behaviour of reg_1 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0)=1) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 2 (R2)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
entity reg_2 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity register;

architecture behaviour of reg_2 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0)=2) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 3 (R3)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
entity reg_3 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity register;

architecture behaviour of reg_3 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0)=3) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 4 (R4)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
entity reg_4 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity register;

architecture behaviour of reg_4 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0)=4) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 5 (R5)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
entity reg_5 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity register;

architecture behaviour of reg_5 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0)=5) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 6 (R6)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
entity reg_6 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity register;

architecture behaviour of reg_6 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0)=6) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 7 (R7)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
entity reg_7 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity register;

architecture behaviour of reg_7 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0)=7) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 8 (R8)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
entity reg_8 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity register;

architecture behaviour of reg_8 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0)=8) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 9 (R9)-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
entity reg_9 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity register;

architecture behaviour of reg_9 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0)=9) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;

----------------------------------------------------------------------------------------------------
--Register 10 (R10)---------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
entity reg_10 is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity register;

architecture behaviour of reg_10 is
begin
  process(reg_clk, reg_rst)
  begin
    if (reg_rst = '1') then
      reg_out <= "00000000";
    elsif (reg_clk'event AND reg_clk='1' AND reg_ld(4)='1' AND (unsigned(reg_ld(3 downto 0)=10) then
      reg_out <= reg_in;
    end if;
  end process;
end architecture;