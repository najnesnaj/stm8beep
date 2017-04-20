                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.0 #8981 (Jul  5 2014) (Linux)
                                      4 ; This file was generated Thu Apr 20 21:43:24 2017
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
                                     15 	.globl _clock
                                     16 	.globl _tm1637DisplayDecimal
                                     17 	.globl _tm1637Init
                                     18 	.globl _InitializeUART
                                     19 	.globl _InitializeI2C
                                     20 	.globl _i2c_read_register
                                     21 	.globl _print_byte_hex
                                     22 	.globl _i2c_set_start_ack
                                     23 	.globl _i2c_send_address
                                     24 	.globl _print_UCHAR_hex
                                     25 	.globl _UARTPrintF
                                     26 	.globl _i2c_send_reg
                                     27 	.globl _i2c_set_stop
                                     28 	.globl _i2c_set_nak
                                     29 	.globl _i2c_read
                                     30 	.globl _delay
                                     31 	.globl _InitializeSystemClock
                                     32 	.globl _delayTenMicro
                                     33 	.globl _minuten
                                     34 	.globl _seconden
                                     35 	.globl _internteller
                                     36 	.globl _tm1637SetBrightness
                                     37 	.globl __tm1637Start
                                     38 	.globl __tm1637Stop
                                     39 	.globl __tm1637ReadResult
                                     40 	.globl __tm1637WriteByte
                                     41 	.globl __tm1637ClkHigh
                                     42 	.globl __tm1637ClkLow
                                     43 	.globl __tm1637DioHigh
                                     44 	.globl __tm1637DioLow
                                     45 ;--------------------------------------------------------
                                     46 ; ram data
                                     47 ;--------------------------------------------------------
                                     48 	.area DATA
      000001                         49 _internteller::
      000001                         50 	.ds 2
      000003                         51 _seconden::
      000003                         52 	.ds 2
      000005                         53 _minuten::
      000005                         54 	.ds 2
                                     55 ;--------------------------------------------------------
                                     56 ; ram data
                                     57 ;--------------------------------------------------------
                                     58 	.area INITIALIZED
                                     59 ;--------------------------------------------------------
                                     60 ; Stack segment in internal ram 
                                     61 ;--------------------------------------------------------
                                     62 	.area	SSEG
      000000                         63 __start__stack:
      000000                         64 	.ds	1
                                     65 
                                     66 ;--------------------------------------------------------
                                     67 ; absolute external ram data
                                     68 ;--------------------------------------------------------
                                     69 	.area DABS (ABS)
                                     70 ;--------------------------------------------------------
                                     71 ; interrupt vector 
                                     72 ;--------------------------------------------------------
                                     73 	.area HOME
      008000                         74 __interrupt_vect:
      008000 82 00 80 83             75 	int s_GSINIT ;reset
      008004 82 00 00 00             76 	int 0x0000 ;trap
      008008 82 00 00 00             77 	int 0x0000 ;int0
      00800C 82 00 00 00             78 	int 0x0000 ;int1
      008010 82 00 00 00             79 	int 0x0000 ;int2
      008014 82 00 00 00             80 	int 0x0000 ;int3
      008018 82 00 00 00             81 	int 0x0000 ;int4
      00801C 82 00 00 00             82 	int 0x0000 ;int5
      008020 82 00 85 01             83 	int _timer_isr ;int6
      008024 82 00 00 00             84 	int 0x0000 ;int7
      008028 82 00 00 00             85 	int 0x0000 ;int8
      00802C 82 00 00 00             86 	int 0x0000 ;int9
      008030 82 00 00 00             87 	int 0x0000 ;int10
      008034 82 00 00 00             88 	int 0x0000 ;int11
      008038 82 00 00 00             89 	int 0x0000 ;int12
      00803C 82 00 00 00             90 	int 0x0000 ;int13
      008040 82 00 00 00             91 	int 0x0000 ;int14
      008044 82 00 00 00             92 	int 0x0000 ;int15
      008048 82 00 00 00             93 	int 0x0000 ;int16
      00804C 82 00 00 00             94 	int 0x0000 ;int17
      008050 82 00 00 00             95 	int 0x0000 ;int18
      008054 82 00 00 00             96 	int 0x0000 ;int19
      008058 82 00 00 00             97 	int 0x0000 ;int20
      00805C 82 00 00 00             98 	int 0x0000 ;int21
      008060 82 00 00 00             99 	int 0x0000 ;int22
      008064 82 00 00 00            100 	int 0x0000 ;int23
      008068 82 00 00 00            101 	int 0x0000 ;int24
      00806C 82 00 00 00            102 	int 0x0000 ;int25
      008070 82 00 00 00            103 	int 0x0000 ;int26
      008074 82 00 00 00            104 	int 0x0000 ;int27
      008078 82 00 00 00            105 	int 0x0000 ;int28
      00807C 82 00 00 00            106 	int 0x0000 ;int29
                                    107 ;--------------------------------------------------------
                                    108 ; global & static initialisations
                                    109 ;--------------------------------------------------------
                                    110 	.area HOME
                                    111 	.area GSINIT
                                    112 	.area GSFINAL
                                    113 	.area GSINIT
      008083                        114 __sdcc_gs_init_startup:
      008083                        115 __sdcc_init_data:
                                    116 ; stm8_genXINIT() start
      008083 AE 00 06         [ 2]  117 	ldw x, #l_DATA
      008086 27 07            [ 1]  118 	jreq	00002$
      008088                        119 00001$:
      008088 72 4F 00 00      [ 1]  120 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  121 	decw x
      00808D 26 F9            [ 1]  122 	jrne	00001$
      00808F                        123 00002$:
      00808F AE 00 00         [ 2]  124 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  125 	jreq	00004$
      008094                        126 00003$:
      008094 D6 85 F7         [ 1]  127 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 06         [ 1]  128 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  129 	decw	x
      00809B 26 F7            [ 1]  130 	jrne	00003$
      00809D                        131 00004$:
                                    132 ; stm8_genXINIT() end
                                    133 	.area GSFINAL
      00809D CC 80 80         [ 2]  134 	jp	__sdcc_program_startup
                                    135 ;--------------------------------------------------------
                                    136 ; Home
                                    137 ;--------------------------------------------------------
                                    138 	.area HOME
                                    139 	.area HOME
      008080                        140 __sdcc_program_startup:
      008080 CC 85 34         [ 2]  141 	jp	_main
                                    142 ;	return from main will return to caller
                                    143 ;--------------------------------------------------------
                                    144 ; code
                                    145 ;--------------------------------------------------------
                                    146 	.area CODE
                                    147 ;	sensors.c: 15: void delayTenMicro (void) {
                                    148 ;	-----------------------------------------
                                    149 ;	 function delayTenMicro
                                    150 ;	-----------------------------------------
      0080A0                        151 _delayTenMicro:
                                    152 ;	sensors.c: 17: for (a = 0; a < 50; ++a)
      0080A0 A6 32            [ 1]  153 	ld	a, #0x32
      0080A2                        154 00104$:
                                    155 ;	sensors.c: 18: __asm__("nop");
      0080A2 9D               [ 1]  156 	nop
      0080A3 4A               [ 1]  157 	dec	a
                                    158 ;	sensors.c: 17: for (a = 0; a < 50; ++a)
      0080A4 4D               [ 1]  159 	tnz	a
      0080A5 26 FB            [ 1]  160 	jrne	00104$
      0080A7 81               [ 4]  161 	ret
                                    162 ;	sensors.c: 21: void InitializeSystemClock() {
                                    163 ;	-----------------------------------------
                                    164 ;	 function InitializeSystemClock
                                    165 ;	-----------------------------------------
      0080A8                        166 _InitializeSystemClock:
                                    167 ;	sensors.c: 22: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
      0080A8 AE 50 C0         [ 2]  168 	ldw	x, #0x50c0
      0080AB 7F               [ 1]  169 	clr	(x)
                                    170 ;	sensors.c: 23: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
      0080AC AE 50 C0         [ 2]  171 	ldw	x, #0x50c0
      0080AF A6 01            [ 1]  172 	ld	a, #0x01
      0080B1 F7               [ 1]  173 	ld	(x), a
                                    174 ;	sensors.c: 24: CLK_ECKR = 0;                       //  Disable the external clock.
      0080B2 AE 50 C1         [ 2]  175 	ldw	x, #0x50c1
      0080B5 7F               [ 1]  176 	clr	(x)
                                    177 ;	sensors.c: 25: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
      0080B6                        178 00101$:
      0080B6 AE 50 C0         [ 2]  179 	ldw	x, #0x50c0
      0080B9 F6               [ 1]  180 	ld	a, (x)
      0080BA A5 02            [ 1]  181 	bcp	a, #0x02
      0080BC 27 F8            [ 1]  182 	jreq	00101$
                                    183 ;	sensors.c: 26: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
      0080BE AE 50 C6         [ 2]  184 	ldw	x, #0x50c6
      0080C1 7F               [ 1]  185 	clr	(x)
                                    186 ;	sensors.c: 27: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
      0080C2 AE 50 C7         [ 2]  187 	ldw	x, #0x50c7
      0080C5 A6 FF            [ 1]  188 	ld	a, #0xff
      0080C7 F7               [ 1]  189 	ld	(x), a
                                    190 ;	sensors.c: 28: CLK_PCKENR2 = 0xff;                 //  Ditto.
      0080C8 AE 50 CA         [ 2]  191 	ldw	x, #0x50ca
      0080CB A6 FF            [ 1]  192 	ld	a, #0xff
      0080CD F7               [ 1]  193 	ld	(x), a
                                    194 ;	sensors.c: 29: CLK_CCOR = 0;                       //  Turn off CCO.
      0080CE AE 50 C9         [ 2]  195 	ldw	x, #0x50c9
      0080D1 7F               [ 1]  196 	clr	(x)
                                    197 ;	sensors.c: 30: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
      0080D2 AE 50 CC         [ 2]  198 	ldw	x, #0x50cc
      0080D5 7F               [ 1]  199 	clr	(x)
                                    200 ;	sensors.c: 31: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
      0080D6 AE 50 CD         [ 2]  201 	ldw	x, #0x50cd
      0080D9 7F               [ 1]  202 	clr	(x)
                                    203 ;	sensors.c: 32: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
      0080DA AE 50 C4         [ 2]  204 	ldw	x, #0x50c4
      0080DD A6 E1            [ 1]  205 	ld	a, #0xe1
      0080DF F7               [ 1]  206 	ld	(x), a
                                    207 ;	sensors.c: 33: CLK_SWCR = 0;                       //  Reset the clock switch control register.
      0080E0 AE 50 C5         [ 2]  208 	ldw	x, #0x50c5
      0080E3 7F               [ 1]  209 	clr	(x)
                                    210 ;	sensors.c: 34: CLK_SWCR = CLK_SWEN;                //  Enable switching.
      0080E4 AE 50 C5         [ 2]  211 	ldw	x, #0x50c5
      0080E7 A6 02            [ 1]  212 	ld	a, #0x02
      0080E9 F7               [ 1]  213 	ld	(x), a
                                    214 ;	sensors.c: 35: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
      0080EA                        215 00104$:
      0080EA AE 50 C5         [ 2]  216 	ldw	x, #0x50c5
      0080ED F6               [ 1]  217 	ld	a, (x)
      0080EE 44               [ 1]  218 	srl	a
      0080EF 25 F9            [ 1]  219 	jrc	00104$
      0080F1 81               [ 4]  220 	ret
                                    221 ;	sensors.c: 37: void delay (int time_ms) {
                                    222 ;	-----------------------------------------
                                    223 ;	 function delay
                                    224 ;	-----------------------------------------
      0080F2                        225 _delay:
      0080F2 52 0A            [ 2]  226 	sub	sp, #10
                                    227 ;	sensors.c: 39: for (x = 0; x < 1036*time_ms; ++x)
      0080F4 5F               [ 1]  228 	clrw	x
      0080F5 1F 03            [ 2]  229 	ldw	(0x03, sp), x
      0080F7 1F 01            [ 2]  230 	ldw	(0x01, sp), x
      0080F9 1E 0D            [ 2]  231 	ldw	x, (0x0d, sp)
      0080FB 89               [ 2]  232 	pushw	x
      0080FC 4B 0C            [ 1]  233 	push	#0x0c
      0080FE 4B 04            [ 1]  234 	push	#0x04
      008100 CD 85 A2         [ 4]  235 	call	__mulint
      008103 5B 04            [ 2]  236 	addw	sp, #4
      008105 1F 09            [ 2]  237 	ldw	(0x09, sp), x
      008107                        238 00103$:
      008107 16 09            [ 2]  239 	ldw	y, (0x09, sp)
      008109 17 07            [ 2]  240 	ldw	(0x07, sp), y
      00810B 7B 07            [ 1]  241 	ld	a, (0x07, sp)
      00810D 49               [ 1]  242 	rlc	a
      00810E 4F               [ 1]  243 	clr	a
      00810F A2 00            [ 1]  244 	sbc	a, #0x00
      008111 6B 06            [ 1]  245 	ld	(0x06, sp), a
      008113 6B 05            [ 1]  246 	ld	(0x05, sp), a
      008115 1E 03            [ 2]  247 	ldw	x, (0x03, sp)
      008117 13 07            [ 2]  248 	cpw	x, (0x07, sp)
      008119 7B 02            [ 1]  249 	ld	a, (0x02, sp)
      00811B 12 06            [ 1]  250 	sbc	a, (0x06, sp)
      00811D 7B 01            [ 1]  251 	ld	a, (0x01, sp)
      00811F 12 05            [ 1]  252 	sbc	a, (0x05, sp)
      008121 2E 17            [ 1]  253 	jrsge	00105$
                                    254 ;	sensors.c: 40: __asm__("nop");
      008123 9D               [ 1]  255 	nop
                                    256 ;	sensors.c: 39: for (x = 0; x < 1036*time_ms; ++x)
      008124 16 03            [ 2]  257 	ldw	y, (0x03, sp)
      008126 72 A9 00 01      [ 2]  258 	addw	y, #0x0001
      00812A 7B 02            [ 1]  259 	ld	a, (0x02, sp)
      00812C A9 00            [ 1]  260 	adc	a, #0x00
      00812E 97               [ 1]  261 	ld	xl, a
      00812F 7B 01            [ 1]  262 	ld	a, (0x01, sp)
      008131 A9 00            [ 1]  263 	adc	a, #0x00
      008133 95               [ 1]  264 	ld	xh, a
      008134 17 03            [ 2]  265 	ldw	(0x03, sp), y
      008136 1F 01            [ 2]  266 	ldw	(0x01, sp), x
      008138 20 CD            [ 2]  267 	jra	00103$
      00813A                        268 00105$:
      00813A 5B 0A            [ 2]  269 	addw	sp, #10
      00813C 81               [ 4]  270 	ret
                                    271 ;	sensors.c: 42: void i2c_read (unsigned char *x) {
                                    272 ;	-----------------------------------------
                                    273 ;	 function i2c_read
                                    274 ;	-----------------------------------------
      00813D                        275 _i2c_read:
                                    276 ;	sensors.c: 43: while ((I2C_SR1 & I2C_RXNE) == 0);
      00813D                        277 00101$:
      00813D AE 52 17         [ 2]  278 	ldw	x, #0x5217
      008140 F6               [ 1]  279 	ld	a, (x)
      008141 A5 40            [ 1]  280 	bcp	a, #0x40
      008143 27 F8            [ 1]  281 	jreq	00101$
                                    282 ;	sensors.c: 44: *x = I2C_DR;
      008145 16 03            [ 2]  283 	ldw	y, (0x03, sp)
      008147 AE 52 16         [ 2]  284 	ldw	x, #0x5216
      00814A F6               [ 1]  285 	ld	a, (x)
      00814B 90 F7            [ 1]  286 	ld	(y), a
      00814D 81               [ 4]  287 	ret
                                    288 ;	sensors.c: 46: void i2c_set_nak (void) {
                                    289 ;	-----------------------------------------
                                    290 ;	 function i2c_set_nak
                                    291 ;	-----------------------------------------
      00814E                        292 _i2c_set_nak:
                                    293 ;	sensors.c: 47: I2C_CR2 &= ~I2C_ACK;
      00814E AE 52 11         [ 2]  294 	ldw	x, #0x5211
      008151 F6               [ 1]  295 	ld	a, (x)
      008152 A4 FB            [ 1]  296 	and	a, #0xfb
      008154 F7               [ 1]  297 	ld	(x), a
      008155 81               [ 4]  298 	ret
                                    299 ;	sensors.c: 49: void i2c_set_stop (void) {
                                    300 ;	-----------------------------------------
                                    301 ;	 function i2c_set_stop
                                    302 ;	-----------------------------------------
      008156                        303 _i2c_set_stop:
                                    304 ;	sensors.c: 50: I2C_CR2 |= I2C_STOP;
      008156 AE 52 11         [ 2]  305 	ldw	x, #0x5211
      008159 F6               [ 1]  306 	ld	a, (x)
      00815A AA 02            [ 1]  307 	or	a, #0x02
      00815C F7               [ 1]  308 	ld	(x), a
      00815D 81               [ 4]  309 	ret
                                    310 ;	sensors.c: 52: void i2c_send_reg (UCHAR addr) {
                                    311 ;	-----------------------------------------
                                    312 ;	 function i2c_send_reg
                                    313 ;	-----------------------------------------
      00815E                        314 _i2c_send_reg:
      00815E 52 02            [ 2]  315 	sub	sp, #2
                                    316 ;	sensors.c: 54: reg = I2C_SR1;
      008160 AE 52 17         [ 2]  317 	ldw	x, #0x5217
      008163 F6               [ 1]  318 	ld	a, (x)
      008164 5F               [ 1]  319 	clrw	x
      008165 97               [ 1]  320 	ld	xl, a
      008166 1F 01            [ 2]  321 	ldw	(0x01, sp), x
                                    322 ;	sensors.c: 55: reg = I2C_SR3;
      008168 AE 52 19         [ 2]  323 	ldw	x, #0x5219
      00816B F6               [ 1]  324 	ld	a, (x)
      00816C 5F               [ 1]  325 	clrw	x
      00816D 97               [ 1]  326 	ld	xl, a
      00816E 1F 01            [ 2]  327 	ldw	(0x01, sp), x
                                    328 ;	sensors.c: 56: I2C_DR = addr;
      008170 AE 52 16         [ 2]  329 	ldw	x, #0x5216
      008173 7B 05            [ 1]  330 	ld	a, (0x05, sp)
      008175 F7               [ 1]  331 	ld	(x), a
                                    332 ;	sensors.c: 57: while ((I2C_SR1 & I2C_TXE) == 0);
      008176                        333 00101$:
      008176 AE 52 17         [ 2]  334 	ldw	x, #0x5217
      008179 F6               [ 1]  335 	ld	a, (x)
      00817A 48               [ 1]  336 	sll	a
      00817B 24 F9            [ 1]  337 	jrnc	00101$
      00817D 5B 02            [ 2]  338 	addw	sp, #2
      00817F 81               [ 4]  339 	ret
                                    340 ;	sensors.c: 61: void UARTPrintF (char *message) {
                                    341 ;	-----------------------------------------
                                    342 ;	 function UARTPrintF
                                    343 ;	-----------------------------------------
      008180                        344 _UARTPrintF:
                                    345 ;	sensors.c: 62: char *ch = message;
      008180 16 03            [ 2]  346 	ldw	y, (0x03, sp)
                                    347 ;	sensors.c: 63: while (*ch) {
      008182                        348 00104$:
      008182 90 F6            [ 1]  349 	ld	a, (y)
      008184 4D               [ 1]  350 	tnz	a
      008185 27 0F            [ 1]  351 	jreq	00107$
                                    352 ;	sensors.c: 64: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
      008187 AE 52 31         [ 2]  353 	ldw	x, #0x5231
      00818A F7               [ 1]  354 	ld	(x), a
                                    355 ;	sensors.c: 65: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
      00818B                        356 00101$:
      00818B AE 52 30         [ 2]  357 	ldw	x, #0x5230
      00818E F6               [ 1]  358 	ld	a, (x)
      00818F 48               [ 1]  359 	sll	a
      008190 24 F9            [ 1]  360 	jrnc	00101$
                                    361 ;	sensors.c: 66: ch++;                               //  Grab the next character.
      008192 90 5C            [ 2]  362 	incw	y
      008194 20 EC            [ 2]  363 	jra	00104$
      008196                        364 00107$:
      008196 81               [ 4]  365 	ret
                                    366 ;	sensors.c: 70: void print_UCHAR_hex (unsigned char buffer) {
                                    367 ;	-----------------------------------------
                                    368 ;	 function print_UCHAR_hex
                                    369 ;	-----------------------------------------
      008197                        370 _print_UCHAR_hex:
      008197 52 0C            [ 2]  371 	sub	sp, #12
                                    372 ;	sensors.c: 73: a = (buffer >> 4);
      008199 7B 0F            [ 1]  373 	ld	a, (0x0f, sp)
      00819B 4E               [ 1]  374 	swap	a
      00819C A4 0F            [ 1]  375 	and	a, #0x0f
      00819E 5F               [ 1]  376 	clrw	x
      00819F 97               [ 1]  377 	ld	xl, a
                                    378 ;	sensors.c: 74: if (a > 9)
      0081A0 A3 00 09         [ 2]  379 	cpw	x, #0x0009
      0081A3 2D 07            [ 1]  380 	jrsle	00102$
                                    381 ;	sensors.c: 75: a = a + 'a' - 10;
      0081A5 1C 00 57         [ 2]  382 	addw	x, #0x0057
      0081A8 1F 01            [ 2]  383 	ldw	(0x01, sp), x
      0081AA 20 05            [ 2]  384 	jra	00103$
      0081AC                        385 00102$:
                                    386 ;	sensors.c: 77: a += '0';
      0081AC 1C 00 30         [ 2]  387 	addw	x, #0x0030
      0081AF 1F 01            [ 2]  388 	ldw	(0x01, sp), x
      0081B1                        389 00103$:
                                    390 ;	sensors.c: 78: b = buffer & 0x0f;
      0081B1 7B 0F            [ 1]  391 	ld	a, (0x0f, sp)
      0081B3 A4 0F            [ 1]  392 	and	a, #0x0f
      0081B5 5F               [ 1]  393 	clrw	x
      0081B6 97               [ 1]  394 	ld	xl, a
                                    395 ;	sensors.c: 79: if (b > 9)
      0081B7 A3 00 09         [ 2]  396 	cpw	x, #0x0009
      0081BA 2D 07            [ 1]  397 	jrsle	00105$
                                    398 ;	sensors.c: 80: b = b + 'a' - 10;
      0081BC 1C 00 57         [ 2]  399 	addw	x, #0x0057
      0081BF 1F 0B            [ 2]  400 	ldw	(0x0b, sp), x
      0081C1 20 05            [ 2]  401 	jra	00106$
      0081C3                        402 00105$:
                                    403 ;	sensors.c: 82: b += '0';
      0081C3 1C 00 30         [ 2]  404 	addw	x, #0x0030
      0081C6 1F 0B            [ 2]  405 	ldw	(0x0b, sp), x
      0081C8                        406 00106$:
                                    407 ;	sensors.c: 83: message[0] = a;
      0081C8 90 96            [ 1]  408 	ldw	y, sp
      0081CA 72 A9 00 03      [ 2]  409 	addw	y, #3
      0081CE 7B 02            [ 1]  410 	ld	a, (0x02, sp)
      0081D0 90 F7            [ 1]  411 	ld	(y), a
                                    412 ;	sensors.c: 84: message[1] = b;
      0081D2 93               [ 1]  413 	ldw	x, y
      0081D3 5C               [ 2]  414 	incw	x
      0081D4 7B 0C            [ 1]  415 	ld	a, (0x0c, sp)
      0081D6 F7               [ 1]  416 	ld	(x), a
                                    417 ;	sensors.c: 85: message[2] = 0;
      0081D7 93               [ 1]  418 	ldw	x, y
      0081D8 5C               [ 2]  419 	incw	x
      0081D9 5C               [ 2]  420 	incw	x
      0081DA 7F               [ 1]  421 	clr	(x)
                                    422 ;	sensors.c: 86: UARTPrintF (message);
      0081DB 90 89            [ 2]  423 	pushw	y
      0081DD CD 81 80         [ 4]  424 	call	_UARTPrintF
      0081E0 5B 02            [ 2]  425 	addw	sp, #2
      0081E2 5B 0C            [ 2]  426 	addw	sp, #12
      0081E4 81               [ 4]  427 	ret
                                    428 ;	sensors.c: 89: void i2c_send_address (UCHAR addr, UCHAR mode) {
                                    429 ;	-----------------------------------------
                                    430 ;	 function i2c_send_address
                                    431 ;	-----------------------------------------
      0081E5                        432 _i2c_send_address:
      0081E5 52 03            [ 2]  433 	sub	sp, #3
                                    434 ;	sensors.c: 91: reg = I2C_SR1;
      0081E7 AE 52 17         [ 2]  435 	ldw	x, #0x5217
      0081EA F6               [ 1]  436 	ld	a, (x)
      0081EB 5F               [ 1]  437 	clrw	x
      0081EC 97               [ 1]  438 	ld	xl, a
      0081ED 1F 01            [ 2]  439 	ldw	(0x01, sp), x
                                    440 ;	sensors.c: 92: I2C_DR = (addr << 1) | mode;
      0081EF 7B 06            [ 1]  441 	ld	a, (0x06, sp)
      0081F1 48               [ 1]  442 	sll	a
      0081F2 1A 07            [ 1]  443 	or	a, (0x07, sp)
      0081F4 AE 52 16         [ 2]  444 	ldw	x, #0x5216
      0081F7 F7               [ 1]  445 	ld	(x), a
                                    446 ;	sensors.c: 93: if (mode == I2C_READ) {
      0081F8 7B 07            [ 1]  447 	ld	a, (0x07, sp)
      0081FA A1 01            [ 1]  448 	cp	a, #0x01
      0081FC 26 06            [ 1]  449 	jrne	00127$
      0081FE A6 01            [ 1]  450 	ld	a, #0x01
      008200 6B 03            [ 1]  451 	ld	(0x03, sp), a
      008202 20 02            [ 2]  452 	jra	00128$
      008204                        453 00127$:
      008204 0F 03            [ 1]  454 	clr	(0x03, sp)
      008206                        455 00128$:
      008206 0D 03            [ 1]  456 	tnz	(0x03, sp)
      008208 27 08            [ 1]  457 	jreq	00103$
                                    458 ;	sensors.c: 94: I2C_OARL = 0;
      00820A AE 52 13         [ 2]  459 	ldw	x, #0x5213
      00820D 7F               [ 1]  460 	clr	(x)
                                    461 ;	sensors.c: 95: I2C_OARH = 0;
      00820E AE 52 14         [ 2]  462 	ldw	x, #0x5214
      008211 7F               [ 1]  463 	clr	(x)
                                    464 ;	sensors.c: 98: while ((I2C_SR1 & I2C_ADDR) == 0);
      008212                        465 00103$:
                                    466 ;	sensors.c: 91: reg = I2C_SR1;
      008212 AE 52 17         [ 2]  467 	ldw	x, #0x5217
      008215 F6               [ 1]  468 	ld	a, (x)
                                    469 ;	sensors.c: 98: while ((I2C_SR1 & I2C_ADDR) == 0);
      008216 A5 02            [ 1]  470 	bcp	a, #0x02
      008218 27 F8            [ 1]  471 	jreq	00103$
                                    472 ;	sensors.c: 99: if (mode == I2C_READ)
      00821A 0D 03            [ 1]  473 	tnz	(0x03, sp)
      00821C 27 06            [ 1]  474 	jreq	00108$
                                    475 ;	sensors.c: 100: UNSET (I2C_SR1, I2C_ADDR);
      00821E A4 FD            [ 1]  476 	and	a, #0xfd
      008220 AE 52 17         [ 2]  477 	ldw	x, #0x5217
      008223 F7               [ 1]  478 	ld	(x), a
      008224                        479 00108$:
      008224 5B 03            [ 2]  480 	addw	sp, #3
      008226 81               [ 4]  481 	ret
                                    482 ;	sensors.c: 103: void i2c_set_start_ack (void) {
                                    483 ;	-----------------------------------------
                                    484 ;	 function i2c_set_start_ack
                                    485 ;	-----------------------------------------
      008227                        486 _i2c_set_start_ack:
                                    487 ;	sensors.c: 104: I2C_CR2 = I2C_ACK | I2C_START;
      008227 AE 52 11         [ 2]  488 	ldw	x, #0x5211
      00822A A6 05            [ 1]  489 	ld	a, #0x05
      00822C F7               [ 1]  490 	ld	(x), a
                                    491 ;	sensors.c: 105: while ((I2C_SR1 & I2C_SB) == 0);
      00822D                        492 00101$:
      00822D AE 52 17         [ 2]  493 	ldw	x, #0x5217
      008230 F6               [ 1]  494 	ld	a, (x)
      008231 44               [ 1]  495 	srl	a
      008232 24 F9            [ 1]  496 	jrnc	00101$
      008234 81               [ 4]  497 	ret
                                    498 ;	sensors.c: 112: void print_byte_hex (unsigned char buffer) {
                                    499 ;	-----------------------------------------
                                    500 ;	 function print_byte_hex
                                    501 ;	-----------------------------------------
      008235                        502 _print_byte_hex:
      008235 52 0C            [ 2]  503 	sub	sp, #12
                                    504 ;	sensors.c: 115: a = (buffer >> 4);
      008237 7B 0F            [ 1]  505 	ld	a, (0x0f, sp)
      008239 4E               [ 1]  506 	swap	a
      00823A A4 0F            [ 1]  507 	and	a, #0x0f
      00823C 5F               [ 1]  508 	clrw	x
      00823D 97               [ 1]  509 	ld	xl, a
                                    510 ;	sensors.c: 116: if (a > 9)
      00823E A3 00 09         [ 2]  511 	cpw	x, #0x0009
      008241 2D 07            [ 1]  512 	jrsle	00102$
                                    513 ;	sensors.c: 117: a = a + 'a' - 10;
      008243 1C 00 57         [ 2]  514 	addw	x, #0x0057
      008246 1F 03            [ 2]  515 	ldw	(0x03, sp), x
      008248 20 05            [ 2]  516 	jra	00103$
      00824A                        517 00102$:
                                    518 ;	sensors.c: 119: a += '0'; 
      00824A 1C 00 30         [ 2]  519 	addw	x, #0x0030
      00824D 1F 03            [ 2]  520 	ldw	(0x03, sp), x
      00824F                        521 00103$:
                                    522 ;	sensors.c: 120: b = buffer & 0x0f;
      00824F 7B 0F            [ 1]  523 	ld	a, (0x0f, sp)
      008251 A4 0F            [ 1]  524 	and	a, #0x0f
      008253 5F               [ 1]  525 	clrw	x
      008254 97               [ 1]  526 	ld	xl, a
                                    527 ;	sensors.c: 121: if (b > 9)
      008255 A3 00 09         [ 2]  528 	cpw	x, #0x0009
      008258 2D 07            [ 1]  529 	jrsle	00105$
                                    530 ;	sensors.c: 122: b = b + 'a' - 10;
      00825A 1C 00 57         [ 2]  531 	addw	x, #0x0057
      00825D 1F 01            [ 2]  532 	ldw	(0x01, sp), x
      00825F 20 05            [ 2]  533 	jra	00106$
      008261                        534 00105$:
                                    535 ;	sensors.c: 124: b += '0'; 
      008261 1C 00 30         [ 2]  536 	addw	x, #0x0030
      008264 1F 01            [ 2]  537 	ldw	(0x01, sp), x
      008266                        538 00106$:
                                    539 ;	sensors.c: 125: message[0] = a;
      008266 90 96            [ 1]  540 	ldw	y, sp
      008268 72 A9 00 05      [ 2]  541 	addw	y, #5
      00826C 7B 04            [ 1]  542 	ld	a, (0x04, sp)
      00826E 90 F7            [ 1]  543 	ld	(y), a
                                    544 ;	sensors.c: 126: message[1] = b;
      008270 93               [ 1]  545 	ldw	x, y
      008271 5C               [ 2]  546 	incw	x
      008272 7B 02            [ 1]  547 	ld	a, (0x02, sp)
      008274 F7               [ 1]  548 	ld	(x), a
                                    549 ;	sensors.c: 127: message[2] = 0;
      008275 93               [ 1]  550 	ldw	x, y
      008276 5C               [ 2]  551 	incw	x
      008277 5C               [ 2]  552 	incw	x
      008278 7F               [ 1]  553 	clr	(x)
                                    554 ;	sensors.c: 128: UARTPrintF (message);
      008279 90 89            [ 2]  555 	pushw	y
      00827B CD 81 80         [ 4]  556 	call	_UARTPrintF
      00827E 5B 02            [ 2]  557 	addw	sp, #2
      008280 5B 0C            [ 2]  558 	addw	sp, #12
      008282 81               [ 4]  559 	ret
                                    560 ;	sensors.c: 132: unsigned char i2c_read_register (UCHAR addr, UCHAR rg) {
                                    561 ;	-----------------------------------------
                                    562 ;	 function i2c_read_register
                                    563 ;	-----------------------------------------
      008283                        564 _i2c_read_register:
      008283 52 02            [ 2]  565 	sub	sp, #2
                                    566 ;	sensors.c: 135: i2c_set_start_ack ();
      008285 CD 82 27         [ 4]  567 	call	_i2c_set_start_ack
                                    568 ;	sensors.c: 136: i2c_send_address (addr, I2C_WRITE);
      008288 4B 00            [ 1]  569 	push	#0x00
      00828A 7B 06            [ 1]  570 	ld	a, (0x06, sp)
      00828C 88               [ 1]  571 	push	a
      00828D CD 81 E5         [ 4]  572 	call	_i2c_send_address
      008290 5B 02            [ 2]  573 	addw	sp, #2
                                    574 ;	sensors.c: 137: i2c_send_reg (rg);
      008292 7B 06            [ 1]  575 	ld	a, (0x06, sp)
      008294 88               [ 1]  576 	push	a
      008295 CD 81 5E         [ 4]  577 	call	_i2c_send_reg
      008298 84               [ 1]  578 	pop	a
                                    579 ;	sensors.c: 138: i2c_set_start_ack ();
      008299 CD 82 27         [ 4]  580 	call	_i2c_set_start_ack
                                    581 ;	sensors.c: 139: i2c_send_address (addr, I2C_READ);
      00829C 4B 01            [ 1]  582 	push	#0x01
      00829E 7B 06            [ 1]  583 	ld	a, (0x06, sp)
      0082A0 88               [ 1]  584 	push	a
      0082A1 CD 81 E5         [ 4]  585 	call	_i2c_send_address
      0082A4 5B 02            [ 2]  586 	addw	sp, #2
                                    587 ;	sensors.c: 140: reg = I2C_SR1;
      0082A6 AE 52 17         [ 2]  588 	ldw	x, #0x5217
      0082A9 F6               [ 1]  589 	ld	a, (x)
      0082AA 6B 01            [ 1]  590 	ld	(0x01, sp), a
                                    591 ;	sensors.c: 141: reg = I2C_SR3;
      0082AC AE 52 19         [ 2]  592 	ldw	x, #0x5219
      0082AF F6               [ 1]  593 	ld	a, (x)
      0082B0 6B 01            [ 1]  594 	ld	(0x01, sp), a
                                    595 ;	sensors.c: 142: i2c_set_nak ();
      0082B2 CD 81 4E         [ 4]  596 	call	_i2c_set_nak
                                    597 ;	sensors.c: 143: i2c_set_stop ();
      0082B5 CD 81 56         [ 4]  598 	call	_i2c_set_stop
                                    599 ;	sensors.c: 144: i2c_read (&x);
      0082B8 96               [ 1]  600 	ldw	x, sp
      0082B9 5C               [ 2]  601 	incw	x
      0082BA 5C               [ 2]  602 	incw	x
      0082BB 89               [ 2]  603 	pushw	x
      0082BC CD 81 3D         [ 4]  604 	call	_i2c_read
      0082BF 5B 02            [ 2]  605 	addw	sp, #2
                                    606 ;	sensors.c: 145: return (x);
      0082C1 7B 02            [ 1]  607 	ld	a, (0x02, sp)
      0082C3 5B 02            [ 2]  608 	addw	sp, #2
      0082C5 81               [ 4]  609 	ret
                                    610 ;	sensors.c: 148: void InitializeI2C (void) {
                                    611 ;	-----------------------------------------
                                    612 ;	 function InitializeI2C
                                    613 ;	-----------------------------------------
      0082C6                        614 _InitializeI2C:
                                    615 ;	sensors.c: 149: I2C_CR1 = 0;   //  Disable I2C before configuration starts. PE bit is bit 0
      0082C6 AE 52 10         [ 2]  616 	ldw	x, #0x5210
      0082C9 7F               [ 1]  617 	clr	(x)
                                    618 ;	sensors.c: 153: I2C_FREQR = 16;                     //  Set the internal clock frequency (MHz).
      0082CA AE 52 12         [ 2]  619 	ldw	x, #0x5212
      0082CD A6 10            [ 1]  620 	ld	a, #0x10
      0082CF F7               [ 1]  621 	ld	(x), a
                                    622 ;	sensors.c: 154: UNSET (I2C_CCRH, I2C_FS);           //  I2C running is standard mode.
      0082D0 72 17 52 1C      [ 1]  623 	bres	0x521c, #7
                                    624 ;	sensors.c: 156: I2C_CCRL = 0xa0;                    //  SCL clock speed is 50 kHz.
      0082D4 AE 52 1B         [ 2]  625 	ldw	x, #0x521b
      0082D7 A6 A0            [ 1]  626 	ld	a, #0xa0
      0082D9 F7               [ 1]  627 	ld	(x), a
                                    628 ;	sensors.c: 158: I2C_CCRH &= 0x00;	// Clears lower 4 bits "CCR"
      0082DA AE 52 1C         [ 2]  629 	ldw	x, #0x521c
      0082DD 7F               [ 1]  630 	clr	(x)
                                    631 ;	sensors.c: 162: UNSET (I2C_OARH, I2C_ADDMODE);      //  7 bit address mode.
      0082DE 72 17 52 14      [ 1]  632 	bres	0x5214, #7
                                    633 ;	sensors.c: 163: SET (I2C_OARH, I2C_ADDCONF);        //  Docs say this must always be 1.
      0082E2 AE 52 14         [ 2]  634 	ldw	x, #0x5214
      0082E5 F6               [ 1]  635 	ld	a, (x)
      0082E6 AA 40            [ 1]  636 	or	a, #0x40
      0082E8 F7               [ 1]  637 	ld	(x), a
                                    638 ;	sensors.c: 167: I2C_TRISER = 17;
      0082E9 AE 52 1D         [ 2]  639 	ldw	x, #0x521d
      0082EC A6 11            [ 1]  640 	ld	a, #0x11
      0082EE F7               [ 1]  641 	ld	(x), a
                                    642 ;	sensors.c: 175: I2C_CR1 = I2C_PE;	// Enables port
      0082EF AE 52 10         [ 2]  643 	ldw	x, #0x5210
      0082F2 A6 01            [ 1]  644 	ld	a, #0x01
      0082F4 F7               [ 1]  645 	ld	(x), a
      0082F5 81               [ 4]  646 	ret
                                    647 ;	sensors.c: 181: void InitializeUART() {
                                    648 ;	-----------------------------------------
                                    649 ;	 function InitializeUART
                                    650 ;	-----------------------------------------
      0082F6                        651 _InitializeUART:
                                    652 ;	sensors.c: 191: UART1_CR1 = 0;
      0082F6 AE 52 34         [ 2]  653 	ldw	x, #0x5234
      0082F9 7F               [ 1]  654 	clr	(x)
                                    655 ;	sensors.c: 192: UART1_CR2 = 0;
      0082FA AE 52 35         [ 2]  656 	ldw	x, #0x5235
      0082FD 7F               [ 1]  657 	clr	(x)
                                    658 ;	sensors.c: 193: UART1_CR4 = 0;
      0082FE AE 52 37         [ 2]  659 	ldw	x, #0x5237
      008301 7F               [ 1]  660 	clr	(x)
                                    661 ;	sensors.c: 194: UART1_CR3 = 0;
      008302 AE 52 36         [ 2]  662 	ldw	x, #0x5236
      008305 7F               [ 1]  663 	clr	(x)
                                    664 ;	sensors.c: 195: UART1_CR5 = 0;
      008306 AE 52 38         [ 2]  665 	ldw	x, #0x5238
      008309 7F               [ 1]  666 	clr	(x)
                                    667 ;	sensors.c: 196: UART1_GTR = 0;
      00830A AE 52 39         [ 2]  668 	ldw	x, #0x5239
      00830D 7F               [ 1]  669 	clr	(x)
                                    670 ;	sensors.c: 197: UART1_PSCR = 0;
      00830E AE 52 3A         [ 2]  671 	ldw	x, #0x523a
      008311 7F               [ 1]  672 	clr	(x)
                                    673 ;	sensors.c: 201: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
      008312 AE 52 34         [ 2]  674 	ldw	x, #0x5234
      008315 F6               [ 1]  675 	ld	a, (x)
      008316 A4 EF            [ 1]  676 	and	a, #0xef
      008318 F7               [ 1]  677 	ld	(x), a
                                    678 ;	sensors.c: 202: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
      008319 AE 52 34         [ 2]  679 	ldw	x, #0x5234
      00831C F6               [ 1]  680 	ld	a, (x)
      00831D A4 FB            [ 1]  681 	and	a, #0xfb
      00831F F7               [ 1]  682 	ld	(x), a
                                    683 ;	sensors.c: 203: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
      008320 AE 52 36         [ 2]  684 	ldw	x, #0x5236
      008323 F6               [ 1]  685 	ld	a, (x)
      008324 A4 DF            [ 1]  686 	and	a, #0xdf
      008326 F7               [ 1]  687 	ld	(x), a
                                    688 ;	sensors.c: 204: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
      008327 AE 52 36         [ 2]  689 	ldw	x, #0x5236
      00832A F6               [ 1]  690 	ld	a, (x)
      00832B A4 EF            [ 1]  691 	and	a, #0xef
      00832D F7               [ 1]  692 	ld	(x), a
                                    693 ;	sensors.c: 205: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
      00832E AE 52 33         [ 2]  694 	ldw	x, #0x5233
      008331 A6 0A            [ 1]  695 	ld	a, #0x0a
      008333 F7               [ 1]  696 	ld	(x), a
                                    697 ;	sensors.c: 206: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
      008334 AE 52 32         [ 2]  698 	ldw	x, #0x5232
      008337 A6 08            [ 1]  699 	ld	a, #0x08
      008339 F7               [ 1]  700 	ld	(x), a
                                    701 ;	sensors.c: 210: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
      00833A AE 52 35         [ 2]  702 	ldw	x, #0x5235
      00833D F6               [ 1]  703 	ld	a, (x)
      00833E A4 F7            [ 1]  704 	and	a, #0xf7
      008340 F7               [ 1]  705 	ld	(x), a
                                    706 ;	sensors.c: 211: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
      008341 AE 52 35         [ 2]  707 	ldw	x, #0x5235
      008344 F6               [ 1]  708 	ld	a, (x)
      008345 A4 FB            [ 1]  709 	and	a, #0xfb
      008347 F7               [ 1]  710 	ld	(x), a
                                    711 ;	sensors.c: 215: SET (UART1_CR3, CR3_CPOL);
      008348 AE 52 36         [ 2]  712 	ldw	x, #0x5236
      00834B F6               [ 1]  713 	ld	a, (x)
      00834C AA 04            [ 1]  714 	or	a, #0x04
      00834E F7               [ 1]  715 	ld	(x), a
                                    716 ;	sensors.c: 216: SET (UART1_CR3, CR3_CPHA);
      00834F AE 52 36         [ 2]  717 	ldw	x, #0x5236
      008352 F6               [ 1]  718 	ld	a, (x)
      008353 AA 02            [ 1]  719 	or	a, #0x02
      008355 F7               [ 1]  720 	ld	(x), a
                                    721 ;	sensors.c: 217: SET (UART1_CR3, CR3_LBCL);
      008356 72 10 52 36      [ 1]  722 	bset	0x5236, #0
                                    723 ;	sensors.c: 221: SET (UART1_CR2, CR2_TEN);
      00835A AE 52 35         [ 2]  724 	ldw	x, #0x5235
      00835D F6               [ 1]  725 	ld	a, (x)
      00835E AA 08            [ 1]  726 	or	a, #0x08
      008360 F7               [ 1]  727 	ld	(x), a
                                    728 ;	sensors.c: 222: SET (UART1_CR2, CR2_REN);
      008361 AE 52 35         [ 2]  729 	ldw	x, #0x5235
      008364 F6               [ 1]  730 	ld	a, (x)
      008365 AA 04            [ 1]  731 	or	a, #0x04
      008367 F7               [ 1]  732 	ld	(x), a
                                    733 ;	sensors.c: 223: UART1_CR3 = CR3_CLKEN;
      008368 AE 52 36         [ 2]  734 	ldw	x, #0x5236
      00836B A6 08            [ 1]  735 	ld	a, #0x08
      00836D F7               [ 1]  736 	ld	(x), a
      00836E 81               [ 4]  737 	ret
                                    738 ;	sensors.c: 251: void tm1637Init(void)
                                    739 ;	-----------------------------------------
                                    740 ;	 function tm1637Init
                                    741 ;	-----------------------------------------
      00836F                        742 _tm1637Init:
                                    743 ;	sensors.c: 253: tm1637SetBrightness(8);
      00836F 4B 08            [ 1]  744 	push	#0x08
      008371 CD 84 14         [ 4]  745 	call	_tm1637SetBrightness
      008374 84               [ 1]  746 	pop	a
      008375 81               [ 4]  747 	ret
                                    748 ;	sensors.c: 258: void tm1637DisplayDecimal(long TT,unsigned int displaySeparator)
                                    749 ;	-----------------------------------------
                                    750 ;	 function tm1637DisplayDecimal
                                    751 ;	-----------------------------------------
      008376                        752 _tm1637DisplayDecimal:
      008376 52 13            [ 2]  753 	sub	sp, #19
                                    754 ;	sensors.c: 260: unsigned int v = TT & 0x0000FFFF;
      008378 7B 19            [ 1]  755 	ld	a, (0x19, sp)
      00837A 97               [ 1]  756 	ld	xl, a
      00837B 7B 18            [ 1]  757 	ld	a, (0x18, sp)
      00837D 95               [ 1]  758 	ld	xh, a
      00837E 0F 0D            [ 1]  759 	clr	(0x0d, sp)
      008380 4F               [ 1]  760 	clr	a
      008381 1F 05            [ 2]  761 	ldw	(0x05, sp), x
                                    762 ;	sensors.c: 266: for (ii = 0; ii < 4; ++ii) {
      008383 96               [ 1]  763 	ldw	x, sp
      008384 5C               [ 2]  764 	incw	x
      008385 1F 12            [ 2]  765 	ldw	(0x12, sp), x
      008387 AE 85 91         [ 2]  766 	ldw	x, #_segmentMap+0
      00838A 1F 09            [ 2]  767 	ldw	(0x09, sp), x
      00838C 90 5F            [ 1]  768 	clrw	y
      00838E                        769 00106$:
                                    770 ;	sensors.c: 267: digitArr[ii] = segmentMap[v % 10];
      00838E 93               [ 1]  771 	ldw	x, y
      00838F 72 FB 12         [ 2]  772 	addw	x, (0x12, sp)
      008392 1F 10            [ 2]  773 	ldw	(0x10, sp), x
      008394 90 89            [ 2]  774 	pushw	y
      008396 1E 07            [ 2]  775 	ldw	x, (0x07, sp)
      008398 90 AE 00 0A      [ 2]  776 	ldw	y, #0x000a
      00839C 65               [ 2]  777 	divw	x, y
      00839D 93               [ 1]  778 	ldw	x, y
      00839E 90 85            [ 2]  779 	popw	y
      0083A0 72 FB 09         [ 2]  780 	addw	x, (0x09, sp)
      0083A3 F6               [ 1]  781 	ld	a, (x)
      0083A4 1E 10            [ 2]  782 	ldw	x, (0x10, sp)
      0083A6 F7               [ 1]  783 	ld	(x), a
                                    784 ;	sensors.c: 268: if (ii == 2 && displaySeparator) {
      0083A7 90 A3 00 02      [ 2]  785 	cpw	y, #0x0002
      0083AB 26 0C            [ 1]  786 	jrne	00102$
      0083AD 1E 1A            [ 2]  787 	ldw	x, (0x1a, sp)
      0083AF 27 08            [ 1]  788 	jreq	00102$
                                    789 ;	sensors.c: 269: digitArr[ii] |= 1 << 7;
      0083B1 1E 10            [ 2]  790 	ldw	x, (0x10, sp)
      0083B3 F6               [ 1]  791 	ld	a, (x)
      0083B4 AA 80            [ 1]  792 	or	a, #0x80
      0083B6 1E 10            [ 2]  793 	ldw	x, (0x10, sp)
      0083B8 F7               [ 1]  794 	ld	(x), a
      0083B9                        795 00102$:
                                    796 ;	sensors.c: 271: v /= 10;
      0083B9 90 89            [ 2]  797 	pushw	y
      0083BB 1E 07            [ 2]  798 	ldw	x, (0x07, sp)
      0083BD 90 AE 00 0A      [ 2]  799 	ldw	y, #0x000a
      0083C1 65               [ 2]  800 	divw	x, y
      0083C2 90 85            [ 2]  801 	popw	y
      0083C4 1F 05            [ 2]  802 	ldw	(0x05, sp), x
                                    803 ;	sensors.c: 266: for (ii = 0; ii < 4; ++ii) {
      0083C6 90 5C            [ 2]  804 	incw	y
      0083C8 90 A3 00 04      [ 2]  805 	cpw	y, #0x0004
      0083CC 25 C0            [ 1]  806 	jrc	00106$
                                    807 ;	sensors.c: 274: _tm1637Start();
      0083CE CD 84 26         [ 4]  808 	call	__tm1637Start
                                    809 ;	sensors.c: 275: _tm1637WriteByte(0x40);
      0083D1 4B 40            [ 1]  810 	push	#0x40
      0083D3 CD 84 7A         [ 4]  811 	call	__tm1637WriteByte
      0083D6 84               [ 1]  812 	pop	a
                                    813 ;	sensors.c: 276: _tm1637ReadResult();
      0083D7 CD 84 5F         [ 4]  814 	call	__tm1637ReadResult
                                    815 ;	sensors.c: 277: _tm1637Stop();
      0083DA CD 84 38         [ 4]  816 	call	__tm1637Stop
                                    817 ;	sensors.c: 279: _tm1637Start();
      0083DD CD 84 26         [ 4]  818 	call	__tm1637Start
                                    819 ;	sensors.c: 280: _tm1637WriteByte(0xc0);
      0083E0 4B C0            [ 1]  820 	push	#0xc0
      0083E2 CD 84 7A         [ 4]  821 	call	__tm1637WriteByte
      0083E5 84               [ 1]  822 	pop	a
                                    823 ;	sensors.c: 281: _tm1637ReadResult();
      0083E6 CD 84 5F         [ 4]  824 	call	__tm1637ReadResult
                                    825 ;	sensors.c: 283: for (ii = 0; ii < 4; ++ii) {
      0083E9 5F               [ 1]  826 	clrw	x
      0083EA 1F 07            [ 2]  827 	ldw	(0x07, sp), x
      0083EC                        828 00108$:
                                    829 ;	sensors.c: 284: _tm1637WriteByte(digitArr[3 - ii]);
      0083EC 7B 08            [ 1]  830 	ld	a, (0x08, sp)
      0083EE 6B 0B            [ 1]  831 	ld	(0x0b, sp), a
      0083F0 A6 03            [ 1]  832 	ld	a, #0x03
      0083F2 10 0B            [ 1]  833 	sub	a, (0x0b, sp)
      0083F4 5F               [ 1]  834 	clrw	x
      0083F5 97               [ 1]  835 	ld	xl, a
      0083F6 72 FB 12         [ 2]  836 	addw	x, (0x12, sp)
      0083F9 F6               [ 1]  837 	ld	a, (x)
      0083FA 88               [ 1]  838 	push	a
      0083FB CD 84 7A         [ 4]  839 	call	__tm1637WriteByte
      0083FE 84               [ 1]  840 	pop	a
                                    841 ;	sensors.c: 285: _tm1637ReadResult();
      0083FF CD 84 5F         [ 4]  842 	call	__tm1637ReadResult
                                    843 ;	sensors.c: 283: for (ii = 0; ii < 4; ++ii) {
      008402 1E 07            [ 2]  844 	ldw	x, (0x07, sp)
      008404 5C               [ 2]  845 	incw	x
      008405 1F 07            [ 2]  846 	ldw	(0x07, sp), x
      008407 1E 07            [ 2]  847 	ldw	x, (0x07, sp)
      008409 A3 00 04         [ 2]  848 	cpw	x, #0x0004
      00840C 25 DE            [ 1]  849 	jrc	00108$
                                    850 ;	sensors.c: 288: _tm1637Stop();
      00840E CD 84 38         [ 4]  851 	call	__tm1637Stop
      008411 5B 13            [ 2]  852 	addw	sp, #19
      008413 81               [ 4]  853 	ret
                                    854 ;	sensors.c: 293: void tm1637SetBrightness(char brightness)
                                    855 ;	-----------------------------------------
                                    856 ;	 function tm1637SetBrightness
                                    857 ;	-----------------------------------------
      008414                        858 _tm1637SetBrightness:
                                    859 ;	sensors.c: 300: _tm1637Start();
      008414 CD 84 26         [ 4]  860 	call	__tm1637Start
                                    861 ;	sensors.c: 301: _tm1637WriteByte(0x87 + brightness);
      008417 7B 03            [ 1]  862 	ld	a, (0x03, sp)
      008419 AB 87            [ 1]  863 	add	a, #0x87
      00841B 88               [ 1]  864 	push	a
      00841C CD 84 7A         [ 4]  865 	call	__tm1637WriteByte
      00841F 84               [ 1]  866 	pop	a
                                    867 ;	sensors.c: 302: _tm1637ReadResult();
      008420 CD 84 5F         [ 4]  868 	call	__tm1637ReadResult
                                    869 ;	sensors.c: 303: _tm1637Stop();
      008423 CC 84 38         [ 2]  870 	jp	__tm1637Stop
                                    871 ;	sensors.c: 306: void _tm1637Start(void)
                                    872 ;	-----------------------------------------
                                    873 ;	 function _tm1637Start
                                    874 ;	-----------------------------------------
      008426                        875 __tm1637Start:
                                    876 ;	sensors.c: 308: _tm1637ClkHigh();
      008426 CD 84 B8         [ 4]  877 	call	__tm1637ClkHigh
                                    878 ;	sensors.c: 309: _tm1637DioHigh();
      008429 CD 84 C8         [ 4]  879 	call	__tm1637DioHigh
                                    880 ;	sensors.c: 310: delay(5);
      00842C 4B 05            [ 1]  881 	push	#0x05
      00842E 4B 00            [ 1]  882 	push	#0x00
      008430 CD 80 F2         [ 4]  883 	call	_delay
      008433 5B 02            [ 2]  884 	addw	sp, #2
                                    885 ;	sensors.c: 311: _tm1637DioLow();
      008435 CC 84 D0         [ 2]  886 	jp	__tm1637DioLow
                                    887 ;	sensors.c: 314: void _tm1637Stop(void)
                                    888 ;	-----------------------------------------
                                    889 ;	 function _tm1637Stop
                                    890 ;	-----------------------------------------
      008438                        891 __tm1637Stop:
                                    892 ;	sensors.c: 316: _tm1637ClkLow();
      008438 CD 84 C0         [ 4]  893 	call	__tm1637ClkLow
                                    894 ;	sensors.c: 317: delay(5);
      00843B 4B 05            [ 1]  895 	push	#0x05
      00843D 4B 00            [ 1]  896 	push	#0x00
      00843F CD 80 F2         [ 4]  897 	call	_delay
      008442 5B 02            [ 2]  898 	addw	sp, #2
                                    899 ;	sensors.c: 318: _tm1637DioLow();
      008444 CD 84 D0         [ 4]  900 	call	__tm1637DioLow
                                    901 ;	sensors.c: 319: delay(5);
      008447 4B 05            [ 1]  902 	push	#0x05
      008449 4B 00            [ 1]  903 	push	#0x00
      00844B CD 80 F2         [ 4]  904 	call	_delay
      00844E 5B 02            [ 2]  905 	addw	sp, #2
                                    906 ;	sensors.c: 320: _tm1637ClkHigh();
      008450 CD 84 B8         [ 4]  907 	call	__tm1637ClkHigh
                                    908 ;	sensors.c: 321: delay(5);
      008453 4B 05            [ 1]  909 	push	#0x05
      008455 4B 00            [ 1]  910 	push	#0x00
      008457 CD 80 F2         [ 4]  911 	call	_delay
      00845A 5B 02            [ 2]  912 	addw	sp, #2
                                    913 ;	sensors.c: 322: _tm1637DioHigh();
      00845C CC 84 C8         [ 2]  914 	jp	__tm1637DioHigh
                                    915 ;	sensors.c: 325: void _tm1637ReadResult(void)
                                    916 ;	-----------------------------------------
                                    917 ;	 function _tm1637ReadResult
                                    918 ;	-----------------------------------------
      00845F                        919 __tm1637ReadResult:
                                    920 ;	sensors.c: 327: _tm1637ClkLow();
      00845F CD 84 C0         [ 4]  921 	call	__tm1637ClkLow
                                    922 ;	sensors.c: 328: delay(5);
      008462 4B 05            [ 1]  923 	push	#0x05
      008464 4B 00            [ 1]  924 	push	#0x00
      008466 CD 80 F2         [ 4]  925 	call	_delay
      008469 5B 02            [ 2]  926 	addw	sp, #2
                                    927 ;	sensors.c: 330: _tm1637ClkHigh();
      00846B CD 84 B8         [ 4]  928 	call	__tm1637ClkHigh
                                    929 ;	sensors.c: 331: delay(5);
      00846E 4B 05            [ 1]  930 	push	#0x05
      008470 4B 00            [ 1]  931 	push	#0x00
      008472 CD 80 F2         [ 4]  932 	call	_delay
      008475 5B 02            [ 2]  933 	addw	sp, #2
                                    934 ;	sensors.c: 332: _tm1637ClkLow();
      008477 CC 84 C0         [ 2]  935 	jp	__tm1637ClkLow
                                    936 ;	sensors.c: 335: void _tm1637WriteByte(unsigned char b)
                                    937 ;	-----------------------------------------
                                    938 ;	 function _tm1637WriteByte
                                    939 ;	-----------------------------------------
      00847A                        940 __tm1637WriteByte:
      00847A 52 02            [ 2]  941 	sub	sp, #2
                                    942 ;	sensors.c: 337: for (ii = 0; ii < 8; ++ii) {
      00847C 5F               [ 1]  943 	clrw	x
      00847D 1F 01            [ 2]  944 	ldw	(0x01, sp), x
      00847F                        945 00105$:
                                    946 ;	sensors.c: 338: _tm1637ClkLow();
      00847F CD 84 C0         [ 4]  947 	call	__tm1637ClkLow
                                    948 ;	sensors.c: 339: if (b & 0x01) {
      008482 7B 05            [ 1]  949 	ld	a, (0x05, sp)
      008484 44               [ 1]  950 	srl	a
      008485 24 05            [ 1]  951 	jrnc	00102$
                                    952 ;	sensors.c: 340: _tm1637DioHigh();
      008487 CD 84 C8         [ 4]  953 	call	__tm1637DioHigh
      00848A 20 03            [ 2]  954 	jra	00103$
      00848C                        955 00102$:
                                    956 ;	sensors.c: 343: _tm1637DioLow();
      00848C CD 84 D0         [ 4]  957 	call	__tm1637DioLow
      00848F                        958 00103$:
                                    959 ;	sensors.c: 345: delay(15);
      00848F 4B 0F            [ 1]  960 	push	#0x0f
      008491 4B 00            [ 1]  961 	push	#0x00
      008493 CD 80 F2         [ 4]  962 	call	_delay
      008496 5B 02            [ 2]  963 	addw	sp, #2
                                    964 ;	sensors.c: 346: b >>= 1;
      008498 7B 05            [ 1]  965 	ld	a, (0x05, sp)
      00849A 44               [ 1]  966 	srl	a
      00849B 6B 05            [ 1]  967 	ld	(0x05, sp), a
                                    968 ;	sensors.c: 347: _tm1637ClkHigh();
      00849D CD 84 B8         [ 4]  969 	call	__tm1637ClkHigh
                                    970 ;	sensors.c: 348: delay(15);
      0084A0 4B 0F            [ 1]  971 	push	#0x0f
      0084A2 4B 00            [ 1]  972 	push	#0x00
      0084A4 CD 80 F2         [ 4]  973 	call	_delay
      0084A7 5B 02            [ 2]  974 	addw	sp, #2
                                    975 ;	sensors.c: 337: for (ii = 0; ii < 8; ++ii) {
      0084A9 1E 01            [ 2]  976 	ldw	x, (0x01, sp)
      0084AB 5C               [ 2]  977 	incw	x
      0084AC 1F 01            [ 2]  978 	ldw	(0x01, sp), x
      0084AE 1E 01            [ 2]  979 	ldw	x, (0x01, sp)
      0084B0 A3 00 08         [ 2]  980 	cpw	x, #0x0008
      0084B3 2F CA            [ 1]  981 	jrslt	00105$
      0084B5 5B 02            [ 2]  982 	addw	sp, #2
      0084B7 81               [ 4]  983 	ret
                                    984 ;	sensors.c: 354: void _tm1637ClkHigh(void)
                                    985 ;	-----------------------------------------
                                    986 ;	 function _tm1637ClkHigh
                                    987 ;	-----------------------------------------
      0084B8                        988 __tm1637ClkHigh:
                                    989 ;	sensors.c: 359: PD_ODR |= 1 << 2;
      0084B8 AE 50 0F         [ 2]  990 	ldw	x, #0x500f
      0084BB F6               [ 1]  991 	ld	a, (x)
      0084BC AA 04            [ 1]  992 	or	a, #0x04
      0084BE F7               [ 1]  993 	ld	(x), a
      0084BF 81               [ 4]  994 	ret
                                    995 ;	sensors.c: 362: void _tm1637ClkLow(void)
                                    996 ;	-----------------------------------------
                                    997 ;	 function _tm1637ClkLow
                                    998 ;	-----------------------------------------
      0084C0                        999 __tm1637ClkLow:
                                   1000 ;	sensors.c: 366: PD_ODR &= ~(1 << 2);
      0084C0 AE 50 0F         [ 2] 1001 	ldw	x, #0x500f
      0084C3 F6               [ 1] 1002 	ld	a, (x)
      0084C4 A4 FB            [ 1] 1003 	and	a, #0xfb
      0084C6 F7               [ 1] 1004 	ld	(x), a
      0084C7 81               [ 4] 1005 	ret
                                   1006 ;	sensors.c: 372: void _tm1637DioHigh(void)
                                   1007 ;	-----------------------------------------
                                   1008 ;	 function _tm1637DioHigh
                                   1009 ;	-----------------------------------------
      0084C8                       1010 __tm1637DioHigh:
                                   1011 ;	sensors.c: 376: PD_ODR |= 1 << 3;
      0084C8 AE 50 0F         [ 2] 1012 	ldw	x, #0x500f
      0084CB F6               [ 1] 1013 	ld	a, (x)
      0084CC AA 08            [ 1] 1014 	or	a, #0x08
      0084CE F7               [ 1] 1015 	ld	(x), a
      0084CF 81               [ 4] 1016 	ret
                                   1017 ;	sensors.c: 380: void _tm1637DioLow(void)
                                   1018 ;	-----------------------------------------
                                   1019 ;	 function _tm1637DioLow
                                   1020 ;	-----------------------------------------
      0084D0                       1021 __tm1637DioLow:
                                   1022 ;	sensors.c: 382: PD_ODR &= ~(1 << 3);
      0084D0 AE 50 0F         [ 2] 1023 	ldw	x, #0x500f
      0084D3 F6               [ 1] 1024 	ld	a, (x)
      0084D4 A4 F7            [ 1] 1025 	and	a, #0xf7
      0084D6 F7               [ 1] 1026 	ld	(x), a
      0084D7 81               [ 4] 1027 	ret
                                   1028 ;	sensors.c: 391: unsigned int clock(void)
                                   1029 ;	-----------------------------------------
                                   1030 ;	 function clock
                                   1031 ;	-----------------------------------------
      0084D8                       1032 _clock:
      0084D8 52 03            [ 2] 1033 	sub	sp, #3
                                   1034 ;	sensors.c: 393: unsigned char h = TIM1_CNTRH; //origineel PCNTRH
      0084DA AE 52 5E         [ 2] 1035 	ldw	x, #0x525e
      0084DD F6               [ 1] 1036 	ld	a, (x)
                                   1037 ;	sensors.c: 394: unsigned char l = TIM1_CNTRL;
      0084DE AE 52 5F         [ 2] 1038 	ldw	x, #0x525f
      0084E1 88               [ 1] 1039 	push	a
      0084E2 F6               [ 1] 1040 	ld	a, (x)
      0084E3 6B 02            [ 1] 1041 	ld	(0x02, sp), a
      0084E5 84               [ 1] 1042 	pop	a
                                   1043 ;	sensors.c: 395: return((unsigned int)(h) << 8 | l);
      0084E6 5F               [ 1] 1044 	clrw	x
      0084E7 97               [ 1] 1045 	ld	xl, a
      0084E8 58               [ 2] 1046 	sllw	x
      0084E9 58               [ 2] 1047 	sllw	x
      0084EA 58               [ 2] 1048 	sllw	x
      0084EB 58               [ 2] 1049 	sllw	x
      0084EC 58               [ 2] 1050 	sllw	x
      0084ED 58               [ 2] 1051 	sllw	x
      0084EE 58               [ 2] 1052 	sllw	x
      0084EF 58               [ 2] 1053 	sllw	x
      0084F0 7B 01            [ 1] 1054 	ld	a, (0x01, sp)
      0084F2 6B 03            [ 1] 1055 	ld	(0x03, sp), a
      0084F4 0F 02            [ 1] 1056 	clr	(0x02, sp)
      0084F6 9F               [ 1] 1057 	ld	a, xl
      0084F7 1A 03            [ 1] 1058 	or	a, (0x03, sp)
      0084F9 97               [ 1] 1059 	ld	xl, a
      0084FA 9E               [ 1] 1060 	ld	a, xh
      0084FB 1A 02            [ 1] 1061 	or	a, (0x02, sp)
      0084FD 95               [ 1] 1062 	ld	xh, a
      0084FE 5B 03            [ 2] 1063 	addw	sp, #3
      008500 81               [ 4] 1064 	ret
                                   1065 ;	sensors.c: 444: void timer_isr(void) __interrupt(BEEP_ISR) {
                                   1066 ;	-----------------------------------------
                                   1067 ;	 function timer_isr
                                   1068 ;	-----------------------------------------
      008501                       1069 _timer_isr:
                                   1070 ;	sensors.c: 445: if (++internteller > 500) {
      008501 CE 00 01         [ 2] 1071 	ldw	x, _internteller+0
      008504 5C               [ 2] 1072 	incw	x
      008505 CF 00 01         [ 2] 1073 	ldw	_internteller+0, x
      008508 A3 01 F4         [ 2] 1074 	cpw	x, #0x01f4
      00850B 23 0F            [ 2] 1075 	jrule	00102$
                                   1076 ;	sensors.c: 446: internteller=0;
      00850D 72 5F 00 02      [ 1] 1077 	clr	_internteller+1
      008511 72 5F 00 01      [ 1] 1078 	clr	_internteller+0
                                   1079 ;	sensors.c: 447: ++seconden;
      008515 CE 00 03         [ 2] 1080 	ldw	x, _seconden+0
      008518 5C               [ 2] 1081 	incw	x
      008519 CF 00 03         [ 2] 1082 	ldw	_seconden+0, x
      00851C                       1083 00102$:
                                   1084 ;	sensors.c: 451: if (seconden > 59){
      00851C CE 00 03         [ 2] 1085 	ldw	x, _seconden+0
      00851F A3 00 3B         [ 2] 1086 	cpw	x, #0x003b
      008522 23 0F            [ 2] 1087 	jrule	00105$
                                   1088 ;	sensors.c: 452: seconden=0;
      008524 72 5F 00 04      [ 1] 1089 	clr	_seconden+1
      008528 72 5F 00 03      [ 1] 1090 	clr	_seconden+0
                                   1091 ;	sensors.c: 453: ++minuten;
      00852C CE 00 05         [ 2] 1092 	ldw	x, _minuten+0
      00852F 5C               [ 2] 1093 	incw	x
      008530 CF 00 05         [ 2] 1094 	ldw	_minuten+0, x
      008533                       1095 00105$:
      008533 80               [11] 1096 	iret
                                   1097 ;	sensors.c: 462: int main () {
                                   1098 ;	-----------------------------------------
                                   1099 ;	 function main
                                   1100 ;	-----------------------------------------
      008534                       1101 _main:
                                   1102 ;	sensors.c: 469: InitializeSystemClock();
      008534 CD 80 A8         [ 4] 1103 	call	_InitializeSystemClock
                                   1104 ;	sensors.c: 471: BEEP_CSR = (0<<7) | (0<<6) | (1<<5) | 0x1E;
      008537 AE 50 F3         [ 2] 1105 	ldw	x, #0x50f3
      00853A A6 3E            [ 1] 1106 	ld	a, #0x3e
      00853C F7               [ 1] 1107 	ld	(x), a
                                   1108 ;	sensors.c: 472: PD_DDR = (1 << 3) | (1 << 2); // output mode
      00853D AE 50 11         [ 2] 1109 	ldw	x, #0x5011
      008540 A6 0C            [ 1] 1110 	ld	a, #0x0c
      008542 F7               [ 1] 1111 	ld	(x), a
                                   1112 ;	sensors.c: 474: PD_DDR &=  ~(1 << 4); //PD4 input
      008543 AE 50 11         [ 2] 1113 	ldw	x, #0x5011
      008546 F6               [ 1] 1114 	ld	a, (x)
      008547 A4 EF            [ 1] 1115 	and	a, #0xef
      008549 F7               [ 1] 1116 	ld	(x), a
                                   1117 ;	sensors.c: 475: PD_CR1 = (1 << 3) | (1 << 2); // push-pull
      00854A AE 50 12         [ 2] 1118 	ldw	x, #0x5012
      00854D A6 0C            [ 1] 1119 	ld	a, #0x0c
      00854F F7               [ 1] 1120 	ld	(x), a
                                   1121 ;	sensors.c: 476: PD_CR1 &= ~(1 << 4); // input with float
      008550 AE 50 12         [ 2] 1122 	ldw	x, #0x5012
      008553 F6               [ 1] 1123 	ld	a, (x)
      008554 A4 EF            [ 1] 1124 	and	a, #0xef
      008556 F7               [ 1] 1125 	ld	(x), a
                                   1126 ;	sensors.c: 478: PD_CR2 = (1 << 3) | (1 << 2) | (1<< 4); // up to 10MHz speed + interrupt enabled 
      008557 AE 50 13         [ 2] 1127 	ldw	x, #0x5013
      00855A A6 1C            [ 1] 1128 	ld	a, #0x1c
      00855C F7               [ 1] 1129 	ld	(x), a
                                   1130 ;	sensors.c: 480: EXTI_CR1 = (1<<7); //Port D external sensitivity bits7:6 10: Falling edge only
      00855D AE 50 A0         [ 2] 1131 	ldw	x, #0x50a0
      008560 A6 80            [ 1] 1132 	ld	a, #0x80
      008562 F7               [ 1] 1133 	ld	(x), a
                                   1134 ;	sensors.c: 481: EXTI_CR1 &= ~(1<<6); //Port D external sensitivity bits7:6 10: Falling edge only
      008563 AE 50 A0         [ 2] 1135 	ldw	x, #0x50a0
      008566 F6               [ 1] 1136 	ld	a, (x)
      008567 A4 BF            [ 1] 1137 	and	a, #0xbf
      008569 F7               [ 1] 1138 	ld	(x), a
                                   1139 ;	sensors.c: 497: TIM1_PSCRH = 0x3e;
      00856A AE 52 60         [ 2] 1140 	ldw	x, #0x5260
      00856D A6 3E            [ 1] 1141 	ld	a, #0x3e
      00856F F7               [ 1] 1142 	ld	(x), a
                                   1143 ;	sensors.c: 498: TIM1_PSCRL = 0x80;
      008570 AE 52 61         [ 2] 1144 	ldw	x, #0x5261
      008573 A6 80            [ 1] 1145 	ld	a, #0x80
      008575 F7               [ 1] 1146 	ld	(x), a
                                   1147 ;	sensors.c: 500: tm1637Init();
      008576 CD 83 6F         [ 4] 1148 	call	_tm1637Init
                                   1149 ;	sensors.c: 502: InitializeUART();
      008579 CD 82 F6         [ 4] 1150 	call	_InitializeUART
                                   1151 ;	sensors.c: 505: __asm__("rim");
      00857C 9A               [ 1] 1152 	rim
                                   1153 ;	sensors.c: 519: while (1) {
      00857D                       1154 00102$:
                                   1155 ;	sensors.c: 548: tm1637DisplayDecimal(seconden, 0); // tijd in seconden 
      00857D 90 CE 00 03      [ 2] 1156 	ldw	y, _seconden+0
      008581 5F               [ 1] 1157 	clrw	x
      008582 4B 00            [ 1] 1158 	push	#0x00
      008584 4B 00            [ 1] 1159 	push	#0x00
      008586 90 89            [ 2] 1160 	pushw	y
      008588 89               [ 2] 1161 	pushw	x
      008589 CD 83 76         [ 4] 1162 	call	_tm1637DisplayDecimal
      00858C 5B 06            [ 2] 1163 	addw	sp, #6
                                   1164 ;	sensors.c: 549: val=0;
      00858E 20 ED            [ 2] 1165 	jra	00102$
      008590 81               [ 4] 1166 	ret
                                   1167 	.area CODE
      008591                       1168 _segmentMap:
      008591 3F                    1169 	.db #0x3F	;  63
      008592 06                    1170 	.db #0x06	;  6
      008593 5B                    1171 	.db #0x5B	;  91
      008594 4F                    1172 	.db #0x4F	;  79	'O'
      008595 66                    1173 	.db #0x66	;  102	'f'
      008596 6D                    1174 	.db #0x6D	;  109	'm'
      008597 7D                    1175 	.db #0x7D	;  125
      008598 07                    1176 	.db #0x07	;  7
      008599 7F                    1177 	.db #0x7F	;  127
      00859A 6F                    1178 	.db #0x6F	;  111	'o'
      00859B 77                    1179 	.db #0x77	;  119	'w'
      00859C 7C                    1180 	.db #0x7C	;  124
      00859D 39                    1181 	.db #0x39	;  57	'9'
      00859E 5E                    1182 	.db #0x5E	;  94
      00859F 79                    1183 	.db #0x79	;  121	'y'
      0085A0 71                    1184 	.db #0x71	;  113	'q'
      0085A1 00                    1185 	.db #0x00	;  0
                                   1186 	.area INITIALIZER
                                   1187 	.area CABS (ABS)
