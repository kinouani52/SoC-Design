--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: intro_test_stimulus.vhd
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


library ieee;
use ieee.std_logic_1164.all;

entity intro_test_stimulus is
end intro_test_stimulus;

architecture behavioral of intro_test_stimulus is

    constant SYSCLK_PERIOD : time := 100 ns; -- 10MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    component Top
        -- ports
        port( 
            -- Inputs
            SPI_0_DI : in std_logic;
            UART_0_RXD : in std_logic;
            MSS_RESET_N : in std_logic;

            -- Outputs
            SPI_0_DO : out std_logic;
            UART_0_TXD : out std_logic;
            RD : out std_logic_vector(7 downto 0);

            -- Inouts
            SPI_0_CLK : inout std_logic;
            SPI_0_SS : inout std_logic

        );
    end component;

begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '0';
            wait for ( SYSCLK_PERIOD * 10 );
            
            NSYSRESET <= '1';
            wait;
        end if;
    end process;

    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  Top
    Top_0 : Top
        -- port map
        port map( 
            -- Inputs
            SPI_0_DI => '0',
            UART_0_RXD => '0',
            MSS_RESET_N => NSYSRESET,

            -- Outputs
            SPI_0_DO =>  open,
            UART_0_TXD =>  open,
            RD => open,

            -- Inouts
            SPI_0_CLK =>  open,
            SPI_0_SS =>  open

        );

end behavioral;

