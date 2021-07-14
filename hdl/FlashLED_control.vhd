--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: FlashLED_control.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::SmartFusion> <Die::A2F200M3F> <Package::484 FBGA>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;
library smartfusion;
use smartfusion.all;
use IEEE.std_logic_1164.all;
entity FlashLED_control is
port( WD : in std_logic_vector(7 downto 0);
 RD : out std_logic_vector(7 downto 0);
 WEN : in std_logic;
 WADDR : in std_logic_vector(7 downto 0);
 RWCLK : in std_logic
 );
end FlashLED_control;
architecture architecture_FlashLED_control of FlashLED_control is
 -- signal, component etc. declarations
signal REG_control : std_logic_vector(7 downto 0) ;
 signal REG_load_value : std_logic_vector(7 downto 0) ;
begin
 -- architecture body
Write_REGs: process (WEN, RWCLK)
begin
if ((WEN = '1') and (RWCLK = '1')) then 
    if (WADDR = "00000000") then
      REG_control <= WD;
    else
      REG_load_value <= WD;
    end if;
end if;
end process;
 
Read_REGs: process (RWCLK)
begin
if ((RWCLK = '0') and (REG_control = "00000001")) then
RD <= REG_load_value;
end if;
end process;
end architecture_FlashLED_control;

