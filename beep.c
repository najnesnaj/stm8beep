#include "stm8.h"
#include <string.h>
#define SET(x, y)   (x) |= (y)
#define UNSET(x, y) (x) &= ~(y)
#define READ(x, y)  ((x) & (y))
#define MLX90614_ADDR	0x5a
#define I2C_READ        1
#define I2C_WRITE       0

#define MIN_CURRENT 10


typedef unsigned char u8;

typedef struct {        // real time information field structure 
	u8 second;  
	u8 minute;  
	u8 hour;  
	u8 day;  
	long ticker; 
} st_time; 

st_time real_time;


typedef unsigned char UCHAR;
void delayTenMicro (void) {
	char a;
	for (a = 0; a < 50; ++a)
		__asm__("nop");
}

void InitializeSystemClock() {
	CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
	CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
	CLK_ECKR = 0;                       //  Disable the external clock.
	while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
	CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
	CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
	CLK_PCKENR2 = 0xff;                 //  Ditto.
	CLK_CCOR = 0;                       //  Turn off CCO.
	CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
	CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
	CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
	CLK_SWCR = 0;                       //  Reset the clock switch control register.
	CLK_SWCR = CLK_SWEN;                //  Enable switching.
	while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
}
void delay (int time_ms) {
	volatile long int x;
	for (x = 0; x < 1036*time_ms; ++x)
		__asm__("nop");
}

void UARTPrintF (char *message) {
	char *ch = message;
	while (*ch) {
		UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
		while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
		ch++;                               //  Grab the next character.
	}
}

void print_UCHAR_hex (unsigned char buffer) {
	unsigned char message[8];
	int a, b;
	a = (buffer >> 4);
	if (a > 9)
		a = a + 'a' - 10;
	else
		a += '0';
	b = buffer & 0x0f;
	if (b > 9)
		b = b + 'a' - 10;
	else
		b += '0';
	message[0] = a;
	message[1] = b;
	message[2] = 0;
	UARTPrintF (message);
}


//
//  Send a message to the debug port (UART1).
//

void print_byte_hex (unsigned char buffer) {
	unsigned char message[8];
	int a, b;
	a = (buffer >> 4);
	if (a > 9)
		a = a + 'a' - 10;
	else
		a += '0'; 
	b = buffer & 0x0f;
	if (b > 9)
		b = b + 'a' - 10;
	else
		b += '0'; 
	message[0] = a;
	message[1] = b;
	message[2] = 0;
	UARTPrintF (message);
}



void InitializeUART() {
	//
	//  Clear the Idle Line Detected bit in the status register by a read
	//  to the UART1_SR register followed by a Read to the UART1_DR register.
	//
	unsigned char tmp = UART1_SR;
	tmp = UART1_DR;
	//
	//  Reset the UART registers to the reset values.
	//
	UART1_CR1 = 0;
	UART1_CR2 = 0;
	UART1_CR4 = 0;
	UART1_CR3 = 0;
	UART1_CR5 = 0;
	UART1_GTR = 0;
	UART1_PSCR = 0;
	//
	//  Now setup the port to 115200,n,8,1.
	//
	UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
	UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
	UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
	UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
	UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
	UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
	//
	//  Disable the transmitter and receiver.
	//
	UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
	UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
	//
	//  Set the clock polarity, lock phase and last bit clock pulse.
	//
	SET (UART1_CR3, CR3_CPOL);
	SET (UART1_CR3, CR3_CPHA);
	SET (UART1_CR3, CR3_LBCL);
	//
	//  Turn on the UART transmit, receive and the UART clock.
	//
	SET (UART1_CR2, CR2_TEN);
	SET (UART1_CR2, CR2_REN);
	UART1_CR3 = CR3_CLKEN;
}


// DISPLAY




void _tm1637Start(void);
void _tm1637Stop(void);
void _tm1637ReadResult(void);
void _tm1637WriteByte(unsigned char b);

void _tm1637ClkHigh(void);
void _tm1637ClkLow(void);
void _tm1637DioHigh(void);
void _tm1637DioLow(void);
void tm1637SetBrightness(char brightness);

const char segmentMap[] = {
	0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, // 0-7
	0x7f, 0x6f, 0x77, 0x7c, 0x39, 0x5e, 0x79, 0x71, // 8-9, A-F
	0x00
};



void tm1637Init(void)
{
	tm1637SetBrightness(8);
}



void tm1637DisplayDecimal(u8 TT,unsigned int displaySeparator)
{ unsigned int ii;
	unsigned int v = TT ;
	unsigned char digitArr[4];



	//  unsigned char digitArr[4];
	for (ii = 0; ii < 4; ++ii) {
		digitArr[ii] = segmentMap[v % 10];
		if (ii == 2 && displaySeparator) {
			digitArr[ii] |= 1 << 7;
		}
		v /= 10;
	}

	_tm1637Start();
	_tm1637WriteByte(0x40);
	_tm1637ReadResult();
	_tm1637Stop();

	_tm1637Start();
	_tm1637WriteByte(0xc0);
	_tm1637ReadResult();

	for (ii = 0; ii < 4; ++ii) {
		_tm1637WriteByte(digitArr[3 - ii]);
		_tm1637ReadResult();
	}

	_tm1637Stop();
}

// Valid brightness values: 0 - 8.
// 0 = display off.
void tm1637SetBrightness(char brightness)
{
	// Brightness command:
	// 1000 0XXX = display off
	// 1000 1BBB = display on, brightness 0-7
	// X = don't care
	// B = brightness
	_tm1637Start();
	_tm1637WriteByte(0x87 + brightness);
	_tm1637ReadResult();
	_tm1637Stop();
}

void _tm1637Start(void)
{
	_tm1637ClkHigh();
	_tm1637DioHigh();
	delay(5);
	_tm1637DioLow();
}

void _tm1637Stop(void)
{
	_tm1637ClkLow();
	delay(5);
	_tm1637DioLow();
	delay(5);
	_tm1637ClkHigh();
	delay(5);
	_tm1637DioHigh();
}

void _tm1637ReadResult(void)
{
	_tm1637ClkLow();
	delay(5);
	// while (dio); // We're cheating here and not actually reading back the response.
	_tm1637ClkHigh();
	delay(5);
	_tm1637ClkLow();
}

void _tm1637WriteByte(unsigned char b)
{int ii;
	for (ii = 0; ii < 8; ++ii) {
		_tm1637ClkLow();
		if (b & 0x01) {
			_tm1637DioHigh();
		}
		else {
			_tm1637DioLow();
		}
		delay(15);
		b >>= 1;
		_tm1637ClkHigh();
		delay(15);
	}
}



void _tm1637ClkHigh(void)
{ 
	//PB_ODR_bit.ODR5 = 1; //      _tm1637ClkHigh(); 

	//  GPIO_WriteHigh(GPIOD,GPIO_PIN_2);
	PD_ODR |= 1 << 2;
}

void _tm1637ClkLow(void)
{ 
	// GPIO_WriteLow(GPIOD,GPIO_PIN_2);

	PD_ODR &= ~(1 << 2);

	//    PB_ODR_bit.ODR5 = 0; //      _tm1637ClkHigh(); 

}

void _tm1637DioHigh(void)
{
	//PB_ODR_bit.ODR4 = 1; //  _tm1637DioHigh(); 
	// GPIO_WriteHigh(GPIOD,GPIO_PIN_3);
	PD_ODR |= 1 << 3;

}

void _tm1637DioLow(void)
{
	PD_ODR &= ~(1 << 3);

	//GPIO_WriteLow(GPIOD,GPIO_PIN_3);
	//PB_ODR_bit.ODR4 = 0; //  _tm1637DioHigh(); 

}







#define BEEP_ISR 6 // port D

void rt_one_second_increment (st_time *t) {
	++t->ticker; //   
	if(++t->second > 59) {
		t->second= 0;
		if(++t->minute > 59) {
			t->minute= 0;
			if(++t->hour > 23) {
				t->hour= 0;
			}
		}
	}
}



unsigned int internteller;

void timer_isr(void) __interrupt(BEEP_ISR) {
	if (++internteller > 500) {
		internteller=0;
		rt_one_second_increment(&real_time);

		//		++seconden;
	}

}



/*
#define EEPROM_START_ADDR       0x4000
#define EEPROM_END_ADDR         0x4280 
//640 bytes of eeprom
#define FLASH_CR2_OPT 7
#define FLASH_NCR2_NOPT 7
 */




//
//  Data to write into the EEPROM.
//
unsigned int _pulseLength[] = { 2000U, 27830U, 400U, 1580U, 400U, 3580U, 400U };
unsigned char _onOrOff[] =    {   1,      0,     1,     0,    1,     0,    1 };
char numberOfValues = 7;

//--------------------------------------------------------------------------------
//
//  Write the default values into EEPROM.
//
void SetDefaultValues()
{
	char *addrss = (char *) 0x4000;        //  EEPROM base address.
	int index;
	//
	//  Check if the EEPROM is write-protected.  If it is then unlock the EEPROM.
	//
	FLASH_DUKR = FLASH_DUKR_KEY1;
	FLASH_DUKR = FLASH_DUKR_KEY2;
	//
	//  Write the data to the EEPROM.
	//
	*addrss++ = (char) numberOfValues;
	for (index = 0; index < numberOfValues; index++)
	{
		*addrss++ = (char) (_pulseLength[index] & 0xff);
		*addrss++ = (char) ((_pulseLength[index] >> 8) & 0xff);
		*addrss++ = _onOrOff[index];
	}
	//
	//  Now write protect the EEPROM.
	//
	//  FLASH_IAPSR_DUL = 0;
} 




int main () {
	st_time *tijd;
	st_time starttijd;
	unsigned int urenteller=1;
	u8 startmeting=0;	
	unsigned int val=0, current,periode;
	unsigned int displaymode=1;
	InitializeSystemClock();


	SetDefaultValues();

	BEEP_CSR = (0<<7) | (0<<6) | (1<<5) | 0x1E;
	PD_DDR = (1 << 3) | (1 << 2); // output mode

	PD_DDR &=  ~(1 << 4); //PD4 input
	//display on PD2 PD3
	PD_CR1 = (1 << 3) | (1 << 2); // push-pull
	PD_CR1 &= ~(1 << 4); // input with float
	PD_CR2 = (1 << 3) | (1 << 2) | (1<< 4); // up to 10MHz speed + interrupt enabled 

	EXTI_CR1 = (1<<7); //Port D external sensitivity bits7:6 10: Falling edge only
	EXTI_CR1 &= ~(1<<6); //Port D external sensitivity bits7:6 10: Falling edge only


	tijd = &real_time;

	// Configure timer
	// 1000 ticks per second

	tm1637Init();

	InitializeUART();


	/* Enable interrupts */
	__asm__("rim");



	while (1) {
		ADC_CR1 |= ADC_ADON; // ADC ON
		ADC_CSR |= ((0x0F)&2); // select channel = 2 = PC4
		ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
		ADC_CR1 |= ADC_ADON; // start conversion
		while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC

		val |= (unsigned int)ADC_DRL;
		// UARTPrintF("value = \n\r");
		val |= (unsigned int)ADC_DRH<<8;
		ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
		current = val & 0x03ff;

		if (current > MIN_CURRENT){ //start timing current consumption

			starttijd.second = real_time.second;
			starttijd.minute = real_time.minute;
			starttijd.hour = real_time.hour;
			starttijd.ticker = real_time.ticker;
			startmeting = 1;
		}
		if ((current < MIN_CURRENT) && (startmeting)) //stop timing current consumption
		{ 
			periode += real_time.ticker - starttijd.ticker; //periode in seconds that application draws current
			startmeting = 0;
		}
		if (real_time.hour == urenteller)
		{       ++urenteller;
			periode = 0;
			// store hour and period of activity
			// volt * ampere * (periode / 3600)   
		}


		tm1637DisplayDecimal(tijd->minute, 0); // display minutes 
	}
}
