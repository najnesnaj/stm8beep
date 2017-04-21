                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.0 #8981 (Jul 11 2014) (Linux)
                                      4 ; This file was generated Fri Apr 21 13:12:02 2017
                                      5 ;--------------------------------------------------------
                                      6 	.module sensors
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _segmentMap
                                     13 	.globl _main
                                     14 	.globl _timer_isr
                                     15 	.globl _rt_one_second_increment
                                     16 	.globl _clock
                                     17 	.globl _tm1637DisplayDecimal
                                     18 	.globl _tm1637Init
                                     19 	.globl _InitializeUART
                                     20 	.globl _InitializeI2C
                                     21 	.globl _i2c_read_register
                                     22 	.globl _print_byte_hex
                                     23 	.globl _i2c_set_start_ack
                                     24 	.globl _i2c_send_address
                                     25 	.globl _print_UCHAR_hex
                                     26 	.globl _UARTPrintF
                                     27 	.globl _i2c_send_reg
                                     28 	.globl _i2c_set_stop
                                     29 	.globl _i2c_set_nak
                                     30 	.globl _i2c_read
                                     31 	.globl _delay
                                     32 	.globl _InitializeSystemClock
                                     33 	.globl _delayTenMicro
                                     34 	.globl _minuten
                                     35 	.globl _seconden
                                     36 	.globl _internteller
                                     37 	.globl _real_time
                                     38 	.globl _tm1637SetBrightness
                                     39 	.globl __tm1637Start
                                     40 	.globl __tm1637Stop
                                     41 	.globl __tm1637ReadResult
                                     42 	.globl __tm1637WriteByte
                                     43 	.globl __tm1637ClkHigh
                                     44 	.globl __tm1637ClkLow
                                     45 	.globl __tm1637DioHigh
                                     46 	.globl __tm1637DioLow
                                     47 ;--------------------------------------------------------
                                     48 ; ram data
                                     49 ;--------------------------------------------------------
                                     50 	.area DATA
      000001                         51 _real_time::
      000001                         52 	.ds 4
      000005                         53 _internteller::
      000005                         54 	.ds 2
      000007                         55 _seconden::
      000007                         56 	.ds 2
      000009                         57 _minuten::
      000009                         58 	.ds 2
                                     59 ;--------------------------------------------------------
                                     60 ; ram data
                                     61 ;--------------------------------------------------------
                                     62 	.area INITIALIZED
                                     63 ;--------------------------------------------------------
                                     64 ; Stack segment in internal ram 
                                     65 ;--------------------------------------------------------
                                     66 	.area	SSEG
      000000                         67 __start__stack:
      000000                         68 	.ds	1
                                     69 
                                     70 ;--------------------------------------------------------
                                     71 ; absolute external ram data
                                     72 ;--------------------------------------------------------
                                     73 	.area DABS (ABS)
                                     74 ;--------------------------------------------------------
                                     75 ; interrupt vector 
                                     76 ;--------------------------------------------------------
                                     77 	.area HOME
      008000                         78 __interrupt_vect:
      008000 82 00 80 83             79 	int s_GSINIT ;reset
      008004 82 00 00 00             80 	int 0x0000 ;trap
      008008 82 00 00 00             81 	int 0x0000 ;int0
      00800C 82 00 00 00             82 	int 0x0000 ;int1
      008010 82 00 00 00             83 	int 0x0000 ;int2
      008014 82 00 00 00             84 	int 0x0000 ;int3
      008018 82 00 00 00             85 	int 0x0000 ;int4
      00801C 82 00 00 00             86 	int 0x0000 ;int5
      008020 82 00 85 1F             87 	int _timer_isr ;int6
      008024 82 00 00 00             88 	int 0x0000 ;int7
      008028 82 00 00 00             89 	int 0x0000 ;int8
      00802C 82 00 00 00             90 	int 0x0000 ;int9
      008030 82 00 00 00             91 	int 0x0000 ;int10
      008034 82 00 00 00             92 	int 0x0000 ;int11
      008038 82 00 00 00             93 	int 0x0000 ;int12
      00803C 82 00 00 00             94 	int 0x0000 ;int13
      008040 82 00 00 00             95 	int 0x0000 ;int14
      008044 82 00 00 00             96 	int 0x0000 ;int15
      008048 82 00 00 00             97 	int 0x0000 ;int16
      00804C 82 00 00 00             98 	int 0x0000 ;int17
      008050 82 00 00 00             99 	int 0x0000 ;int18
      008054 82 00 00 00            100 	int 0x0000 ;int19
      008058 82 00 00 00            101 	int 0x0000 ;int20
      00805C 82 00 00 00            102 	int 0x0000 ;int21
      008060 82 00 00 00            103 	int 0x0000 ;int22
      008064 82 00 00 00            104 	int 0x0000 ;int23
      008068 82 00 00 00            105 	int 0x0000 ;int24
      00806C 82 00 00 00            106 	int 0x0000 ;int25
      008070 82 00 00 00            107 	int 0x0000 ;int26
      008074 82 00 00 00            108 	int 0x0000 ;int27
      008078 82 00 00 00            109 	int 0x0000 ;int28
      00807C 82 00 00 00            110 	int 0x0000 ;int29
                                    111 ;--------------------------------------------------------
                                    112 ; global & static initialisations
                                    113 ;--------------------------------------------------------
                                    114 	.area HOME
                                    115 	.area GSINIT
                                    116 	.area GSFINAL
                                    117 	.area GSINIT
      008083                        118 __sdcc_gs_init_startup:
      008083                        119 __sdcc_init_data:
                                    120 ; stm8_genXINIT() start
      008083 AE 00 0A         [ 2]  121 	ldw x, #l_DATA
      008086 27 07            [ 1]  122 	jreq	00002$
      008088                        123 00001$:
      008088 72 4F 00 00      [ 1]  124 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  125 	decw x
      00808D 26 F9            [ 1]  126 	jrne	00001$
      00808F                        127 00002$:
      00808F AE 00 00         [ 2]  128 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  129 	jreq	00004$
      008094                        130 00003$:
      008094 D6 86 04         [ 1]  131 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 0A         [ 1]  132 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  133 	decw	x
      00809B 26 F7            [ 1]  134 	jrne	00003$
      00809D                        135 00004$:
                                    136 ; stm8_genXINIT() end
                                    137 	.area GSFINAL
      00809D CC 80 80         [ 2]  138 	jp	__sdcc_program_startup
                                    139 ;--------------------------------------------------------
                                    140 ; Home
                                    141 ;--------------------------------------------------------
                                    142 	.area HOME
                                    143 	.area HOME
      008080                        144 __sdcc_program_startup:
      008080 CC 85 3D         [ 2]  145 	jp	_main
                                    146 ;	return from main will return to caller
                                    147 ;--------------------------------------------------------
                                    148 ; code
                                    149 ;--------------------------------------------------------
                                    150 	.area CODE
                                    151 ;	sensors.c: 24: void delayTenMicro (void) {
                                    152 ;	-----------------------------------------
                                    153 ;	 function delayTenMicro
                                    154 ;	-----------------------------------------
      0080A0                        155 _delayTenMicro:
                                    156 ;	sensors.c: 26: for (a = 0; a < 50; ++a)
      0080A0 A6 32            [ 1]  157 	ld	a, #0x32
      0080A2                        158 00104$:
                                    159 ;	sensors.c: 27: __asm__("nop");
      0080A2 9D               [ 1]  160 	nop
      0080A3 4A               [ 1]  161 	dec	a
                                    162 ;	sensors.c: 26: for (a = 0; a < 50; ++a)
      0080A4 4D               [ 1]  163 	tnz	a
      0080A5 26 FB            [ 1]  164 	jrne	00104$
      0080A7 81               [ 4]  165 	ret
                                    166 ;	sensors.c: 30: void InitializeSystemClock() {
                                    167 ;	-----------------------------------------
                                    168 ;	 function InitializeSystemClock
                                    169 ;	-----------------------------------------
      0080A8                        170 _InitializeSystemClock:
                                    171 ;	sensors.c: 31: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
      0080A8 AE 50 C0         [ 2]  172 	ldw	x, #0x50c0
      0080AB 7F               [ 1]  173 	clr	(x)
                                    174 ;	sensors.c: 32: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
      0080AC AE 50 C0         [ 2]  175 	ldw	x, #0x50c0
      0080AF A6 01            [ 1]  176 	ld	a, #0x01
      0080B1 F7               [ 1]  177 	ld	(x), a
                                    178 ;	sensors.c: 33: CLK_ECKR = 0;                       //  Disable the external clock.
      0080B2 AE 50 C1         [ 2]  179 	ldw	x, #0x50c1
      0080B5 7F               [ 1]  180 	clr	(x)
                                    181 ;	sensors.c: 34: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
      0080B6                        182 00101$:
      0080B6 AE 50 C0         [ 2]  183 	ldw	x, #0x50c0
      0080B9 F6               [ 1]  184 	ld	a, (x)
      0080BA A5 02            [ 1]  185 	bcp	a, #0x02
      0080BC 27 F8            [ 1]  186 	jreq	00101$
                                    187 ;	sensors.c: 35: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
      0080BE AE 50 C6         [ 2]  188 	ldw	x, #0x50c6
      0080C1 7F               [ 1]  189 	clr	(x)
                                    190 ;	sensors.c: 36: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
      0080C2 AE 50 C7         [ 2]  191 	ldw	x, #0x50c7
      0080C5 A6 FF            [ 1]  192 	ld	a, #0xff
      0080C7 F7               [ 1]  193 	ld	(x), a
                                    194 ;	sensors.c: 37: CLK_PCKENR2 = 0xff;                 //  Ditto.
      0080C8 AE 50 CA         [ 2]  195 	ldw	x, #0x50ca
      0080CB A6 FF            [ 1]  196 	ld	a, #0xff
      0080CD F7               [ 1]  197 	ld	(x), a
                                    198 ;	sensors.c: 38: CLK_CCOR = 0;                       //  Turn off CCO.
      0080CE AE 50 C9         [ 2]  199 	ldw	x, #0x50c9
      0080D1 7F               [ 1]  200 	clr	(x)
                                    201 ;	sensors.c: 39: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
      0080D2 AE 50 CC         [ 2]  202 	ldw	x, #0x50cc
      0080D5 7F               [ 1]  203 	clr	(x)
                                    204 ;	sensors.c: 40: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
      0080D6 AE 50 CD         [ 2]  205 	ldw	x, #0x50cd
      0080D9 7F               [ 1]  206 	clr	(x)
                                    207 ;	sensors.c: 41: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
      0080DA AE 50 C4         [ 2]  208 	ldw	x, #0x50c4
      0080DD A6 E1            [ 1]  209 	ld	a, #0xe1
      0080DF F7               [ 1]  210 	ld	(x), a
                                    211 ;	sensors.c: 42: CLK_SWCR = 0;                       //  Reset the clock switch control register.
      0080E0 AE 50 C5         [ 2]  212 	ldw	x, #0x50c5
      0080E3 7F               [ 1]  213 	clr	(x)
                                    214 ;	sensors.c: 43: CLK_SWCR = CLK_SWEN;                //  Enable switching.
      0080E4 AE 50 C5         [ 2]  215 	ldw	x, #0x50c5
      0080E7 A6 02            [ 1]  216 	ld	a, #0x02
      0080E9 F7               [ 1]  217 	ld	(x), a
                                    218 ;	sensors.c: 44: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
      0080EA                        219 00104$:
      0080EA AE 50 C5         [ 2]  220 	ldw	x, #0x50c5
      0080ED F6               [ 1]  221 	ld	a, (x)
      0080EE 44               [ 1]  222 	srl	a
      0080EF 25 F9            [ 1]  223 	jrc	00104$
      0080F1 81               [ 4]  224 	ret
                                    225 ;	sensors.c: 46: void delay (int time_ms) {
                                    226 ;	-----------------------------------------
                                    227 ;	 function delay
                                    228 ;	-----------------------------------------
      0080F2                        229 _delay:
      0080F2 52 0A            [ 2]  230 	sub	sp, #10
                                    231 ;	sensors.c: 48: for (x = 0; x < 1036*time_ms; ++x)
      0080F4 5F               [ 1]  232 	clrw	x
      0080F5 1F 03            [ 2]  233 	ldw	(0x03, sp), x
      0080F7 1F 01            [ 2]  234 	ldw	(0x01, sp), x
      0080F9 1E 0D            [ 2]  235 	ldw	x, (0x0d, sp)
      0080FB 89               [ 2]  236 	pushw	x
      0080FC 4B 0C            [ 1]  237 	push	#0x0c
      0080FE 4B 04            [ 1]  238 	push	#0x04
      008100 CD 85 AF         [ 4]  239 	call	__mulint
      008103 5B 04            [ 2]  240 	addw	sp, #4
      008105 1F 09            [ 2]  241 	ldw	(0x09, sp), x
      008107                        242 00103$:
      008107 16 09            [ 2]  243 	ldw	y, (0x09, sp)
      008109 17 07            [ 2]  244 	ldw	(0x07, sp), y
      00810B 7B 07            [ 1]  245 	ld	a, (0x07, sp)
      00810D 49               [ 1]  246 	rlc	a
      00810E 4F               [ 1]  247 	clr	a
      00810F A2 00            [ 1]  248 	sbc	a, #0x00
      008111 6B 06            [ 1]  249 	ld	(0x06, sp), a
      008113 6B 05            [ 1]  250 	ld	(0x05, sp), a
      008115 1E 03            [ 2]  251 	ldw	x, (0x03, sp)
      008117 13 07            [ 2]  252 	cpw	x, (0x07, sp)
      008119 7B 02            [ 1]  253 	ld	a, (0x02, sp)
      00811B 12 06            [ 1]  254 	sbc	a, (0x06, sp)
      00811D 7B 01            [ 1]  255 	ld	a, (0x01, sp)
      00811F 12 05            [ 1]  256 	sbc	a, (0x05, sp)
      008121 2E 17            [ 1]  257 	jrsge	00105$
                                    258 ;	sensors.c: 49: __asm__("nop");
      008123 9D               [ 1]  259 	nop
                                    260 ;	sensors.c: 48: for (x = 0; x < 1036*time_ms; ++x)
      008124 16 03            [ 2]  261 	ldw	y, (0x03, sp)
      008126 72 A9 00 01      [ 2]  262 	addw	y, #0x0001
      00812A 7B 02            [ 1]  263 	ld	a, (0x02, sp)
      00812C A9 00            [ 1]  264 	adc	a, #0x00
      00812E 97               [ 1]  265 	ld	xl, a
      00812F 7B 01            [ 1]  266 	ld	a, (0x01, sp)
      008131 A9 00            [ 1]  267 	adc	a, #0x00
      008133 95               [ 1]  268 	ld	xh, a
      008134 17 03            [ 2]  269 	ldw	(0x03, sp), y
      008136 1F 01            [ 2]  270 	ldw	(0x01, sp), x
      008138 20 CD            [ 2]  271 	jra	00103$
      00813A                        272 00105$:
      00813A 5B 0A            [ 2]  273 	addw	sp, #10
      00813C 81               [ 4]  274 	ret
                                    275 ;	sensors.c: 51: void i2c_read (unsigned char *x) {
                                    276 ;	-----------------------------------------
                                    277 ;	 function i2c_read
                                    278 ;	-----------------------------------------
      00813D                        279 _i2c_read:
                                    280 ;	sensors.c: 52: while ((I2C_SR1 & I2C_RXNE) == 0);
      00813D                        281 00101$:
      00813D AE 52 17         [ 2]  282 	ldw	x, #0x5217
      008140 F6               [ 1]  283 	ld	a, (x)
      008141 A5 40            [ 1]  284 	bcp	a, #0x40
      008143 27 F8            [ 1]  285 	jreq	00101$
                                    286 ;	sensors.c: 53: *x = I2C_DR;
      008145 16 03            [ 2]  287 	ldw	y, (0x03, sp)
      008147 AE 52 16         [ 2]  288 	ldw	x, #0x5216
      00814A F6               [ 1]  289 	ld	a, (x)
      00814B 90 F7            [ 1]  290 	ld	(y), a
      00814D 81               [ 4]  291 	ret
                                    292 ;	sensors.c: 55: void i2c_set_nak (void) {
                                    293 ;	-----------------------------------------
                                    294 ;	 function i2c_set_nak
                                    295 ;	-----------------------------------------
      00814E                        296 _i2c_set_nak:
                                    297 ;	sensors.c: 56: I2C_CR2 &= ~I2C_ACK;
      00814E AE 52 11         [ 2]  298 	ldw	x, #0x5211
      008151 F6               [ 1]  299 	ld	a, (x)
      008152 A4 FB            [ 1]  300 	and	a, #0xfb
      008154 F7               [ 1]  301 	ld	(x), a
      008155 81               [ 4]  302 	ret
                                    303 ;	sensors.c: 58: void i2c_set_stop (void) {
                                    304 ;	-----------------------------------------
                                    305 ;	 function i2c_set_stop
                                    306 ;	-----------------------------------------
      008156                        307 _i2c_set_stop:
                                    308 ;	sensors.c: 59: I2C_CR2 |= I2C_STOP;
      008156 AE 52 11         [ 2]  309 	ldw	x, #0x5211
      008159 F6               [ 1]  310 	ld	a, (x)
      00815A AA 02            [ 1]  311 	or	a, #0x02
      00815C F7               [ 1]  312 	ld	(x), a
      00815D 81               [ 4]  313 	ret
                                    314 ;	sensors.c: 61: void i2c_send_reg (UCHAR addr) {
                                    315 ;	-----------------------------------------
                                    316 ;	 function i2c_send_reg
                                    317 ;	-----------------------------------------
      00815E                        318 _i2c_send_reg:
      00815E 52 02            [ 2]  319 	sub	sp, #2
                                    320 ;	sensors.c: 63: reg = I2C_SR1;
      008160 AE 52 17         [ 2]  321 	ldw	x, #0x5217
      008163 F6               [ 1]  322 	ld	a, (x)
      008164 5F               [ 1]  323 	clrw	x
      008165 97               [ 1]  324 	ld	xl, a
      008166 1F 01            [ 2]  325 	ldw	(0x01, sp), x
                                    326 ;	sensors.c: 64: reg = I2C_SR3;
      008168 AE 52 19         [ 2]  327 	ldw	x, #0x5219
      00816B F6               [ 1]  328 	ld	a, (x)
      00816C 5F               [ 1]  329 	clrw	x
      00816D 97               [ 1]  330 	ld	xl, a
      00816E 1F 01            [ 2]  331 	ldw	(0x01, sp), x
                                    332 ;	sensors.c: 65: I2C_DR = addr;
      008170 AE 52 16         [ 2]  333 	ldw	x, #0x5216
      008173 7B 05            [ 1]  334 	ld	a, (0x05, sp)
      008175 F7               [ 1]  335 	ld	(x), a
                                    336 ;	sensors.c: 66: while ((I2C_SR1 & I2C_TXE) == 0);
      008176                        337 00101$:
      008176 AE 52 17         [ 2]  338 	ldw	x, #0x5217
      008179 F6               [ 1]  339 	ld	a, (x)
      00817A 48               [ 1]  340 	sll	a
      00817B 24 F9            [ 1]  341 	jrnc	00101$
      00817D 5B 02            [ 2]  342 	addw	sp, #2
      00817F 81               [ 4]  343 	ret
                                    344 ;	sensors.c: 70: void UARTPrintF (char *message) {
                                    345 ;	-----------------------------------------
                                    346 ;	 function UARTPrintF
                                    347 ;	-----------------------------------------
      008180                        348 _UARTPrintF:
                                    349 ;	sensors.c: 71: char *ch = message;
      008180 16 03            [ 2]  350 	ldw	y, (0x03, sp)
                                    351 ;	sensors.c: 72: while (*ch) {
      008182                        352 00104$:
      008182 90 F6            [ 1]  353 	ld	a, (y)
      008184 4D               [ 1]  354 	tnz	a
      008185 27 0F            [ 1]  355 	jreq	00107$
                                    356 ;	sensors.c: 73: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
      008187 AE 52 31         [ 2]  357 	ldw	x, #0x5231
      00818A F7               [ 1]  358 	ld	(x), a
                                    359 ;	sensors.c: 74: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
      00818B                        360 00101$:
      00818B AE 52 30         [ 2]  361 	ldw	x, #0x5230
      00818E F6               [ 1]  362 	ld	a, (x)
      00818F 48               [ 1]  363 	sll	a
      008190 24 F9            [ 1]  364 	jrnc	00101$
                                    365 ;	sensors.c: 75: ch++;                               //  Grab the next character.
      008192 90 5C            [ 2]  366 	incw	y
      008194 20 EC            [ 2]  367 	jra	00104$
      008196                        368 00107$:
      008196 81               [ 4]  369 	ret
                                    370 ;	sensors.c: 79: void print_UCHAR_hex (unsigned char buffer) {
                                    371 ;	-----------------------------------------
                                    372 ;	 function print_UCHAR_hex
                                    373 ;	-----------------------------------------
      008197                        374 _print_UCHAR_hex:
      008197 52 0C            [ 2]  375 	sub	sp, #12
                                    376 ;	sensors.c: 82: a = (buffer >> 4);
      008199 7B 0F            [ 1]  377 	ld	a, (0x0f, sp)
      00819B 4E               [ 1]  378 	swap	a
      00819C A4 0F            [ 1]  379 	and	a, #0x0f
      00819E 5F               [ 1]  380 	clrw	x
      00819F 97               [ 1]  381 	ld	xl, a
                                    382 ;	sensors.c: 83: if (a > 9)
      0081A0 A3 00 09         [ 2]  383 	cpw	x, #0x0009
      0081A3 2D 07            [ 1]  384 	jrsle	00102$
                                    385 ;	sensors.c: 84: a = a + 'a' - 10;
      0081A5 1C 00 57         [ 2]  386 	addw	x, #0x0057
      0081A8 1F 01            [ 2]  387 	ldw	(0x01, sp), x
      0081AA 20 05            [ 2]  388 	jra	00103$
      0081AC                        389 00102$:
                                    390 ;	sensors.c: 86: a += '0';
      0081AC 1C 00 30         [ 2]  391 	addw	x, #0x0030
      0081AF 1F 01            [ 2]  392 	ldw	(0x01, sp), x
      0081B1                        393 00103$:
                                    394 ;	sensors.c: 87: b = buffer & 0x0f;
      0081B1 7B 0F            [ 1]  395 	ld	a, (0x0f, sp)
      0081B3 A4 0F            [ 1]  396 	and	a, #0x0f
      0081B5 5F               [ 1]  397 	clrw	x
      0081B6 97               [ 1]  398 	ld	xl, a
                                    399 ;	sensors.c: 88: if (b > 9)
      0081B7 A3 00 09         [ 2]  400 	cpw	x, #0x0009
      0081BA 2D 07            [ 1]  401 	jrsle	00105$
                                    402 ;	sensors.c: 89: b = b + 'a' - 10;
      0081BC 1C 00 57         [ 2]  403 	addw	x, #0x0057
      0081BF 1F 0B            [ 2]  404 	ldw	(0x0b, sp), x
      0081C1 20 05            [ 2]  405 	jra	00106$
      0081C3                        406 00105$:
                                    407 ;	sensors.c: 91: b += '0';
      0081C3 1C 00 30         [ 2]  408 	addw	x, #0x0030
      0081C6 1F 0B            [ 2]  409 	ldw	(0x0b, sp), x
      0081C8                        410 00106$:
                                    411 ;	sensors.c: 92: message[0] = a;
      0081C8 90 96            [ 1]  412 	ldw	y, sp
      0081CA 72 A9 00 03      [ 2]  413 	addw	y, #3
      0081CE 7B 02            [ 1]  414 	ld	a, (0x02, sp)
      0081D0 90 F7            [ 1]  415 	ld	(y), a
                                    416 ;	sensors.c: 93: message[1] = b;
      0081D2 93               [ 1]  417 	ldw	x, y
      0081D3 5C               [ 2]  418 	incw	x
      0081D4 7B 0C            [ 1]  419 	ld	a, (0x0c, sp)
      0081D6 F7               [ 1]  420 	ld	(x), a
                                    421 ;	sensors.c: 94: message[2] = 0;
      0081D7 93               [ 1]  422 	ldw	x, y
      0081D8 5C               [ 2]  423 	incw	x
      0081D9 5C               [ 2]  424 	incw	x
      0081DA 7F               [ 1]  425 	clr	(x)
                                    426 ;	sensors.c: 95: UARTPrintF (message);
      0081DB 90 89            [ 2]  427 	pushw	y
      0081DD CD 81 80         [ 4]  428 	call	_UARTPrintF
      0081E0 5B 02            [ 2]  429 	addw	sp, #2
      0081E2 5B 0C            [ 2]  430 	addw	sp, #12
      0081E4 81               [ 4]  431 	ret
                                    432 ;	sensors.c: 98: void i2c_send_address (UCHAR addr, UCHAR mode) {
                                    433 ;	-----------------------------------------
                                    434 ;	 function i2c_send_address
                                    435 ;	-----------------------------------------
      0081E5                        436 _i2c_send_address:
      0081E5 52 03            [ 2]  437 	sub	sp, #3
                                    438 ;	sensors.c: 100: reg = I2C_SR1;
      0081E7 AE 52 17         [ 2]  439 	ldw	x, #0x5217
      0081EA F6               [ 1]  440 	ld	a, (x)
      0081EB 5F               [ 1]  441 	clrw	x
      0081EC 97               [ 1]  442 	ld	xl, a
      0081ED 1F 01            [ 2]  443 	ldw	(0x01, sp), x
                                    444 ;	sensors.c: 101: I2C_DR = (addr << 1) | mode;
      0081EF 7B 06            [ 1]  445 	ld	a, (0x06, sp)
      0081F1 48               [ 1]  446 	sll	a
      0081F2 1A 07            [ 1]  447 	or	a, (0x07, sp)
      0081F4 AE 52 16         [ 2]  448 	ldw	x, #0x5216
      0081F7 F7               [ 1]  449 	ld	(x), a
                                    450 ;	sensors.c: 102: if (mode == I2C_READ) {
      0081F8 7B 07            [ 1]  451 	ld	a, (0x07, sp)
      0081FA A1 01            [ 1]  452 	cp	a, #0x01
      0081FC 26 06            [ 1]  453 	jrne	00127$
      0081FE A6 01            [ 1]  454 	ld	a, #0x01
      008200 6B 03            [ 1]  455 	ld	(0x03, sp), a
      008202 20 02            [ 2]  456 	jra	00128$
      008204                        457 00127$:
      008204 0F 03            [ 1]  458 	clr	(0x03, sp)
      008206                        459 00128$:
      008206 0D 03            [ 1]  460 	tnz	(0x03, sp)
      008208 27 08            [ 1]  461 	jreq	00103$
                                    462 ;	sensors.c: 103: I2C_OARL = 0;
      00820A AE 52 13         [ 2]  463 	ldw	x, #0x5213
      00820D 7F               [ 1]  464 	clr	(x)
                                    465 ;	sensors.c: 104: I2C_OARH = 0;
      00820E AE 52 14         [ 2]  466 	ldw	x, #0x5214
      008211 7F               [ 1]  467 	clr	(x)
                                    468 ;	sensors.c: 107: while ((I2C_SR1 & I2C_ADDR) == 0);
      008212                        469 00103$:
                                    470 ;	sensors.c: 100: reg = I2C_SR1;
      008212 AE 52 17         [ 2]  471 	ldw	x, #0x5217
      008215 F6               [ 1]  472 	ld	a, (x)
                                    473 ;	sensors.c: 107: while ((I2C_SR1 & I2C_ADDR) == 0);
      008216 A5 02            [ 1]  474 	bcp	a, #0x02
      008218 27 F8            [ 1]  475 	jreq	00103$
                                    476 ;	sensors.c: 108: if (mode == I2C_READ)
      00821A 0D 03            [ 1]  477 	tnz	(0x03, sp)
      00821C 27 06            [ 1]  478 	jreq	00108$
                                    479 ;	sensors.c: 109: UNSET (I2C_SR1, I2C_ADDR);
      00821E A4 FD            [ 1]  480 	and	a, #0xfd
      008220 AE 52 17         [ 2]  481 	ldw	x, #0x5217
      008223 F7               [ 1]  482 	ld	(x), a
      008224                        483 00108$:
      008224 5B 03            [ 2]  484 	addw	sp, #3
      008226 81               [ 4]  485 	ret
                                    486 ;	sensors.c: 112: void i2c_set_start_ack (void) {
                                    487 ;	-----------------------------------------
                                    488 ;	 function i2c_set_start_ack
                                    489 ;	-----------------------------------------
      008227                        490 _i2c_set_start_ack:
                                    491 ;	sensors.c: 113: I2C_CR2 = I2C_ACK | I2C_START;
      008227 AE 52 11         [ 2]  492 	ldw	x, #0x5211
      00822A A6 05            [ 1]  493 	ld	a, #0x05
      00822C F7               [ 1]  494 	ld	(x), a
                                    495 ;	sensors.c: 114: while ((I2C_SR1 & I2C_SB) == 0);
      00822D                        496 00101$:
      00822D AE 52 17         [ 2]  497 	ldw	x, #0x5217
      008230 F6               [ 1]  498 	ld	a, (x)
      008231 44               [ 1]  499 	srl	a
      008232 24 F9            [ 1]  500 	jrnc	00101$
      008234 81               [ 4]  501 	ret
                                    502 ;	sensors.c: 121: void print_byte_hex (unsigned char buffer) {
                                    503 ;	-----------------------------------------
                                    504 ;	 function print_byte_hex
                                    505 ;	-----------------------------------------
      008235                        506 _print_byte_hex:
      008235 52 0C            [ 2]  507 	sub	sp, #12
                                    508 ;	sensors.c: 124: a = (buffer >> 4);
      008237 7B 0F            [ 1]  509 	ld	a, (0x0f, sp)
      008239 4E               [ 1]  510 	swap	a
      00823A A4 0F            [ 1]  511 	and	a, #0x0f
      00823C 5F               [ 1]  512 	clrw	x
      00823D 97               [ 1]  513 	ld	xl, a
                                    514 ;	sensors.c: 125: if (a > 9)
      00823E A3 00 09         [ 2]  515 	cpw	x, #0x0009
      008241 2D 07            [ 1]  516 	jrsle	00102$
                                    517 ;	sensors.c: 126: a = a + 'a' - 10;
      008243 1C 00 57         [ 2]  518 	addw	x, #0x0057
      008246 1F 03            [ 2]  519 	ldw	(0x03, sp), x
      008248 20 05            [ 2]  520 	jra	00103$
      00824A                        521 00102$:
                                    522 ;	sensors.c: 128: a += '0'; 
      00824A 1C 00 30         [ 2]  523 	addw	x, #0x0030
      00824D 1F 03            [ 2]  524 	ldw	(0x03, sp), x
      00824F                        525 00103$:
                                    526 ;	sensors.c: 129: b = buffer & 0x0f;
      00824F 7B 0F            [ 1]  527 	ld	a, (0x0f, sp)
      008251 A4 0F            [ 1]  528 	and	a, #0x0f
      008253 5F               [ 1]  529 	clrw	x
      008254 97               [ 1]  530 	ld	xl, a
                                    531 ;	sensors.c: 130: if (b > 9)
      008255 A3 00 09         [ 2]  532 	cpw	x, #0x0009
      008258 2D 07            [ 1]  533 	jrsle	00105$
                                    534 ;	sensors.c: 131: b = b + 'a' - 10;
      00825A 1C 00 57         [ 2]  535 	addw	x, #0x0057
      00825D 1F 01            [ 2]  536 	ldw	(0x01, sp), x
      00825F 20 05            [ 2]  537 	jra	00106$
      008261                        538 00105$:
                                    539 ;	sensors.c: 133: b += '0'; 
      008261 1C 00 30         [ 2]  540 	addw	x, #0x0030
      008264 1F 01            [ 2]  541 	ldw	(0x01, sp), x
      008266                        542 00106$:
                                    543 ;	sensors.c: 134: message[0] = a;
      008266 90 96            [ 1]  544 	ldw	y, sp
      008268 72 A9 00 05      [ 2]  545 	addw	y, #5
      00826C 7B 04            [ 1]  546 	ld	a, (0x04, sp)
      00826E 90 F7            [ 1]  547 	ld	(y), a
                                    548 ;	sensors.c: 135: message[1] = b;
      008270 93               [ 1]  549 	ldw	x, y
      008271 5C               [ 2]  550 	incw	x
      008272 7B 02            [ 1]  551 	ld	a, (0x02, sp)
      008274 F7               [ 1]  552 	ld	(x), a
                                    553 ;	sensors.c: 136: message[2] = 0;
      008275 93               [ 1]  554 	ldw	x, y
      008276 5C               [ 2]  555 	incw	x
      008277 5C               [ 2]  556 	incw	x
      008278 7F               [ 1]  557 	clr	(x)
                                    558 ;	sensors.c: 137: UARTPrintF (message);
      008279 90 89            [ 2]  559 	pushw	y
      00827B CD 81 80         [ 4]  560 	call	_UARTPrintF
      00827E 5B 02            [ 2]  561 	addw	sp, #2
      008280 5B 0C            [ 2]  562 	addw	sp, #12
      008282 81               [ 4]  563 	ret
                                    564 ;	sensors.c: 141: unsigned char i2c_read_register (UCHAR addr, UCHAR rg) {
                                    565 ;	-----------------------------------------
                                    566 ;	 function i2c_read_register
                                    567 ;	-----------------------------------------
      008283                        568 _i2c_read_register:
      008283 52 02            [ 2]  569 	sub	sp, #2
                                    570 ;	sensors.c: 144: i2c_set_start_ack ();
      008285 CD 82 27         [ 4]  571 	call	_i2c_set_start_ack
                                    572 ;	sensors.c: 145: i2c_send_address (addr, I2C_WRITE);
      008288 4B 00            [ 1]  573 	push	#0x00
      00828A 7B 06            [ 1]  574 	ld	a, (0x06, sp)
      00828C 88               [ 1]  575 	push	a
      00828D CD 81 E5         [ 4]  576 	call	_i2c_send_address
      008290 5B 02            [ 2]  577 	addw	sp, #2
                                    578 ;	sensors.c: 146: i2c_send_reg (rg);
      008292 7B 06            [ 1]  579 	ld	a, (0x06, sp)
      008294 88               [ 1]  580 	push	a
      008295 CD 81 5E         [ 4]  581 	call	_i2c_send_reg
      008298 84               [ 1]  582 	pop	a
                                    583 ;	sensors.c: 147: i2c_set_start_ack ();
      008299 CD 82 27         [ 4]  584 	call	_i2c_set_start_ack
                                    585 ;	sensors.c: 148: i2c_send_address (addr, I2C_READ);
      00829C 4B 01            [ 1]  586 	push	#0x01
      00829E 7B 06            [ 1]  587 	ld	a, (0x06, sp)
      0082A0 88               [ 1]  588 	push	a
      0082A1 CD 81 E5         [ 4]  589 	call	_i2c_send_address
      0082A4 5B 02            [ 2]  590 	addw	sp, #2
                                    591 ;	sensors.c: 149: reg = I2C_SR1;
      0082A6 AE 52 17         [ 2]  592 	ldw	x, #0x5217
      0082A9 F6               [ 1]  593 	ld	a, (x)
      0082AA 6B 01            [ 1]  594 	ld	(0x01, sp), a
                                    595 ;	sensors.c: 150: reg = I2C_SR3;
      0082AC AE 52 19         [ 2]  596 	ldw	x, #0x5219
      0082AF F6               [ 1]  597 	ld	a, (x)
      0082B0 6B 01            [ 1]  598 	ld	(0x01, sp), a
                                    599 ;	sensors.c: 151: i2c_set_nak ();
      0082B2 CD 81 4E         [ 4]  600 	call	_i2c_set_nak
                                    601 ;	sensors.c: 152: i2c_set_stop ();
      0082B5 CD 81 56         [ 4]  602 	call	_i2c_set_stop
                                    603 ;	sensors.c: 153: i2c_read (&x);
      0082B8 96               [ 1]  604 	ldw	x, sp
      0082B9 5C               [ 2]  605 	incw	x
      0082BA 5C               [ 2]  606 	incw	x
      0082BB 89               [ 2]  607 	pushw	x
      0082BC CD 81 3D         [ 4]  608 	call	_i2c_read
      0082BF 5B 02            [ 2]  609 	addw	sp, #2
                                    610 ;	sensors.c: 154: return (x);
      0082C1 7B 02            [ 1]  611 	ld	a, (0x02, sp)
      0082C3 5B 02            [ 2]  612 	addw	sp, #2
      0082C5 81               [ 4]  613 	ret
                                    614 ;	sensors.c: 157: void InitializeI2C (void) {
                                    615 ;	-----------------------------------------
                                    616 ;	 function InitializeI2C
                                    617 ;	-----------------------------------------
      0082C6                        618 _InitializeI2C:
                                    619 ;	sensors.c: 158: I2C_CR1 = 0;   //  Disable I2C before configuration starts. PE bit is bit 0
      0082C6 AE 52 10         [ 2]  620 	ldw	x, #0x5210
      0082C9 7F               [ 1]  621 	clr	(x)
                                    622 ;	sensors.c: 162: I2C_FREQR = 16;                     //  Set the internal clock frequency (MHz).
      0082CA AE 52 12         [ 2]  623 	ldw	x, #0x5212
      0082CD A6 10            [ 1]  624 	ld	a, #0x10
      0082CF F7               [ 1]  625 	ld	(x), a
                                    626 ;	sensors.c: 163: UNSET (I2C_CCRH, I2C_FS);           //  I2C running is standard mode.
      0082D0 72 17 52 1C      [ 1]  627 	bres	0x521c, #7
                                    628 ;	sensors.c: 165: I2C_CCRL = 0xa0;                    //  SCL clock speed is 50 kHz.
      0082D4 AE 52 1B         [ 2]  629 	ldw	x, #0x521b
      0082D7 A6 A0            [ 1]  630 	ld	a, #0xa0
      0082D9 F7               [ 1]  631 	ld	(x), a
                                    632 ;	sensors.c: 167: I2C_CCRH &= 0x00;	// Clears lower 4 bits "CCR"
      0082DA AE 52 1C         [ 2]  633 	ldw	x, #0x521c
      0082DD 7F               [ 1]  634 	clr	(x)
                                    635 ;	sensors.c: 171: UNSET (I2C_OARH, I2C_ADDMODE);      //  7 bit address mode.
      0082DE 72 17 52 14      [ 1]  636 	bres	0x5214, #7
                                    637 ;	sensors.c: 172: SET (I2C_OARH, I2C_ADDCONF);        //  Docs say this must always be 1.
      0082E2 AE 52 14         [ 2]  638 	ldw	x, #0x5214
      0082E5 F6               [ 1]  639 	ld	a, (x)
      0082E6 AA 40            [ 1]  640 	or	a, #0x40
      0082E8 F7               [ 1]  641 	ld	(x), a
                                    642 ;	sensors.c: 176: I2C_TRISER = 17;
      0082E9 AE 52 1D         [ 2]  643 	ldw	x, #0x521d
      0082EC A6 11            [ 1]  644 	ld	a, #0x11
      0082EE F7               [ 1]  645 	ld	(x), a
                                    646 ;	sensors.c: 184: I2C_CR1 = I2C_PE;	// Enables port
      0082EF AE 52 10         [ 2]  647 	ldw	x, #0x5210
      0082F2 A6 01            [ 1]  648 	ld	a, #0x01
      0082F4 F7               [ 1]  649 	ld	(x), a
      0082F5 81               [ 4]  650 	ret
                                    651 ;	sensors.c: 190: void InitializeUART() {
                                    652 ;	-----------------------------------------
                                    653 ;	 function InitializeUART
                                    654 ;	-----------------------------------------
      0082F6                        655 _InitializeUART:
                                    656 ;	sensors.c: 200: UART1_CR1 = 0;
      0082F6 AE 52 34         [ 2]  657 	ldw	x, #0x5234
      0082F9 7F               [ 1]  658 	clr	(x)
                                    659 ;	sensors.c: 201: UART1_CR2 = 0;
      0082FA AE 52 35         [ 2]  660 	ldw	x, #0x5235
      0082FD 7F               [ 1]  661 	clr	(x)
                                    662 ;	sensors.c: 202: UART1_CR4 = 0;
      0082FE AE 52 37         [ 2]  663 	ldw	x, #0x5237
      008301 7F               [ 1]  664 	clr	(x)
                                    665 ;	sensors.c: 203: UART1_CR3 = 0;
      008302 AE 52 36         [ 2]  666 	ldw	x, #0x5236
      008305 7F               [ 1]  667 	clr	(x)
                                    668 ;	sensors.c: 204: UART1_CR5 = 0;
      008306 AE 52 38         [ 2]  669 	ldw	x, #0x5238
      008309 7F               [ 1]  670 	clr	(x)
                                    671 ;	sensors.c: 205: UART1_GTR = 0;
      00830A AE 52 39         [ 2]  672 	ldw	x, #0x5239
      00830D 7F               [ 1]  673 	clr	(x)
                                    674 ;	sensors.c: 206: UART1_PSCR = 0;
      00830E AE 52 3A         [ 2]  675 	ldw	x, #0x523a
      008311 7F               [ 1]  676 	clr	(x)
                                    677 ;	sensors.c: 210: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
      008312 AE 52 34         [ 2]  678 	ldw	x, #0x5234
      008315 F6               [ 1]  679 	ld	a, (x)
      008316 A4 EF            [ 1]  680 	and	a, #0xef
      008318 F7               [ 1]  681 	ld	(x), a
                                    682 ;	sensors.c: 211: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
      008319 AE 52 34         [ 2]  683 	ldw	x, #0x5234
      00831C F6               [ 1]  684 	ld	a, (x)
      00831D A4 FB            [ 1]  685 	and	a, #0xfb
      00831F F7               [ 1]  686 	ld	(x), a
                                    687 ;	sensors.c: 212: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
      008320 AE 52 36         [ 2]  688 	ldw	x, #0x5236
      008323 F6               [ 1]  689 	ld	a, (x)
      008324 A4 DF            [ 1]  690 	and	a, #0xdf
      008326 F7               [ 1]  691 	ld	(x), a
                                    692 ;	sensors.c: 213: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
      008327 AE 52 36         [ 2]  693 	ldw	x, #0x5236
      00832A F6               [ 1]  694 	ld	a, (x)
      00832B A4 EF            [ 1]  695 	and	a, #0xef
      00832D F7               [ 1]  696 	ld	(x), a
                                    697 ;	sensors.c: 214: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
      00832E AE 52 33         [ 2]  698 	ldw	x, #0x5233
      008331 A6 0A            [ 1]  699 	ld	a, #0x0a
      008333 F7               [ 1]  700 	ld	(x), a
                                    701 ;	sensors.c: 215: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
      008334 AE 52 32         [ 2]  702 	ldw	x, #0x5232
      008337 A6 08            [ 1]  703 	ld	a, #0x08
      008339 F7               [ 1]  704 	ld	(x), a
                                    705 ;	sensors.c: 219: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
      00833A AE 52 35         [ 2]  706 	ldw	x, #0x5235
      00833D F6               [ 1]  707 	ld	a, (x)
      00833E A4 F7            [ 1]  708 	and	a, #0xf7
      008340 F7               [ 1]  709 	ld	(x), a
                                    710 ;	sensors.c: 220: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
      008341 AE 52 35         [ 2]  711 	ldw	x, #0x5235
      008344 F6               [ 1]  712 	ld	a, (x)
      008345 A4 FB            [ 1]  713 	and	a, #0xfb
      008347 F7               [ 1]  714 	ld	(x), a
                                    715 ;	sensors.c: 224: SET (UART1_CR3, CR3_CPOL);
      008348 AE 52 36         [ 2]  716 	ldw	x, #0x5236
      00834B F6               [ 1]  717 	ld	a, (x)
      00834C AA 04            [ 1]  718 	or	a, #0x04
      00834E F7               [ 1]  719 	ld	(x), a
                                    720 ;	sensors.c: 225: SET (UART1_CR3, CR3_CPHA);
      00834F AE 52 36         [ 2]  721 	ldw	x, #0x5236
      008352 F6               [ 1]  722 	ld	a, (x)
      008353 AA 02            [ 1]  723 	or	a, #0x02
      008355 F7               [ 1]  724 	ld	(x), a
                                    725 ;	sensors.c: 226: SET (UART1_CR3, CR3_LBCL);
      008356 72 10 52 36      [ 1]  726 	bset	0x5236, #0
                                    727 ;	sensors.c: 230: SET (UART1_CR2, CR2_TEN);
      00835A AE 52 35         [ 2]  728 	ldw	x, #0x5235
      00835D F6               [ 1]  729 	ld	a, (x)
      00835E AA 08            [ 1]  730 	or	a, #0x08
      008360 F7               [ 1]  731 	ld	(x), a
                                    732 ;	sensors.c: 231: SET (UART1_CR2, CR2_REN);
      008361 AE 52 35         [ 2]  733 	ldw	x, #0x5235
      008364 F6               [ 1]  734 	ld	a, (x)
      008365 AA 04            [ 1]  735 	or	a, #0x04
      008367 F7               [ 1]  736 	ld	(x), a
                                    737 ;	sensors.c: 232: UART1_CR3 = CR3_CLKEN;
      008368 AE 52 36         [ 2]  738 	ldw	x, #0x5236
      00836B A6 08            [ 1]  739 	ld	a, #0x08
      00836D F7               [ 1]  740 	ld	(x), a
      00836E 81               [ 4]  741 	ret
                                    742 ;	sensors.c: 260: void tm1637Init(void)
                                    743 ;	-----------------------------------------
                                    744 ;	 function tm1637Init
                                    745 ;	-----------------------------------------
      00836F                        746 _tm1637Init:
                                    747 ;	sensors.c: 262: tm1637SetBrightness(8);
      00836F 4B 08            [ 1]  748 	push	#0x08
      008371 CD 84 0F         [ 4]  749 	call	_tm1637SetBrightness
      008374 84               [ 1]  750 	pop	a
      008375 81               [ 4]  751 	ret
                                    752 ;	sensors.c: 267: void tm1637DisplayDecimal(u8 TT,unsigned int displaySeparator)
                                    753 ;	-----------------------------------------
                                    754 ;	 function tm1637DisplayDecimal
                                    755 ;	-----------------------------------------
      008376                        756 _tm1637DisplayDecimal:
      008376 52 0F            [ 2]  757 	sub	sp, #15
                                    758 ;	sensors.c: 269: unsigned int v = TT ;
      008378 5F               [ 1]  759 	clrw	x
      008379 7B 12            [ 1]  760 	ld	a, (0x12, sp)
      00837B 97               [ 1]  761 	ld	xl, a
      00837C 1F 05            [ 2]  762 	ldw	(0x05, sp), x
                                    763 ;	sensors.c: 275: for (ii = 0; ii < 4; ++ii) {
      00837E 96               [ 1]  764 	ldw	x, sp
      00837F 5C               [ 2]  765 	incw	x
      008380 1F 09            [ 2]  766 	ldw	(0x09, sp), x
      008382 AE 85 9E         [ 2]  767 	ldw	x, #_segmentMap+0
      008385 1F 0D            [ 2]  768 	ldw	(0x0d, sp), x
      008387 90 5F            [ 1]  769 	clrw	y
      008389                        770 00106$:
                                    771 ;	sensors.c: 276: digitArr[ii] = segmentMap[v % 10];
      008389 93               [ 1]  772 	ldw	x, y
      00838A 72 FB 09         [ 2]  773 	addw	x, (0x09, sp)
      00838D 1F 0B            [ 2]  774 	ldw	(0x0b, sp), x
      00838F 90 89            [ 2]  775 	pushw	y
      008391 1E 07            [ 2]  776 	ldw	x, (0x07, sp)
      008393 90 AE 00 0A      [ 2]  777 	ldw	y, #0x000a
      008397 65               [ 2]  778 	divw	x, y
      008398 93               [ 1]  779 	ldw	x, y
      008399 90 85            [ 2]  780 	popw	y
      00839B 72 FB 0D         [ 2]  781 	addw	x, (0x0d, sp)
      00839E F6               [ 1]  782 	ld	a, (x)
      00839F 1E 0B            [ 2]  783 	ldw	x, (0x0b, sp)
      0083A1 F7               [ 1]  784 	ld	(x), a
                                    785 ;	sensors.c: 277: if (ii == 2 && displaySeparator) {
      0083A2 90 A3 00 02      [ 2]  786 	cpw	y, #0x0002
      0083A6 26 0C            [ 1]  787 	jrne	00102$
      0083A8 1E 13            [ 2]  788 	ldw	x, (0x13, sp)
      0083AA 27 08            [ 1]  789 	jreq	00102$
                                    790 ;	sensors.c: 278: digitArr[ii] |= 1 << 7;
      0083AC 1E 0B            [ 2]  791 	ldw	x, (0x0b, sp)
      0083AE F6               [ 1]  792 	ld	a, (x)
      0083AF AA 80            [ 1]  793 	or	a, #0x80
      0083B1 1E 0B            [ 2]  794 	ldw	x, (0x0b, sp)
      0083B3 F7               [ 1]  795 	ld	(x), a
      0083B4                        796 00102$:
                                    797 ;	sensors.c: 280: v /= 10;
      0083B4 90 89            [ 2]  798 	pushw	y
      0083B6 1E 07            [ 2]  799 	ldw	x, (0x07, sp)
      0083B8 90 AE 00 0A      [ 2]  800 	ldw	y, #0x000a
      0083BC 65               [ 2]  801 	divw	x, y
      0083BD 90 85            [ 2]  802 	popw	y
      0083BF 1F 05            [ 2]  803 	ldw	(0x05, sp), x
                                    804 ;	sensors.c: 275: for (ii = 0; ii < 4; ++ii) {
      0083C1 90 5C            [ 2]  805 	incw	y
      0083C3 90 A3 00 04      [ 2]  806 	cpw	y, #0x0004
      0083C7 25 C0            [ 1]  807 	jrc	00106$
                                    808 ;	sensors.c: 283: _tm1637Start();
      0083C9 CD 84 21         [ 4]  809 	call	__tm1637Start
                                    810 ;	sensors.c: 284: _tm1637WriteByte(0x40);
      0083CC 4B 40            [ 1]  811 	push	#0x40
      0083CE CD 84 75         [ 4]  812 	call	__tm1637WriteByte
      0083D1 84               [ 1]  813 	pop	a
                                    814 ;	sensors.c: 285: _tm1637ReadResult();
      0083D2 CD 84 5A         [ 4]  815 	call	__tm1637ReadResult
                                    816 ;	sensors.c: 286: _tm1637Stop();
      0083D5 CD 84 33         [ 4]  817 	call	__tm1637Stop
                                    818 ;	sensors.c: 288: _tm1637Start();
      0083D8 CD 84 21         [ 4]  819 	call	__tm1637Start
                                    820 ;	sensors.c: 289: _tm1637WriteByte(0xc0);
      0083DB 4B C0            [ 1]  821 	push	#0xc0
      0083DD CD 84 75         [ 4]  822 	call	__tm1637WriteByte
      0083E0 84               [ 1]  823 	pop	a
                                    824 ;	sensors.c: 290: _tm1637ReadResult();
      0083E1 CD 84 5A         [ 4]  825 	call	__tm1637ReadResult
                                    826 ;	sensors.c: 292: for (ii = 0; ii < 4; ++ii) {
      0083E4 5F               [ 1]  827 	clrw	x
      0083E5 1F 07            [ 2]  828 	ldw	(0x07, sp), x
      0083E7                        829 00108$:
                                    830 ;	sensors.c: 293: _tm1637WriteByte(digitArr[3 - ii]);
      0083E7 7B 08            [ 1]  831 	ld	a, (0x08, sp)
      0083E9 6B 0F            [ 1]  832 	ld	(0x0f, sp), a
      0083EB A6 03            [ 1]  833 	ld	a, #0x03
      0083ED 10 0F            [ 1]  834 	sub	a, (0x0f, sp)
      0083EF 5F               [ 1]  835 	clrw	x
      0083F0 97               [ 1]  836 	ld	xl, a
      0083F1 72 FB 09         [ 2]  837 	addw	x, (0x09, sp)
      0083F4 F6               [ 1]  838 	ld	a, (x)
      0083F5 88               [ 1]  839 	push	a
      0083F6 CD 84 75         [ 4]  840 	call	__tm1637WriteByte
      0083F9 84               [ 1]  841 	pop	a
                                    842 ;	sensors.c: 294: _tm1637ReadResult();
      0083FA CD 84 5A         [ 4]  843 	call	__tm1637ReadResult
                                    844 ;	sensors.c: 292: for (ii = 0; ii < 4; ++ii) {
      0083FD 1E 07            [ 2]  845 	ldw	x, (0x07, sp)
      0083FF 5C               [ 2]  846 	incw	x
      008400 1F 07            [ 2]  847 	ldw	(0x07, sp), x
      008402 1E 07            [ 2]  848 	ldw	x, (0x07, sp)
      008404 A3 00 04         [ 2]  849 	cpw	x, #0x0004
      008407 25 DE            [ 1]  850 	jrc	00108$
                                    851 ;	sensors.c: 297: _tm1637Stop();
      008409 CD 84 33         [ 4]  852 	call	__tm1637Stop
      00840C 5B 0F            [ 2]  853 	addw	sp, #15
      00840E 81               [ 4]  854 	ret
                                    855 ;	sensors.c: 302: void tm1637SetBrightness(char brightness)
                                    856 ;	-----------------------------------------
                                    857 ;	 function tm1637SetBrightness
                                    858 ;	-----------------------------------------
      00840F                        859 _tm1637SetBrightness:
                                    860 ;	sensors.c: 309: _tm1637Start();
      00840F CD 84 21         [ 4]  861 	call	__tm1637Start
                                    862 ;	sensors.c: 310: _tm1637WriteByte(0x87 + brightness);
      008412 7B 03            [ 1]  863 	ld	a, (0x03, sp)
      008414 AB 87            [ 1]  864 	add	a, #0x87
      008416 88               [ 1]  865 	push	a
      008417 CD 84 75         [ 4]  866 	call	__tm1637WriteByte
      00841A 84               [ 1]  867 	pop	a
                                    868 ;	sensors.c: 311: _tm1637ReadResult();
      00841B CD 84 5A         [ 4]  869 	call	__tm1637ReadResult
                                    870 ;	sensors.c: 312: _tm1637Stop();
      00841E CC 84 33         [ 2]  871 	jp	__tm1637Stop
                                    872 ;	sensors.c: 315: void _tm1637Start(void)
                                    873 ;	-----------------------------------------
                                    874 ;	 function _tm1637Start
                                    875 ;	-----------------------------------------
      008421                        876 __tm1637Start:
                                    877 ;	sensors.c: 317: _tm1637ClkHigh();
      008421 CD 84 B3         [ 4]  878 	call	__tm1637ClkHigh
                                    879 ;	sensors.c: 318: _tm1637DioHigh();
      008424 CD 84 C3         [ 4]  880 	call	__tm1637DioHigh
                                    881 ;	sensors.c: 319: delay(5);
      008427 4B 05            [ 1]  882 	push	#0x05
      008429 4B 00            [ 1]  883 	push	#0x00
      00842B CD 80 F2         [ 4]  884 	call	_delay
      00842E 5B 02            [ 2]  885 	addw	sp, #2
                                    886 ;	sensors.c: 320: _tm1637DioLow();
      008430 CC 84 CB         [ 2]  887 	jp	__tm1637DioLow
                                    888 ;	sensors.c: 323: void _tm1637Stop(void)
                                    889 ;	-----------------------------------------
                                    890 ;	 function _tm1637Stop
                                    891 ;	-----------------------------------------
      008433                        892 __tm1637Stop:
                                    893 ;	sensors.c: 325: _tm1637ClkLow();
      008433 CD 84 BB         [ 4]  894 	call	__tm1637ClkLow
                                    895 ;	sensors.c: 326: delay(5);
      008436 4B 05            [ 1]  896 	push	#0x05
      008438 4B 00            [ 1]  897 	push	#0x00
      00843A CD 80 F2         [ 4]  898 	call	_delay
      00843D 5B 02            [ 2]  899 	addw	sp, #2
                                    900 ;	sensors.c: 327: _tm1637DioLow();
      00843F CD 84 CB         [ 4]  901 	call	__tm1637DioLow
                                    902 ;	sensors.c: 328: delay(5);
      008442 4B 05            [ 1]  903 	push	#0x05
      008444 4B 00            [ 1]  904 	push	#0x00
      008446 CD 80 F2         [ 4]  905 	call	_delay
      008449 5B 02            [ 2]  906 	addw	sp, #2
                                    907 ;	sensors.c: 329: _tm1637ClkHigh();
      00844B CD 84 B3         [ 4]  908 	call	__tm1637ClkHigh
                                    909 ;	sensors.c: 330: delay(5);
      00844E 4B 05            [ 1]  910 	push	#0x05
      008450 4B 00            [ 1]  911 	push	#0x00
      008452 CD 80 F2         [ 4]  912 	call	_delay
      008455 5B 02            [ 2]  913 	addw	sp, #2
                                    914 ;	sensors.c: 331: _tm1637DioHigh();
      008457 CC 84 C3         [ 2]  915 	jp	__tm1637DioHigh
                                    916 ;	sensors.c: 334: void _tm1637ReadResult(void)
                                    917 ;	-----------------------------------------
                                    918 ;	 function _tm1637ReadResult
                                    919 ;	-----------------------------------------
      00845A                        920 __tm1637ReadResult:
                                    921 ;	sensors.c: 336: _tm1637ClkLow();
      00845A CD 84 BB         [ 4]  922 	call	__tm1637ClkLow
                                    923 ;	sensors.c: 337: delay(5);
      00845D 4B 05            [ 1]  924 	push	#0x05
      00845F 4B 00            [ 1]  925 	push	#0x00
      008461 CD 80 F2         [ 4]  926 	call	_delay
      008464 5B 02            [ 2]  927 	addw	sp, #2
                                    928 ;	sensors.c: 339: _tm1637ClkHigh();
      008466 CD 84 B3         [ 4]  929 	call	__tm1637ClkHigh
                                    930 ;	sensors.c: 340: delay(5);
      008469 4B 05            [ 1]  931 	push	#0x05
      00846B 4B 00            [ 1]  932 	push	#0x00
      00846D CD 80 F2         [ 4]  933 	call	_delay
      008470 5B 02            [ 2]  934 	addw	sp, #2
                                    935 ;	sensors.c: 341: _tm1637ClkLow();
      008472 CC 84 BB         [ 2]  936 	jp	__tm1637ClkLow
                                    937 ;	sensors.c: 344: void _tm1637WriteByte(unsigned char b)
                                    938 ;	-----------------------------------------
                                    939 ;	 function _tm1637WriteByte
                                    940 ;	-----------------------------------------
      008475                        941 __tm1637WriteByte:
      008475 52 02            [ 2]  942 	sub	sp, #2
                                    943 ;	sensors.c: 346: for (ii = 0; ii < 8; ++ii) {
      008477 5F               [ 1]  944 	clrw	x
      008478 1F 01            [ 2]  945 	ldw	(0x01, sp), x
      00847A                        946 00105$:
                                    947 ;	sensors.c: 347: _tm1637ClkLow();
      00847A CD 84 BB         [ 4]  948 	call	__tm1637ClkLow
                                    949 ;	sensors.c: 348: if (b & 0x01) {
      00847D 7B 05            [ 1]  950 	ld	a, (0x05, sp)
      00847F 44               [ 1]  951 	srl	a
      008480 24 05            [ 1]  952 	jrnc	00102$
                                    953 ;	sensors.c: 349: _tm1637DioHigh();
      008482 CD 84 C3         [ 4]  954 	call	__tm1637DioHigh
      008485 20 03            [ 2]  955 	jra	00103$
      008487                        956 00102$:
                                    957 ;	sensors.c: 352: _tm1637DioLow();
      008487 CD 84 CB         [ 4]  958 	call	__tm1637DioLow
      00848A                        959 00103$:
                                    960 ;	sensors.c: 354: delay(15);
      00848A 4B 0F            [ 1]  961 	push	#0x0f
      00848C 4B 00            [ 1]  962 	push	#0x00
      00848E CD 80 F2         [ 4]  963 	call	_delay
      008491 5B 02            [ 2]  964 	addw	sp, #2
                                    965 ;	sensors.c: 355: b >>= 1;
      008493 7B 05            [ 1]  966 	ld	a, (0x05, sp)
      008495 44               [ 1]  967 	srl	a
      008496 6B 05            [ 1]  968 	ld	(0x05, sp), a
                                    969 ;	sensors.c: 356: _tm1637ClkHigh();
      008498 CD 84 B3         [ 4]  970 	call	__tm1637ClkHigh
                                    971 ;	sensors.c: 357: delay(15);
      00849B 4B 0F            [ 1]  972 	push	#0x0f
      00849D 4B 00            [ 1]  973 	push	#0x00
      00849F CD 80 F2         [ 4]  974 	call	_delay
      0084A2 5B 02            [ 2]  975 	addw	sp, #2
                                    976 ;	sensors.c: 346: for (ii = 0; ii < 8; ++ii) {
      0084A4 1E 01            [ 2]  977 	ldw	x, (0x01, sp)
      0084A6 5C               [ 2]  978 	incw	x
      0084A7 1F 01            [ 2]  979 	ldw	(0x01, sp), x
      0084A9 1E 01            [ 2]  980 	ldw	x, (0x01, sp)
      0084AB A3 00 08         [ 2]  981 	cpw	x, #0x0008
      0084AE 2F CA            [ 1]  982 	jrslt	00105$
      0084B0 5B 02            [ 2]  983 	addw	sp, #2
      0084B2 81               [ 4]  984 	ret
                                    985 ;	sensors.c: 363: void _tm1637ClkHigh(void)
                                    986 ;	-----------------------------------------
                                    987 ;	 function _tm1637ClkHigh
                                    988 ;	-----------------------------------------
      0084B3                        989 __tm1637ClkHigh:
                                    990 ;	sensors.c: 368: PD_ODR |= 1 << 2;
      0084B3 AE 50 0F         [ 2]  991 	ldw	x, #0x500f
      0084B6 F6               [ 1]  992 	ld	a, (x)
      0084B7 AA 04            [ 1]  993 	or	a, #0x04
      0084B9 F7               [ 1]  994 	ld	(x), a
      0084BA 81               [ 4]  995 	ret
                                    996 ;	sensors.c: 371: void _tm1637ClkLow(void)
                                    997 ;	-----------------------------------------
                                    998 ;	 function _tm1637ClkLow
                                    999 ;	-----------------------------------------
      0084BB                       1000 __tm1637ClkLow:
                                   1001 ;	sensors.c: 375: PD_ODR &= ~(1 << 2);
      0084BB AE 50 0F         [ 2] 1002 	ldw	x, #0x500f
      0084BE F6               [ 1] 1003 	ld	a, (x)
      0084BF A4 FB            [ 1] 1004 	and	a, #0xfb
      0084C1 F7               [ 1] 1005 	ld	(x), a
      0084C2 81               [ 4] 1006 	ret
                                   1007 ;	sensors.c: 381: void _tm1637DioHigh(void)
                                   1008 ;	-----------------------------------------
                                   1009 ;	 function _tm1637DioHigh
                                   1010 ;	-----------------------------------------
      0084C3                       1011 __tm1637DioHigh:
                                   1012 ;	sensors.c: 385: PD_ODR |= 1 << 3;
      0084C3 AE 50 0F         [ 2] 1013 	ldw	x, #0x500f
      0084C6 F6               [ 1] 1014 	ld	a, (x)
      0084C7 AA 08            [ 1] 1015 	or	a, #0x08
      0084C9 F7               [ 1] 1016 	ld	(x), a
      0084CA 81               [ 4] 1017 	ret
                                   1018 ;	sensors.c: 389: void _tm1637DioLow(void)
                                   1019 ;	-----------------------------------------
                                   1020 ;	 function _tm1637DioLow
                                   1021 ;	-----------------------------------------
      0084CB                       1022 __tm1637DioLow:
                                   1023 ;	sensors.c: 391: PD_ODR &= ~(1 << 3);
      0084CB AE 50 0F         [ 2] 1024 	ldw	x, #0x500f
      0084CE F6               [ 1] 1025 	ld	a, (x)
      0084CF A4 F7            [ 1] 1026 	and	a, #0xf7
      0084D1 F7               [ 1] 1027 	ld	(x), a
      0084D2 81               [ 4] 1028 	ret
                                   1029 ;	sensors.c: 400: unsigned int clock(void)
                                   1030 ;	-----------------------------------------
                                   1031 ;	 function clock
                                   1032 ;	-----------------------------------------
      0084D3                       1033 _clock:
      0084D3 52 03            [ 2] 1034 	sub	sp, #3
                                   1035 ;	sensors.c: 402: unsigned char h = TIM1_CNTRH; //origineel PCNTRH
      0084D5 AE 52 5E         [ 2] 1036 	ldw	x, #0x525e
      0084D8 F6               [ 1] 1037 	ld	a, (x)
                                   1038 ;	sensors.c: 403: unsigned char l = TIM1_CNTRL;
      0084D9 AE 52 5F         [ 2] 1039 	ldw	x, #0x525f
      0084DC 88               [ 1] 1040 	push	a
      0084DD F6               [ 1] 1041 	ld	a, (x)
      0084DE 6B 02            [ 1] 1042 	ld	(0x02, sp), a
      0084E0 84               [ 1] 1043 	pop	a
                                   1044 ;	sensors.c: 404: return((unsigned int)(h) << 8 | l);
      0084E1 5F               [ 1] 1045 	clrw	x
      0084E2 97               [ 1] 1046 	ld	xl, a
      0084E3 58               [ 2] 1047 	sllw	x
      0084E4 58               [ 2] 1048 	sllw	x
      0084E5 58               [ 2] 1049 	sllw	x
      0084E6 58               [ 2] 1050 	sllw	x
      0084E7 58               [ 2] 1051 	sllw	x
      0084E8 58               [ 2] 1052 	sllw	x
      0084E9 58               [ 2] 1053 	sllw	x
      0084EA 58               [ 2] 1054 	sllw	x
      0084EB 7B 01            [ 1] 1055 	ld	a, (0x01, sp)
      0084ED 6B 03            [ 1] 1056 	ld	(0x03, sp), a
      0084EF 0F 02            [ 1] 1057 	clr	(0x02, sp)
      0084F1 9F               [ 1] 1058 	ld	a, xl
      0084F2 1A 03            [ 1] 1059 	or	a, (0x03, sp)
      0084F4 97               [ 1] 1060 	ld	xl, a
      0084F5 9E               [ 1] 1061 	ld	a, xh
      0084F6 1A 02            [ 1] 1062 	or	a, (0x02, sp)
      0084F8 95               [ 1] 1063 	ld	xh, a
      0084F9 5B 03            [ 2] 1064 	addw	sp, #3
      0084FB 81               [ 4] 1065 	ret
                                   1066 ;	sensors.c: 453: void rt_one_second_increment (st_time *t) {
                                   1067 ;	-----------------------------------------
                                   1068 ;	 function rt_one_second_increment
                                   1069 ;	-----------------------------------------
      0084FC                       1070 _rt_one_second_increment:
                                   1071 ;	sensors.c: 454: if(++t->second > 59) {
      0084FC 16 03            [ 2] 1072 	ldw	y, (0x03, sp)
      0084FE 90 F6            [ 1] 1073 	ld	a, (y)
      008500 4C               [ 1] 1074 	inc	a
      008501 90 F7            [ 1] 1075 	ld	(y), a
      008503 A1 3B            [ 1] 1076 	cp	a, #0x3b
      008505 23 17            [ 2] 1077 	jrule	00107$
                                   1078 ;	sensors.c: 455: t->second= 0;
      008507 90 7F            [ 1] 1079 	clr	(y)
                                   1080 ;	sensors.c: 456: if(++t->minute > 59) {
      008509 93               [ 1] 1081 	ldw	x, y
      00850A 5C               [ 2] 1082 	incw	x
      00850B F6               [ 1] 1083 	ld	a, (x)
      00850C 4C               [ 1] 1084 	inc	a
      00850D F7               [ 1] 1085 	ld	(x), a
      00850E A1 3B            [ 1] 1086 	cp	a, #0x3b
      008510 23 0C            [ 2] 1087 	jrule	00107$
                                   1088 ;	sensors.c: 457: t->minute= 0;
      008512 7F               [ 1] 1089 	clr	(x)
                                   1090 ;	sensors.c: 458: if(++t->hour > 23) {
      008513 93               [ 1] 1091 	ldw	x, y
      008514 5C               [ 2] 1092 	incw	x
      008515 5C               [ 2] 1093 	incw	x
      008516 F6               [ 1] 1094 	ld	a, (x)
      008517 4C               [ 1] 1095 	inc	a
      008518 F7               [ 1] 1096 	ld	(x), a
      008519 A1 17            [ 1] 1097 	cp	a, #0x17
      00851B 23 01            [ 2] 1098 	jrule	00107$
                                   1099 ;	sensors.c: 459: t->hour= 0;
      00851D 7F               [ 1] 1100 	clr	(x)
      00851E                       1101 00107$:
      00851E 81               [ 4] 1102 	ret
                                   1103 ;	sensors.c: 469: void timer_isr(void) __interrupt(BEEP_ISR) {
                                   1104 ;	-----------------------------------------
                                   1105 ;	 function timer_isr
                                   1106 ;	-----------------------------------------
      00851F                       1107 _timer_isr:
                                   1108 ;	sensors.c: 470: if (++internteller > 500) {
      00851F CE 00 05         [ 2] 1109 	ldw	x, _internteller+0
      008522 5C               [ 2] 1110 	incw	x
      008523 CF 00 05         [ 2] 1111 	ldw	_internteller+0, x
      008526 A3 01 F4         [ 2] 1112 	cpw	x, #0x01f4
      008529 23 11            [ 2] 1113 	jrule	00103$
                                   1114 ;	sensors.c: 471: internteller=0;
      00852B 72 5F 00 06      [ 1] 1115 	clr	_internteller+1
      00852F 72 5F 00 05      [ 1] 1116 	clr	_internteller+0
                                   1117 ;	sensors.c: 472: rt_one_second_increment(&real_time);
      008533 AE 00 01         [ 2] 1118 	ldw	x, #_real_time+0
      008536 89               [ 2] 1119 	pushw	x
      008537 CD 84 FC         [ 4] 1120 	call	_rt_one_second_increment
      00853A 5B 02            [ 2] 1121 	addw	sp, #2
      00853C                       1122 00103$:
      00853C 80               [11] 1123 	iret
                                   1124 ;	sensors.c: 485: int main () {
                                   1125 ;	-----------------------------------------
                                   1126 ;	 function main
                                   1127 ;	-----------------------------------------
      00853D                       1128 _main:
      00853D 52 02            [ 2] 1129 	sub	sp, #2
                                   1130 ;	sensors.c: 492: InitializeSystemClock();
      00853F CD 80 A8         [ 4] 1131 	call	_InitializeSystemClock
                                   1132 ;	sensors.c: 494: BEEP_CSR = (0<<7) | (0<<6) | (1<<5) | 0x1E;
      008542 AE 50 F3         [ 2] 1133 	ldw	x, #0x50f3
      008545 A6 3E            [ 1] 1134 	ld	a, #0x3e
      008547 F7               [ 1] 1135 	ld	(x), a
                                   1136 ;	sensors.c: 495: PD_DDR = (1 << 3) | (1 << 2); // output mode
      008548 AE 50 11         [ 2] 1137 	ldw	x, #0x5011
      00854B A6 0C            [ 1] 1138 	ld	a, #0x0c
      00854D F7               [ 1] 1139 	ld	(x), a
                                   1140 ;	sensors.c: 497: PD_DDR &=  ~(1 << 4); //PD4 input
      00854E AE 50 11         [ 2] 1141 	ldw	x, #0x5011
      008551 F6               [ 1] 1142 	ld	a, (x)
      008552 A4 EF            [ 1] 1143 	and	a, #0xef
      008554 F7               [ 1] 1144 	ld	(x), a
                                   1145 ;	sensors.c: 498: PD_CR1 = (1 << 3) | (1 << 2); // push-pull
      008555 AE 50 12         [ 2] 1146 	ldw	x, #0x5012
      008558 A6 0C            [ 1] 1147 	ld	a, #0x0c
      00855A F7               [ 1] 1148 	ld	(x), a
                                   1149 ;	sensors.c: 499: PD_CR1 &= ~(1 << 4); // input with float
      00855B AE 50 12         [ 2] 1150 	ldw	x, #0x5012
      00855E F6               [ 1] 1151 	ld	a, (x)
      00855F A4 EF            [ 1] 1152 	and	a, #0xef
      008561 F7               [ 1] 1153 	ld	(x), a
                                   1154 ;	sensors.c: 500: PD_CR2 = (1 << 3) | (1 << 2) | (1<< 4); // up to 10MHz speed + interrupt enabled 
      008562 AE 50 13         [ 2] 1155 	ldw	x, #0x5013
      008565 A6 1C            [ 1] 1156 	ld	a, #0x1c
      008567 F7               [ 1] 1157 	ld	(x), a
                                   1158 ;	sensors.c: 502: EXTI_CR1 = (1<<7); //Port D external sensitivity bits7:6 10: Falling edge only
      008568 AE 50 A0         [ 2] 1159 	ldw	x, #0x50a0
      00856B A6 80            [ 1] 1160 	ld	a, #0x80
      00856D F7               [ 1] 1161 	ld	(x), a
                                   1162 ;	sensors.c: 503: EXTI_CR1 &= ~(1<<6); //Port D external sensitivity bits7:6 10: Falling edge only
      00856E AE 50 A0         [ 2] 1163 	ldw	x, #0x50a0
      008571 F6               [ 1] 1164 	ld	a, (x)
      008572 A4 BF            [ 1] 1165 	and	a, #0xbf
      008574 F7               [ 1] 1166 	ld	(x), a
                                   1167 ;	sensors.c: 506: tijd = &real_time;
      008575 AE 00 01         [ 2] 1168 	ldw	x, #_real_time+0
      008578 1F 01            [ 2] 1169 	ldw	(0x01, sp), x
                                   1170 ;	sensors.c: 510: TIM1_PSCRH = 0x3e;
      00857A AE 52 60         [ 2] 1171 	ldw	x, #0x5260
      00857D A6 3E            [ 1] 1172 	ld	a, #0x3e
      00857F F7               [ 1] 1173 	ld	(x), a
                                   1174 ;	sensors.c: 511: TIM1_PSCRL = 0x80;
      008580 AE 52 61         [ 2] 1175 	ldw	x, #0x5261
      008583 A6 80            [ 1] 1176 	ld	a, #0x80
      008585 F7               [ 1] 1177 	ld	(x), a
                                   1178 ;	sensors.c: 513: tm1637Init();
      008586 CD 83 6F         [ 4] 1179 	call	_tm1637Init
                                   1180 ;	sensors.c: 515: InitializeUART();
      008589 CD 82 F6         [ 4] 1181 	call	_InitializeUART
                                   1182 ;	sensors.c: 518: __asm__("rim");
      00858C 9A               [ 1] 1183 	rim
                                   1184 ;	sensors.c: 522: while (1) {
      00858D                       1185 00102$:
                                   1186 ;	sensors.c: 525: tm1637DisplayDecimal(tijd->minute, 0); // display minutes 
      00858D 1E 01            [ 2] 1187 	ldw	x, (0x01, sp)
      00858F E6 01            [ 1] 1188 	ld	a, (0x1, x)
      008591 5F               [ 1] 1189 	clrw	x
      008592 89               [ 2] 1190 	pushw	x
      008593 88               [ 1] 1191 	push	a
      008594 CD 83 76         [ 4] 1192 	call	_tm1637DisplayDecimal
      008597 5B 03            [ 2] 1193 	addw	sp, #3
      008599 20 F2            [ 2] 1194 	jra	00102$
      00859B 5B 02            [ 2] 1195 	addw	sp, #2
      00859D 81               [ 4] 1196 	ret
                                   1197 	.area CODE
      00859E                       1198 _segmentMap:
      00859E 3F                    1199 	.db #0x3F	;  63
      00859F 06                    1200 	.db #0x06	;  6
      0085A0 5B                    1201 	.db #0x5B	;  91
      0085A1 4F                    1202 	.db #0x4F	;  79	'O'
      0085A2 66                    1203 	.db #0x66	;  102	'f'
      0085A3 6D                    1204 	.db #0x6D	;  109	'm'
      0085A4 7D                    1205 	.db #0x7D	;  125
      0085A5 07                    1206 	.db #0x07	;  7
      0085A6 7F                    1207 	.db #0x7F	;  127
      0085A7 6F                    1208 	.db #0x6F	;  111	'o'
      0085A8 77                    1209 	.db #0x77	;  119	'w'
      0085A9 7C                    1210 	.db #0x7C	;  124
      0085AA 39                    1211 	.db #0x39	;  57	'9'
      0085AB 5E                    1212 	.db #0x5E	;  94
      0085AC 79                    1213 	.db #0x79	;  121	'y'
      0085AD 71                    1214 	.db #0x71	;  113	'q'
      0085AE 00                    1215 	.db #0x00	;  0
                                   1216 	.area INITIALIZER
                                   1217 	.area CABS (ABS)
