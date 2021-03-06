#include "Top_hw_platform.h" //Please, look inside this file the names of your slaves
#include "mss_uart.h"
#include "cortex_nvic.h"
#include "drivers/mss_timer/mss_timer.h"

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

#define CORETIMER_COUNT  0x0000FFFF;
#define CORETIMER_RESET  0;
#define CORETIMER_CONTROL  0X00000003;



void config_CoreTimer ();
void Init();

size_t UART_Polled_Rx
(
    mss_uart_instance_t * this_uart,
    uint8_t * rx_buff,
    size_t buff_size
);

//Local declaration
uint32_t address = 0x00000000;
uint8_t addr;
uint16_t loop_count;
uint32_t ch;
uint8_t i, test;
uint32_t data,num;

//uint32_t timer1_load_value;

//UART 0 - Board USB connection
mss_uart_instance_t * const gp_my_uart = &g_mss_uart0;

/* Fabric Interrupt Handler */
/* This Interrupt handler executes upon the occurrence of
   FPGA interrupt = CoreTimer TIMINT interrupt.
   This function prints the source of the interrupt to the
   hyperterminal */

/*==============================================================================
  Messages displayed over the UART.
 */

const uint8_t g_greeting_msg[] =
"\r\n\r\n\
**********************************************************************\r\n\
***************** SmartFusion MSS SPI Flash example *****************\r\n\
**********************************************************************\r\n\
This example project was elaborated to ESIGELEC SoC course \r\n\
---------------------------------------------------------------------\r\n";
/***************************************************************************/
/** * main function. **/

//FABINT interrupt handler
void Fabric_IRQHandler( void )
{
  MSS_UART_polled_tx_string( gp_my_uart,(const uint8_t*)"\n\r CoreTimer interrupt occurred - FABINT \n\r " );
  addr = 0x10; //Interrupt Register Offset
  *(uint32_t *)(addr + CORETIMER_0) =  CORETIMER_RESET; //This line includes the name of a slave
  NVIC_ClearPendingIRQ(Fabric_IRQn);
}

int main()
{
	//MSS_WD_disable();
	//SystemCoreClockUpdate();


//Enable UART 0 driver

	MSS_UART_init(gp_my_uart,
                       MSS_UART_115200_BAUD,
                       MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT);
    MSS_UART_polled_tx_string(gp_my_uart, g_greeting_msg);

//Enable FABIT interrupt
    NVIC_EnableIRQ(Fabric_IRQn);

//Interrupt initialization
    MSS_TIM1_init( MSS_TIMER_PERIODIC_MODE );

    //timer1_load_value = g_FrequencyPCLK0;
       MSS_TIM1_load_immediate( 0X0000FFFF );
       MSS_TIM1_start();
       MSS_TIM1_enable_irq();


    config_CoreTimer();
    test = 0;
    while(1)
       {

       }
    return 0;
   }


 void config_CoreTimer()
 {

	 data = CORETIMER_COUNT;  //CoreTimer is 32bits data; Load Value
	 addr = 0x00;
	 *(uint32_t *)(addr + CORETIMER_0) =  data;
	 data = CORETIMER_CONTROL;   //Control Register Value
	 addr = 0x08;
	 *(uint32_t *)(addr + CORETIMER_0) =  data;

 }
 __attribute__((__interrupt__)) void Timer1_IRQHandler( void )
 {

	 MSS_UART_polled_tx_string( gp_my_uart,(const uint8_t*)"\n\r Serge \n\r " );


     /* Clear TIM1 interrupt */
     MSS_TIM1_clear_irq();
 }
