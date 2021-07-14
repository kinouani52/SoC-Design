--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: LED_control.vhd
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
use IEEE.std_logic_1164.all;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
entity LED_control is
port (
 RESET: IN std_logic;
COUNT_END : IN std_logic;
 LED: OUT std_logic_vector(7 downto 0)
);
end LED_control;
architecture architecture_LED_control of LED_control is
 signal addr : std_logic_vector (7 downto 0):="00000000";
begin
LED <= "00000000" when RESET = '0' else addr;
Control: process (COUNT_END)
begin
if (COUNT_END = '1') then
 case addr is
 when "00000000" => addr <= "00000010";
 when "00000010" => addr <= "00000100";
 when "00000100" => addr <= "00001000";
 when "00001000" => addr <= "00010000";
 when "00010000" => addr <= "00100000";
 when "00100000" => addr <= "01000000";
 when "01000000" => addr <= "10000000";
 when "10000000" => addr <= "00000000";
 when others => addr <= "00000000";
 end case;
end if;
end process;
end architecture_LED_control;
