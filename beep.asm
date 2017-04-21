;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Jul 11 2014) (Linux)
; This file was generated Fri Apr 21 14:18:39 2017
;--------------------------------------------------------
	.module beep
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _segmentMap
	.globl _main
	.globl _timer_isr
	.globl _rt_one_second_increment
	.globl _tm1637DisplayDecimal
	.globl _tm1637Init
	.globl _InitializeUART
	.globl _print_byte_hex
	.globl _i2c_set_start_ack
	.globl _i2c_send_address
	.globl _print_UCHAR_hex
	.globl _UARTPrintF
	.globl _delay
	.globl _InitializeSystemClock
	.globl _delayTenMicro
	.globl _internteller
	.globl _real_time
	.globl _tm1637SetBrightness
	.globl __tm1637Start
	.globl __tm1637Stop
	.globl __tm1637ReadResult
	.globl __tm1637WriteByte
	.globl __tm1637ClkHigh
	.globl __tm1637ClkLow
	.globl __tm1637DioHigh
	.globl __tm1637DioLow
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_real_time::
	.ds 8
_internteller::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int _timer_isr ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	beep.c: 27: void delayTenMicro (void) {
;	-----------------------------------------
;	 function delayTenMicro
;	-----------------------------------------
_delayTenMicro:
;	beep.c: 29: for (a = 0; a < 50; ++a)
	ld	a, #0x32
00104$:
;	beep.c: 30: __asm__("nop");
	nop
	dec	a
;	beep.c: 29: for (a = 0; a < 50; ++a)
	tnz	a
	jrne	00104$
	ret
;	beep.c: 33: void InitializeSystemClock() {
;	-----------------------------------------
;	 function InitializeSystemClock
;	-----------------------------------------
_InitializeSystemClock:
;	beep.c: 34: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
	ldw	x, #0x50c0
	clr	(x)
;	beep.c: 35: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
	ldw	x, #0x50c0
	ld	a, #0x01
	ld	(x), a
;	beep.c: 36: CLK_ECKR = 0;                       //  Disable the external clock.
	ldw	x, #0x50c1
	clr	(x)
;	beep.c: 37: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
00101$:
	ldw	x, #0x50c0
	ld	a, (x)
	bcp	a, #0x02
	jreq	00101$
;	beep.c: 38: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
	ldw	x, #0x50c6
	clr	(x)
;	beep.c: 39: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
	ldw	x, #0x50c7
	ld	a, #0xff
	ld	(x), a
;	beep.c: 40: CLK_PCKENR2 = 0xff;                 //  Ditto.
	ldw	x, #0x50ca
	ld	a, #0xff
	ld	(x), a
;	beep.c: 41: CLK_CCOR = 0;                       //  Turn off CCO.
	ldw	x, #0x50c9
	clr	(x)
;	beep.c: 42: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
	ldw	x, #0x50cc
	clr	(x)
;	beep.c: 43: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
	ldw	x, #0x50cd
	clr	(x)
;	beep.c: 44: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
	ldw	x, #0x50c4
	ld	a, #0xe1
	ld	(x), a
;	beep.c: 45: CLK_SWCR = 0;                       //  Reset the clock switch control register.
	ldw	x, #0x50c5
	clr	(x)
;	beep.c: 46: CLK_SWCR = CLK_SWEN;                //  Enable switching.
	ldw	x, #0x50c5
	ld	a, #0x02
	ld	(x), a
;	beep.c: 47: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
00104$:
	ldw	x, #0x50c5
	ld	a, (x)
	srl	a
	jrc	00104$
	ret
;	beep.c: 49: void delay (int time_ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	sub	sp, #10
;	beep.c: 51: for (x = 0; x < 1036*time_ms; ++x)
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
	ldw	x, (0x0d, sp)
	pushw	x
	push	#0x0c
	push	#0x04
	call	__mulint
	addw	sp, #4
	ldw	(0x09, sp), x
00103$:
	ldw	y, (0x09, sp)
	ldw	(0x07, sp), y
	ld	a, (0x07, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x06, sp), a
	ld	(0x05, sp), a
	ldw	x, (0x03, sp)
	cpw	x, (0x07, sp)
	ld	a, (0x02, sp)
	sbc	a, (0x06, sp)
	ld	a, (0x01, sp)
	sbc	a, (0x05, sp)
	jrsge	00105$
;	beep.c: 52: __asm__("nop");
	nop
;	beep.c: 51: for (x = 0; x < 1036*time_ms; ++x)
	ldw	y, (0x03, sp)
	addw	y, #0x0001
	ld	a, (0x02, sp)
	adc	a, #0x00
	ld	xl, a
	ld	a, (0x01, sp)
	adc	a, #0x00
	ld	xh, a
	ldw	(0x03, sp), y
	ldw	(0x01, sp), x
	jra	00103$
00105$:
	addw	sp, #10
	ret
;	beep.c: 55: void UARTPrintF (char *message) {
;	-----------------------------------------
;	 function UARTPrintF
;	-----------------------------------------
_UARTPrintF:
;	beep.c: 56: char *ch = message;
	ldw	y, (0x03, sp)
;	beep.c: 57: while (*ch) {
00104$:
	ld	a, (y)
	tnz	a
	jreq	00107$
;	beep.c: 58: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
	ldw	x, #0x5231
	ld	(x), a
;	beep.c: 59: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
00101$:
	ldw	x, #0x5230
	ld	a, (x)
	sll	a
	jrnc	00101$
;	beep.c: 60: ch++;                               //  Grab the next character.
	incw	y
	jra	00104$
00107$:
	ret
;	beep.c: 64: void print_UCHAR_hex (unsigned char buffer) {
;	-----------------------------------------
;	 function print_UCHAR_hex
;	-----------------------------------------
_print_UCHAR_hex:
	sub	sp, #12
;	beep.c: 67: a = (buffer >> 4);
	ld	a, (0x0f, sp)
	swap	a
	and	a, #0x0f
	clrw	x
	ld	xl, a
;	beep.c: 68: if (a > 9)
	cpw	x, #0x0009
	jrsle	00102$
;	beep.c: 69: a = a + 'a' - 10;
	addw	x, #0x0057
	ldw	(0x03, sp), x
	jra	00103$
00102$:
;	beep.c: 71: a += '0';
	addw	x, #0x0030
	ldw	(0x03, sp), x
00103$:
;	beep.c: 72: b = buffer & 0x0f;
	ld	a, (0x0f, sp)
	and	a, #0x0f
	clrw	x
	ld	xl, a
;	beep.c: 73: if (b > 9)
	cpw	x, #0x0009
	jrsle	00105$
;	beep.c: 74: b = b + 'a' - 10;
	addw	x, #0x0057
	ldw	(0x01, sp), x
	jra	00106$
00105$:
;	beep.c: 76: b += '0';
	addw	x, #0x0030
	ldw	(0x01, sp), x
00106$:
;	beep.c: 77: message[0] = a;
	ldw	y, sp
	addw	y, #5
	ld	a, (0x04, sp)
	ld	(y), a
;	beep.c: 78: message[1] = b;
	ldw	x, y
	incw	x
	ld	a, (0x02, sp)
	ld	(x), a
;	beep.c: 79: message[2] = 0;
	ldw	x, y
	incw	x
	incw	x
	clr	(x)
;	beep.c: 80: UARTPrintF (message);
	pushw	y
	call	_UARTPrintF
	addw	sp, #2
	addw	sp, #12
	ret
;	beep.c: 83: void i2c_send_address (UCHAR addr, UCHAR mode) {
;	-----------------------------------------
;	 function i2c_send_address
;	-----------------------------------------
_i2c_send_address:
	sub	sp, #3
;	beep.c: 85: reg = I2C_SR1;
	ldw	x, #0x5217
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	(0x01, sp), x
;	beep.c: 86: I2C_DR = (addr << 1) | mode;
	ld	a, (0x06, sp)
	sll	a
	or	a, (0x07, sp)
	ldw	x, #0x5216
	ld	(x), a
;	beep.c: 87: if (mode == I2C_READ) {
	ld	a, (0x07, sp)
	cp	a, #0x01
	jrne	00127$
	ld	a, #0x01
	ld	(0x03, sp), a
	jra	00128$
00127$:
	clr	(0x03, sp)
00128$:
	tnz	(0x03, sp)
	jreq	00103$
;	beep.c: 88: I2C_OARL = 0;
	ldw	x, #0x5213
	clr	(x)
;	beep.c: 89: I2C_OARH = 0;
	ldw	x, #0x5214
	clr	(x)
;	beep.c: 92: while ((I2C_SR1 & I2C_ADDR) == 0);
00103$:
;	beep.c: 85: reg = I2C_SR1;
	ldw	x, #0x5217
	ld	a, (x)
;	beep.c: 92: while ((I2C_SR1 & I2C_ADDR) == 0);
	bcp	a, #0x02
	jreq	00103$
;	beep.c: 93: if (mode == I2C_READ)
	tnz	(0x03, sp)
	jreq	00108$
;	beep.c: 94: UNSET (I2C_SR1, I2C_ADDR);
	and	a, #0xfd
	ldw	x, #0x5217
	ld	(x), a
00108$:
	addw	sp, #3
	ret
;	beep.c: 97: void i2c_set_start_ack (void) {
;	-----------------------------------------
;	 function i2c_set_start_ack
;	-----------------------------------------
_i2c_set_start_ack:
;	beep.c: 98: I2C_CR2 = I2C_ACK | I2C_START;
	ldw	x, #0x5211
	ld	a, #0x05
	ld	(x), a
;	beep.c: 99: while ((I2C_SR1 & I2C_SB) == 0);
00101$:
	ldw	x, #0x5217
	ld	a, (x)
	srl	a
	jrnc	00101$
	ret
;	beep.c: 106: void print_byte_hex (unsigned char buffer) {
;	-----------------------------------------
;	 function print_byte_hex
;	-----------------------------------------
_print_byte_hex:
	sub	sp, #12
;	beep.c: 109: a = (buffer >> 4);
	ld	a, (0x0f, sp)
	swap	a
	and	a, #0x0f
	clrw	x
	ld	xl, a
;	beep.c: 110: if (a > 9)
	cpw	x, #0x0009
	jrsle	00102$
;	beep.c: 111: a = a + 'a' - 10;
	addw	x, #0x0057
	ldw	(0x03, sp), x
	jra	00103$
00102$:
;	beep.c: 113: a += '0'; 
	addw	x, #0x0030
	ldw	(0x03, sp), x
00103$:
;	beep.c: 114: b = buffer & 0x0f;
	ld	a, (0x0f, sp)
	and	a, #0x0f
	clrw	x
	ld	xl, a
;	beep.c: 115: if (b > 9)
	cpw	x, #0x0009
	jrsle	00105$
;	beep.c: 116: b = b + 'a' - 10;
	addw	x, #0x0057
	ldw	(0x01, sp), x
	jra	00106$
00105$:
;	beep.c: 118: b += '0'; 
	addw	x, #0x0030
	ldw	(0x01, sp), x
00106$:
;	beep.c: 119: message[0] = a;
	ldw	y, sp
	addw	y, #5
	ld	a, (0x04, sp)
	ld	(y), a
;	beep.c: 120: message[1] = b;
	ldw	x, y
	incw	x
	ld	a, (0x02, sp)
	ld	(x), a
;	beep.c: 121: message[2] = 0;
	ldw	x, y
	incw	x
	incw	x
	clr	(x)
;	beep.c: 122: UARTPrintF (message);
	pushw	y
	call	_UARTPrintF
	addw	sp, #2
	addw	sp, #12
	ret
;	beep.c: 127: void InitializeUART() {
;	-----------------------------------------
;	 function InitializeUART
;	-----------------------------------------
_InitializeUART:
;	beep.c: 137: UART1_CR1 = 0;
	ldw	x, #0x5234
	clr	(x)
;	beep.c: 138: UART1_CR2 = 0;
	ldw	x, #0x5235
	clr	(x)
;	beep.c: 139: UART1_CR4 = 0;
	ldw	x, #0x5237
	clr	(x)
;	beep.c: 140: UART1_CR3 = 0;
	ldw	x, #0x5236
	clr	(x)
;	beep.c: 141: UART1_CR5 = 0;
	ldw	x, #0x5238
	clr	(x)
;	beep.c: 142: UART1_GTR = 0;
	ldw	x, #0x5239
	clr	(x)
;	beep.c: 143: UART1_PSCR = 0;
	ldw	x, #0x523a
	clr	(x)
;	beep.c: 147: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	beep.c: 148: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	beep.c: 149: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
;	beep.c: 150: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	beep.c: 151: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
	ldw	x, #0x5233
	ld	a, #0x0a
	ld	(x), a
;	beep.c: 152: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
	ldw	x, #0x5232
	ld	a, #0x08
	ld	(x), a
;	beep.c: 156: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	beep.c: 157: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	beep.c: 161: SET (UART1_CR3, CR3_CPOL);
	ldw	x, #0x5236
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	beep.c: 162: SET (UART1_CR3, CR3_CPHA);
	ldw	x, #0x5236
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	beep.c: 163: SET (UART1_CR3, CR3_LBCL);
	bset	0x5236, #0
;	beep.c: 167: SET (UART1_CR2, CR2_TEN);
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	beep.c: 168: SET (UART1_CR2, CR2_REN);
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	beep.c: 169: UART1_CR3 = CR3_CLKEN;
	ldw	x, #0x5236
	ld	a, #0x08
	ld	(x), a
	ret
;	beep.c: 197: void tm1637Init(void)
;	-----------------------------------------
;	 function tm1637Init
;	-----------------------------------------
_tm1637Init:
;	beep.c: 199: tm1637SetBrightness(8);
	push	#0x08
	call	_tm1637SetBrightness
	pop	a
	ret
;	beep.c: 204: void tm1637DisplayDecimal(u8 TT,unsigned int displaySeparator)
;	-----------------------------------------
;	 function tm1637DisplayDecimal
;	-----------------------------------------
_tm1637DisplayDecimal:
	sub	sp, #15
;	beep.c: 206: unsigned int v = TT ;
	clrw	x
	ld	a, (0x12, sp)
	ld	xl, a
	ldw	(0x05, sp), x
;	beep.c: 212: for (ii = 0; ii < 4; ++ii) {
	ldw	x, sp
	incw	x
	ldw	(0x09, sp), x
	ldw	x, #_segmentMap+0
	ldw	(0x0e, sp), x
	clrw	y
00106$:
;	beep.c: 213: digitArr[ii] = segmentMap[v % 10];
	ldw	x, y
	addw	x, (0x09, sp)
	ldw	(0x0c, sp), x
	pushw	y
	ldw	x, (0x07, sp)
	ldw	y, #0x000a
	divw	x, y
	ldw	x, y
	popw	y
	addw	x, (0x0e, sp)
	ld	a, (x)
	ldw	x, (0x0c, sp)
	ld	(x), a
;	beep.c: 214: if (ii == 2 && displaySeparator) {
	cpw	y, #0x0002
	jrne	00102$
	ldw	x, (0x13, sp)
	jreq	00102$
;	beep.c: 215: digitArr[ii] |= 1 << 7;
	ldw	x, (0x0c, sp)
	ld	a, (x)
	or	a, #0x80
	ldw	x, (0x0c, sp)
	ld	(x), a
00102$:
;	beep.c: 217: v /= 10;
	pushw	y
	ldw	x, (0x07, sp)
	ldw	y, #0x000a
	divw	x, y
	popw	y
	ldw	(0x05, sp), x
;	beep.c: 212: for (ii = 0; ii < 4; ++ii) {
	incw	y
	cpw	y, #0x0004
	jrc	00106$
;	beep.c: 220: _tm1637Start();
	call	__tm1637Start
;	beep.c: 221: _tm1637WriteByte(0x40);
	push	#0x40
	call	__tm1637WriteByte
	pop	a
;	beep.c: 222: _tm1637ReadResult();
	call	__tm1637ReadResult
;	beep.c: 223: _tm1637Stop();
	call	__tm1637Stop
;	beep.c: 225: _tm1637Start();
	call	__tm1637Start
;	beep.c: 226: _tm1637WriteByte(0xc0);
	push	#0xc0
	call	__tm1637WriteByte
	pop	a
;	beep.c: 227: _tm1637ReadResult();
	call	__tm1637ReadResult
;	beep.c: 229: for (ii = 0; ii < 4; ++ii) {
	clrw	x
	ldw	(0x07, sp), x
00108$:
;	beep.c: 230: _tm1637WriteByte(digitArr[3 - ii]);
	ld	a, (0x08, sp)
	ld	(0x0b, sp), a
	ld	a, #0x03
	sub	a, (0x0b, sp)
	clrw	x
	ld	xl, a
	addw	x, (0x09, sp)
	ld	a, (x)
	push	a
	call	__tm1637WriteByte
	pop	a
;	beep.c: 231: _tm1637ReadResult();
	call	__tm1637ReadResult
;	beep.c: 229: for (ii = 0; ii < 4; ++ii) {
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x07, sp), x
	ldw	x, (0x07, sp)
	cpw	x, #0x0004
	jrc	00108$
;	beep.c: 234: _tm1637Stop();
	call	__tm1637Stop
	addw	sp, #15
	ret
;	beep.c: 239: void tm1637SetBrightness(char brightness)
;	-----------------------------------------
;	 function tm1637SetBrightness
;	-----------------------------------------
_tm1637SetBrightness:
;	beep.c: 246: _tm1637Start();
	call	__tm1637Start
;	beep.c: 247: _tm1637WriteByte(0x87 + brightness);
	ld	a, (0x03, sp)
	add	a, #0x87
	push	a
	call	__tm1637WriteByte
	pop	a
;	beep.c: 248: _tm1637ReadResult();
	call	__tm1637ReadResult
;	beep.c: 249: _tm1637Stop();
	jp	__tm1637Stop
;	beep.c: 252: void _tm1637Start(void)
;	-----------------------------------------
;	 function _tm1637Start
;	-----------------------------------------
__tm1637Start:
;	beep.c: 254: _tm1637ClkHigh();
	call	__tm1637ClkHigh
;	beep.c: 255: _tm1637DioHigh();
	call	__tm1637DioHigh
;	beep.c: 256: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	beep.c: 257: _tm1637DioLow();
	jp	__tm1637DioLow
;	beep.c: 260: void _tm1637Stop(void)
;	-----------------------------------------
;	 function _tm1637Stop
;	-----------------------------------------
__tm1637Stop:
;	beep.c: 262: _tm1637ClkLow();
	call	__tm1637ClkLow
;	beep.c: 263: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	beep.c: 264: _tm1637DioLow();
	call	__tm1637DioLow
;	beep.c: 265: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	beep.c: 266: _tm1637ClkHigh();
	call	__tm1637ClkHigh
;	beep.c: 267: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	beep.c: 268: _tm1637DioHigh();
	jp	__tm1637DioHigh
;	beep.c: 271: void _tm1637ReadResult(void)
;	-----------------------------------------
;	 function _tm1637ReadResult
;	-----------------------------------------
__tm1637ReadResult:
;	beep.c: 273: _tm1637ClkLow();
	call	__tm1637ClkLow
;	beep.c: 274: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	beep.c: 276: _tm1637ClkHigh();
	call	__tm1637ClkHigh
;	beep.c: 277: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	beep.c: 278: _tm1637ClkLow();
	jp	__tm1637ClkLow
;	beep.c: 281: void _tm1637WriteByte(unsigned char b)
;	-----------------------------------------
;	 function _tm1637WriteByte
;	-----------------------------------------
__tm1637WriteByte:
	sub	sp, #2
;	beep.c: 283: for (ii = 0; ii < 8; ++ii) {
	clrw	x
	ldw	(0x01, sp), x
00105$:
;	beep.c: 284: _tm1637ClkLow();
	call	__tm1637ClkLow
;	beep.c: 285: if (b & 0x01) {
	ld	a, (0x05, sp)
	srl	a
	jrnc	00102$
;	beep.c: 286: _tm1637DioHigh();
	call	__tm1637DioHigh
	jra	00103$
00102$:
;	beep.c: 289: _tm1637DioLow();
	call	__tm1637DioLow
00103$:
;	beep.c: 291: delay(15);
	push	#0x0f
	push	#0x00
	call	_delay
	addw	sp, #2
;	beep.c: 292: b >>= 1;
	ld	a, (0x05, sp)
	srl	a
	ld	(0x05, sp), a
;	beep.c: 293: _tm1637ClkHigh();
	call	__tm1637ClkHigh
;	beep.c: 294: delay(15);
	push	#0x0f
	push	#0x00
	call	_delay
	addw	sp, #2
;	beep.c: 283: for (ii = 0; ii < 8; ++ii) {
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	cpw	x, #0x0008
	jrslt	00105$
	addw	sp, #2
	ret
;	beep.c: 300: void _tm1637ClkHigh(void)
;	-----------------------------------------
;	 function _tm1637ClkHigh
;	-----------------------------------------
__tm1637ClkHigh:
;	beep.c: 305: PD_ODR |= 1 << 2;
	ldw	x, #0x500f
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
	ret
;	beep.c: 308: void _tm1637ClkLow(void)
;	-----------------------------------------
;	 function _tm1637ClkLow
;	-----------------------------------------
__tm1637ClkLow:
;	beep.c: 312: PD_ODR &= ~(1 << 2);
	ldw	x, #0x500f
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
	ret
;	beep.c: 318: void _tm1637DioHigh(void)
;	-----------------------------------------
;	 function _tm1637DioHigh
;	-----------------------------------------
__tm1637DioHigh:
;	beep.c: 322: PD_ODR |= 1 << 3;
	ldw	x, #0x500f
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
	ret
;	beep.c: 326: void _tm1637DioLow(void)
;	-----------------------------------------
;	 function _tm1637DioLow
;	-----------------------------------------
__tm1637DioLow:
;	beep.c: 328: PD_ODR &= ~(1 << 3);
	ldw	x, #0x500f
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	ret
;	beep.c: 343: void rt_one_second_increment (st_time *t) {
;	-----------------------------------------
;	 function rt_one_second_increment
;	-----------------------------------------
_rt_one_second_increment:
	sub	sp, #8
;	beep.c: 344: ++t->ticker; //   
	ldw	y, (0x0b, sp)
	ldw	(0x05, sp), y
	ldw	x, (0x05, sp)
	addw	x, #0x0004
	ldw	(0x07, sp), x
	ldw	x, (0x07, sp)
	ld	a, (0x3, x)
	ld	yl, a
	ld	a, (0x2, x)
	ldw	x, (x)
	ld	yh, a
	addw	y, #0x0001
	ld	a, xl
	adc	a, #0x00
	ld	(0x02, sp), a
	ld	a, xh
	adc	a, #0x00
	ld	(0x01, sp), a
	ldw	x, (0x07, sp)
	ldw	(0x2, x), y
	ldw	y, (0x01, sp)
	ldw	(x), y
;	beep.c: 345: if(++t->second > 59) {
	ldw	x, (0x05, sp)
	ld	a, (x)
	inc	a
	ld	(x), a
	cp	a, #0x3b
	jrule	00107$
;	beep.c: 346: t->second= 0;
	ldw	x, (0x05, sp)
	clr	(x)
;	beep.c: 347: if(++t->minute > 59) {
	ldw	x, (0x05, sp)
	incw	x
	ld	a, (x)
	inc	a
	ld	(x), a
	cp	a, #0x3b
	jrule	00107$
;	beep.c: 348: t->minute= 0;
	clr	(x)
;	beep.c: 349: if(++t->hour > 23) {
	ldw	x, (0x05, sp)
	incw	x
	incw	x
	ld	a, (x)
	inc	a
	ld	(x), a
	cp	a, #0x17
	jrule	00107$
;	beep.c: 350: t->hour= 0;
	clr	(x)
00107$:
	addw	sp, #8
	ret
;	beep.c: 360: void timer_isr(void) __interrupt(BEEP_ISR) {
;	-----------------------------------------
;	 function timer_isr
;	-----------------------------------------
_timer_isr:
;	beep.c: 361: if (++internteller > 500) {
	ldw	x, _internteller+0
	incw	x
	ldw	_internteller+0, x
	cpw	x, #0x01f4
	jrule	00103$
;	beep.c: 362: internteller=0;
	clr	_internteller+1
	clr	_internteller+0
;	beep.c: 363: rt_one_second_increment(&real_time);
	ldw	x, #_real_time+0
	pushw	x
	call	_rt_one_second_increment
	addw	sp, #2
00103$:
	iret
;	beep.c: 376: int main () {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #29
;	beep.c: 380: u8 startmeting=0;	
	clr	(0x07, sp)
;	beep.c: 381: unsigned int val=0, current,periode;
	clrw	x
	ldw	(0x10, sp), x
;	beep.c: 383: InitializeSystemClock();
	call	_InitializeSystemClock
;	beep.c: 385: BEEP_CSR = (0<<7) | (0<<6) | (1<<5) | 0x1E;
	ldw	x, #0x50f3
	ld	a, #0x3e
	ld	(x), a
;	beep.c: 386: PD_DDR = (1 << 3) | (1 << 2); // output mode
	ldw	x, #0x5011
	ld	a, #0x0c
	ld	(x), a
;	beep.c: 388: PD_DDR &=  ~(1 << 4); //PD4 input
	ldw	x, #0x5011
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	beep.c: 389: PD_CR1 = (1 << 3) | (1 << 2); // push-pull
	ldw	x, #0x5012
	ld	a, #0x0c
	ld	(x), a
;	beep.c: 390: PD_CR1 &= ~(1 << 4); // input with float
	ldw	x, #0x5012
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	beep.c: 391: PD_CR2 = (1 << 3) | (1 << 2) | (1<< 4); // up to 10MHz speed + interrupt enabled 
	ldw	x, #0x5013
	ld	a, #0x1c
	ld	(x), a
;	beep.c: 393: EXTI_CR1 = (1<<7); //Port D external sensitivity bits7:6 10: Falling edge only
	ldw	x, #0x50a0
	ld	a, #0x80
	ld	(x), a
;	beep.c: 394: EXTI_CR1 &= ~(1<<6); //Port D external sensitivity bits7:6 10: Falling edge only
	ldw	x, #0x50a0
	ld	a, (x)
	and	a, #0xbf
	ld	(x), a
;	beep.c: 397: tijd = &real_time;
	ldw	x, #_real_time+0
	ldw	(0x1c, sp), x
	ld	a, (0x1c, sp)
	push	a
	ld	a, (0x1e, sp)
	ld	(0x03, sp), a
	pop	a
	ld	(0x01, sp), a
;	beep.c: 404: tm1637Init();
	call	_tm1637Init
;	beep.c: 406: InitializeUART();
	call	_InitializeUART
;	beep.c: 409: __asm__("rim");
	rim
;	beep.c: 413: while (1) {
00110$:
;	beep.c: 414: ADC_CR1 |= ADC_ADON; // ADC ON
	bset	0x5401, #0
;	beep.c: 415: ADC_CSR |= ((0x0F)&2); // select channel = 2 = PC4
	ldw	x, #0x5400
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	beep.c: 416: ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
	ldw	x, #0x5402
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	beep.c: 417: ADC_CR1 |= ADC_ADON; // start conversion
	bset	0x5401, #0
;	beep.c: 418: while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC
00101$:
	ldw	x, #0x5400
	ld	a, (x)
	sll	a
	jrnc	00101$
;	beep.c: 420: val |= (unsigned int)ADC_DRL;
	ldw	x, #0x5405
	ld	a, (x)
	clrw	x
	ld	xl, a
	or	a, (0x11, sp)
	ld	(0x1b, sp), a
	ld	a, xh
	or	a, (0x10, sp)
	ld	(0x05, sp), a
	ld	a, (0x1b, sp)
	ld	(0x06, sp), a
;	beep.c: 422: val |= (unsigned int)ADC_DRH<<8;
	ldw	x, #0x5404
	ld	a, (x)
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ld	a, xl
	or	a, (0x06, sp)
	ld	(0x19, sp), a
	ld	a, xh
	or	a, (0x05, sp)
	ld	(0x10, sp), a
	ld	a, (0x19, sp)
	ld	(0x11, sp), a
;	beep.c: 423: ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
	ldw	x, #0x5401
	ld	a, (x)
	and	a, #0xfe
	ld	(x), a
;	beep.c: 424: current = val & 0x03ff;
	ld	a, (0x11, sp)
	ld	(0x04, sp), a
	ld	a, (0x10, sp)
	and	a, #0x03
	ld	(0x03, sp), a
;	beep.c: 426: if (current > MIN_CURRENT){ //start timing current consumption
	ldw	x, (0x03, sp)
	cpw	x, #0x000a
	jrule	00105$
;	beep.c: 428: starttijd.second = real_time.second;
	ldw	x, sp
	addw	x, #8
	ldw	y, (0x1c, sp)
	ld	a, (y)
	ld	(x), a
;	beep.c: 429: starttijd.minute = real_time.minute;
	ldw	x, sp
	addw	x, #8
	ldw	(0x16, sp), x
	ldw	x, (0x16, sp)
	incw	x
	ldw	y, (0x1c, sp)
	ld	a, (0x1, y)
	ld	(x), a
;	beep.c: 430: starttijd.hour = real_time.hour;
	ldw	x, (0x16, sp)
	incw	x
	incw	x
	ldw	y, (0x1c, sp)
	ld	a, (0x2, y)
	ld	(x), a
;	beep.c: 431: starttijd.ticker = real_time.ticker;
	ldw	x, (0x16, sp)
	addw	x, #0x0004
	ldw	y, (0x1c, sp)
	ld	a, (0x7, y)
	push	a
	ld	a, (0x6, y)
	ld	(0x15, sp), a
	ldw	y, (0x4, y)
	pop	a
	ld	(0x3, x), a
	ld	a, (0x14, sp)
	ld	(0x2, x), a
	ldw	(x), y
;	beep.c: 432: startmeting = 1;
	ld	a, #0x01
	ld	(0x07, sp), a
00105$:
;	beep.c: 434: if ((current < MIN_CURRENT) && (startmeting))
	ldw	x, (0x03, sp)
	cpw	x, #0x000a
	jrnc	00107$
	tnz	(0x07, sp)
	jreq	00107$
;	beep.c: 437: startmeting = 0;
	clr	(0x07, sp)
00107$:
;	beep.c: 442: tm1637DisplayDecimal(tijd->minute, 0); // display minutes 
	ldw	x, (0x01, sp)
	ld	a, (0x1, x)
	clrw	x
	pushw	x
	push	a
	call	_tm1637DisplayDecimal
	addw	sp, #3
	jp	00110$
	addw	sp, #29
	ret
	.area CODE
_segmentMap:
	.db #0x3F	;  63
	.db #0x06	;  6
	.db #0x5B	;  91
	.db #0x4F	;  79	'O'
	.db #0x66	;  102	'f'
	.db #0x6D	;  109	'm'
	.db #0x7D	;  125
	.db #0x07	;  7
	.db #0x7F	;  127
	.db #0x6F	;  111	'o'
	.db #0x77	;  119	'w'
	.db #0x7C	;  124
	.db #0x39	;  57	'9'
	.db #0x5E	;  94
	.db #0x79	;  121	'y'
	.db #0x71	;  113	'q'
	.db #0x00	;  0
	.area INITIALIZER
	.area CABS (ABS)
