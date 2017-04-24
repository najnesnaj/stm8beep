;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Jul  5 2014) (Linux)
; This file was generated Sun Apr 23 20:27:52 2017
;--------------------------------------------------------
	.module beep
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _segmentMap
	.globl _main
	.globl _option_bytes_unlock
	.globl _timer_isr
	.globl _rt_one_second_increment
	.globl _tm1637DisplayDecimal
	.globl _tm1637Init
	.globl _InitializeUART
	.globl _print_byte_hex
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
;	beep.c: 88: void print_byte_hex (unsigned char buffer) {
;	-----------------------------------------
;	 function print_byte_hex
;	-----------------------------------------
_print_byte_hex:
	sub	sp, #12
;	beep.c: 91: a = (buffer >> 4);
	ld	a, (0x0f, sp)
	swap	a
	and	a, #0x0f
	clrw	x
	ld	xl, a
;	beep.c: 92: if (a > 9)
	cpw	x, #0x0009
	jrsle	00102$
;	beep.c: 93: a = a + 'a' - 10;
	addw	x, #0x0057
	ldw	(0x0b, sp), x
	jra	00103$
00102$:
;	beep.c: 95: a += '0'; 
	addw	x, #0x0030
	ldw	(0x0b, sp), x
00103$:
;	beep.c: 96: b = buffer & 0x0f;
	ld	a, (0x0f, sp)
	and	a, #0x0f
	clrw	x
	ld	xl, a
;	beep.c: 97: if (b > 9)
	cpw	x, #0x0009
	jrsle	00105$
;	beep.c: 98: b = b + 'a' - 10;
	addw	x, #0x0057
	ldw	(0x09, sp), x
	jra	00106$
00105$:
;	beep.c: 100: b += '0'; 
	addw	x, #0x0030
	ldw	(0x09, sp), x
00106$:
;	beep.c: 101: message[0] = a;
	ldw	y, sp
	incw	y
	ld	a, (0x0c, sp)
	ld	(y), a
;	beep.c: 102: message[1] = b;
	ldw	x, y
	incw	x
	ld	a, (0x0a, sp)
	ld	(x), a
;	beep.c: 103: message[2] = 0;
	ldw	x, y
	incw	x
	incw	x
	clr	(x)
;	beep.c: 104: UARTPrintF (message);
	pushw	y
	call	_UARTPrintF
	addw	sp, #2
	addw	sp, #12
	ret
;	beep.c: 109: void InitializeUART() {
;	-----------------------------------------
;	 function InitializeUART
;	-----------------------------------------
_InitializeUART:
;	beep.c: 119: UART1_CR1 = 0;
	ldw	x, #0x5234
	clr	(x)
;	beep.c: 120: UART1_CR2 = 0;
	ldw	x, #0x5235
	clr	(x)
;	beep.c: 121: UART1_CR4 = 0;
	ldw	x, #0x5237
	clr	(x)
;	beep.c: 122: UART1_CR3 = 0;
	ldw	x, #0x5236
	clr	(x)
;	beep.c: 123: UART1_CR5 = 0;
	ldw	x, #0x5238
	clr	(x)
;	beep.c: 124: UART1_GTR = 0;
	ldw	x, #0x5239
	clr	(x)
;	beep.c: 125: UART1_PSCR = 0;
	ldw	x, #0x523a
	clr	(x)
;	beep.c: 129: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	beep.c: 130: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	beep.c: 131: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
;	beep.c: 132: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	beep.c: 133: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
	ldw	x, #0x5233
	ld	a, #0x0a
	ld	(x), a
;	beep.c: 134: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
	ldw	x, #0x5232
	ld	a, #0x08
	ld	(x), a
;	beep.c: 138: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	beep.c: 139: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	beep.c: 143: SET (UART1_CR3, CR3_CPOL);
	ldw	x, #0x5236
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	beep.c: 144: SET (UART1_CR3, CR3_CPHA);
	ldw	x, #0x5236
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	beep.c: 145: SET (UART1_CR3, CR3_LBCL);
	bset	0x5236, #0
;	beep.c: 149: SET (UART1_CR2, CR2_TEN);
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	beep.c: 150: SET (UART1_CR2, CR2_REN);
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	beep.c: 151: UART1_CR3 = CR3_CLKEN;
	ldw	x, #0x5236
	ld	a, #0x08
	ld	(x), a
	ret
;	beep.c: 179: void tm1637Init(void)
;	-----------------------------------------
;	 function tm1637Init
;	-----------------------------------------
_tm1637Init:
;	beep.c: 181: tm1637SetBrightness(8);
	push	#0x08
	call	_tm1637SetBrightness
	pop	a
	ret
;	beep.c: 186: void tm1637DisplayDecimal(u8 TT,unsigned int displaySeparator)
;	-----------------------------------------
;	 function tm1637DisplayDecimal
;	-----------------------------------------
_tm1637DisplayDecimal:
	sub	sp, #15
;	beep.c: 188: unsigned int v = TT ;
	clrw	x
	ld	a, (0x12, sp)
	ld	xl, a
	ldw	(0x05, sp), x
;	beep.c: 194: for (ii = 0; ii < 4; ++ii) {
	ldw	x, sp
	incw	x
	ldw	(0x0e, sp), x
	ldw	x, #_segmentMap+0
	ldw	(0x0c, sp), x
	clrw	y
00106$:
;	beep.c: 195: digitArr[ii] = segmentMap[v % 10];
	ldw	x, y
	addw	x, (0x0e, sp)
	ldw	(0x0a, sp), x
	pushw	y
	ldw	x, (0x07, sp)
	ldw	y, #0x000a
	divw	x, y
	ldw	x, y
	popw	y
	addw	x, (0x0c, sp)
	ld	a, (x)
	ldw	x, (0x0a, sp)
	ld	(x), a
;	beep.c: 196: if (ii == 2 && displaySeparator) {
	cpw	y, #0x0002
	jrne	00102$
	ldw	x, (0x13, sp)
	jreq	00102$
;	beep.c: 197: digitArr[ii] |= 1 << 7;
	ldw	x, (0x0a, sp)
	ld	a, (x)
	or	a, #0x80
	ldw	x, (0x0a, sp)
	ld	(x), a
00102$:
;	beep.c: 199: v /= 10;
	pushw	y
	ldw	x, (0x07, sp)
	ldw	y, #0x000a
	divw	x, y
	popw	y
	ldw	(0x05, sp), x
;	beep.c: 194: for (ii = 0; ii < 4; ++ii) {
	incw	y
	cpw	y, #0x0004
	jrc	00106$
;	beep.c: 202: _tm1637Start();
	call	__tm1637Start
;	beep.c: 203: _tm1637WriteByte(0x40);
	push	#0x40
	call	__tm1637WriteByte
	pop	a
;	beep.c: 204: _tm1637ReadResult();
	call	__tm1637ReadResult
;	beep.c: 205: _tm1637Stop();
	call	__tm1637Stop
;	beep.c: 207: _tm1637Start();
	call	__tm1637Start
;	beep.c: 208: _tm1637WriteByte(0xc0);
	push	#0xc0
	call	__tm1637WriteByte
	pop	a
;	beep.c: 209: _tm1637ReadResult();
	call	__tm1637ReadResult
;	beep.c: 211: for (ii = 0; ii < 4; ++ii) {
	clrw	x
	ldw	(0x07, sp), x
00108$:
;	beep.c: 212: _tm1637WriteByte(digitArr[3 - ii]);
	ld	a, (0x08, sp)
	ld	(0x09, sp), a
	ld	a, #0x03
	sub	a, (0x09, sp)
	clrw	x
	ld	xl, a
	addw	x, (0x0e, sp)
	ld	a, (x)
	push	a
	call	__tm1637WriteByte
	pop	a
;	beep.c: 213: _tm1637ReadResult();
	call	__tm1637ReadResult
;	beep.c: 211: for (ii = 0; ii < 4; ++ii) {
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x07, sp), x
	ldw	x, (0x07, sp)
	cpw	x, #0x0004
	jrc	00108$
;	beep.c: 216: _tm1637Stop();
	call	__tm1637Stop
	addw	sp, #15
	ret
;	beep.c: 221: void tm1637SetBrightness(char brightness)
;	-----------------------------------------
;	 function tm1637SetBrightness
;	-----------------------------------------
_tm1637SetBrightness:
;	beep.c: 228: _tm1637Start();
	call	__tm1637Start
;	beep.c: 229: _tm1637WriteByte(0x87 + brightness);
	ld	a, (0x03, sp)
	add	a, #0x87
	push	a
	call	__tm1637WriteByte
	pop	a
;	beep.c: 230: _tm1637ReadResult();
	call	__tm1637ReadResult
;	beep.c: 231: _tm1637Stop();
	jp	__tm1637Stop
;	beep.c: 234: void _tm1637Start(void)
;	-----------------------------------------
;	 function _tm1637Start
;	-----------------------------------------
__tm1637Start:
;	beep.c: 236: _tm1637ClkHigh();
	call	__tm1637ClkHigh
;	beep.c: 237: _tm1637DioHigh();
	call	__tm1637DioHigh
;	beep.c: 238: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	beep.c: 239: _tm1637DioLow();
	jp	__tm1637DioLow
;	beep.c: 242: void _tm1637Stop(void)
;	-----------------------------------------
;	 function _tm1637Stop
;	-----------------------------------------
__tm1637Stop:
;	beep.c: 244: _tm1637ClkLow();
	call	__tm1637ClkLow
;	beep.c: 245: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	beep.c: 246: _tm1637DioLow();
	call	__tm1637DioLow
;	beep.c: 247: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	beep.c: 248: _tm1637ClkHigh();
	call	__tm1637ClkHigh
;	beep.c: 249: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	beep.c: 250: _tm1637DioHigh();
	jp	__tm1637DioHigh
;	beep.c: 253: void _tm1637ReadResult(void)
;	-----------------------------------------
;	 function _tm1637ReadResult
;	-----------------------------------------
__tm1637ReadResult:
;	beep.c: 255: _tm1637ClkLow();
	call	__tm1637ClkLow
;	beep.c: 256: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	beep.c: 258: _tm1637ClkHigh();
	call	__tm1637ClkHigh
;	beep.c: 259: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	beep.c: 260: _tm1637ClkLow();
	jp	__tm1637ClkLow
;	beep.c: 263: void _tm1637WriteByte(unsigned char b)
;	-----------------------------------------
;	 function _tm1637WriteByte
;	-----------------------------------------
__tm1637WriteByte:
	sub	sp, #2
;	beep.c: 265: for (ii = 0; ii < 8; ++ii) {
	clrw	x
	ldw	(0x01, sp), x
00105$:
;	beep.c: 266: _tm1637ClkLow();
	call	__tm1637ClkLow
;	beep.c: 267: if (b & 0x01) {
	ld	a, (0x05, sp)
	srl	a
	jrnc	00102$
;	beep.c: 268: _tm1637DioHigh();
	call	__tm1637DioHigh
	jra	00103$
00102$:
;	beep.c: 271: _tm1637DioLow();
	call	__tm1637DioLow
00103$:
;	beep.c: 273: delay(15);
	push	#0x0f
	push	#0x00
	call	_delay
	addw	sp, #2
;	beep.c: 274: b >>= 1;
	ld	a, (0x05, sp)
	srl	a
	ld	(0x05, sp), a
;	beep.c: 275: _tm1637ClkHigh();
	call	__tm1637ClkHigh
;	beep.c: 276: delay(15);
	push	#0x0f
	push	#0x00
	call	_delay
	addw	sp, #2
;	beep.c: 265: for (ii = 0; ii < 8; ++ii) {
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	cpw	x, #0x0008
	jrslt	00105$
	addw	sp, #2
	ret
;	beep.c: 282: void _tm1637ClkHigh(void)
;	-----------------------------------------
;	 function _tm1637ClkHigh
;	-----------------------------------------
__tm1637ClkHigh:
;	beep.c: 287: PD_ODR |= 1 << 2;
	ldw	x, #0x500f
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
	ret
;	beep.c: 290: void _tm1637ClkLow(void)
;	-----------------------------------------
;	 function _tm1637ClkLow
;	-----------------------------------------
__tm1637ClkLow:
;	beep.c: 294: PD_ODR &= ~(1 << 2);
	ldw	x, #0x500f
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
	ret
;	beep.c: 300: void _tm1637DioHigh(void)
;	-----------------------------------------
;	 function _tm1637DioHigh
;	-----------------------------------------
__tm1637DioHigh:
;	beep.c: 304: PD_ODR |= 1 << 3;
	ldw	x, #0x500f
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
	ret
;	beep.c: 308: void _tm1637DioLow(void)
;	-----------------------------------------
;	 function _tm1637DioLow
;	-----------------------------------------
__tm1637DioLow:
;	beep.c: 310: PD_ODR &= ~(1 << 3);
	ldw	x, #0x500f
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	ret
;	beep.c: 325: void rt_one_second_increment (st_time *t) {
;	-----------------------------------------
;	 function rt_one_second_increment
;	-----------------------------------------
_rt_one_second_increment:
	sub	sp, #8
;	beep.c: 326: ++t->ticker; //   
	ldw	y, (0x0b, sp)
	ldw	(0x01, sp), y
	ldw	x, (0x01, sp)
	addw	x, #0x0004
	ldw	(0x03, sp), x
	ldw	x, (0x03, sp)
	ld	a, (0x3, x)
	ld	yl, a
	ld	a, (0x2, x)
	ldw	x, (x)
	ld	yh, a
	addw	y, #0x0001
	ld	a, xl
	adc	a, #0x00
	ld	(0x06, sp), a
	ld	a, xh
	adc	a, #0x00
	ld	(0x05, sp), a
	ldw	x, (0x03, sp)
	ldw	(0x2, x), y
	ldw	y, (0x05, sp)
	ldw	(x), y
;	beep.c: 327: if(++t->second > 59) {
	ldw	x, (0x01, sp)
	ld	a, (x)
	inc	a
	ld	(x), a
	cp	a, #0x3b
	jrule	00107$
;	beep.c: 328: t->second= 0;
	ldw	x, (0x01, sp)
	clr	(x)
;	beep.c: 329: if(++t->minute > 59) {
	ldw	x, (0x01, sp)
	incw	x
	ld	a, (x)
	inc	a
	ld	(x), a
	cp	a, #0x3b
	jrule	00107$
;	beep.c: 330: t->minute= 0;
	clr	(x)
;	beep.c: 331: if(++t->hour > 23) {
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	ld	a, (x)
	inc	a
	ld	(x), a
	cp	a, #0x17
	jrule	00107$
;	beep.c: 332: t->hour= 0;
	clr	(x)
00107$:
	addw	sp, #8
	ret
;	beep.c: 342: void timer_isr(void) __interrupt(BEEP_ISR) {
;	-----------------------------------------
;	 function timer_isr
;	-----------------------------------------
_timer_isr:
;	beep.c: 343: if (++internteller > 500) {
	ldw	x, _internteller+0
	incw	x
	ldw	_internteller+0, x
	cpw	x, #0x01f4
	jrule	00103$
;	beep.c: 344: internteller=0;
	clr	_internteller+1
	clr	_internteller+0
;	beep.c: 345: rt_one_second_increment(&real_time);
	ldw	x, #_real_time+0
	pushw	x
	call	_rt_one_second_increment
	addw	sp, #2
00103$:
	iret
;	beep.c: 374: void option_bytes_unlock() {
;	-----------------------------------------
;	 function option_bytes_unlock
;	-----------------------------------------
_option_bytes_unlock:
;	beep.c: 375: FLASH_CR2 |= (1 << FLASH_CR2_OPT);
	bset	0x505b, #7
;	beep.c: 376: FLASH_NCR2 &= ~(1 << FLASH_NCR2_NOPT);
	bres	0x505c, #7
	ret
;	beep.c: 380: int main () {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #29
;	beep.c: 384: u8 startmeting=0;	
	clr	(0x01, sp)
;	beep.c: 385: unsigned int val=0, current,periode;
	clrw	x
	ldw	(0x1c, sp), x
;	beep.c: 387: InitializeSystemClock();
	call	_InitializeSystemClock
;	beep.c: 390: option_bytes_unlock();
	call	_option_bytes_unlock
;	beep.c: 392: tm1637DisplayDecimal(1, 0); // display minutes
	clrw	x
	pushw	x
	push	#0x01
	call	_tm1637DisplayDecimal
	addw	sp, #3
;	beep.c: 393: FLASH_DUKR = FLASH_DUKR_KEY1;
	ldw	x, #0x5064
	ld	a, #0xae
	ld	(x), a
;	beep.c: 394: FLASH_DUKR = FLASH_DUKR_KEY2;
	ldw	x, #0x5064
	ld	a, #0x56
	ld	(x), a
;	beep.c: 395: while (!(FLASH_IAPSR & (1 << FLASH_IAPSR_DUL)));
00101$:
	ldw	x, #0x505f
	ld	a, (x)
	bcp	a, #0x08
	jreq	00101$
;	beep.c: 396: tm1637DisplayDecimal(2, 0); // display minutes
	clrw	x
	pushw	x
	push	#0x02
	call	_tm1637DisplayDecimal
	addw	sp, #3
;	beep.c: 397: for (addr = EEPROM_START_ADDR; addr < EEPROM_END_ADDR; addr++)
	ldw	x, #0x4000
00116$:
;	beep.c: 398: _MEM_(addr) = 0x1A;
	ldw	y, x
	ld	a, #0x1a
	ld	(0x1, y), a
	clr	(y)
;	beep.c: 397: for (addr = EEPROM_START_ADDR; addr < EEPROM_END_ADDR; addr++)
	incw	x
	cpw	x, #0x4280
	jrc	00116$
;	beep.c: 399: tm1637DisplayDecimal(3, 0); // display minutes
	clrw	x
	pushw	x
	push	#0x03
	call	_tm1637DisplayDecimal
	addw	sp, #3
;	beep.c: 402: FLASH_IAPSR &= ~(1 << FLASH_IAPSR_DUL);
	ldw	x, #0x505f
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	beep.c: 404: tm1637DisplayDecimal(4, 0); // display minutes
	clrw	x
	pushw	x
	push	#0x04
	call	_tm1637DisplayDecimal
	addw	sp, #3
;	beep.c: 411: BEEP_CSR = (0<<7) | (0<<6) | (1<<5) | 0x1E;
	ldw	x, #0x50f3
	ld	a, #0x3e
	ld	(x), a
;	beep.c: 412: PD_DDR = (1 << 3) | (1 << 2); // output mode
	ldw	x, #0x5011
	ld	a, #0x0c
	ld	(x), a
;	beep.c: 414: PD_DDR &=  ~(1 << 4); //PD4 input
	ldw	x, #0x5011
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	beep.c: 415: PD_CR1 = (1 << 3) | (1 << 2); // push-pull
	ldw	x, #0x5012
	ld	a, #0x0c
	ld	(x), a
;	beep.c: 416: PD_CR1 &= ~(1 << 4); // input with float
	ldw	x, #0x5012
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	beep.c: 417: PD_CR2 = (1 << 3) | (1 << 2) | (1<< 4); // up to 10MHz speed + interrupt enabled 
	ldw	x, #0x5013
	ld	a, #0x1c
	ld	(x), a
;	beep.c: 419: EXTI_CR1 = (1<<7); //Port D external sensitivity bits7:6 10: Falling edge only
	ldw	x, #0x50a0
	ld	a, #0x80
	ld	(x), a
;	beep.c: 420: EXTI_CR1 &= ~(1<<6); //Port D external sensitivity bits7:6 10: Falling edge only
	ldw	x, #0x50a0
	ld	a, (x)
	and	a, #0xbf
	ld	(x), a
;	beep.c: 423: tijd = &real_time;
	ldw	x, #_real_time+0
	ldw	(0x1a, sp), x
	ld	a, (0x1a, sp)
	push	a
	ld	a, (0x1c, sp)
	ld	(0x0c, sp), a
	pop	a
	ld	(0x0a, sp), a
;	beep.c: 428: tm1637Init();
	call	_tm1637Init
;	beep.c: 430: InitializeUART();
	call	_InitializeUART
;	beep.c: 434: __asm__("rim");
	rim
;	beep.c: 438: while (1) {
00114$:
;	beep.c: 439: ADC_CR1 |= ADC_ADON; // ADC ON
	bset	0x5401, #0
;	beep.c: 440: ADC_CSR |= ((0x0F)&2); // select channel = 2 = PC4
	ldw	x, #0x5400
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	beep.c: 441: ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
	ldw	x, #0x5402
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	beep.c: 442: ADC_CR1 |= ADC_ADON; // start conversion
	bset	0x5401, #0
;	beep.c: 443: while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC
00105$:
	ldw	x, #0x5400
	ld	a, (x)
	sll	a
	jrnc	00105$
;	beep.c: 445: val |= (unsigned int)ADC_DRL;
	ldw	x, #0x5405
	ld	a, (x)
	clrw	x
	ld	xl, a
	or	a, (0x1d, sp)
	ld	(0x19, sp), a
	ld	a, xh
	or	a, (0x1c, sp)
	ld	(0x0e, sp), a
	ld	a, (0x19, sp)
	ld	(0x0f, sp), a
;	beep.c: 447: val |= (unsigned int)ADC_DRH<<8;
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
	or	a, (0x0f, sp)
	ld	(0x17, sp), a
	ld	a, xh
	or	a, (0x0e, sp)
	ld	(0x1c, sp), a
	ld	a, (0x17, sp)
	ld	(0x1d, sp), a
;	beep.c: 448: ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
	ldw	x, #0x5401
	ld	a, (x)
	and	a, #0xfe
	ld	(x), a
;	beep.c: 449: current = val & 0x03ff;
	ld	a, (0x1d, sp)
	ld	(0x0d, sp), a
	ld	a, (0x1c, sp)
	and	a, #0x03
	ld	(0x0c, sp), a
;	beep.c: 451: if (current > MIN_CURRENT){ //start timing current consumption
	ldw	x, (0x0c, sp)
	cpw	x, #0x000a
	jrule	00109$
;	beep.c: 453: starttijd.second = real_time.second;
	ldw	x, sp
	incw	x
	incw	x
	ldw	y, (0x1a, sp)
	ld	a, (y)
	ld	(x), a
;	beep.c: 454: starttijd.minute = real_time.minute;
	ldw	x, sp
	incw	x
	incw	x
	ldw	(0x14, sp), x
	ldw	x, (0x14, sp)
	incw	x
	ldw	y, (0x1a, sp)
	ld	a, (0x1, y)
	ld	(x), a
;	beep.c: 455: starttijd.hour = real_time.hour;
	ldw	x, (0x14, sp)
	incw	x
	incw	x
	ldw	y, (0x1a, sp)
	ld	a, (0x2, y)
	ld	(x), a
;	beep.c: 456: starttijd.ticker = real_time.ticker;
	ldw	x, (0x14, sp)
	addw	x, #0x0004
	ldw	y, (0x1a, sp)
	ld	a, (0x7, y)
	push	a
	ld	a, (0x6, y)
	ld	(0x13, sp), a
	ldw	y, (0x4, y)
	pop	a
	ld	(0x3, x), a
	ld	a, (0x12, sp)
	ld	(0x2, x), a
	ldw	(x), y
;	beep.c: 457: startmeting = 1;
	ld	a, #0x01
	ld	(0x01, sp), a
00109$:
;	beep.c: 459: if ((current < MIN_CURRENT) && (startmeting)) //stop timing current consumption
	ldw	x, (0x0c, sp)
	cpw	x, #0x000a
	jrnc	00111$
	tnz	(0x01, sp)
	jreq	00111$
;	beep.c: 462: startmeting = 0;
	clr	(0x01, sp)
00111$:
;	beep.c: 467: tm1637DisplayDecimal(tijd->minute, 0); // display minutes 
	ldw	x, (0x0a, sp)
	ld	a, (0x1, x)
	clrw	x
	pushw	x
	push	a
	call	_tm1637DisplayDecimal
	addw	sp, #3
	jp	00114$
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
