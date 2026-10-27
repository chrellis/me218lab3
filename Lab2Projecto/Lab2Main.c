#include <xc.h>
// PIC32MX170F256B Configuration Bit Settings for ME218 operating at 40MHz from internal fast oscillator (8Mhz)

// 'C' source line config statements

// DEVCFG3
#pragma config USERID = 0xFFFF          // Enter Hexadecimal value (Enter Hexadecimal value)
#pragma config PMDL1WAY = OFF           // Peripheral Module Disable Configuration (Allow multiple reconfigurations)
#pragma config IOL1WAY = OFF            // Peripheral Pin Select Configuration (Allow multiple reconfigurations)

// DEVCFG2
#pragma config FPLLIDIV = DIV_2         // PLL Input Divider (2x Divider)
#pragma config FPLLMUL = MUL_20         // PLL Multiplier (20x Multiplier)
#pragma config FPLLODIV = DIV_2         // System PLL Output Clock Divider (PLL Divide by 2)

// DEVCFG1
#pragma config FNOSC = FRCPLL           // Oscillator Selection Bits (Fast RC Osc with PLL)
#pragma config FSOSCEN = OFF            // Secondary Oscillator Enable (Disabled)
#pragma config IESO = OFF               // Internal/External Switch Over (Disabled)
#pragma config POSCMOD = OFF            // Primary Oscillator Configuration (Primary osc disabled)
#pragma config OSCIOFNC = OFF           // CLKO Output Signal Active on the OSCO Pin (Disabled)
#pragma config FPBDIV = DIV_2           // Peripheral Clock Divisor (Pb_Clk is Sys_Clk/2)
#pragma config FCKSM = CSDCMD           // Clock Switching and Monitor Selection (Clock Switch Disable, FSCM Disabled)
#pragma config WDTPS = PS1048576        // Watchdog Timer Postscaler (1:1048576)
#pragma config WINDIS = OFF             // Watchdog Timer Window Enable (Watchdog Timer is in Non-Window Mode)
#pragma config FWDTEN = OFF             // Watchdog Timer Enable (WDT Disabled (SWDTEN Bit Controls))
#pragma config FWDTWINSZ = WINSZ_25     // Watchdog Timer Window Size (Window Size is 25%)

// DEVCFG0
#pragma config JTAGEN = OFF             // JTAG Enable (JTAG Disabled)
#pragma config ICESEL = ICS_PGx1        // ICE/ICD Comm Channel Select (Communicate on PGEC1/PGED1)
#pragma config PWP = OFF                // Program Flash Write Protect (Disable)
#pragma config BWP = OFF                // Boot Flash Write Protect bit (Protection Disabled)
#pragma config CP = OFF                 // Code Protect (Protection Disabled)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.


//	Function Prototypes
int main(void);


int main(void) {
    

// step 0: disable analog on all pins
ANSELA = 0; 
ANSELB = 0;

//step 1: PPS/ map outputs to desired pins + tris
TRISAbits.TRISA0 = 0;
TRISAbits.TRISA1 = 0;
TRISBbits.TRISB14 = 0;

RPA0Rbits.RPA0R = 3;   //ra0 PPS mapping //RPAObits. 
RPA1Rbits.RPA1R = 3;  //ra1 PPS mapping 

//step 3: clear the on bit. step 2 unnecessary
SPI1CONbits.ON = 0;
  
// 4. Clear the receive buffer (Step 4 from your lab sheet)
volatile unsigned int dummy;
dummy = SPI1BUF;

//5: enhanced buff mode 
SPI1CON = 0; 
SPI1CON2 = 0; 
SPI1CONbits.ENHBUF = 1; 

//6: baud rate register
SPI1BRG = 999; // set baud rate

// 7. Clear the SPIROV bit (Step 7 from your lab sheet)
SPI1STATbits.SPIROV = 0;

//8: desired settings
SPI1CONbits.CKE = 0; 
SPI1CONbits.CKP = 1; 
SPI1CONbits.MSTEN = 1; 
SPI1CONbits.MSSEN = 1; 

SPI1CONbits.MODE16 = 1; //previously 0 but i want 16 bit transfers now!

//9:set the on bit
SPI1CONbits.ON = 1;   //turn on SPI, done configuring!

//10: write the data to the buffer
    
while(1){
//const char message[] = "ME218a";
    const uint16_t values[] = {
    0x004D, 0x0045, 0x0032, 0x0031, 0x0038,
    0x804D, 0x8045, 0x8032, 0x8031, 0x8038
};  

for(int i = 0; i < 10; i++) {
    while (SPI1STATbits.SPITBF != 0){ } //wait until shift register is empty
    SPI1BUF = values[i];//wait for SS to go high
}

while (SPI1STATbits.SRMT == 0);

for(volatile unsigned int delay = 0; delay < 3000; delay++) {} 
}
} 








