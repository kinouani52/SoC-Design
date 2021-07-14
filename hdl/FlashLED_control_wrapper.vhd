--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: FlashLED_control_wrapper.vhd
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



entity FlashLED_control_wrapper is
port (
   PCLK: IN std_logic;
 PRESET: IN std_logic;
 PADDR : IN std_logic_vector (7 downto 0);
 PWDATA : IN std_logic_vector (7 downto 0);
 PENABLE: IN std_logic;
 PWRITE: IN std_logic;
 PREADY: OUT std_logic;
 PSEL: IN std_logic;
 PSLVERR: OUT std_logic;

 RD : OUT std_logic_vector (7 downto 0)
);

end FlashLED_control_wrapper;
architecture architecture_FlashLED_control_wrapper of FlashLED_control_wrapper is
   -- signal, component etc. declarations
            signal aux1 : std_logic;
component FlashLED_control is
port (
 WD : in std_logic_vector (7 downto 0);
 RD : out std_logic_vector (7 downto 0);
 WEN : in std_logic;
 WADDR : in std_logic_vector (7 downto 0);
 RWCLK : in std_logic
 );
end component;

begin
aux1 <= PSEL and PWRITE;
PREADY <= '1';
M1: FlashLED_control port map (WD => PWDATA, RD => RD, WEN => aux1, WADDR=> PADDR, RWCLK => PCLK);

 -- architecture body
   -- architecture body
end architecture_FlashLED_control_wrapper;
