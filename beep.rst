                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.0 #8981 (Jul 11 2014) (Linux)
                                      4 ; This file was generated Fri Apr 21 15:49:19 2017
                                      5 ;--------------------------------------------------------
                                      6 	.module beep
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _segmentMap
                                     13 	.globl _main
                                     14 	.globl _timer_isr
                                     15 	.globl _rt_one_second_increment
                                     16 	.globl _tm1637DisplayDecimal
                                     17 	.globl _tm1637Init
                                     18 	.globl _InitializeUART
                                     19 	.globl _print_byte_hex
                                     20 	.globl _i2c_set_start_ack
                                     21 	.globl _i2c_send_address
                                     22 	.globl _print_UCHAR_hex
                                     23 	.globl _UARTPrintF
                                     24 	.globl _delay
                                     25 	.globl _InitializeSystemClock
                                     26 	.globl _delayTenMicro
                                     27 	.globl _internteller
                                     28 	.globl _real_time
                                     29 	.globl _tm1637SetBrightness
                                     30 	.globl __tm1637Start
                                     31 	.globl __tm1637Stop
                                     32 	.globl __tm1637ReadResult
                                     33 	.globl __tm1637WriteByte
                                     34 	.globl __tm1637ClkHigh
                                     35 	.globl __tm1637ClkLow
                                     36 	.globl __tm1637DioHigh
                                     37 	.globl __tm1637DioLow
                                     38 ;--------------------------------------------------------
                                     39 ; ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area DATA
      000001                         42 _real_time::
      000001                         43 	.ds 8
      000009                         44 _internteller::
      000009                         45 	.ds 2
                                     46 ;--------------------------------------------------------
                                     47 ; ram data
                                     48 ;--------------------------------------------------------
                                     49 	.area INITIALIZED
                                     50 ;--------------------------------------------------------
                                     51 ; Stack segment in internal ram 
                                     52 ;--------------------------------------------------------
                                     53 	.area	SSEG
      000000                         54 __start__stack:
      000000                         55 	.ds	1
                                     56 
                                     57 ;--------------------------------------------------------
                                     58 ; absolute external ram data
                                     59 ;--------------------------------------------------------
                                     60 	.area DABS (ABS)
                                     61 ;--------------------------------------------------------
                                     62 ; interrupt vector 
                                     63 ;--------------------------------------------------------
                                     64 	.area HOME
      008000                         65 __interrupt_vect:
      008000 82 00 80 83             66 	int s_GSINIT ;reset
      008004 82 00 00 00             67 	int 0x0000 ;trap
      008008 82 00 00 00             68 	int 0x0000 ;int0
      00800C 82 00 00 00             69 	int 0x0000 ;int1
      008010 82 00 00 00             70 	int 0x0000 ;int2
      008014 82 00 00 00             71 	int 0x0000 ;int3
      008018 82 00 00 00             72 	int 0x0000 ;int4
      00801C 82 00 00 00             73 	int 0x0000 ;int5
      008020 82 00 84 70             74 	int _timer_isr ;int6
      008024 82 00 00 00             75 	int 0x0000 ;int7
      008028 82 00 00 00             76 	int 0x0000 ;int8
      00802C 82 00 00 00             77 	int 0x0000 ;int9
      008030 82 00 00 00             78 	int 0x0000 ;int10
      008034 82 00 00 00             79 	int 0x0000 ;int11
      008038 82 00 00 00             80 	int 0x0000 ;int12
      00803C 82 00 00 00             81 	int 0x0000 ;int13
      008040 82 00 00 00             82 	int 0x0000 ;int14
      008044 82 00 00 00             83 	int 0x0000 ;int15
      008048 82 00 00 00             84 	int 0x0000 ;int16
      00804C 82 00 00 00             85 	int 0x0000 ;int17
      008050 82 00 00 00             86 	int 0x0000 ;int18
      008054 82 00 00 00             87 	int 0x0000 ;int19
      008058 82 00 00 00             88 	int 0x0000 ;int20
      00805C 82 00 00 00             89 	int 0x0000 ;int21
      008060 82 00 00 00             90 	int 0x0000 ;int22
      008064 82 00 00 00             91 	int 0x0000 ;int23
      008068 82 00 00 00             92 	int 0x0000 ;int24
      00806C 82 00 00 00             93 	int 0x0000 ;int25
      008070 82 00 00 00             94 	int 0x0000 ;int26
      008074 82 00 00 00             95 	int 0x0000 ;int27
      008078 82 00 00 00             96 	int 0x0000 ;int28
      00807C 82 00 00 00             97 	int 0x0000 ;int29
                                     98 ;--------------------------------------------------------
                                     99 ; global & static initialisations
                                    100 ;--------------------------------------------------------
                                    101 	.area HOME
                                    102 	.area GSINIT
                                    103 	.area GSFINAL
                                    104 	.area GSINIT
      008083                        105 __sdcc_gs_init_startup:
      008083                        106 __sdcc_init_data:
                                    107 ; stm8_genXINIT() start
      008083 AE 00 0A         [ 2]  108 	ldw x, #l_DATA
      008086 27 07            [ 1]  109 	jreq	00002$
      008088                        110 00001$:
      008088 72 4F 00 00      [ 1]  111 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  112 	decw x
      00808D 26 F9            [ 1]  113 	jrne	00001$
      00808F                        114 00002$:
      00808F AE 00 00         [ 2]  115 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  116 	jreq	00004$
      008094                        117 00003$:
      008094 D6 86 31         [ 1]  118 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 0A         [ 1]  119 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  120 	decw	x
      00809B 26 F7            [ 1]  121 	jrne	00003$
      00809D                        122 00004$:
                                    123 ; stm8_genXINIT() end
                                    124 	.area GSFINAL
      00809D CC 80 80         [ 2]  125 	jp	__sdcc_program_startup
                                    126 ;--------------------------------------------------------
                                    127 ; Home
                                    128 ;--------------------------------------------------------
                                    129 	.area HOME
                                    130 	.area HOME
      008080                        131 __sdcc_program_startup:
      008080 CC 84 8E         [ 2]  132 	jp	_main
                                    133 ;	return from main will return to caller
                                    134 ;--------------------------------------------------------
                                    135 ; code
                                    136 ;--------------------------------------------------------
                                    137 	.area CODE
                                    138 ;	beep.c: 27: void delayTenMicro (void) {
                                    139 ;	-----------------------------------------
                                    140 ;	 function delayTenMicro
                                    141 ;	-----------------------------------------
      0080A0                        142 _delayTenMicro:
                                    143 ;	beep.c: 29: for (a = 0; a < 50; ++a)
      0080A0 A6 32            [ 1]  144 	ld	a, #0x32
      0080A2                        145 00104$:
                                    146 ;	beep.c: 30: __asm__("nop");
      0080A2 9D               [ 1]  147 	nop
      0080A3 4A               [ 1]  148 	dec	a
                                    149 ;	beep.c: 29: for (a = 0; a < 50; ++a)
      0080A4 4D               [ 1]  150 	tnz	a
      0080A5 26 FB            [ 1]  151 	jrne	00104$
      0080A7 81               [ 4]  152 	ret
                                    153 ;	beep.c: 33: void InitializeSystemClock() {
                                    154 ;	-----------------------------------------
                                    155 ;	 function InitializeSystemClock
                                    156 ;	-----------------------------------------
      0080A8                        157 _InitializeSystemClock:
                                    158 ;	beep.c: 34: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
      0080A8 AE 50 C0         [ 2]  159 	ldw	x, #0x50c0
      0080AB 7F               [ 1]  160 	clr	(x)
                                    161 ;	beep.c: 35: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
      0080AC AE 50 C0         [ 2]  162 	ldw	x, #0x50c0
      0080AF A6 01            [ 1]  163 	ld	a, #0x01
      0080B1 F7               [ 1]  164 	ld	(x), a
                                    165 ;	beep.c: 36: CLK_ECKR = 0;                       //  Disable the external clock.
      0080B2 AE 50 C1         [ 2]  166 	ldw	x, #0x50c1
      0080B5 7F               [ 1]  167 	clr	(x)
                                    168 ;	beep.c: 37: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
      0080B6                        169 00101$:
      0080B6 AE 50 C0         [ 2]  170 	ldw	x, #0x50c0
      0080B9 F6               [ 1]  171 	ld	a, (x)
      0080BA A5 02            [ 1]  172 	bcp	a, #0x02
      0080BC 27 F8            [ 1]  173 	jreq	00101$
                                    174 ;	beep.c: 38: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
      0080BE AE 50 C6         [ 2]  175 	ldw	x, #0x50c6
      0080C1 7F               [ 1]  176 	clr	(x)
                                    177 ;	beep.c: 39: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
      0080C2 AE 50 C7         [ 2]  178 	ldw	x, #0x50c7
      0080C5 A6 FF            [ 1]  179 	ld	a, #0xff
      0080C7 F7               [ 1]  180 	ld	(x), a
                                    181 ;	beep.c: 40: CLK_PCKENR2 = 0xff;                 //  Ditto.
      0080C8 AE 50 CA         [ 2]  182 	ldw	x, #0x50ca
      0080CB A6 FF            [ 1]  183 	ld	a, #0xff
      0080CD F7               [ 1]  184 	ld	(x), a
                                    185 ;	beep.c: 41: CLK_CCOR = 0;                       //  Turn off CCO.
      0080CE AE 50 C9         [ 2]  186 	ldw	x, #0x50c9
      0080D1 7F               [ 1]  187 	clr	(x)
                                    188 ;	beep.c: 42: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
      0080D2 AE 50 CC         [ 2]  189 	ldw	x, #0x50cc
      0080D5 7F               [ 1]  190 	clr	(x)
                                    191 ;	beep.c: 43: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
      0080D6 AE 50 CD         [ 2]  192 	ldw	x, #0x50cd
      0080D9 7F               [ 1]  193 	clr	(x)
                                    194 ;	beep.c: 44: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
      0080DA AE 50 C4         [ 2]  195 	ldw	x, #0x50c4
      0080DD A6 E1            [ 1]  196 	ld	a, #0xe1
      0080DF F7               [ 1]  197 	ld	(x), a
                                    198 ;	beep.c: 45: CLK_SWCR = 0;                       //  Reset the clock switch control register.
      0080E0 AE 50 C5         [ 2]  199 	ldw	x, #0x50c5
      0080E3 7F               [ 1]  200 	clr	(x)
                                    201 ;	beep.c: 46: CLK_SWCR = CLK_SWEN;                //  Enable switching.
      0080E4 AE 50 C5         [ 2]  202 	ldw	x, #0x50c5
      0080E7 A6 02            [ 1]  203 	ld	a, #0x02
      0080E9 F7               [ 1]  204 	ld	(x), a
                                    205 ;	beep.c: 47: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
      0080EA                        206 00104$:
      0080EA AE 50 C5         [ 2]  207 	ldw	x, #0x50c5
      0080ED F6               [ 1]  208 	ld	a, (x)
      0080EE 44               [ 1]  209 	srl	a
      0080EF 25 F9            [ 1]  210 	jrc	00104$
      0080F1 81               [ 4]  211 	ret
                                    212 ;	beep.c: 49: void delay (int time_ms) {
                                    213 ;	-----------------------------------------
                                    214 ;	 function delay
                                    215 ;	-----------------------------------------
      0080F2                        216 _delay:
      0080F2 52 0A            [ 2]  217 	sub	sp, #10
                                    218 ;	beep.c: 51: for (x = 0; x < 1036*time_ms; ++x)
      0080F4 5F               [ 1]  219 	clrw	x
      0080F5 1F 03            [ 2]  220 	ldw	(0x03, sp), x
      0080F7 1F 01            [ 2]  221 	ldw	(0x01, sp), x
      0080F9 1E 0D            [ 2]  222 	ldw	x, (0x0d, sp)
      0080FB 89               [ 2]  223 	pushw	x
      0080FC 4B 0C            [ 1]  224 	push	#0x0c
      0080FE 4B 04            [ 1]  225 	push	#0x04
      008100 CD 85 DC         [ 4]  226 	call	__mulint
      008103 5B 04            [ 2]  227 	addw	sp, #4
      008105 1F 09            [ 2]  228 	ldw	(0x09, sp), x
      008107                        229 00103$:
      008107 16 09            [ 2]  230 	ldw	y, (0x09, sp)
      008109 17 07            [ 2]  231 	ldw	(0x07, sp), y
      00810B 7B 07            [ 1]  232 	ld	a, (0x07, sp)
      00810D 49               [ 1]  233 	rlc	a
      00810E 4F               [ 1]  234 	clr	a
      00810F A2 00            [ 1]  235 	sbc	a, #0x00
      008111 6B 06            [ 1]  236 	ld	(0x06, sp), a
      008113 6B 05            [ 1]  237 	ld	(0x05, sp), a
      008115 1E 03            [ 2]  238 	ldw	x, (0x03, sp)
      008117 13 07            [ 2]  239 	cpw	x, (0x07, sp)
      008119 7B 02            [ 1]  240 	ld	a, (0x02, sp)
      00811B 12 06            [ 1]  241 	sbc	a, (0x06, sp)
      00811D 7B 01            [ 1]  242 	ld	a, (0x01, sp)
      00811F 12 05            [ 1]  243 	sbc	a, (0x05, sp)
      008121 2E 17            [ 1]  244 	jrsge	00105$
                                    245 ;	beep.c: 52: __asm__("nop");
      008123 9D               [ 1]  246 	nop
                                    247 ;	beep.c: 51: for (x = 0; x < 1036*time_ms; ++x)
      008124 16 03            [ 2]  248 	ldw	y, (0x03, sp)
      008126 72 A9 00 01      [ 2]  249 	addw	y, #0x0001
      00812A 7B 02            [ 1]  250 	ld	a, (0x02, sp)
      00812C A9 00            [ 1]  251 	adc	a, #0x00
      00812E 97               [ 1]  252 	ld	xl, a
      00812F 7B 01            [ 1]  253 	ld	a, (0x01, sp)
      008131 A9 00            [ 1]  254 	adc	a, #0x00
      008133 95               [ 1]  255 	ld	xh, a
      008134 17 03            [ 2]  256 	ldw	(0x03, sp), y
      008136 1F 01            [ 2]  257 	ldw	(0x01, sp), x
      008138 20 CD            [ 2]  258 	jra	00103$
      00813A                        259 00105$:
      00813A 5B 0A            [ 2]  260 	addw	sp, #10
      00813C 81               [ 4]  261 	ret
                                    262 ;	beep.c: 55: void UARTPrintF (char *message) {
                                    263 ;	-----------------------------------------
                                    264 ;	 function UARTPrintF
                                    265 ;	-----------------------------------------
      00813D                        266 _UARTPrintF:
                                    267 ;	beep.c: 56: char *ch = message;
      00813D 16 03            [ 2]  268 	ldw	y, (0x03, sp)
                                    269 ;	beep.c: 57: while (*ch) {
      00813F                        270 00104$:
      00813F 90 F6            [ 1]  271 	ld	a, (y)
      008141 4D               [ 1]  272 	tnz	a
      008142 27 0F            [ 1]  273 	jreq	00107$
                                    274 ;	beep.c: 58: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
      008144 AE 52 31         [ 2]  275 	ldw	x, #0x5231
      008147 F7               [ 1]  276 	ld	(x), a
                                    277 ;	beep.c: 59: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
      008148                        278 00101$:
      008148 AE 52 30         [ 2]  279 	ldw	x, #0x5230
      00814B F6               [ 1]  280 	ld	a, (x)
      00814C 48               [ 1]  281 	sll	a
      00814D 24 F9            [ 1]  282 	jrnc	00101$
                                    283 ;	beep.c: 60: ch++;                               //  Grab the next character.
      00814F 90 5C            [ 2]  284 	incw	y
      008151 20 EC            [ 2]  285 	jra	00104$
      008153                        286 00107$:
      008153 81               [ 4]  287 	ret
                                    288 ;	beep.c: 64: void print_UCHAR_hex (unsigned char buffer) {
                                    289 ;	-----------------------------------------
                                    290 ;	 function print_UCHAR_hex
                                    291 ;	-----------------------------------------
      008154                        292 _print_UCHAR_hex:
      008154 52 0C            [ 2]  293 	sub	sp, #12
                                    294 ;	beep.c: 67: a = (buffer >> 4);
      008156 7B 0F            [ 1]  295 	ld	a, (0x0f, sp)
      008158 4E               [ 1]  296 	swap	a
      008159 A4 0F            [ 1]  297 	and	a, #0x0f
      00815B 5F               [ 1]  298 	clrw	x
      00815C 97               [ 1]  299 	ld	xl, a
                                    300 ;	beep.c: 68: if (a > 9)
      00815D A3 00 09         [ 2]  301 	cpw	x, #0x0009
      008160 2D 07            [ 1]  302 	jrsle	00102$
                                    303 ;	beep.c: 69: a = a + 'a' - 10;
      008162 1C 00 57         [ 2]  304 	addw	x, #0x0057
      008165 1F 03            [ 2]  305 	ldw	(0x03, sp), x
      008167 20 05            [ 2]  306 	jra	00103$
      008169                        307 00102$:
                                    308 ;	beep.c: 71: a += '0';
      008169 1C 00 30         [ 2]  309 	addw	x, #0x0030
      00816C 1F 03            [ 2]  310 	ldw	(0x03, sp), x
      00816E                        311 00103$:
                                    312 ;	beep.c: 72: b = buffer & 0x0f;
      00816E 7B 0F            [ 1]  313 	ld	a, (0x0f, sp)
      008170 A4 0F            [ 1]  314 	and	a, #0x0f
      008172 5F               [ 1]  315 	clrw	x
      008173 97               [ 1]  316 	ld	xl, a
                                    317 ;	beep.c: 73: if (b > 9)
      008174 A3 00 09         [ 2]  318 	cpw	x, #0x0009
      008177 2D 07            [ 1]  319 	jrsle	00105$
                                    320 ;	beep.c: 74: b = b + 'a' - 10;
      008179 1C 00 57         [ 2]  321 	addw	x, #0x0057
      00817C 1F 01            [ 2]  322 	ldw	(0x01, sp), x
      00817E 20 05            [ 2]  323 	jra	00106$
      008180                        324 00105$:
                                    325 ;	beep.c: 76: b += '0';
      008180 1C 00 30         [ 2]  326 	addw	x, #0x0030
      008183 1F 01            [ 2]  327 	ldw	(0x01, sp), x
      008185                        328 00106$:
                                    329 ;	beep.c: 77: message[0] = a;
      008185 90 96            [ 1]  330 	ldw	y, sp
      008187 72 A9 00 05      [ 2]  331 	addw	y, #5
      00818B 7B 04            [ 1]  332 	ld	a, (0x04, sp)
      00818D 90 F7            [ 1]  333 	ld	(y), a
                                    334 ;	beep.c: 78: message[1] = b;
      00818F 93               [ 1]  335 	ldw	x, y
      008190 5C               [ 2]  336 	incw	x
      008191 7B 02            [ 1]  337 	ld	a, (0x02, sp)
      008193 F7               [ 1]  338 	ld	(x), a
                                    339 ;	beep.c: 79: message[2] = 0;
      008194 93               [ 1]  340 	ldw	x, y
      008195 5C               [ 2]  341 	incw	x
      008196 5C               [ 2]  342 	incw	x
      008197 7F               [ 1]  343 	clr	(x)
                                    344 ;	beep.c: 80: UARTPrintF (message);
      008198 90 89            [ 2]  345 	pushw	y
      00819A CD 81 3D         [ 4]  346 	call	_UARTPrintF
      00819D 5B 02            [ 2]  347 	addw	sp, #2
      00819F 5B 0C            [ 2]  348 	addw	sp, #12
      0081A1 81               [ 4]  349 	ret
                                    350 ;	beep.c: 83: void i2c_send_address (UCHAR addr, UCHAR mode) {
                                    351 ;	-----------------------------------------
                                    352 ;	 function i2c_send_address
                                    353 ;	-----------------------------------------
      0081A2                        354 _i2c_send_address:
      0081A2 52 03            [ 2]  355 	sub	sp, #3
                                    356 ;	beep.c: 85: reg = I2C_SR1;
      0081A4 AE 52 17         [ 2]  357 	ldw	x, #0x5217
      0081A7 F6               [ 1]  358 	ld	a, (x)
      0081A8 5F               [ 1]  359 	clrw	x
      0081A9 97               [ 1]  360 	ld	xl, a
      0081AA 1F 01            [ 2]  361 	ldw	(0x01, sp), x
                                    362 ;	beep.c: 86: I2C_DR = (addr << 1) | mode;
      0081AC 7B 06            [ 1]  363 	ld	a, (0x06, sp)
      0081AE 48               [ 1]  364 	sll	a
      0081AF 1A 07            [ 1]  365 	or	a, (0x07, sp)
      0081B1 AE 52 16         [ 2]  366 	ldw	x, #0x5216
      0081B4 F7               [ 1]  367 	ld	(x), a
                                    368 ;	beep.c: 87: if (mode == I2C_READ) {
      0081B5 7B 07            [ 1]  369 	ld	a, (0x07, sp)
      0081B7 A1 01            [ 1]  370 	cp	a, #0x01
      0081B9 26 06            [ 1]  371 	jrne	00127$
      0081BB A6 01            [ 1]  372 	ld	a, #0x01
      0081BD 6B 03            [ 1]  373 	ld	(0x03, sp), a
      0081BF 20 02            [ 2]  374 	jra	00128$
      0081C1                        375 00127$:
      0081C1 0F 03            [ 1]  376 	clr	(0x03, sp)
      0081C3                        377 00128$:
      0081C3 0D 03            [ 1]  378 	tnz	(0x03, sp)
      0081C5 27 08            [ 1]  379 	jreq	00103$
                                    380 ;	beep.c: 88: I2C_OARL = 0;
      0081C7 AE 52 13         [ 2]  381 	ldw	x, #0x5213
      0081CA 7F               [ 1]  382 	clr	(x)
                                    383 ;	beep.c: 89: I2C_OARH = 0;
      0081CB AE 52 14         [ 2]  384 	ldw	x, #0x5214
      0081CE 7F               [ 1]  385 	clr	(x)
                                    386 ;	beep.c: 92: while ((I2C_SR1 & I2C_ADDR) == 0);
      0081CF                        387 00103$:
                                    388 ;	beep.c: 85: reg = I2C_SR1;
      0081CF AE 52 17         [ 2]  389 	ldw	x, #0x5217
      0081D2 F6               [ 1]  390 	ld	a, (x)
                                    391 ;	beep.c: 92: while ((I2C_SR1 & I2C_ADDR) == 0);
      0081D3 A5 02            [ 1]  392 	bcp	a, #0x02
      0081D5 27 F8            [ 1]  393 	jreq	00103$
                                    394 ;	beep.c: 93: if (mode == I2C_READ)
      0081D7 0D 03            [ 1]  395 	tnz	(0x03, sp)
      0081D9 27 06            [ 1]  396 	jreq	00108$
                                    397 ;	beep.c: 94: UNSET (I2C_SR1, I2C_ADDR);
      0081DB A4 FD            [ 1]  398 	and	a, #0xfd
      0081DD AE 52 17         [ 2]  399 	ldw	x, #0x5217
      0081E0 F7               [ 1]  400 	ld	(x), a
      0081E1                        401 00108$:
      0081E1 5B 03            [ 2]  402 	addw	sp, #3
      0081E3 81               [ 4]  403 	ret
                                    404 ;	beep.c: 97: void i2c_set_start_ack (void) {
                                    405 ;	-----------------------------------------
                                    406 ;	 function i2c_set_start_ack
                                    407 ;	-----------------------------------------
      0081E4                        408 _i2c_set_start_ack:
                                    409 ;	beep.c: 98: I2C_CR2 = I2C_ACK | I2C_START;
      0081E4 AE 52 11         [ 2]  410 	ldw	x, #0x5211
      0081E7 A6 05            [ 1]  411 	ld	a, #0x05
      0081E9 F7               [ 1]  412 	ld	(x), a
                                    413 ;	beep.c: 99: while ((I2C_SR1 & I2C_SB) == 0);
      0081EA                        414 00101$:
      0081EA AE 52 17         [ 2]  415 	ldw	x, #0x5217
      0081ED F6               [ 1]  416 	ld	a, (x)
      0081EE 44               [ 1]  417 	srl	a
      0081EF 24 F9            [ 1]  418 	jrnc	00101$
      0081F1 81               [ 4]  419 	ret
                                    420 ;	beep.c: 106: void print_byte_hex (unsigned char buffer) {
                                    421 ;	-----------------------------------------
                                    422 ;	 function print_byte_hex
                                    423 ;	-----------------------------------------
      0081F2                        424 _print_byte_hex:
      0081F2 52 0C            [ 2]  425 	sub	sp, #12
                                    426 ;	beep.c: 109: a = (buffer >> 4);
      0081F4 7B 0F            [ 1]  427 	ld	a, (0x0f, sp)
      0081F6 4E               [ 1]  428 	swap	a
      0081F7 A4 0F            [ 1]  429 	and	a, #0x0f
      0081F9 5F               [ 1]  430 	clrw	x
      0081FA 97               [ 1]  431 	ld	xl, a
                                    432 ;	beep.c: 110: if (a > 9)
      0081FB A3 00 09         [ 2]  433 	cpw	x, #0x0009
      0081FE 2D 07            [ 1]  434 	jrsle	00102$
                                    435 ;	beep.c: 111: a = a + 'a' - 10;
      008200 1C 00 57         [ 2]  436 	addw	x, #0x0057
      008203 1F 03            [ 2]  437 	ldw	(0x03, sp), x
      008205 20 05            [ 2]  438 	jra	00103$
      008207                        439 00102$:
                                    440 ;	beep.c: 113: a += '0'; 
      008207 1C 00 30         [ 2]  441 	addw	x, #0x0030
      00820A 1F 03            [ 2]  442 	ldw	(0x03, sp), x
      00820C                        443 00103$:
                                    444 ;	beep.c: 114: b = buffer & 0x0f;
      00820C 7B 0F            [ 1]  445 	ld	a, (0x0f, sp)
      00820E A4 0F            [ 1]  446 	and	a, #0x0f
      008210 5F               [ 1]  447 	clrw	x
      008211 97               [ 1]  448 	ld	xl, a
                                    449 ;	beep.c: 115: if (b > 9)
      008212 A3 00 09         [ 2]  450 	cpw	x, #0x0009
      008215 2D 07            [ 1]  451 	jrsle	00105$
                                    452 ;	beep.c: 116: b = b + 'a' - 10;
      008217 1C 00 57         [ 2]  453 	addw	x, #0x0057
      00821A 1F 01            [ 2]  454 	ldw	(0x01, sp), x
      00821C 20 05            [ 2]  455 	jra	00106$
      00821E                        456 00105$:
                                    457 ;	beep.c: 118: b += '0'; 
      00821E 1C 00 30         [ 2]  458 	addw	x, #0x0030
      008221 1F 01            [ 2]  459 	ldw	(0x01, sp), x
      008223                        460 00106$:
                                    461 ;	beep.c: 119: message[0] = a;
      008223 90 96            [ 1]  462 	ldw	y, sp
      008225 72 A9 00 05      [ 2]  463 	addw	y, #5
      008229 7B 04            [ 1]  464 	ld	a, (0x04, sp)
      00822B 90 F7            [ 1]  465 	ld	(y), a
                                    466 ;	beep.c: 120: message[1] = b;
      00822D 93               [ 1]  467 	ldw	x, y
      00822E 5C               [ 2]  468 	incw	x
      00822F 7B 02            [ 1]  469 	ld	a, (0x02, sp)
      008231 F7               [ 1]  470 	ld	(x), a
                                    471 ;	beep.c: 121: message[2] = 0;
      008232 93               [ 1]  472 	ldw	x, y
      008233 5C               [ 2]  473 	incw	x
      008234 5C               [ 2]  474 	incw	x
      008235 7F               [ 1]  475 	clr	(x)
                                    476 ;	beep.c: 122: UARTPrintF (message);
      008236 90 89            [ 2]  477 	pushw	y
      008238 CD 81 3D         [ 4]  478 	call	_UARTPrintF
      00823B 5B 02            [ 2]  479 	addw	sp, #2
      00823D 5B 0C            [ 2]  480 	addw	sp, #12
      00823F 81               [ 4]  481 	ret
                                    482 ;	beep.c: 127: void InitializeUART() {
                                    483 ;	-----------------------------------------
                                    484 ;	 function InitializeUART
                                    485 ;	-----------------------------------------
      008240                        486 _InitializeUART:
                                    487 ;	beep.c: 137: UART1_CR1 = 0;
      008240 AE 52 34         [ 2]  488 	ldw	x, #0x5234
      008243 7F               [ 1]  489 	clr	(x)
                                    490 ;	beep.c: 138: UART1_CR2 = 0;
      008244 AE 52 35         [ 2]  491 	ldw	x, #0x5235
      008247 7F               [ 1]  492 	clr	(x)
                                    493 ;	beep.c: 139: UART1_CR4 = 0;
      008248 AE 52 37         [ 2]  494 	ldw	x, #0x5237
      00824B 7F               [ 1]  495 	clr	(x)
                                    496 ;	beep.c: 140: UART1_CR3 = 0;
      00824C AE 52 36         [ 2]  497 	ldw	x, #0x5236
      00824F 7F               [ 1]  498 	clr	(x)
                                    499 ;	beep.c: 141: UART1_CR5 = 0;
      008250 AE 52 38         [ 2]  500 	ldw	x, #0x5238
      008253 7F               [ 1]  501 	clr	(x)
                                    502 ;	beep.c: 142: UART1_GTR = 0;
      008254 AE 52 39         [ 2]  503 	ldw	x, #0x5239
      008257 7F               [ 1]  504 	clr	(x)
                                    505 ;	beep.c: 143: UART1_PSCR = 0;
      008258 AE 52 3A         [ 2]  506 	ldw	x, #0x523a
      00825B 7F               [ 1]  507 	clr	(x)
                                    508 ;	beep.c: 147: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
      00825C AE 52 34         [ 2]  509 	ldw	x, #0x5234
      00825F F6               [ 1]  510 	ld	a, (x)
      008260 A4 EF            [ 1]  511 	and	a, #0xef
      008262 F7               [ 1]  512 	ld	(x), a
                                    513 ;	beep.c: 148: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
      008263 AE 52 34         [ 2]  514 	ldw	x, #0x5234
      008266 F6               [ 1]  515 	ld	a, (x)
      008267 A4 FB            [ 1]  516 	and	a, #0xfb
      008269 F7               [ 1]  517 	ld	(x), a
                                    518 ;	beep.c: 149: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
      00826A AE 52 36         [ 2]  519 	ldw	x, #0x5236
      00826D F6               [ 1]  520 	ld	a, (x)
      00826E A4 DF            [ 1]  521 	and	a, #0xdf
      008270 F7               [ 1]  522 	ld	(x), a
                                    523 ;	beep.c: 150: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
      008271 AE 52 36         [ 2]  524 	ldw	x, #0x5236
      008274 F6               [ 1]  525 	ld	a, (x)
      008275 A4 EF            [ 1]  526 	and	a, #0xef
      008277 F7               [ 1]  527 	ld	(x), a
                                    528 ;	beep.c: 151: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
      008278 AE 52 33         [ 2]  529 	ldw	x, #0x5233
      00827B A6 0A            [ 1]  530 	ld	a, #0x0a
      00827D F7               [ 1]  531 	ld	(x), a
                                    532 ;	beep.c: 152: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
      00827E AE 52 32         [ 2]  533 	ldw	x, #0x5232
      008281 A6 08            [ 1]  534 	ld	a, #0x08
      008283 F7               [ 1]  535 	ld	(x), a
                                    536 ;	beep.c: 156: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
      008284 AE 52 35         [ 2]  537 	ldw	x, #0x5235
      008287 F6               [ 1]  538 	ld	a, (x)
      008288 A4 F7            [ 1]  539 	and	a, #0xf7
      00828A F7               [ 1]  540 	ld	(x), a
                                    541 ;	beep.c: 157: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
      00828B AE 52 35         [ 2]  542 	ldw	x, #0x5235
      00828E F6               [ 1]  543 	ld	a, (x)
      00828F A4 FB            [ 1]  544 	and	a, #0xfb
      008291 F7               [ 1]  545 	ld	(x), a
                                    546 ;	beep.c: 161: SET (UART1_CR3, CR3_CPOL);
      008292 AE 52 36         [ 2]  547 	ldw	x, #0x5236
      008295 F6               [ 1]  548 	ld	a, (x)
      008296 AA 04            [ 1]  549 	or	a, #0x04
      008298 F7               [ 1]  550 	ld	(x), a
                                    551 ;	beep.c: 162: SET (UART1_CR3, CR3_CPHA);
      008299 AE 52 36         [ 2]  552 	ldw	x, #0x5236
      00829C F6               [ 1]  553 	ld	a, (x)
      00829D AA 02            [ 1]  554 	or	a, #0x02
      00829F F7               [ 1]  555 	ld	(x), a
                                    556 ;	beep.c: 163: SET (UART1_CR3, CR3_LBCL);
      0082A0 72 10 52 36      [ 1]  557 	bset	0x5236, #0
                                    558 ;	beep.c: 167: SET (UART1_CR2, CR2_TEN);
      0082A4 AE 52 35         [ 2]  559 	ldw	x, #0x5235
      0082A7 F6               [ 1]  560 	ld	a, (x)
      0082A8 AA 08            [ 1]  561 	or	a, #0x08
      0082AA F7               [ 1]  562 	ld	(x), a
                                    563 ;	beep.c: 168: SET (UART1_CR2, CR2_REN);
      0082AB AE 52 35         [ 2]  564 	ldw	x, #0x5235
      0082AE F6               [ 1]  565 	ld	a, (x)
      0082AF AA 04            [ 1]  566 	or	a, #0x04
      0082B1 F7               [ 1]  567 	ld	(x), a
                                    568 ;	beep.c: 169: UART1_CR3 = CR3_CLKEN;
      0082B2 AE 52 36         [ 2]  569 	ldw	x, #0x5236
      0082B5 A6 08            [ 1]  570 	ld	a, #0x08
      0082B7 F7               [ 1]  571 	ld	(x), a
      0082B8 81               [ 4]  572 	ret
                                    573 ;	beep.c: 197: void tm1637Init(void)
                                    574 ;	-----------------------------------------
                                    575 ;	 function tm1637Init
                                    576 ;	-----------------------------------------
      0082B9                        577 _tm1637Init:
                                    578 ;	beep.c: 199: tm1637SetBrightness(8);
      0082B9 4B 08            [ 1]  579 	push	#0x08
      0082BB CD 83 59         [ 4]  580 	call	_tm1637SetBrightness
      0082BE 84               [ 1]  581 	pop	a
      0082BF 81               [ 4]  582 	ret
                                    583 ;	beep.c: 204: void tm1637DisplayDecimal(u8 TT,unsigned int displaySeparator)
                                    584 ;	-----------------------------------------
                                    585 ;	 function tm1637DisplayDecimal
                                    586 ;	-----------------------------------------
      0082C0                        587 _tm1637DisplayDecimal:
      0082C0 52 0F            [ 2]  588 	sub	sp, #15
                                    589 ;	beep.c: 206: unsigned int v = TT ;
      0082C2 5F               [ 1]  590 	clrw	x
      0082C3 7B 12            [ 1]  591 	ld	a, (0x12, sp)
      0082C5 97               [ 1]  592 	ld	xl, a
      0082C6 1F 05            [ 2]  593 	ldw	(0x05, sp), x
                                    594 ;	beep.c: 212: for (ii = 0; ii < 4; ++ii) {
      0082C8 96               [ 1]  595 	ldw	x, sp
      0082C9 5C               [ 2]  596 	incw	x
      0082CA 1F 09            [ 2]  597 	ldw	(0x09, sp), x
      0082CC AE 85 CB         [ 2]  598 	ldw	x, #_segmentMap+0
      0082CF 1F 0E            [ 2]  599 	ldw	(0x0e, sp), x
      0082D1 90 5F            [ 1]  600 	clrw	y
      0082D3                        601 00106$:
                                    602 ;	beep.c: 213: digitArr[ii] = segmentMap[v % 10];
      0082D3 93               [ 1]  603 	ldw	x, y
      0082D4 72 FB 09         [ 2]  604 	addw	x, (0x09, sp)
      0082D7 1F 0C            [ 2]  605 	ldw	(0x0c, sp), x
      0082D9 90 89            [ 2]  606 	pushw	y
      0082DB 1E 07            [ 2]  607 	ldw	x, (0x07, sp)
      0082DD 90 AE 00 0A      [ 2]  608 	ldw	y, #0x000a
      0082E1 65               [ 2]  609 	divw	x, y
      0082E2 93               [ 1]  610 	ldw	x, y
      0082E3 90 85            [ 2]  611 	popw	y
      0082E5 72 FB 0E         [ 2]  612 	addw	x, (0x0e, sp)
      0082E8 F6               [ 1]  613 	ld	a, (x)
      0082E9 1E 0C            [ 2]  614 	ldw	x, (0x0c, sp)
      0082EB F7               [ 1]  615 	ld	(x), a
                                    616 ;	beep.c: 214: if (ii == 2 && displaySeparator) {
      0082EC 90 A3 00 02      [ 2]  617 	cpw	y, #0x0002
      0082F0 26 0C            [ 1]  618 	jrne	00102$
      0082F2 1E 13            [ 2]  619 	ldw	x, (0x13, sp)
      0082F4 27 08            [ 1]  620 	jreq	00102$
                                    621 ;	beep.c: 215: digitArr[ii] |= 1 << 7;
      0082F6 1E 0C            [ 2]  622 	ldw	x, (0x0c, sp)
      0082F8 F6               [ 1]  623 	ld	a, (x)
      0082F9 AA 80            [ 1]  624 	or	a, #0x80
      0082FB 1E 0C            [ 2]  625 	ldw	x, (0x0c, sp)
      0082FD F7               [ 1]  626 	ld	(x), a
      0082FE                        627 00102$:
                                    628 ;	beep.c: 217: v /= 10;
      0082FE 90 89            [ 2]  629 	pushw	y
      008300 1E 07            [ 2]  630 	ldw	x, (0x07, sp)
      008302 90 AE 00 0A      [ 2]  631 	ldw	y, #0x000a
      008306 65               [ 2]  632 	divw	x, y
      008307 90 85            [ 2]  633 	popw	y
      008309 1F 05            [ 2]  634 	ldw	(0x05, sp), x
                                    635 ;	beep.c: 212: for (ii = 0; ii < 4; ++ii) {
      00830B 90 5C            [ 2]  636 	incw	y
      00830D 90 A3 00 04      [ 2]  637 	cpw	y, #0x0004
      008311 25 C0            [ 1]  638 	jrc	00106$
                                    639 ;	beep.c: 220: _tm1637Start();
      008313 CD 83 6B         [ 4]  640 	call	__tm1637Start
                                    641 ;	beep.c: 221: _tm1637WriteByte(0x40);
      008316 4B 40            [ 1]  642 	push	#0x40
      008318 CD 83 BF         [ 4]  643 	call	__tm1637WriteByte
      00831B 84               [ 1]  644 	pop	a
                                    645 ;	beep.c: 222: _tm1637ReadResult();
      00831C CD 83 A4         [ 4]  646 	call	__tm1637ReadResult
                                    647 ;	beep.c: 223: _tm1637Stop();
      00831F CD 83 7D         [ 4]  648 	call	__tm1637Stop
                                    649 ;	beep.c: 225: _tm1637Start();
      008322 CD 83 6B         [ 4]  650 	call	__tm1637Start
                                    651 ;	beep.c: 226: _tm1637WriteByte(0xc0);
      008325 4B C0            [ 1]  652 	push	#0xc0
      008327 CD 83 BF         [ 4]  653 	call	__tm1637WriteByte
      00832A 84               [ 1]  654 	pop	a
                                    655 ;	beep.c: 227: _tm1637ReadResult();
      00832B CD 83 A4         [ 4]  656 	call	__tm1637ReadResult
                                    657 ;	beep.c: 229: for (ii = 0; ii < 4; ++ii) {
      00832E 5F               [ 1]  658 	clrw	x
      00832F 1F 07            [ 2]  659 	ldw	(0x07, sp), x
      008331                        660 00108$:
                                    661 ;	beep.c: 230: _tm1637WriteByte(digitArr[3 - ii]);
      008331 7B 08            [ 1]  662 	ld	a, (0x08, sp)
      008333 6B 0B            [ 1]  663 	ld	(0x0b, sp), a
      008335 A6 03            [ 1]  664 	ld	a, #0x03
      008337 10 0B            [ 1]  665 	sub	a, (0x0b, sp)
      008339 5F               [ 1]  666 	clrw	x
      00833A 97               [ 1]  667 	ld	xl, a
      00833B 72 FB 09         [ 2]  668 	addw	x, (0x09, sp)
      00833E F6               [ 1]  669 	ld	a, (x)
      00833F 88               [ 1]  670 	push	a
      008340 CD 83 BF         [ 4]  671 	call	__tm1637WriteByte
      008343 84               [ 1]  672 	pop	a
                                    673 ;	beep.c: 231: _tm1637ReadResult();
      008344 CD 83 A4         [ 4]  674 	call	__tm1637ReadResult
                                    675 ;	beep.c: 229: for (ii = 0; ii < 4; ++ii) {
      008347 1E 07            [ 2]  676 	ldw	x, (0x07, sp)
      008349 5C               [ 2]  677 	incw	x
      00834A 1F 07            [ 2]  678 	ldw	(0x07, sp), x
      00834C 1E 07            [ 2]  679 	ldw	x, (0x07, sp)
      00834E A3 00 04         [ 2]  680 	cpw	x, #0x0004
      008351 25 DE            [ 1]  681 	jrc	00108$
                                    682 ;	beep.c: 234: _tm1637Stop();
      008353 CD 83 7D         [ 4]  683 	call	__tm1637Stop
      008356 5B 0F            [ 2]  684 	addw	sp, #15
      008358 81               [ 4]  685 	ret
                                    686 ;	beep.c: 239: void tm1637SetBrightness(char brightness)
                                    687 ;	-----------------------------------------
                                    688 ;	 function tm1637SetBrightness
                                    689 ;	-----------------------------------------
      008359                        690 _tm1637SetBrightness:
                                    691 ;	beep.c: 246: _tm1637Start();
      008359 CD 83 6B         [ 4]  692 	call	__tm1637Start
                                    693 ;	beep.c: 247: _tm1637WriteByte(0x87 + brightness);
      00835C 7B 03            [ 1]  694 	ld	a, (0x03, sp)
      00835E AB 87            [ 1]  695 	add	a, #0x87
      008360 88               [ 1]  696 	push	a
      008361 CD 83 BF         [ 4]  697 	call	__tm1637WriteByte
      008364 84               [ 1]  698 	pop	a
                                    699 ;	beep.c: 248: _tm1637ReadResult();
      008365 CD 83 A4         [ 4]  700 	call	__tm1637ReadResult
                                    701 ;	beep.c: 249: _tm1637Stop();
      008368 CC 83 7D         [ 2]  702 	jp	__tm1637Stop
                                    703 ;	beep.c: 252: void _tm1637Start(void)
                                    704 ;	-----------------------------------------
                                    705 ;	 function _tm1637Start
                                    706 ;	-----------------------------------------
      00836B                        707 __tm1637Start:
                                    708 ;	beep.c: 254: _tm1637ClkHigh();
      00836B CD 83 FD         [ 4]  709 	call	__tm1637ClkHigh
                                    710 ;	beep.c: 255: _tm1637DioHigh();
      00836E CD 84 0D         [ 4]  711 	call	__tm1637DioHigh
                                    712 ;	beep.c: 256: delay(5);
      008371 4B 05            [ 1]  713 	push	#0x05
      008373 4B 00            [ 1]  714 	push	#0x00
      008375 CD 80 F2         [ 4]  715 	call	_delay
      008378 5B 02            [ 2]  716 	addw	sp, #2
                                    717 ;	beep.c: 257: _tm1637DioLow();
      00837A CC 84 15         [ 2]  718 	jp	__tm1637DioLow
                                    719 ;	beep.c: 260: void _tm1637Stop(void)
                                    720 ;	-----------------------------------------
                                    721 ;	 function _tm1637Stop
                                    722 ;	-----------------------------------------
      00837D                        723 __tm1637Stop:
                                    724 ;	beep.c: 262: _tm1637ClkLow();
      00837D CD 84 05         [ 4]  725 	call	__tm1637ClkLow
                                    726 ;	beep.c: 263: delay(5);
      008380 4B 05            [ 1]  727 	push	#0x05
      008382 4B 00            [ 1]  728 	push	#0x00
      008384 CD 80 F2         [ 4]  729 	call	_delay
      008387 5B 02            [ 2]  730 	addw	sp, #2
                                    731 ;	beep.c: 264: _tm1637DioLow();
      008389 CD 84 15         [ 4]  732 	call	__tm1637DioLow
                                    733 ;	beep.c: 265: delay(5);
      00838C 4B 05            [ 1]  734 	push	#0x05
      00838E 4B 00            [ 1]  735 	push	#0x00
      008390 CD 80 F2         [ 4]  736 	call	_delay
      008393 5B 02            [ 2]  737 	addw	sp, #2
                                    738 ;	beep.c: 266: _tm1637ClkHigh();
      008395 CD 83 FD         [ 4]  739 	call	__tm1637ClkHigh
                                    740 ;	beep.c: 267: delay(5);
      008398 4B 05            [ 1]  741 	push	#0x05
      00839A 4B 00            [ 1]  742 	push	#0x00
      00839C CD 80 F2         [ 4]  743 	call	_delay
      00839F 5B 02            [ 2]  744 	addw	sp, #2
                                    745 ;	beep.c: 268: _tm1637DioHigh();
      0083A1 CC 84 0D         [ 2]  746 	jp	__tm1637DioHigh
                                    747 ;	beep.c: 271: void _tm1637ReadResult(void)
                                    748 ;	-----------------------------------------
                                    749 ;	 function _tm1637ReadResult
                                    750 ;	-----------------------------------------
      0083A4                        751 __tm1637ReadResult:
                                    752 ;	beep.c: 273: _tm1637ClkLow();
      0083A4 CD 84 05         [ 4]  753 	call	__tm1637ClkLow
                                    754 ;	beep.c: 274: delay(5);
      0083A7 4B 05            [ 1]  755 	push	#0x05
      0083A9 4B 00            [ 1]  756 	push	#0x00
      0083AB CD 80 F2         [ 4]  757 	call	_delay
      0083AE 5B 02            [ 2]  758 	addw	sp, #2
                                    759 ;	beep.c: 276: _tm1637ClkHigh();
      0083B0 CD 83 FD         [ 4]  760 	call	__tm1637ClkHigh
                                    761 ;	beep.c: 277: delay(5);
      0083B3 4B 05            [ 1]  762 	push	#0x05
      0083B5 4B 00            [ 1]  763 	push	#0x00
      0083B7 CD 80 F2         [ 4]  764 	call	_delay
      0083BA 5B 02            [ 2]  765 	addw	sp, #2
                                    766 ;	beep.c: 278: _tm1637ClkLow();
      0083BC CC 84 05         [ 2]  767 	jp	__tm1637ClkLow
                                    768 ;	beep.c: 281: void _tm1637WriteByte(unsigned char b)
                                    769 ;	-----------------------------------------
                                    770 ;	 function _tm1637WriteByte
                                    771 ;	-----------------------------------------
      0083BF                        772 __tm1637WriteByte:
      0083BF 52 02            [ 2]  773 	sub	sp, #2
                                    774 ;	beep.c: 283: for (ii = 0; ii < 8; ++ii) {
      0083C1 5F               [ 1]  775 	clrw	x
      0083C2 1F 01            [ 2]  776 	ldw	(0x01, sp), x
      0083C4                        777 00105$:
                                    778 ;	beep.c: 284: _tm1637ClkLow();
      0083C4 CD 84 05         [ 4]  779 	call	__tm1637ClkLow
                                    780 ;	beep.c: 285: if (b & 0x01) {
      0083C7 7B 05            [ 1]  781 	ld	a, (0x05, sp)
      0083C9 44               [ 1]  782 	srl	a
      0083CA 24 05            [ 1]  783 	jrnc	00102$
                                    784 ;	beep.c: 286: _tm1637DioHigh();
      0083CC CD 84 0D         [ 4]  785 	call	__tm1637DioHigh
      0083CF 20 03            [ 2]  786 	jra	00103$
      0083D1                        787 00102$:
                                    788 ;	beep.c: 289: _tm1637DioLow();
      0083D1 CD 84 15         [ 4]  789 	call	__tm1637DioLow
      0083D4                        790 00103$:
                                    791 ;	beep.c: 291: delay(15);
      0083D4 4B 0F            [ 1]  792 	push	#0x0f
      0083D6 4B 00            [ 1]  793 	push	#0x00
      0083D8 CD 80 F2         [ 4]  794 	call	_delay
      0083DB 5B 02            [ 2]  795 	addw	sp, #2
                                    796 ;	beep.c: 292: b >>= 1;
      0083DD 7B 05            [ 1]  797 	ld	a, (0x05, sp)
      0083DF 44               [ 1]  798 	srl	a
      0083E0 6B 05            [ 1]  799 	ld	(0x05, sp), a
                                    800 ;	beep.c: 293: _tm1637ClkHigh();
      0083E2 CD 83 FD         [ 4]  801 	call	__tm1637ClkHigh
                                    802 ;	beep.c: 294: delay(15);
      0083E5 4B 0F            [ 1]  803 	push	#0x0f
      0083E7 4B 00            [ 1]  804 	push	#0x00
      0083E9 CD 80 F2         [ 4]  805 	call	_delay
      0083EC 5B 02            [ 2]  806 	addw	sp, #2
                                    807 ;	beep.c: 283: for (ii = 0; ii < 8; ++ii) {
      0083EE 1E 01            [ 2]  808 	ldw	x, (0x01, sp)
      0083F0 5C               [ 2]  809 	incw	x
      0083F1 1F 01            [ 2]  810 	ldw	(0x01, sp), x
      0083F3 1E 01            [ 2]  811 	ldw	x, (0x01, sp)
      0083F5 A3 00 08         [ 2]  812 	cpw	x, #0x0008
      0083F8 2F CA            [ 1]  813 	jrslt	00105$
      0083FA 5B 02            [ 2]  814 	addw	sp, #2
      0083FC 81               [ 4]  815 	ret
                                    816 ;	beep.c: 300: void _tm1637ClkHigh(void)
                                    817 ;	-----------------------------------------
                                    818 ;	 function _tm1637ClkHigh
                                    819 ;	-----------------------------------------
      0083FD                        820 __tm1637ClkHigh:
                                    821 ;	beep.c: 305: PD_ODR |= 1 << 2;
      0083FD AE 50 0F         [ 2]  822 	ldw	x, #0x500f
      008400 F6               [ 1]  823 	ld	a, (x)
      008401 AA 04            [ 1]  824 	or	a, #0x04
      008403 F7               [ 1]  825 	ld	(x), a
      008404 81               [ 4]  826 	ret
                                    827 ;	beep.c: 308: void _tm1637ClkLow(void)
                                    828 ;	-----------------------------------------
                                    829 ;	 function _tm1637ClkLow
                                    830 ;	-----------------------------------------
      008405                        831 __tm1637ClkLow:
                                    832 ;	beep.c: 312: PD_ODR &= ~(1 << 2);
      008405 AE 50 0F         [ 2]  833 	ldw	x, #0x500f
      008408 F6               [ 1]  834 	ld	a, (x)
      008409 A4 FB            [ 1]  835 	and	a, #0xfb
      00840B F7               [ 1]  836 	ld	(x), a
      00840C 81               [ 4]  837 	ret
                                    838 ;	beep.c: 318: void _tm1637DioHigh(void)
                                    839 ;	-----------------------------------------
                                    840 ;	 function _tm1637DioHigh
                                    841 ;	-----------------------------------------
      00840D                        842 __tm1637DioHigh:
                                    843 ;	beep.c: 322: PD_ODR |= 1 << 3;
      00840D AE 50 0F         [ 2]  844 	ldw	x, #0x500f
      008410 F6               [ 1]  845 	ld	a, (x)
      008411 AA 08            [ 1]  846 	or	a, #0x08
      008413 F7               [ 1]  847 	ld	(x), a
      008414 81               [ 4]  848 	ret
                                    849 ;	beep.c: 326: void _tm1637DioLow(void)
                                    850 ;	-----------------------------------------
                                    851 ;	 function _tm1637DioLow
                                    852 ;	-----------------------------------------
      008415                        853 __tm1637DioLow:
                                    854 ;	beep.c: 328: PD_ODR &= ~(1 << 3);
      008415 AE 50 0F         [ 2]  855 	ldw	x, #0x500f
      008418 F6               [ 1]  856 	ld	a, (x)
      008419 A4 F7            [ 1]  857 	and	a, #0xf7
      00841B F7               [ 1]  858 	ld	(x), a
      00841C 81               [ 4]  859 	ret
                                    860 ;	beep.c: 343: void rt_one_second_increment (st_time *t) {
                                    861 ;	-----------------------------------------
                                    862 ;	 function rt_one_second_increment
                                    863 ;	-----------------------------------------
      00841D                        864 _rt_one_second_increment:
      00841D 52 08            [ 2]  865 	sub	sp, #8
                                    866 ;	beep.c: 344: ++t->ticker; //   
      00841F 16 0B            [ 2]  867 	ldw	y, (0x0b, sp)
      008421 17 05            [ 2]  868 	ldw	(0x05, sp), y
      008423 1E 05            [ 2]  869 	ldw	x, (0x05, sp)
      008425 1C 00 04         [ 2]  870 	addw	x, #0x0004
      008428 1F 07            [ 2]  871 	ldw	(0x07, sp), x
      00842A 1E 07            [ 2]  872 	ldw	x, (0x07, sp)
      00842C E6 03            [ 1]  873 	ld	a, (0x3, x)
      00842E 90 97            [ 1]  874 	ld	yl, a
      008430 E6 02            [ 1]  875 	ld	a, (0x2, x)
      008432 FE               [ 2]  876 	ldw	x, (x)
      008433 90 95            [ 1]  877 	ld	yh, a
      008435 72 A9 00 01      [ 2]  878 	addw	y, #0x0001
      008439 9F               [ 1]  879 	ld	a, xl
      00843A A9 00            [ 1]  880 	adc	a, #0x00
      00843C 6B 02            [ 1]  881 	ld	(0x02, sp), a
      00843E 9E               [ 1]  882 	ld	a, xh
      00843F A9 00            [ 1]  883 	adc	a, #0x00
      008441 6B 01            [ 1]  884 	ld	(0x01, sp), a
      008443 1E 07            [ 2]  885 	ldw	x, (0x07, sp)
      008445 EF 02            [ 2]  886 	ldw	(0x2, x), y
      008447 16 01            [ 2]  887 	ldw	y, (0x01, sp)
      008449 FF               [ 2]  888 	ldw	(x), y
                                    889 ;	beep.c: 345: if(++t->second > 59) {
      00844A 1E 05            [ 2]  890 	ldw	x, (0x05, sp)
      00844C F6               [ 1]  891 	ld	a, (x)
      00844D 4C               [ 1]  892 	inc	a
      00844E F7               [ 1]  893 	ld	(x), a
      00844F A1 3B            [ 1]  894 	cp	a, #0x3b
      008451 23 1A            [ 2]  895 	jrule	00107$
                                    896 ;	beep.c: 346: t->second= 0;
      008453 1E 05            [ 2]  897 	ldw	x, (0x05, sp)
      008455 7F               [ 1]  898 	clr	(x)
                                    899 ;	beep.c: 347: if(++t->minute > 59) {
      008456 1E 05            [ 2]  900 	ldw	x, (0x05, sp)
      008458 5C               [ 2]  901 	incw	x
      008459 F6               [ 1]  902 	ld	a, (x)
      00845A 4C               [ 1]  903 	inc	a
      00845B F7               [ 1]  904 	ld	(x), a
      00845C A1 3B            [ 1]  905 	cp	a, #0x3b
      00845E 23 0D            [ 2]  906 	jrule	00107$
                                    907 ;	beep.c: 348: t->minute= 0;
      008460 7F               [ 1]  908 	clr	(x)
                                    909 ;	beep.c: 349: if(++t->hour > 23) {
      008461 1E 05            [ 2]  910 	ldw	x, (0x05, sp)
      008463 5C               [ 2]  911 	incw	x
      008464 5C               [ 2]  912 	incw	x
      008465 F6               [ 1]  913 	ld	a, (x)
      008466 4C               [ 1]  914 	inc	a
      008467 F7               [ 1]  915 	ld	(x), a
      008468 A1 17            [ 1]  916 	cp	a, #0x17
      00846A 23 01            [ 2]  917 	jrule	00107$
                                    918 ;	beep.c: 350: t->hour= 0;
      00846C 7F               [ 1]  919 	clr	(x)
      00846D                        920 00107$:
      00846D 5B 08            [ 2]  921 	addw	sp, #8
      00846F 81               [ 4]  922 	ret
                                    923 ;	beep.c: 360: void timer_isr(void) __interrupt(BEEP_ISR) {
                                    924 ;	-----------------------------------------
                                    925 ;	 function timer_isr
                                    926 ;	-----------------------------------------
      008470                        927 _timer_isr:
                                    928 ;	beep.c: 361: if (++internteller > 500) {
      008470 CE 00 09         [ 2]  929 	ldw	x, _internteller+0
      008473 5C               [ 2]  930 	incw	x
      008474 CF 00 09         [ 2]  931 	ldw	_internteller+0, x
      008477 A3 01 F4         [ 2]  932 	cpw	x, #0x01f4
      00847A 23 11            [ 2]  933 	jrule	00103$
                                    934 ;	beep.c: 362: internteller=0;
      00847C 72 5F 00 0A      [ 1]  935 	clr	_internteller+1
      008480 72 5F 00 09      [ 1]  936 	clr	_internteller+0
                                    937 ;	beep.c: 363: rt_one_second_increment(&real_time);
      008484 AE 00 01         [ 2]  938 	ldw	x, #_real_time+0
      008487 89               [ 2]  939 	pushw	x
      008488 CD 84 1D         [ 4]  940 	call	_rt_one_second_increment
      00848B 5B 02            [ 2]  941 	addw	sp, #2
      00848D                        942 00103$:
      00848D 80               [11]  943 	iret
                                    944 ;	beep.c: 396: int main () {
                                    945 ;	-----------------------------------------
                                    946 ;	 function main
                                    947 ;	-----------------------------------------
      00848E                        948 _main:
      00848E 52 1D            [ 2]  949 	sub	sp, #29
                                    950 ;	beep.c: 400: u8 startmeting=0;	
      008490 0F 05            [ 1]  951 	clr	(0x05, sp)
                                    952 ;	beep.c: 401: unsigned int val=0, current,periode;
      008492 5F               [ 1]  953 	clrw	x
      008493 1F 1C            [ 2]  954 	ldw	(0x1c, sp), x
                                    955 ;	beep.c: 403: InitializeSystemClock();
      008495 CD 80 A8         [ 4]  956 	call	_InitializeSystemClock
                                    957 ;	beep.c: 405: BEEP_CSR = (0<<7) | (0<<6) | (1<<5) | 0x1E;
      008498 AE 50 F3         [ 2]  958 	ldw	x, #0x50f3
      00849B A6 3E            [ 1]  959 	ld	a, #0x3e
      00849D F7               [ 1]  960 	ld	(x), a
                                    961 ;	beep.c: 406: PD_DDR = (1 << 3) | (1 << 2); // output mode
      00849E AE 50 11         [ 2]  962 	ldw	x, #0x5011
      0084A1 A6 0C            [ 1]  963 	ld	a, #0x0c
      0084A3 F7               [ 1]  964 	ld	(x), a
                                    965 ;	beep.c: 408: PD_DDR &=  ~(1 << 4); //PD4 input
      0084A4 AE 50 11         [ 2]  966 	ldw	x, #0x5011
      0084A7 F6               [ 1]  967 	ld	a, (x)
      0084A8 A4 EF            [ 1]  968 	and	a, #0xef
      0084AA F7               [ 1]  969 	ld	(x), a
                                    970 ;	beep.c: 409: PD_CR1 = (1 << 3) | (1 << 2); // push-pull
      0084AB AE 50 12         [ 2]  971 	ldw	x, #0x5012
      0084AE A6 0C            [ 1]  972 	ld	a, #0x0c
      0084B0 F7               [ 1]  973 	ld	(x), a
                                    974 ;	beep.c: 410: PD_CR1 &= ~(1 << 4); // input with float
      0084B1 AE 50 12         [ 2]  975 	ldw	x, #0x5012
      0084B4 F6               [ 1]  976 	ld	a, (x)
      0084B5 A4 EF            [ 1]  977 	and	a, #0xef
      0084B7 F7               [ 1]  978 	ld	(x), a
                                    979 ;	beep.c: 411: PD_CR2 = (1 << 3) | (1 << 2) | (1<< 4); // up to 10MHz speed + interrupt enabled 
      0084B8 AE 50 13         [ 2]  980 	ldw	x, #0x5013
      0084BB A6 1C            [ 1]  981 	ld	a, #0x1c
      0084BD F7               [ 1]  982 	ld	(x), a
                                    983 ;	beep.c: 413: EXTI_CR1 = (1<<7); //Port D external sensitivity bits7:6 10: Falling edge only
      0084BE AE 50 A0         [ 2]  984 	ldw	x, #0x50a0
      0084C1 A6 80            [ 1]  985 	ld	a, #0x80
      0084C3 F7               [ 1]  986 	ld	(x), a
                                    987 ;	beep.c: 414: EXTI_CR1 &= ~(1<<6); //Port D external sensitivity bits7:6 10: Falling edge only
      0084C4 AE 50 A0         [ 2]  988 	ldw	x, #0x50a0
      0084C7 F6               [ 1]  989 	ld	a, (x)
      0084C8 A4 BF            [ 1]  990 	and	a, #0xbf
      0084CA F7               [ 1]  991 	ld	(x), a
                                    992 ;	beep.c: 417: tijd = &real_time;
      0084CB AE 00 01         [ 2]  993 	ldw	x, #_real_time+0
      0084CE 1F 1A            [ 2]  994 	ldw	(0x1a, sp), x
      0084D0 7B 1A            [ 1]  995 	ld	a, (0x1a, sp)
      0084D2 88               [ 1]  996 	push	a
      0084D3 7B 1C            [ 1]  997 	ld	a, (0x1c, sp)
      0084D5 6B 10            [ 1]  998 	ld	(0x10, sp), a
      0084D7 84               [ 1]  999 	pop	a
      0084D8 6B 0E            [ 1] 1000 	ld	(0x0e, sp), a
                                   1001 ;	beep.c: 424: tm1637Init();
      0084DA CD 82 B9         [ 4] 1002 	call	_tm1637Init
                                   1003 ;	beep.c: 426: InitializeUART();
      0084DD CD 82 40         [ 4] 1004 	call	_InitializeUART
                                   1005 ;	beep.c: 429: FLASH_DUKR = FLASH_DUKR_KEY1;
      0084E0 AE 50 64         [ 2] 1006 	ldw	x, #0x5064
      0084E3 A6 AE            [ 1] 1007 	ld	a, #0xae
      0084E5 F7               [ 1] 1008 	ld	(x), a
                                   1009 ;	beep.c: 430: FLASH_DUKR = FLASH_DUKR_KEY2;
      0084E6 AE 50 64         [ 2] 1010 	ldw	x, #0x5064
      0084E9 A6 56            [ 1] 1011 	ld	a, #0x56
      0084EB F7               [ 1] 1012 	ld	(x), a
                                   1013 ;	beep.c: 431: while (!(FLASH_IAPSR & (1 << FLASH_IAPSR_DUL)));
      0084EC                       1014 00101$:
      0084EC AE 50 5F         [ 2] 1015 	ldw	x, #0x505f
      0084EF F6               [ 1] 1016 	ld	a, (x)
      0084F0 A5 08            [ 1] 1017 	bcp	a, #0x08
      0084F2 27 F8            [ 1] 1018 	jreq	00101$
                                   1019 ;	beep.c: 432: for (addr = EEPROM_START_ADDR; addr < EEPROM_END_ADDR; addr++)
      0084F4 AE 40 00         [ 2] 1020 	ldw	x, #0x4000
      0084F7                       1021 00116$:
                                   1022 ;	beep.c: 433: _MEM_(addr) = 0xAA;
      0084F7 90 93            [ 1] 1023 	ldw	y, x
      0084F9 A6 AA            [ 1] 1024 	ld	a, #0xaa
      0084FB 90 E7 01         [ 1] 1025 	ld	(0x1, y), a
      0084FE 90 7F            [ 1] 1026 	clr	(y)
                                   1027 ;	beep.c: 432: for (addr = EEPROM_START_ADDR; addr < EEPROM_END_ADDR; addr++)
      008500 5C               [ 2] 1028 	incw	x
      008501 A3 42 80         [ 2] 1029 	cpw	x, #0x4280
      008504 25 F1            [ 1] 1030 	jrc	00116$
                                   1031 ;	beep.c: 439: __asm__("rim");
      008506 9A               [ 1] 1032 	rim
                                   1033 ;	beep.c: 443: while (1) {
      008507                       1034 00114$:
                                   1035 ;	beep.c: 444: ADC_CR1 |= ADC_ADON; // ADC ON
      008507 72 10 54 01      [ 1] 1036 	bset	0x5401, #0
                                   1037 ;	beep.c: 445: ADC_CSR |= ((0x0F)&2); // select channel = 2 = PC4
      00850B AE 54 00         [ 2] 1038 	ldw	x, #0x5400
      00850E F6               [ 1] 1039 	ld	a, (x)
      00850F AA 02            [ 1] 1040 	or	a, #0x02
      008511 F7               [ 1] 1041 	ld	(x), a
                                   1042 ;	beep.c: 446: ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
      008512 AE 54 02         [ 2] 1043 	ldw	x, #0x5402
      008515 F6               [ 1] 1044 	ld	a, (x)
      008516 AA 08            [ 1] 1045 	or	a, #0x08
      008518 F7               [ 1] 1046 	ld	(x), a
                                   1047 ;	beep.c: 447: ADC_CR1 |= ADC_ADON; // start conversion
      008519 72 10 54 01      [ 1] 1048 	bset	0x5401, #0
                                   1049 ;	beep.c: 448: while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC
      00851D                       1050 00105$:
      00851D AE 54 00         [ 2] 1051 	ldw	x, #0x5400
      008520 F6               [ 1] 1052 	ld	a, (x)
      008521 48               [ 1] 1053 	sll	a
      008522 24 F9            [ 1] 1054 	jrnc	00105$
                                   1055 ;	beep.c: 450: val |= (unsigned int)ADC_DRL;
      008524 AE 54 05         [ 2] 1056 	ldw	x, #0x5405
      008527 F6               [ 1] 1057 	ld	a, (x)
      008528 5F               [ 1] 1058 	clrw	x
      008529 97               [ 1] 1059 	ld	xl, a
      00852A 1A 1D            [ 1] 1060 	or	a, (0x1d, sp)
      00852C 6B 19            [ 1] 1061 	ld	(0x19, sp), a
      00852E 9E               [ 1] 1062 	ld	a, xh
      00852F 1A 1C            [ 1] 1063 	or	a, (0x1c, sp)
      008531 6B 01            [ 1] 1064 	ld	(0x01, sp), a
      008533 7B 19            [ 1] 1065 	ld	a, (0x19, sp)
      008535 6B 02            [ 1] 1066 	ld	(0x02, sp), a
                                   1067 ;	beep.c: 452: val |= (unsigned int)ADC_DRH<<8;
      008537 AE 54 04         [ 2] 1068 	ldw	x, #0x5404
      00853A F6               [ 1] 1069 	ld	a, (x)
      00853B 5F               [ 1] 1070 	clrw	x
      00853C 97               [ 1] 1071 	ld	xl, a
      00853D 58               [ 2] 1072 	sllw	x
      00853E 58               [ 2] 1073 	sllw	x
      00853F 58               [ 2] 1074 	sllw	x
      008540 58               [ 2] 1075 	sllw	x
      008541 58               [ 2] 1076 	sllw	x
      008542 58               [ 2] 1077 	sllw	x
      008543 58               [ 2] 1078 	sllw	x
      008544 58               [ 2] 1079 	sllw	x
      008545 9F               [ 1] 1080 	ld	a, xl
      008546 1A 02            [ 1] 1081 	or	a, (0x02, sp)
      008548 6B 17            [ 1] 1082 	ld	(0x17, sp), a
      00854A 9E               [ 1] 1083 	ld	a, xh
      00854B 1A 01            [ 1] 1084 	or	a, (0x01, sp)
      00854D 6B 1C            [ 1] 1085 	ld	(0x1c, sp), a
      00854F 7B 17            [ 1] 1086 	ld	a, (0x17, sp)
      008551 6B 1D            [ 1] 1087 	ld	(0x1d, sp), a
                                   1088 ;	beep.c: 453: ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
      008553 AE 54 01         [ 2] 1089 	ldw	x, #0x5401
      008556 F6               [ 1] 1090 	ld	a, (x)
      008557 A4 FE            [ 1] 1091 	and	a, #0xfe
      008559 F7               [ 1] 1092 	ld	(x), a
                                   1093 ;	beep.c: 454: current = val & 0x03ff;
      00855A 7B 1D            [ 1] 1094 	ld	a, (0x1d, sp)
      00855C 6B 04            [ 1] 1095 	ld	(0x04, sp), a
      00855E 7B 1C            [ 1] 1096 	ld	a, (0x1c, sp)
      008560 A4 03            [ 1] 1097 	and	a, #0x03
      008562 6B 03            [ 1] 1098 	ld	(0x03, sp), a
                                   1099 ;	beep.c: 456: if (current > MIN_CURRENT){ //start timing current consumption
      008564 1E 03            [ 2] 1100 	ldw	x, (0x03, sp)
      008566 A3 00 0A         [ 2] 1101 	cpw	x, #0x000a
      008569 23 41            [ 2] 1102 	jrule	00109$
                                   1103 ;	beep.c: 458: starttijd.second = real_time.second;
      00856B 96               [ 1] 1104 	ldw	x, sp
      00856C 1C 00 06         [ 2] 1105 	addw	x, #6
      00856F 16 1A            [ 2] 1106 	ldw	y, (0x1a, sp)
      008571 90 F6            [ 1] 1107 	ld	a, (y)
      008573 F7               [ 1] 1108 	ld	(x), a
                                   1109 ;	beep.c: 459: starttijd.minute = real_time.minute;
      008574 96               [ 1] 1110 	ldw	x, sp
      008575 1C 00 06         [ 2] 1111 	addw	x, #6
      008578 1F 14            [ 2] 1112 	ldw	(0x14, sp), x
      00857A 1E 14            [ 2] 1113 	ldw	x, (0x14, sp)
      00857C 5C               [ 2] 1114 	incw	x
      00857D 16 1A            [ 2] 1115 	ldw	y, (0x1a, sp)
      00857F 90 E6 01         [ 1] 1116 	ld	a, (0x1, y)
      008582 F7               [ 1] 1117 	ld	(x), a
                                   1118 ;	beep.c: 460: starttijd.hour = real_time.hour;
      008583 1E 14            [ 2] 1119 	ldw	x, (0x14, sp)
      008585 5C               [ 2] 1120 	incw	x
      008586 5C               [ 2] 1121 	incw	x
      008587 16 1A            [ 2] 1122 	ldw	y, (0x1a, sp)
      008589 90 E6 02         [ 1] 1123 	ld	a, (0x2, y)
      00858C F7               [ 1] 1124 	ld	(x), a
                                   1125 ;	beep.c: 461: starttijd.ticker = real_time.ticker;
      00858D 1E 14            [ 2] 1126 	ldw	x, (0x14, sp)
      00858F 1C 00 04         [ 2] 1127 	addw	x, #0x0004
      008592 16 1A            [ 2] 1128 	ldw	y, (0x1a, sp)
      008594 90 E6 07         [ 1] 1129 	ld	a, (0x7, y)
      008597 88               [ 1] 1130 	push	a
      008598 90 E6 06         [ 1] 1131 	ld	a, (0x6, y)
      00859B 6B 13            [ 1] 1132 	ld	(0x13, sp), a
      00859D 90 EE 04         [ 2] 1133 	ldw	y, (0x4, y)
      0085A0 84               [ 1] 1134 	pop	a
      0085A1 E7 03            [ 1] 1135 	ld	(0x3, x), a
      0085A3 7B 12            [ 1] 1136 	ld	a, (0x12, sp)
      0085A5 E7 02            [ 1] 1137 	ld	(0x2, x), a
      0085A7 FF               [ 2] 1138 	ldw	(x), y
                                   1139 ;	beep.c: 462: startmeting = 1;
      0085A8 A6 01            [ 1] 1140 	ld	a, #0x01
      0085AA 6B 05            [ 1] 1141 	ld	(0x05, sp), a
      0085AC                       1142 00109$:
                                   1143 ;	beep.c: 464: if ((current < MIN_CURRENT) && (startmeting))
      0085AC 1E 03            [ 2] 1144 	ldw	x, (0x03, sp)
      0085AE A3 00 0A         [ 2] 1145 	cpw	x, #0x000a
      0085B1 24 06            [ 1] 1146 	jrnc	00111$
      0085B3 0D 05            [ 1] 1147 	tnz	(0x05, sp)
      0085B5 27 02            [ 1] 1148 	jreq	00111$
                                   1149 ;	beep.c: 467: startmeting = 0;
      0085B7 0F 05            [ 1] 1150 	clr	(0x05, sp)
      0085B9                       1151 00111$:
                                   1152 ;	beep.c: 472: tm1637DisplayDecimal(tijd->minute, 0); // display minutes 
      0085B9 1E 0E            [ 2] 1153 	ldw	x, (0x0e, sp)
      0085BB E6 01            [ 1] 1154 	ld	a, (0x1, x)
      0085BD 5F               [ 1] 1155 	clrw	x
      0085BE 89               [ 2] 1156 	pushw	x
      0085BF 88               [ 1] 1157 	push	a
      0085C0 CD 82 C0         [ 4] 1158 	call	_tm1637DisplayDecimal
      0085C3 5B 03            [ 2] 1159 	addw	sp, #3
      0085C5 CC 85 07         [ 2] 1160 	jp	00114$
      0085C8 5B 1D            [ 2] 1161 	addw	sp, #29
      0085CA 81               [ 4] 1162 	ret
                                   1163 	.area CODE
      0085CB                       1164 _segmentMap:
      0085CB 3F                    1165 	.db #0x3F	;  63
      0085CC 06                    1166 	.db #0x06	;  6
      0085CD 5B                    1167 	.db #0x5B	;  91
      0085CE 4F                    1168 	.db #0x4F	;  79	'O'
      0085CF 66                    1169 	.db #0x66	;  102	'f'
      0085D0 6D                    1170 	.db #0x6D	;  109	'm'
      0085D1 7D                    1171 	.db #0x7D	;  125
      0085D2 07                    1172 	.db #0x07	;  7
      0085D3 7F                    1173 	.db #0x7F	;  127
      0085D4 6F                    1174 	.db #0x6F	;  111	'o'
      0085D5 77                    1175 	.db #0x77	;  119	'w'
      0085D6 7C                    1176 	.db #0x7C	;  124
      0085D7 39                    1177 	.db #0x39	;  57	'9'
      0085D8 5E                    1178 	.db #0x5E	;  94
      0085D9 79                    1179 	.db #0x79	;  121	'y'
      0085DA 71                    1180 	.db #0x71	;  113	'q'
      0085DB 00                    1181 	.db #0x00	;  0
                                   1182 	.area INITIALIZER
                                   1183 	.area CABS (ABS)
