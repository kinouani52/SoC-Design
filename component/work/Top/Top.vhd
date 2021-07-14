----------------------------------------------------------------------
-- Created by SmartDesign Tue Dec 08 09:10:13 2020
-- Version: v11.9 SP2 11.9.2.1
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion;
use smartfusion.all;
library COREAPB3_LIB;
use COREAPB3_LIB.all;
use COREAPB3_LIB.components.all;
library CORETIMER_LIB;
use CORETIMER_LIB.all;
----------------------------------------------------------------------
-- Top entity declaration
----------------------------------------------------------------------
entity Top is
    -- Port list
    port(
        -- Inputs
        MSS_RESET_N : in    std_logic;
        SPI_0_DI    : in    std_logic;
        UART_0_RXD  : in    std_logic;
        -- Outputs
        RD          : out   std_logic_vector(7 downto 0);
        SPI_0_DO    : out   std_logic;
        UART_0_TXD  : out   std_logic;
        -- Inouts
        SPI_0_CLK   : inout std_logic;
        SPI_0_SS    : inout std_logic
        );
end Top;
----------------------------------------------------------------------
-- Top architecture body
----------------------------------------------------------------------
architecture RTL of Top is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- CoreAPB3   -   Actel:DirectCore:CoreAPB3:4.1.100
-- using entity instantiation for component CoreAPB3
-- CoreTimer   -   Actel:DirectCore:CoreTimer:2.0.103
component CoreTimer
    generic( 
        FAMILY     : integer := 18 ;
        INTACTIVEH : integer := 1 ;
        WIDTH      : integer := 32 
        );
    -- Port list
    port(
        -- Inputs
        PADDR   : in  std_logic_vector(4 downto 2);
        PCLK    : in  std_logic;
        PENABLE : in  std_logic;
        PRESETn : in  std_logic;
        PSEL    : in  std_logic;
        PWDATA  : in  std_logic_vector(31 downto 0);
        PWRITE  : in  std_logic;
        -- Outputs
        PRDATA  : out std_logic_vector(31 downto 0);
        TIMINT  : out std_logic
        );
end component;
-- FlashLED_control_wrapper
-- using entity instantiation for component FlashLED_control_wrapper
-- Intro
component Intro
    -- Port list
    port(
        -- Inputs
        FABINT      : in    std_logic;
        MSSPRDATA   : in    std_logic_vector(31 downto 0);
        MSSPREADY   : in    std_logic;
        MSSPSLVERR  : in    std_logic;
        MSS_RESET_N : in    std_logic;
        SPI_0_DI    : in    std_logic;
        UART_0_RXD  : in    std_logic;
        -- Outputs
        FAB_CLK     : out   std_logic;
        M2F_RESET_N : out   std_logic;
        MSSPADDR    : out   std_logic_vector(19 downto 0);
        MSSPENABLE  : out   std_logic;
        MSSPSEL     : out   std_logic;
        MSSPWDATA   : out   std_logic_vector(31 downto 0);
        MSSPWRITE   : out   std_logic;
        SPI_0_DO    : out   std_logic;
        UART_0_TXD  : out   std_logic;
        -- Inouts
        SPI_0_CLK   : inout std_logic;
        SPI_0_SS    : inout std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal CoreAPB3_0_APBmslave0_PENABLE  : std_logic;
signal CoreAPB3_0_APBmslave0_PREADY   : std_logic;
signal CoreAPB3_0_APBmslave0_PSELx    : std_logic;
signal CoreAPB3_0_APBmslave0_PWRITE   : std_logic;
signal CoreAPB3_0_APBmslave1_PRDATA   : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave1_PSELx    : std_logic;
signal CoreTimer_0_TIMINT             : std_logic;
signal Intro_0_FAB_CLK                : std_logic;
signal Intro_0_M2F_RESET_N            : std_logic;
signal Intro_0_MSS_MASTER_APB_PENABLE : std_logic;
signal Intro_0_MSS_MASTER_APB_PRDATA  : std_logic_vector(31 downto 0);
signal Intro_0_MSS_MASTER_APB_PREADY  : std_logic;
signal Intro_0_MSS_MASTER_APB_PSELx   : std_logic;
signal Intro_0_MSS_MASTER_APB_PSLVERR : std_logic;
signal Intro_0_MSS_MASTER_APB_PWDATA  : std_logic_vector(31 downto 0);
signal Intro_0_MSS_MASTER_APB_PWRITE  : std_logic;
signal RD_net_0                       : std_logic_vector(7 downto 0);
signal SPI_0_DO_net_0                 : std_logic;
signal UART_0_TXD_net_0               : std_logic;
signal SPI_0_DO_net_1                 : std_logic;
signal UART_0_TXD_net_1               : std_logic;
signal RD_net_1                       : std_logic_vector(7 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                        : std_logic;
signal VCC_net                        : std_logic;
signal IADDR_const_net_0              : std_logic_vector(31 downto 0);
signal PRDATAS0_const_net_0           : std_logic_vector(31 downto 0);
signal PRDATAS2_const_net_0           : std_logic_vector(31 downto 0);
signal PRDATAS3_const_net_0           : std_logic_vector(31 downto 0);
signal PRDATAS4_const_net_0           : std_logic_vector(31 downto 0);
signal PRDATAS5_const_net_0           : std_logic_vector(31 downto 0);
signal PRDATAS6_const_net_0           : std_logic_vector(31 downto 0);
signal PRDATAS7_const_net_0           : std_logic_vector(31 downto 0);
signal PRDATAS8_const_net_0           : std_logic_vector(31 downto 0);
signal PRDATAS9_const_net_0           : std_logic_vector(31 downto 0);
signal PRDATAS10_const_net_0          : std_logic_vector(31 downto 0);
signal PRDATAS11_const_net_0          : std_logic_vector(31 downto 0);
signal PRDATAS12_const_net_0          : std_logic_vector(31 downto 0);
signal PRDATAS13_const_net_0          : std_logic_vector(31 downto 0);
signal PRDATAS14_const_net_0          : std_logic_vector(31 downto 0);
signal PRDATAS15_const_net_0          : std_logic_vector(31 downto 0);
signal PRDATAS16_const_net_0          : std_logic_vector(31 downto 0);
----------------------------------------------------------------------
-- Bus Interface Nets Declarations - Unequal Pin Widths
----------------------------------------------------------------------
signal CoreAPB3_0_APBmslave0_PADDR    : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_1_4to2: std_logic_vector(4 downto 2);
signal CoreAPB3_0_APBmslave0_PADDR_1  : std_logic_vector(4 downto 2);
signal CoreAPB3_0_APBmslave0_PADDR_0_7to0: std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_0  : std_logic_vector(7 downto 0);

signal CoreAPB3_0_APBmslave0_PWDATA   : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_0_7to0: std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_0 : std_logic_vector(7 downto 0);

signal Intro_0_MSS_MASTER_APB_PADDR_0_31to20: std_logic_vector(31 downto 20);
signal Intro_0_MSS_MASTER_APB_PADDR_0_19to0: std_logic_vector(19 downto 0);
signal Intro_0_MSS_MASTER_APB_PADDR_0 : std_logic_vector(31 downto 0);
signal Intro_0_MSS_MASTER_APB_PADDR   : std_logic_vector(19 downto 0);


begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net               <= '0';
 VCC_net               <= '1';
 IADDR_const_net_0     <= B"00000000000000000000000000000000";
 PRDATAS0_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS2_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS3_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS4_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS5_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS6_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS7_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS8_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS9_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS10_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS11_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS12_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS13_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS14_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS15_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS16_const_net_0 <= B"00000000000000000000000000000000";
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 SPI_0_DO_net_1   <= SPI_0_DO_net_0;
 SPI_0_DO         <= SPI_0_DO_net_1;
 UART_0_TXD_net_1 <= UART_0_TXD_net_0;
 UART_0_TXD       <= UART_0_TXD_net_1;
 RD_net_1         <= RD_net_0;
 RD(7 downto 0)   <= RD_net_1;
----------------------------------------------------------------------
-- Bus Interface Nets Assignments - Unequal Pin Widths
----------------------------------------------------------------------
 CoreAPB3_0_APBmslave0_PADDR_1_4to2(4 downto 2) <= CoreAPB3_0_APBmslave0_PADDR(4 downto 2);
 CoreAPB3_0_APBmslave0_PADDR_1 <= ( CoreAPB3_0_APBmslave0_PADDR_1_4to2(4 downto 2) );
 CoreAPB3_0_APBmslave0_PADDR_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(7 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_0 <= ( CoreAPB3_0_APBmslave0_PADDR_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave0_PWDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_0 <= ( CoreAPB3_0_APBmslave0_PWDATA_0_7to0(7 downto 0) );

 Intro_0_MSS_MASTER_APB_PADDR_0_31to20(31 downto 20) <= B"000000000000";
 Intro_0_MSS_MASTER_APB_PADDR_0_19to0(19 downto 0) <= Intro_0_MSS_MASTER_APB_PADDR(19 downto 0);
 Intro_0_MSS_MASTER_APB_PADDR_0 <= ( Intro_0_MSS_MASTER_APB_PADDR_0_31to20(31 downto 20) & Intro_0_MSS_MASTER_APB_PADDR_0_19to0(19 downto 0) );

----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CoreAPB3_0   -   Actel:DirectCore:CoreAPB3:4.1.100
CoreAPB3_0 : entity COREAPB3_LIB.CoreAPB3
    generic map( 
        APB_DWIDTH      => ( 32 ),
        APBSLOT0ENABLE  => ( 1 ),
        APBSLOT1ENABLE  => ( 1 ),
        APBSLOT2ENABLE  => ( 0 ),
        APBSLOT3ENABLE  => ( 0 ),
        APBSLOT4ENABLE  => ( 0 ),
        APBSLOT5ENABLE  => ( 0 ),
        APBSLOT6ENABLE  => ( 0 ),
        APBSLOT7ENABLE  => ( 0 ),
        APBSLOT8ENABLE  => ( 0 ),
        APBSLOT9ENABLE  => ( 0 ),
        APBSLOT10ENABLE => ( 0 ),
        APBSLOT11ENABLE => ( 0 ),
        APBSLOT12ENABLE => ( 0 ),
        APBSLOT13ENABLE => ( 0 ),
        APBSLOT14ENABLE => ( 0 ),
        APBSLOT15ENABLE => ( 0 ),
        FAMILY          => ( 18 ),
        IADDR_OPTION    => ( 0 ),
        MADDR_BITS      => ( 12 ),
        SC_0            => ( 0 ),
        SC_1            => ( 0 ),
        SC_2            => ( 0 ),
        SC_3            => ( 0 ),
        SC_4            => ( 0 ),
        SC_5            => ( 0 ),
        SC_6            => ( 0 ),
        SC_7            => ( 0 ),
        SC_8            => ( 0 ),
        SC_9            => ( 0 ),
        SC_10           => ( 0 ),
        SC_11           => ( 0 ),
        SC_12           => ( 0 ),
        SC_13           => ( 0 ),
        SC_14           => ( 0 ),
        SC_15           => ( 0 ),
        UPR_NIBBLE_POSN => ( 7 )
        )
    port map( 
        -- Inputs
        PRESETN    => GND_net, -- tied to '0' from definition
        PCLK       => GND_net, -- tied to '0' from definition
        PWRITE     => Intro_0_MSS_MASTER_APB_PWRITE,
        PENABLE    => Intro_0_MSS_MASTER_APB_PENABLE,
        PSEL       => Intro_0_MSS_MASTER_APB_PSELx,
        PREADYS0   => CoreAPB3_0_APBmslave0_PREADY,
        PSLVERRS0  => GND_net, -- tied to '0' from definition
        PREADYS1   => VCC_net, -- tied to '1' from definition
        PSLVERRS1  => GND_net, -- tied to '0' from definition
        PREADYS2   => VCC_net, -- tied to '1' from definition
        PSLVERRS2  => GND_net, -- tied to '0' from definition
        PREADYS3   => VCC_net, -- tied to '1' from definition
        PSLVERRS3  => GND_net, -- tied to '0' from definition
        PREADYS4   => VCC_net, -- tied to '1' from definition
        PSLVERRS4  => GND_net, -- tied to '0' from definition
        PREADYS5   => VCC_net, -- tied to '1' from definition
        PSLVERRS5  => GND_net, -- tied to '0' from definition
        PREADYS6   => VCC_net, -- tied to '1' from definition
        PSLVERRS6  => GND_net, -- tied to '0' from definition
        PREADYS7   => VCC_net, -- tied to '1' from definition
        PSLVERRS7  => GND_net, -- tied to '0' from definition
        PREADYS8   => VCC_net, -- tied to '1' from definition
        PSLVERRS8  => GND_net, -- tied to '0' from definition
        PREADYS9   => VCC_net, -- tied to '1' from definition
        PSLVERRS9  => GND_net, -- tied to '0' from definition
        PREADYS10  => VCC_net, -- tied to '1' from definition
        PSLVERRS10 => GND_net, -- tied to '0' from definition
        PREADYS11  => VCC_net, -- tied to '1' from definition
        PSLVERRS11 => GND_net, -- tied to '0' from definition
        PREADYS12  => VCC_net, -- tied to '1' from definition
        PSLVERRS12 => GND_net, -- tied to '0' from definition
        PREADYS13  => VCC_net, -- tied to '1' from definition
        PSLVERRS13 => GND_net, -- tied to '0' from definition
        PREADYS14  => VCC_net, -- tied to '1' from definition
        PSLVERRS14 => GND_net, -- tied to '0' from definition
        PREADYS15  => VCC_net, -- tied to '1' from definition
        PSLVERRS15 => GND_net, -- tied to '0' from definition
        PREADYS16  => VCC_net, -- tied to '1' from definition
        PSLVERRS16 => GND_net, -- tied to '0' from definition
        PADDR      => Intro_0_MSS_MASTER_APB_PADDR_0,
        PWDATA     => Intro_0_MSS_MASTER_APB_PWDATA,
        PRDATAS0   => PRDATAS0_const_net_0, -- tied to X"0" from definition
        PRDATAS1   => CoreAPB3_0_APBmslave1_PRDATA,
        PRDATAS2   => PRDATAS2_const_net_0, -- tied to X"0" from definition
        PRDATAS3   => PRDATAS3_const_net_0, -- tied to X"0" from definition
        PRDATAS4   => PRDATAS4_const_net_0, -- tied to X"0" from definition
        PRDATAS5   => PRDATAS5_const_net_0, -- tied to X"0" from definition
        PRDATAS6   => PRDATAS6_const_net_0, -- tied to X"0" from definition
        PRDATAS7   => PRDATAS7_const_net_0, -- tied to X"0" from definition
        PRDATAS8   => PRDATAS8_const_net_0, -- tied to X"0" from definition
        PRDATAS9   => PRDATAS9_const_net_0, -- tied to X"0" from definition
        PRDATAS10  => PRDATAS10_const_net_0, -- tied to X"0" from definition
        PRDATAS11  => PRDATAS11_const_net_0, -- tied to X"0" from definition
        PRDATAS12  => PRDATAS12_const_net_0, -- tied to X"0" from definition
        PRDATAS13  => PRDATAS13_const_net_0, -- tied to X"0" from definition
        PRDATAS14  => PRDATAS14_const_net_0, -- tied to X"0" from definition
        PRDATAS15  => PRDATAS15_const_net_0, -- tied to X"0" from definition
        PRDATAS16  => PRDATAS16_const_net_0, -- tied to X"0" from definition
        IADDR      => IADDR_const_net_0, -- tied to X"0" from definition
        -- Outputs
        PREADY     => Intro_0_MSS_MASTER_APB_PREADY,
        PSLVERR    => Intro_0_MSS_MASTER_APB_PSLVERR,
        PWRITES    => CoreAPB3_0_APBmslave0_PWRITE,
        PENABLES   => CoreAPB3_0_APBmslave0_PENABLE,
        PSELS0     => CoreAPB3_0_APBmslave0_PSELx,
        PSELS1     => CoreAPB3_0_APBmslave1_PSELx,
        PSELS2     => OPEN,
        PSELS3     => OPEN,
        PSELS4     => OPEN,
        PSELS5     => OPEN,
        PSELS6     => OPEN,
        PSELS7     => OPEN,
        PSELS8     => OPEN,
        PSELS9     => OPEN,
        PSELS10    => OPEN,
        PSELS11    => OPEN,
        PSELS12    => OPEN,
        PSELS13    => OPEN,
        PSELS14    => OPEN,
        PSELS15    => OPEN,
        PSELS16    => OPEN,
        PRDATA     => Intro_0_MSS_MASTER_APB_PRDATA,
        PADDRS     => CoreAPB3_0_APBmslave0_PADDR,
        PWDATAS    => CoreAPB3_0_APBmslave0_PWDATA 
        );
-- CoreTimer_0   -   Actel:DirectCore:CoreTimer:2.0.103
CoreTimer_0 : CoreTimer
    generic map( 
        FAMILY     => ( 18 ),
        INTACTIVEH => ( 1 ),
        WIDTH      => ( 32 )
        )
    port map( 
        -- Inputs
        PCLK    => Intro_0_FAB_CLK,
        PRESETn => Intro_0_M2F_RESET_N,
        PSEL    => CoreAPB3_0_APBmslave1_PSELx,
        PWRITE  => CoreAPB3_0_APBmslave0_PWRITE,
        PENABLE => CoreAPB3_0_APBmslave0_PENABLE,
        PADDR   => CoreAPB3_0_APBmslave0_PADDR_1,
        PWDATA  => CoreAPB3_0_APBmslave0_PWDATA,
        -- Outputs
        TIMINT  => CoreTimer_0_TIMINT,
        PRDATA  => CoreAPB3_0_APBmslave1_PRDATA 
        );
-- FlashLED_control_wrapper_0
FlashLED_control_wrapper_0 : entity work.FlashLED_control_wrapper
    port map( 
        -- Inputs
        PCLK    => Intro_0_FAB_CLK,
        PRESET  => Intro_0_M2F_RESET_N,
        PENABLE => CoreAPB3_0_APBmslave0_PENABLE,
        PWRITE  => CoreAPB3_0_APBmslave0_PWRITE,
        PSEL    => CoreAPB3_0_APBmslave0_PSELx,
        PADDR   => CoreAPB3_0_APBmslave0_PADDR_0,
        PWDATA  => CoreAPB3_0_APBmslave0_PWDATA_0,
        -- Outputs
        PREADY  => CoreAPB3_0_APBmslave0_PREADY,
        PSLVERR => OPEN,
        RD      => RD_net_0 
        );
-- Intro_0
Intro_0 : Intro
    port map( 
        -- Inputs
        MSS_RESET_N => MSS_RESET_N,
        SPI_0_DI    => SPI_0_DI,
        UART_0_RXD  => UART_0_RXD,
        FABINT      => CoreTimer_0_TIMINT,
        MSSPREADY   => Intro_0_MSS_MASTER_APB_PREADY,
        MSSPSLVERR  => Intro_0_MSS_MASTER_APB_PSLVERR,
        MSSPRDATA   => Intro_0_MSS_MASTER_APB_PRDATA,
        -- Outputs
        SPI_0_DO    => SPI_0_DO_net_0,
        UART_0_TXD  => UART_0_TXD_net_0,
        FAB_CLK     => Intro_0_FAB_CLK,
        MSSPSEL     => Intro_0_MSS_MASTER_APB_PSELx,
        MSSPENABLE  => Intro_0_MSS_MASTER_APB_PENABLE,
        MSSPWRITE   => Intro_0_MSS_MASTER_APB_PWRITE,
        M2F_RESET_N => Intro_0_M2F_RESET_N,
        MSSPADDR    => Intro_0_MSS_MASTER_APB_PADDR,
        MSSPWDATA   => Intro_0_MSS_MASTER_APB_PWDATA,
        -- Inouts
        SPI_0_CLK   => SPI_0_CLK,
        SPI_0_SS    => SPI_0_SS 
        );

end RTL;
