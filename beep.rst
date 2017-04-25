                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.0 #8981 (Jul 11 2014) (Linux)
                                      4 ; This file was generated Tue Apr 25 20:13:38 2017
                                      5 ;--------------------------------------------------------
                                      6 	.module beep
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _segmentMap
                                     13 	.globl _main
                                     14 	.globl _SetDefaultValues
                                     15 	.globl _timer_isr
                                     16 	.globl _rt_one_second_increment
                                     17 	.globl _tm1637DisplayDecimal
                                     18 	.globl _tm1637Init
                                     19 	.globl _InitializeUART
                                     20 	.globl _print_byte_hex
                                     21 	.globl _print_UCHAR_hex
                                     22 	.globl _UARTPrintF
                                     23 	.globl _delay
                                     24 	.globl _InitializeSystemClock
                                     25 	.globl _delayTenMicro
                                     26 	.globl _numberOfValues
                                     27 	.globl __onOrOff
                                     28 	.globl __pulseLength
                                     29 	.globl _internteller
                                     30 	.globl _real_time
                                     31 	.globl _tm1637SetBrightness
                                     32 	.globl __tm1637Start
                                     33 	.globl __tm1637Stop
                                     34 	.globl __tm1637ReadResult
                                     35 	.globl __tm1637WriteByte
                                     36 	.globl __tm1637ClkHigh
                                     37 	.globl __tm1637ClkLow
                                     38 	.globl __tm1637DioHigh
                                     39 	.globl __tm1637DioLow
                                     40 ;--------------------------------------------------------
                                     41 ; ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area DATA
      000001                         44 _real_time::
      000001                         45 	.ds 8
      000009                         46 _internteller::
      000009                         47 	.ds 2
                                     48 ;--------------------------------------------------------
                                     49 ; ram data
                                     50 ;--------------------------------------------------------
                                     51 	.area INITIALIZED
      00000B                         52 __pulseLength::
      00000B                         53 	.ds 14
      000019                         54 __onOrOff::
      000019                         55 	.ds 7
      000020                         56 _numberOfValues::
      000020                         57 	.ds 1
                                     58 ;--------------------------------------------------------
                                     59 ; Stack segment in internal ram 
                                     60 ;--------------------------------------------------------
                                     61 	.area	SSEG
      000000                         62 __start__stack:
      000000                         63 	.ds	1
                                     64 
                                     65 ;--------------------------------------------------------
                                     66 ; absolute external ram data
                                     67 ;--------------------------------------------------------
                                     68 	.area DABS (ABS)
                                     69 ;--------------------------------------------------------
                                     70 ; interrupt vector 
                                     71 ;--------------------------------------------------------
                                     72 	.area HOME
      008000                         73 __interrupt_vect:
      008000 82 00 80 83             74 	int s_GSINIT ;reset
      008004 82 00 00 00             75 	int 0x0000 ;trap
      008008 82 00 00 00             76 	int 0x0000 ;int0
      00800C 82 00 00 00             77 	int 0x0000 ;int1
      008010 82 00 00 00             78 	int 0x0000 ;int2
      008014 82 00 00 00             79 	int 0x0000 ;int3
      008018 82 00 00 00             80 	int 0x0000 ;int4
      00801C 82 00 00 00             81 	int 0x0000 ;int5
      008020 82 00 84 1E             82 	int _timer_isr ;int6
      008024 82 00 00 00             83 	int 0x0000 ;int7
      008028 82 00 00 00             84 	int 0x0000 ;int8
      00802C 82 00 00 00             85 	int 0x0000 ;int9
      008030 82 00 00 00             86 	int 0x0000 ;int10
      008034 82 00 00 00             87 	int 0x0000 ;int11
      008038 82 00 00 00             88 	int 0x0000 ;int12
      00803C 82 00 00 00             89 	int 0x0000 ;int13
      008040 82 00 00 00             90 	int 0x0000 ;int14
      008044 82 00 00 00             91 	int 0x0000 ;int15
      008048 82 00 00 00             92 	int 0x0000 ;int16
      00804C 82 00 00 00             93 	int 0x0000 ;int17
      008050 82 00 00 00             94 	int 0x0000 ;int18
      008054 82 00 00 00             95 	int 0x0000 ;int19
      008058 82 00 00 00             96 	int 0x0000 ;int20
      00805C 82 00 00 00             97 	int 0x0000 ;int21
      008060 82 00 00 00             98 	int 0x0000 ;int22
      008064 82 00 00 00             99 	int 0x0000 ;int23
      008068 82 00 00 00            100 	int 0x0000 ;int24
      00806C 82 00 00 00            101 	int 0x0000 ;int25
      008070 82 00 00 00            102 	int 0x0000 ;int26
      008074 82 00 00 00            103 	int 0x0000 ;int27
      008078 82 00 00 00            104 	int 0x0000 ;int28
      00807C 82 00 00 00            105 	int 0x0000 ;int29
                                    106 ;--------------------------------------------------------
                                    107 ; global & static initialisations
                                    108 ;--------------------------------------------------------
                                    109 	.area HOME
                                    110 	.area GSINIT
                                    111 	.area GSFINAL
                                    112 	.area GSINIT
      008083                        113 __sdcc_gs_init_startup:
      008083                        114 __sdcc_init_data:
                                    115 ; stm8_genXINIT() start
      008083 AE 00 0A         [ 2]  116 	ldw x, #l_DATA
      008086 27 07            [ 1]  117 	jreq	00002$
      008088                        118 00001$:
      008088 72 4F 00 00      [ 1]  119 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  120 	decw x
      00808D 26 F9            [ 1]  121 	jrne	00001$
      00808F                        122 00002$:
      00808F AE 00 16         [ 2]  123 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  124 	jreq	00004$
      008094                        125 00003$:
      008094 D6 86 8D         [ 1]  126 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 0A         [ 1]  127 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  128 	decw	x
      00809B 26 F7            [ 1]  129 	jrne	00003$
      00809D                        130 00004$:
                                    131 ; stm8_genXINIT() end
                                    132 	.area GSFINAL
      00809D CC 80 80         [ 2]  133 	jp	__sdcc_program_startup
                                    134 ;--------------------------------------------------------
                                    135 ; Home
                                    136 ;--------------------------------------------------------
                                    137 	.area HOME
                                    138 	.area HOME
      008080                        139 __sdcc_program_startup:
      008080 CC 84 A9         [ 2]  140 	jp	_main
                                    141 ;	return from main will return to caller
                                    142 ;--------------------------------------------------------
                                    143 ; code
                                    144 ;--------------------------------------------------------
                                    145 	.area CODE
                                    146 ;	beep.c: 27: void delayTenMicro (void) {
                                    147 ;	-----------------------------------------
                                    148 ;	 function delayTenMicro
                                    149 ;	-----------------------------------------
      0080A0                        150 _delayTenMicro:
                                    151 ;	beep.c: 29: for (a = 0; a < 50; ++a)
      0080A0 A6 32            [ 1]  152 	ld	a, #0x32
      0080A2                        153 00104$:
                                    154 ;	beep.c: 30: __asm__("nop");
      0080A2 9D               [ 1]  155 	nop
      0080A3 4A               [ 1]  156 	dec	a
                                    157 ;	beep.c: 29: for (a = 0; a < 50; ++a)
      0080A4 4D               [ 1]  158 	tnz	a
      0080A5 26 FB            [ 1]  159 	jrne	00104$
      0080A7 81               [ 4]  160 	ret
                                    161 ;	beep.c: 33: void InitializeSystemClock() {
                                    162 ;	-----------------------------------------
                                    163 ;	 function InitializeSystemClock
                                    164 ;	-----------------------------------------
      0080A8                        165 _InitializeSystemClock:
                                    166 ;	beep.c: 34: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
      0080A8 AE 50 C0         [ 2]  167 	ldw	x, #0x50c0
      0080AB 7F               [ 1]  168 	clr	(x)
                                    169 ;	beep.c: 35: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
      0080AC AE 50 C0         [ 2]  170 	ldw	x, #0x50c0
      0080AF A6 01            [ 1]  171 	ld	a, #0x01
      0080B1 F7               [ 1]  172 	ld	(x), a
                                    173 ;	beep.c: 36: CLK_ECKR = 0;                       //  Disable the external clock.
      0080B2 AE 50 C1         [ 2]  174 	ldw	x, #0x50c1
      0080B5 7F               [ 1]  175 	clr	(x)
                                    176 ;	beep.c: 37: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
      0080B6                        177 00101$:
      0080B6 AE 50 C0         [ 2]  178 	ldw	x, #0x50c0
      0080B9 F6               [ 1]  179 	ld	a, (x)
      0080BA A5 02            [ 1]  180 	bcp	a, #0x02
      0080BC 27 F8            [ 1]  181 	jreq	00101$
                                    182 ;	beep.c: 38: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
      0080BE AE 50 C6         [ 2]  183 	ldw	x, #0x50c6
      0080C1 7F               [ 1]  184 	clr	(x)
                                    185 ;	beep.c: 39: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
      0080C2 AE 50 C7         [ 2]  186 	ldw	x, #0x50c7
      0080C5 A6 FF            [ 1]  187 	ld	a, #0xff
      0080C7 F7               [ 1]  188 	ld	(x), a
                                    189 ;	beep.c: 40: CLK_PCKENR2 = 0xff;                 //  Ditto.
      0080C8 AE 50 CA         [ 2]  190 	ldw	x, #0x50ca
      0080CB A6 FF            [ 1]  191 	ld	a, #0xff
      0080CD F7               [ 1]  192 	ld	(x), a
                                    193 ;	beep.c: 41: CLK_CCOR = 0;                       //  Turn off CCO.
      0080CE AE 50 C9         [ 2]  194 	ldw	x, #0x50c9
      0080D1 7F               [ 1]  195 	clr	(x)
                                    196 ;	beep.c: 42: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
      0080D2 AE 50 CC         [ 2]  197 	ldw	x, #0x50cc
      0080D5 7F               [ 1]  198 	clr	(x)
                                    199 ;	beep.c: 43: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
      0080D6 AE 50 CD         [ 2]  200 	ldw	x, #0x50cd
      0080D9 7F               [ 1]  201 	clr	(x)
                                    202 ;	beep.c: 44: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
      0080DA AE 50 C4         [ 2]  203 	ldw	x, #0x50c4
      0080DD A6 E1            [ 1]  204 	ld	a, #0xe1
      0080DF F7               [ 1]  205 	ld	(x), a
                                    206 ;	beep.c: 45: CLK_SWCR = 0;                       //  Reset the clock switch control register.
      0080E0 AE 50 C5         [ 2]  207 	ldw	x, #0x50c5
      0080E3 7F               [ 1]  208 	clr	(x)
                                    209 ;	beep.c: 46: CLK_SWCR = CLK_SWEN;                //  Enable switching.
      0080E4 AE 50 C5         [ 2]  210 	ldw	x, #0x50c5
      0080E7 A6 02            [ 1]  211 	ld	a, #0x02
      0080E9 F7               [ 1]  212 	ld	(x), a
                                    213 ;	beep.c: 47: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
      0080EA                        214 00104$:
      0080EA AE 50 C5         [ 2]  215 	ldw	x, #0x50c5
      0080ED F6               [ 1]  216 	ld	a, (x)
      0080EE 44               [ 1]  217 	srl	a
      0080EF 25 F9            [ 1]  218 	jrc	00104$
      0080F1 81               [ 4]  219 	ret
                                    220 ;	beep.c: 49: void delay (int time_ms) {
                                    221 ;	-----------------------------------------
                                    222 ;	 function delay
                                    223 ;	-----------------------------------------
      0080F2                        224 _delay:
      0080F2 52 0A            [ 2]  225 	sub	sp, #10
                                    226 ;	beep.c: 51: for (x = 0; x < 1036*time_ms; ++x)
      0080F4 5F               [ 1]  227 	clrw	x
      0080F5 1F 03            [ 2]  228 	ldw	(0x03, sp), x
      0080F7 1F 01            [ 2]  229 	ldw	(0x01, sp), x
      0080F9 1E 0D            [ 2]  230 	ldw	x, (0x0d, sp)
      0080FB 89               [ 2]  231 	pushw	x
      0080FC 4B 0C            [ 1]  232 	push	#0x0c
      0080FE 4B 04            [ 1]  233 	push	#0x04
      008100 CD 86 38         [ 4]  234 	call	__mulint
      008103 5B 04            [ 2]  235 	addw	sp, #4
      008105 1F 09            [ 2]  236 	ldw	(0x09, sp), x
      008107                        237 00103$:
      008107 16 09            [ 2]  238 	ldw	y, (0x09, sp)
      008109 17 07            [ 2]  239 	ldw	(0x07, sp), y
      00810B 7B 07            [ 1]  240 	ld	a, (0x07, sp)
      00810D 49               [ 1]  241 	rlc	a
      00810E 4F               [ 1]  242 	clr	a
      00810F A2 00            [ 1]  243 	sbc	a, #0x00
      008111 6B 06            [ 1]  244 	ld	(0x06, sp), a
      008113 6B 05            [ 1]  245 	ld	(0x05, sp), a
      008115 1E 03            [ 2]  246 	ldw	x, (0x03, sp)
      008117 13 07            [ 2]  247 	cpw	x, (0x07, sp)
      008119 7B 02            [ 1]  248 	ld	a, (0x02, sp)
      00811B 12 06            [ 1]  249 	sbc	a, (0x06, sp)
      00811D 7B 01            [ 1]  250 	ld	a, (0x01, sp)
      00811F 12 05            [ 1]  251 	sbc	a, (0x05, sp)
      008121 2E 17            [ 1]  252 	jrsge	00105$
                                    253 ;	beep.c: 52: __asm__("nop");
      008123 9D               [ 1]  254 	nop
                                    255 ;	beep.c: 51: for (x = 0; x < 1036*time_ms; ++x)
      008124 16 03            [ 2]  256 	ldw	y, (0x03, sp)
      008126 72 A9 00 01      [ 2]  257 	addw	y, #0x0001
      00812A 7B 02            [ 1]  258 	ld	a, (0x02, sp)
      00812C A9 00            [ 1]  259 	adc	a, #0x00
      00812E 97               [ 1]  260 	ld	xl, a
      00812F 7B 01            [ 1]  261 	ld	a, (0x01, sp)
      008131 A9 00            [ 1]  262 	adc	a, #0x00
      008133 95               [ 1]  263 	ld	xh, a
      008134 17 03            [ 2]  264 	ldw	(0x03, sp), y
      008136 1F 01            [ 2]  265 	ldw	(0x01, sp), x
      008138 20 CD            [ 2]  266 	jra	00103$
      00813A                        267 00105$:
      00813A 5B 0A            [ 2]  268 	addw	sp, #10
      00813C 81               [ 4]  269 	ret
                                    270 ;	beep.c: 55: void UARTPrintF (char *message) {
                                    271 ;	-----------------------------------------
                                    272 ;	 function UARTPrintF
                                    273 ;	-----------------------------------------
      00813D                        274 _UARTPrintF:
                                    275 ;	beep.c: 56: char *ch = message;
      00813D 16 03            [ 2]  276 	ldw	y, (0x03, sp)
                                    277 ;	beep.c: 57: while (*ch) {
      00813F                        278 00104$:
      00813F 90 F6            [ 1]  279 	ld	a, (y)
      008141 4D               [ 1]  280 	tnz	a
      008142 27 0F            [ 1]  281 	jreq	00107$
                                    282 ;	beep.c: 58: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
      008144 AE 52 31         [ 2]  283 	ldw	x, #0x5231
      008147 F7               [ 1]  284 	ld	(x), a
                                    285 ;	beep.c: 59: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
      008148                        286 00101$:
      008148 AE 52 30         [ 2]  287 	ldw	x, #0x5230
      00814B F6               [ 1]  288 	ld	a, (x)
      00814C 48               [ 1]  289 	sll	a
      00814D 24 F9            [ 1]  290 	jrnc	00101$
                                    291 ;	beep.c: 60: ch++;                               //  Grab the next character.
      00814F 90 5C            [ 2]  292 	incw	y
      008151 20 EC            [ 2]  293 	jra	00104$
      008153                        294 00107$:
      008153 81               [ 4]  295 	ret
                                    296 ;	beep.c: 64: void print_UCHAR_hex (unsigned char buffer) {
                                    297 ;	-----------------------------------------
                                    298 ;	 function print_UCHAR_hex
                                    299 ;	-----------------------------------------
      008154                        300 _print_UCHAR_hex:
      008154 52 0C            [ 2]  301 	sub	sp, #12
                                    302 ;	beep.c: 67: a = (buffer >> 4);
      008156 7B 0F            [ 1]  303 	ld	a, (0x0f, sp)
      008158 4E               [ 1]  304 	swap	a
      008159 A4 0F            [ 1]  305 	and	a, #0x0f
      00815B 5F               [ 1]  306 	clrw	x
      00815C 97               [ 1]  307 	ld	xl, a
                                    308 ;	beep.c: 68: if (a > 9)
      00815D A3 00 09         [ 2]  309 	cpw	x, #0x0009
      008160 2D 07            [ 1]  310 	jrsle	00102$
                                    311 ;	beep.c: 69: a = a + 'a' - 10;
      008162 1C 00 57         [ 2]  312 	addw	x, #0x0057
      008165 1F 03            [ 2]  313 	ldw	(0x03, sp), x
      008167 20 05            [ 2]  314 	jra	00103$
      008169                        315 00102$:
                                    316 ;	beep.c: 71: a += '0';
      008169 1C 00 30         [ 2]  317 	addw	x, #0x0030
      00816C 1F 03            [ 2]  318 	ldw	(0x03, sp), x
      00816E                        319 00103$:
                                    320 ;	beep.c: 72: b = buffer & 0x0f;
      00816E 7B 0F            [ 1]  321 	ld	a, (0x0f, sp)
      008170 A4 0F            [ 1]  322 	and	a, #0x0f
      008172 5F               [ 1]  323 	clrw	x
      008173 97               [ 1]  324 	ld	xl, a
                                    325 ;	beep.c: 73: if (b > 9)
      008174 A3 00 09         [ 2]  326 	cpw	x, #0x0009
      008177 2D 07            [ 1]  327 	jrsle	00105$
                                    328 ;	beep.c: 74: b = b + 'a' - 10;
      008179 1C 00 57         [ 2]  329 	addw	x, #0x0057
      00817C 1F 01            [ 2]  330 	ldw	(0x01, sp), x
      00817E 20 05            [ 2]  331 	jra	00106$
      008180                        332 00105$:
                                    333 ;	beep.c: 76: b += '0';
      008180 1C 00 30         [ 2]  334 	addw	x, #0x0030
      008183 1F 01            [ 2]  335 	ldw	(0x01, sp), x
      008185                        336 00106$:
                                    337 ;	beep.c: 77: message[0] = a;
      008185 90 96            [ 1]  338 	ldw	y, sp
      008187 72 A9 00 05      [ 2]  339 	addw	y, #5
      00818B 7B 04            [ 1]  340 	ld	a, (0x04, sp)
      00818D 90 F7            [ 1]  341 	ld	(y), a
                                    342 ;	beep.c: 78: message[1] = b;
      00818F 93               [ 1]  343 	ldw	x, y
      008190 5C               [ 2]  344 	incw	x
      008191 7B 02            [ 1]  345 	ld	a, (0x02, sp)
      008193 F7               [ 1]  346 	ld	(x), a
                                    347 ;	beep.c: 79: message[2] = 0;
      008194 93               [ 1]  348 	ldw	x, y
      008195 5C               [ 2]  349 	incw	x
      008196 5C               [ 2]  350 	incw	x
      008197 7F               [ 1]  351 	clr	(x)
                                    352 ;	beep.c: 80: UARTPrintF (message);
      008198 90 89            [ 2]  353 	pushw	y
      00819A CD 81 3D         [ 4]  354 	call	_UARTPrintF
      00819D 5B 02            [ 2]  355 	addw	sp, #2
      00819F 5B 0C            [ 2]  356 	addw	sp, #12
      0081A1 81               [ 4]  357 	ret
                                    358 ;	beep.c: 88: void print_byte_hex (unsigned char buffer) {
                                    359 ;	-----------------------------------------
                                    360 ;	 function print_byte_hex
                                    361 ;	-----------------------------------------
      0081A2                        362 _print_byte_hex:
      0081A2 52 0C            [ 2]  363 	sub	sp, #12
                                    364 ;	beep.c: 91: a = (buffer >> 4);
      0081A4 7B 0F            [ 1]  365 	ld	a, (0x0f, sp)
      0081A6 4E               [ 1]  366 	swap	a
      0081A7 A4 0F            [ 1]  367 	and	a, #0x0f
      0081A9 5F               [ 1]  368 	clrw	x
      0081AA 97               [ 1]  369 	ld	xl, a
                                    370 ;	beep.c: 92: if (a > 9)
      0081AB A3 00 09         [ 2]  371 	cpw	x, #0x0009
      0081AE 2D 07            [ 1]  372 	jrsle	00102$
                                    373 ;	beep.c: 93: a = a + 'a' - 10;
      0081B0 1C 00 57         [ 2]  374 	addw	x, #0x0057
      0081B3 1F 0B            [ 2]  375 	ldw	(0x0b, sp), x
      0081B5 20 05            [ 2]  376 	jra	00103$
      0081B7                        377 00102$:
                                    378 ;	beep.c: 95: a += '0'; 
      0081B7 1C 00 30         [ 2]  379 	addw	x, #0x0030
      0081BA 1F 0B            [ 2]  380 	ldw	(0x0b, sp), x
      0081BC                        381 00103$:
                                    382 ;	beep.c: 96: b = buffer & 0x0f;
      0081BC 7B 0F            [ 1]  383 	ld	a, (0x0f, sp)
      0081BE A4 0F            [ 1]  384 	and	a, #0x0f
      0081C0 5F               [ 1]  385 	clrw	x
      0081C1 97               [ 1]  386 	ld	xl, a
                                    387 ;	beep.c: 97: if (b > 9)
      0081C2 A3 00 09         [ 2]  388 	cpw	x, #0x0009
      0081C5 2D 07            [ 1]  389 	jrsle	00105$
                                    390 ;	beep.c: 98: b = b + 'a' - 10;
      0081C7 1C 00 57         [ 2]  391 	addw	x, #0x0057
      0081CA 1F 09            [ 2]  392 	ldw	(0x09, sp), x
      0081CC 20 05            [ 2]  393 	jra	00106$
      0081CE                        394 00105$:
                                    395 ;	beep.c: 100: b += '0'; 
      0081CE 1C 00 30         [ 2]  396 	addw	x, #0x0030
      0081D1 1F 09            [ 2]  397 	ldw	(0x09, sp), x
      0081D3                        398 00106$:
                                    399 ;	beep.c: 101: message[0] = a;
      0081D3 90 96            [ 1]  400 	ldw	y, sp
      0081D5 90 5C            [ 2]  401 	incw	y
      0081D7 7B 0C            [ 1]  402 	ld	a, (0x0c, sp)
      0081D9 90 F7            [ 1]  403 	ld	(y), a
                                    404 ;	beep.c: 102: message[1] = b;
      0081DB 93               [ 1]  405 	ldw	x, y
      0081DC 5C               [ 2]  406 	incw	x
      0081DD 7B 0A            [ 1]  407 	ld	a, (0x0a, sp)
      0081DF F7               [ 1]  408 	ld	(x), a
                                    409 ;	beep.c: 103: message[2] = 0;
      0081E0 93               [ 1]  410 	ldw	x, y
      0081E1 5C               [ 2]  411 	incw	x
      0081E2 5C               [ 2]  412 	incw	x
      0081E3 7F               [ 1]  413 	clr	(x)
                                    414 ;	beep.c: 104: UARTPrintF (message);
      0081E4 90 89            [ 2]  415 	pushw	y
      0081E6 CD 81 3D         [ 4]  416 	call	_UARTPrintF
      0081E9 5B 02            [ 2]  417 	addw	sp, #2
      0081EB 5B 0C            [ 2]  418 	addw	sp, #12
      0081ED 81               [ 4]  419 	ret
                                    420 ;	beep.c: 109: void InitializeUART() {
                                    421 ;	-----------------------------------------
                                    422 ;	 function InitializeUART
                                    423 ;	-----------------------------------------
      0081EE                        424 _InitializeUART:
                                    425 ;	beep.c: 119: UART1_CR1 = 0;
      0081EE AE 52 34         [ 2]  426 	ldw	x, #0x5234
      0081F1 7F               [ 1]  427 	clr	(x)
                                    428 ;	beep.c: 120: UART1_CR2 = 0;
      0081F2 AE 52 35         [ 2]  429 	ldw	x, #0x5235
      0081F5 7F               [ 1]  430 	clr	(x)
                                    431 ;	beep.c: 121: UART1_CR4 = 0;
      0081F6 AE 52 37         [ 2]  432 	ldw	x, #0x5237
      0081F9 7F               [ 1]  433 	clr	(x)
                                    434 ;	beep.c: 122: UART1_CR3 = 0;
      0081FA AE 52 36         [ 2]  435 	ldw	x, #0x5236
      0081FD 7F               [ 1]  436 	clr	(x)
                                    437 ;	beep.c: 123: UART1_CR5 = 0;
      0081FE AE 52 38         [ 2]  438 	ldw	x, #0x5238
      008201 7F               [ 1]  439 	clr	(x)
                                    440 ;	beep.c: 124: UART1_GTR = 0;
      008202 AE 52 39         [ 2]  441 	ldw	x, #0x5239
      008205 7F               [ 1]  442 	clr	(x)
                                    443 ;	beep.c: 125: UART1_PSCR = 0;
      008206 AE 52 3A         [ 2]  444 	ldw	x, #0x523a
      008209 7F               [ 1]  445 	clr	(x)
                                    446 ;	beep.c: 129: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
      00820A AE 52 34         [ 2]  447 	ldw	x, #0x5234
      00820D F6               [ 1]  448 	ld	a, (x)
      00820E A4 EF            [ 1]  449 	and	a, #0xef
      008210 F7               [ 1]  450 	ld	(x), a
                                    451 ;	beep.c: 130: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
      008211 AE 52 34         [ 2]  452 	ldw	x, #0x5234
      008214 F6               [ 1]  453 	ld	a, (x)
      008215 A4 FB            [ 1]  454 	and	a, #0xfb
      008217 F7               [ 1]  455 	ld	(x), a
                                    456 ;	beep.c: 131: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
      008218 AE 52 36         [ 2]  457 	ldw	x, #0x5236
      00821B F6               [ 1]  458 	ld	a, (x)
      00821C A4 DF            [ 1]  459 	and	a, #0xdf
      00821E F7               [ 1]  460 	ld	(x), a
                                    461 ;	beep.c: 132: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
      00821F AE 52 36         [ 2]  462 	ldw	x, #0x5236
      008222 F6               [ 1]  463 	ld	a, (x)
      008223 A4 EF            [ 1]  464 	and	a, #0xef
      008225 F7               [ 1]  465 	ld	(x), a
                                    466 ;	beep.c: 133: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
      008226 AE 52 33         [ 2]  467 	ldw	x, #0x5233
      008229 A6 0A            [ 1]  468 	ld	a, #0x0a
      00822B F7               [ 1]  469 	ld	(x), a
                                    470 ;	beep.c: 134: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
      00822C AE 52 32         [ 2]  471 	ldw	x, #0x5232
      00822F A6 08            [ 1]  472 	ld	a, #0x08
      008231 F7               [ 1]  473 	ld	(x), a
                                    474 ;	beep.c: 138: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
      008232 AE 52 35         [ 2]  475 	ldw	x, #0x5235
      008235 F6               [ 1]  476 	ld	a, (x)
      008236 A4 F7            [ 1]  477 	and	a, #0xf7
      008238 F7               [ 1]  478 	ld	(x), a
                                    479 ;	beep.c: 139: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
      008239 AE 52 35         [ 2]  480 	ldw	x, #0x5235
      00823C F6               [ 1]  481 	ld	a, (x)
      00823D A4 FB            [ 1]  482 	and	a, #0xfb
      00823F F7               [ 1]  483 	ld	(x), a
                                    484 ;	beep.c: 143: SET (UART1_CR3, CR3_CPOL);
      008240 AE 52 36         [ 2]  485 	ldw	x, #0x5236
      008243 F6               [ 1]  486 	ld	a, (x)
      008244 AA 04            [ 1]  487 	or	a, #0x04
      008246 F7               [ 1]  488 	ld	(x), a
                                    489 ;	beep.c: 144: SET (UART1_CR3, CR3_CPHA);
      008247 AE 52 36         [ 2]  490 	ldw	x, #0x5236
      00824A F6               [ 1]  491 	ld	a, (x)
      00824B AA 02            [ 1]  492 	or	a, #0x02
      00824D F7               [ 1]  493 	ld	(x), a
                                    494 ;	beep.c: 145: SET (UART1_CR3, CR3_LBCL);
      00824E 72 10 52 36      [ 1]  495 	bset	0x5236, #0
                                    496 ;	beep.c: 149: SET (UART1_CR2, CR2_TEN);
      008252 AE 52 35         [ 2]  497 	ldw	x, #0x5235
      008255 F6               [ 1]  498 	ld	a, (x)
      008256 AA 08            [ 1]  499 	or	a, #0x08
      008258 F7               [ 1]  500 	ld	(x), a
                                    501 ;	beep.c: 150: SET (UART1_CR2, CR2_REN);
      008259 AE 52 35         [ 2]  502 	ldw	x, #0x5235
      00825C F6               [ 1]  503 	ld	a, (x)
      00825D AA 04            [ 1]  504 	or	a, #0x04
      00825F F7               [ 1]  505 	ld	(x), a
                                    506 ;	beep.c: 151: UART1_CR3 = CR3_CLKEN;
      008260 AE 52 36         [ 2]  507 	ldw	x, #0x5236
      008263 A6 08            [ 1]  508 	ld	a, #0x08
      008265 F7               [ 1]  509 	ld	(x), a
      008266 81               [ 4]  510 	ret
                                    511 ;	beep.c: 179: void tm1637Init(void)
                                    512 ;	-----------------------------------------
                                    513 ;	 function tm1637Init
                                    514 ;	-----------------------------------------
      008267                        515 _tm1637Init:
                                    516 ;	beep.c: 181: tm1637SetBrightness(8);
      008267 4B 08            [ 1]  517 	push	#0x08
      008269 CD 83 07         [ 4]  518 	call	_tm1637SetBrightness
      00826C 84               [ 1]  519 	pop	a
      00826D 81               [ 4]  520 	ret
                                    521 ;	beep.c: 186: void tm1637DisplayDecimal(u8 TT,unsigned int displaySeparator)
                                    522 ;	-----------------------------------------
                                    523 ;	 function tm1637DisplayDecimal
                                    524 ;	-----------------------------------------
      00826E                        525 _tm1637DisplayDecimal:
      00826E 52 0F            [ 2]  526 	sub	sp, #15
                                    527 ;	beep.c: 188: unsigned int v = TT ;
      008270 5F               [ 1]  528 	clrw	x
      008271 7B 12            [ 1]  529 	ld	a, (0x12, sp)
      008273 97               [ 1]  530 	ld	xl, a
      008274 1F 05            [ 2]  531 	ldw	(0x05, sp), x
                                    532 ;	beep.c: 194: for (ii = 0; ii < 4; ++ii) {
      008276 96               [ 1]  533 	ldw	x, sp
      008277 5C               [ 2]  534 	incw	x
      008278 1F 0E            [ 2]  535 	ldw	(0x0e, sp), x
      00827A AE 86 27         [ 2]  536 	ldw	x, #_segmentMap+0
      00827D 1F 0C            [ 2]  537 	ldw	(0x0c, sp), x
      00827F 90 5F            [ 1]  538 	clrw	y
      008281                        539 00106$:
                                    540 ;	beep.c: 195: digitArr[ii] = segmentMap[v % 10];
      008281 93               [ 1]  541 	ldw	x, y
      008282 72 FB 0E         [ 2]  542 	addw	x, (0x0e, sp)
      008285 1F 0A            [ 2]  543 	ldw	(0x0a, sp), x
      008287 90 89            [ 2]  544 	pushw	y
      008289 1E 07            [ 2]  545 	ldw	x, (0x07, sp)
      00828B 90 AE 00 0A      [ 2]  546 	ldw	y, #0x000a
      00828F 65               [ 2]  547 	divw	x, y
      008290 93               [ 1]  548 	ldw	x, y
      008291 90 85            [ 2]  549 	popw	y
      008293 72 FB 0C         [ 2]  550 	addw	x, (0x0c, sp)
      008296 F6               [ 1]  551 	ld	a, (x)
      008297 1E 0A            [ 2]  552 	ldw	x, (0x0a, sp)
      008299 F7               [ 1]  553 	ld	(x), a
                                    554 ;	beep.c: 196: if (ii == 2 && displaySeparator) {
      00829A 90 A3 00 02      [ 2]  555 	cpw	y, #0x0002
      00829E 26 0C            [ 1]  556 	jrne	00102$
      0082A0 1E 13            [ 2]  557 	ldw	x, (0x13, sp)
      0082A2 27 08            [ 1]  558 	jreq	00102$
                                    559 ;	beep.c: 197: digitArr[ii] |= 1 << 7;
      0082A4 1E 0A            [ 2]  560 	ldw	x, (0x0a, sp)
      0082A6 F6               [ 1]  561 	ld	a, (x)
      0082A7 AA 80            [ 1]  562 	or	a, #0x80
      0082A9 1E 0A            [ 2]  563 	ldw	x, (0x0a, sp)
      0082AB F7               [ 1]  564 	ld	(x), a
      0082AC                        565 00102$:
                                    566 ;	beep.c: 199: v /= 10;
      0082AC 90 89            [ 2]  567 	pushw	y
      0082AE 1E 07            [ 2]  568 	ldw	x, (0x07, sp)
      0082B0 90 AE 00 0A      [ 2]  569 	ldw	y, #0x000a
      0082B4 65               [ 2]  570 	divw	x, y
      0082B5 90 85            [ 2]  571 	popw	y
      0082B7 1F 05            [ 2]  572 	ldw	(0x05, sp), x
                                    573 ;	beep.c: 194: for (ii = 0; ii < 4; ++ii) {
      0082B9 90 5C            [ 2]  574 	incw	y
      0082BB 90 A3 00 04      [ 2]  575 	cpw	y, #0x0004
      0082BF 25 C0            [ 1]  576 	jrc	00106$
                                    577 ;	beep.c: 202: _tm1637Start();
      0082C1 CD 83 19         [ 4]  578 	call	__tm1637Start
                                    579 ;	beep.c: 203: _tm1637WriteByte(0x40);
      0082C4 4B 40            [ 1]  580 	push	#0x40
      0082C6 CD 83 6D         [ 4]  581 	call	__tm1637WriteByte
      0082C9 84               [ 1]  582 	pop	a
                                    583 ;	beep.c: 204: _tm1637ReadResult();
      0082CA CD 83 52         [ 4]  584 	call	__tm1637ReadResult
                                    585 ;	beep.c: 205: _tm1637Stop();
      0082CD CD 83 2B         [ 4]  586 	call	__tm1637Stop
                                    587 ;	beep.c: 207: _tm1637Start();
      0082D0 CD 83 19         [ 4]  588 	call	__tm1637Start
                                    589 ;	beep.c: 208: _tm1637WriteByte(0xc0);
      0082D3 4B C0            [ 1]  590 	push	#0xc0
      0082D5 CD 83 6D         [ 4]  591 	call	__tm1637WriteByte
      0082D8 84               [ 1]  592 	pop	a
                                    593 ;	beep.c: 209: _tm1637ReadResult();
      0082D9 CD 83 52         [ 4]  594 	call	__tm1637ReadResult
                                    595 ;	beep.c: 211: for (ii = 0; ii < 4; ++ii) {
      0082DC 5F               [ 1]  596 	clrw	x
      0082DD 1F 07            [ 2]  597 	ldw	(0x07, sp), x
      0082DF                        598 00108$:
                                    599 ;	beep.c: 212: _tm1637WriteByte(digitArr[3 - ii]);
      0082DF 7B 08            [ 1]  600 	ld	a, (0x08, sp)
      0082E1 6B 09            [ 1]  601 	ld	(0x09, sp), a
      0082E3 A6 03            [ 1]  602 	ld	a, #0x03
      0082E5 10 09            [ 1]  603 	sub	a, (0x09, sp)
      0082E7 5F               [ 1]  604 	clrw	x
      0082E8 97               [ 1]  605 	ld	xl, a
      0082E9 72 FB 0E         [ 2]  606 	addw	x, (0x0e, sp)
      0082EC F6               [ 1]  607 	ld	a, (x)
      0082ED 88               [ 1]  608 	push	a
      0082EE CD 83 6D         [ 4]  609 	call	__tm1637WriteByte
      0082F1 84               [ 1]  610 	pop	a
                                    611 ;	beep.c: 213: _tm1637ReadResult();
      0082F2 CD 83 52         [ 4]  612 	call	__tm1637ReadResult
                                    613 ;	beep.c: 211: for (ii = 0; ii < 4; ++ii) {
      0082F5 1E 07            [ 2]  614 	ldw	x, (0x07, sp)
      0082F7 5C               [ 2]  615 	incw	x
      0082F8 1F 07            [ 2]  616 	ldw	(0x07, sp), x
      0082FA 1E 07            [ 2]  617 	ldw	x, (0x07, sp)
      0082FC A3 00 04         [ 2]  618 	cpw	x, #0x0004
      0082FF 25 DE            [ 1]  619 	jrc	00108$
                                    620 ;	beep.c: 216: _tm1637Stop();
      008301 CD 83 2B         [ 4]  621 	call	__tm1637Stop
      008304 5B 0F            [ 2]  622 	addw	sp, #15
      008306 81               [ 4]  623 	ret
                                    624 ;	beep.c: 221: void tm1637SetBrightness(char brightness)
                                    625 ;	-----------------------------------------
                                    626 ;	 function tm1637SetBrightness
                                    627 ;	-----------------------------------------
      008307                        628 _tm1637SetBrightness:
                                    629 ;	beep.c: 228: _tm1637Start();
      008307 CD 83 19         [ 4]  630 	call	__tm1637Start
                                    631 ;	beep.c: 229: _tm1637WriteByte(0x87 + brightness);
      00830A 7B 03            [ 1]  632 	ld	a, (0x03, sp)
      00830C AB 87            [ 1]  633 	add	a, #0x87
      00830E 88               [ 1]  634 	push	a
      00830F CD 83 6D         [ 4]  635 	call	__tm1637WriteByte
      008312 84               [ 1]  636 	pop	a
                                    637 ;	beep.c: 230: _tm1637ReadResult();
      008313 CD 83 52         [ 4]  638 	call	__tm1637ReadResult
                                    639 ;	beep.c: 231: _tm1637Stop();
      008316 CC 83 2B         [ 2]  640 	jp	__tm1637Stop
                                    641 ;	beep.c: 234: void _tm1637Start(void)
                                    642 ;	-----------------------------------------
                                    643 ;	 function _tm1637Start
                                    644 ;	-----------------------------------------
      008319                        645 __tm1637Start:
                                    646 ;	beep.c: 236: _tm1637ClkHigh();
      008319 CD 83 AB         [ 4]  647 	call	__tm1637ClkHigh
                                    648 ;	beep.c: 237: _tm1637DioHigh();
      00831C CD 83 BB         [ 4]  649 	call	__tm1637DioHigh
                                    650 ;	beep.c: 238: delay(5);
      00831F 4B 05            [ 1]  651 	push	#0x05
      008321 4B 00            [ 1]  652 	push	#0x00
      008323 CD 80 F2         [ 4]  653 	call	_delay
      008326 5B 02            [ 2]  654 	addw	sp, #2
                                    655 ;	beep.c: 239: _tm1637DioLow();
      008328 CC 83 C3         [ 2]  656 	jp	__tm1637DioLow
                                    657 ;	beep.c: 242: void _tm1637Stop(void)
                                    658 ;	-----------------------------------------
                                    659 ;	 function _tm1637Stop
                                    660 ;	-----------------------------------------
      00832B                        661 __tm1637Stop:
                                    662 ;	beep.c: 244: _tm1637ClkLow();
      00832B CD 83 B3         [ 4]  663 	call	__tm1637ClkLow
                                    664 ;	beep.c: 245: delay(5);
      00832E 4B 05            [ 1]  665 	push	#0x05
      008330 4B 00            [ 1]  666 	push	#0x00
      008332 CD 80 F2         [ 4]  667 	call	_delay
      008335 5B 02            [ 2]  668 	addw	sp, #2
                                    669 ;	beep.c: 246: _tm1637DioLow();
      008337 CD 83 C3         [ 4]  670 	call	__tm1637DioLow
                                    671 ;	beep.c: 247: delay(5);
      00833A 4B 05            [ 1]  672 	push	#0x05
      00833C 4B 00            [ 1]  673 	push	#0x00
      00833E CD 80 F2         [ 4]  674 	call	_delay
      008341 5B 02            [ 2]  675 	addw	sp, #2
                                    676 ;	beep.c: 248: _tm1637ClkHigh();
      008343 CD 83 AB         [ 4]  677 	call	__tm1637ClkHigh
                                    678 ;	beep.c: 249: delay(5);
      008346 4B 05            [ 1]  679 	push	#0x05
      008348 4B 00            [ 1]  680 	push	#0x00
      00834A CD 80 F2         [ 4]  681 	call	_delay
      00834D 5B 02            [ 2]  682 	addw	sp, #2
                                    683 ;	beep.c: 250: _tm1637DioHigh();
      00834F CC 83 BB         [ 2]  684 	jp	__tm1637DioHigh
                                    685 ;	beep.c: 253: void _tm1637ReadResult(void)
                                    686 ;	-----------------------------------------
                                    687 ;	 function _tm1637ReadResult
                                    688 ;	-----------------------------------------
      008352                        689 __tm1637ReadResult:
                                    690 ;	beep.c: 255: _tm1637ClkLow();
      008352 CD 83 B3         [ 4]  691 	call	__tm1637ClkLow
                                    692 ;	beep.c: 256: delay(5);
      008355 4B 05            [ 1]  693 	push	#0x05
      008357 4B 00            [ 1]  694 	push	#0x00
      008359 CD 80 F2         [ 4]  695 	call	_delay
      00835C 5B 02            [ 2]  696 	addw	sp, #2
                                    697 ;	beep.c: 258: _tm1637ClkHigh();
      00835E CD 83 AB         [ 4]  698 	call	__tm1637ClkHigh
                                    699 ;	beep.c: 259: delay(5);
      008361 4B 05            [ 1]  700 	push	#0x05
      008363 4B 00            [ 1]  701 	push	#0x00
      008365 CD 80 F2         [ 4]  702 	call	_delay
      008368 5B 02            [ 2]  703 	addw	sp, #2
                                    704 ;	beep.c: 260: _tm1637ClkLow();
      00836A CC 83 B3         [ 2]  705 	jp	__tm1637ClkLow
                                    706 ;	beep.c: 263: void _tm1637WriteByte(unsigned char b)
                                    707 ;	-----------------------------------------
                                    708 ;	 function _tm1637WriteByte
                                    709 ;	-----------------------------------------
      00836D                        710 __tm1637WriteByte:
      00836D 52 02            [ 2]  711 	sub	sp, #2
                                    712 ;	beep.c: 265: for (ii = 0; ii < 8; ++ii) {
      00836F 5F               [ 1]  713 	clrw	x
      008370 1F 01            [ 2]  714 	ldw	(0x01, sp), x
      008372                        715 00105$:
                                    716 ;	beep.c: 266: _tm1637ClkLow();
      008372 CD 83 B3         [ 4]  717 	call	__tm1637ClkLow
                                    718 ;	beep.c: 267: if (b & 0x01) {
      008375 7B 05            [ 1]  719 	ld	a, (0x05, sp)
      008377 44               [ 1]  720 	srl	a
      008378 24 05            [ 1]  721 	jrnc	00102$
                                    722 ;	beep.c: 268: _tm1637DioHigh();
      00837A CD 83 BB         [ 4]  723 	call	__tm1637DioHigh
      00837D 20 03            [ 2]  724 	jra	00103$
      00837F                        725 00102$:
                                    726 ;	beep.c: 271: _tm1637DioLow();
      00837F CD 83 C3         [ 4]  727 	call	__tm1637DioLow
      008382                        728 00103$:
                                    729 ;	beep.c: 273: delay(15);
      008382 4B 0F            [ 1]  730 	push	#0x0f
      008384 4B 00            [ 1]  731 	push	#0x00
      008386 CD 80 F2         [ 4]  732 	call	_delay
      008389 5B 02            [ 2]  733 	addw	sp, #2
                                    734 ;	beep.c: 274: b >>= 1;
      00838B 7B 05            [ 1]  735 	ld	a, (0x05, sp)
      00838D 44               [ 1]  736 	srl	a
      00838E 6B 05            [ 1]  737 	ld	(0x05, sp), a
                                    738 ;	beep.c: 275: _tm1637ClkHigh();
      008390 CD 83 AB         [ 4]  739 	call	__tm1637ClkHigh
                                    740 ;	beep.c: 276: delay(15);
      008393 4B 0F            [ 1]  741 	push	#0x0f
      008395 4B 00            [ 1]  742 	push	#0x00
      008397 CD 80 F2         [ 4]  743 	call	_delay
      00839A 5B 02            [ 2]  744 	addw	sp, #2
                                    745 ;	beep.c: 265: for (ii = 0; ii < 8; ++ii) {
      00839C 1E 01            [ 2]  746 	ldw	x, (0x01, sp)
      00839E 5C               [ 2]  747 	incw	x
      00839F 1F 01            [ 2]  748 	ldw	(0x01, sp), x
      0083A1 1E 01            [ 2]  749 	ldw	x, (0x01, sp)
      0083A3 A3 00 08         [ 2]  750 	cpw	x, #0x0008
      0083A6 2F CA            [ 1]  751 	jrslt	00105$
      0083A8 5B 02            [ 2]  752 	addw	sp, #2
      0083AA 81               [ 4]  753 	ret
                                    754 ;	beep.c: 282: void _tm1637ClkHigh(void)
                                    755 ;	-----------------------------------------
                                    756 ;	 function _tm1637ClkHigh
                                    757 ;	-----------------------------------------
      0083AB                        758 __tm1637ClkHigh:
                                    759 ;	beep.c: 287: PD_ODR |= 1 << 2;
      0083AB AE 50 0F         [ 2]  760 	ldw	x, #0x500f
      0083AE F6               [ 1]  761 	ld	a, (x)
      0083AF AA 04            [ 1]  762 	or	a, #0x04
      0083B1 F7               [ 1]  763 	ld	(x), a
      0083B2 81               [ 4]  764 	ret
                                    765 ;	beep.c: 290: void _tm1637ClkLow(void)
                                    766 ;	-----------------------------------------
                                    767 ;	 function _tm1637ClkLow
                                    768 ;	-----------------------------------------
      0083B3                        769 __tm1637ClkLow:
                                    770 ;	beep.c: 294: PD_ODR &= ~(1 << 2);
      0083B3 AE 50 0F         [ 2]  771 	ldw	x, #0x500f
      0083B6 F6               [ 1]  772 	ld	a, (x)
      0083B7 A4 FB            [ 1]  773 	and	a, #0xfb
      0083B9 F7               [ 1]  774 	ld	(x), a
      0083BA 81               [ 4]  775 	ret
                                    776 ;	beep.c: 300: void _tm1637DioHigh(void)
                                    777 ;	-----------------------------------------
                                    778 ;	 function _tm1637DioHigh
                                    779 ;	-----------------------------------------
      0083BB                        780 __tm1637DioHigh:
                                    781 ;	beep.c: 304: PD_ODR |= 1 << 3;
      0083BB AE 50 0F         [ 2]  782 	ldw	x, #0x500f
      0083BE F6               [ 1]  783 	ld	a, (x)
      0083BF AA 08            [ 1]  784 	or	a, #0x08
      0083C1 F7               [ 1]  785 	ld	(x), a
      0083C2 81               [ 4]  786 	ret
                                    787 ;	beep.c: 308: void _tm1637DioLow(void)
                                    788 ;	-----------------------------------------
                                    789 ;	 function _tm1637DioLow
                                    790 ;	-----------------------------------------
      0083C3                        791 __tm1637DioLow:
                                    792 ;	beep.c: 310: PD_ODR &= ~(1 << 3);
      0083C3 AE 50 0F         [ 2]  793 	ldw	x, #0x500f
      0083C6 F6               [ 1]  794 	ld	a, (x)
      0083C7 A4 F7            [ 1]  795 	and	a, #0xf7
      0083C9 F7               [ 1]  796 	ld	(x), a
      0083CA 81               [ 4]  797 	ret
                                    798 ;	beep.c: 325: void rt_one_second_increment (st_time *t) {
                                    799 ;	-----------------------------------------
                                    800 ;	 function rt_one_second_increment
                                    801 ;	-----------------------------------------
      0083CB                        802 _rt_one_second_increment:
      0083CB 52 08            [ 2]  803 	sub	sp, #8
                                    804 ;	beep.c: 326: ++t->ticker; //   
      0083CD 16 0B            [ 2]  805 	ldw	y, (0x0b, sp)
      0083CF 17 01            [ 2]  806 	ldw	(0x01, sp), y
      0083D1 1E 01            [ 2]  807 	ldw	x, (0x01, sp)
      0083D3 1C 00 04         [ 2]  808 	addw	x, #0x0004
      0083D6 1F 03            [ 2]  809 	ldw	(0x03, sp), x
      0083D8 1E 03            [ 2]  810 	ldw	x, (0x03, sp)
      0083DA E6 03            [ 1]  811 	ld	a, (0x3, x)
      0083DC 90 97            [ 1]  812 	ld	yl, a
      0083DE E6 02            [ 1]  813 	ld	a, (0x2, x)
      0083E0 FE               [ 2]  814 	ldw	x, (x)
      0083E1 90 95            [ 1]  815 	ld	yh, a
      0083E3 72 A9 00 01      [ 2]  816 	addw	y, #0x0001
      0083E7 9F               [ 1]  817 	ld	a, xl
      0083E8 A9 00            [ 1]  818 	adc	a, #0x00
      0083EA 6B 06            [ 1]  819 	ld	(0x06, sp), a
      0083EC 9E               [ 1]  820 	ld	a, xh
      0083ED A9 00            [ 1]  821 	adc	a, #0x00
      0083EF 6B 05            [ 1]  822 	ld	(0x05, sp), a
      0083F1 1E 03            [ 2]  823 	ldw	x, (0x03, sp)
      0083F3 EF 02            [ 2]  824 	ldw	(0x2, x), y
      0083F5 16 05            [ 2]  825 	ldw	y, (0x05, sp)
      0083F7 FF               [ 2]  826 	ldw	(x), y
                                    827 ;	beep.c: 327: if(++t->second > 59) {
      0083F8 1E 01            [ 2]  828 	ldw	x, (0x01, sp)
      0083FA F6               [ 1]  829 	ld	a, (x)
      0083FB 4C               [ 1]  830 	inc	a
      0083FC F7               [ 1]  831 	ld	(x), a
      0083FD A1 3B            [ 1]  832 	cp	a, #0x3b
      0083FF 23 1A            [ 2]  833 	jrule	00107$
                                    834 ;	beep.c: 328: t->second= 0;
      008401 1E 01            [ 2]  835 	ldw	x, (0x01, sp)
      008403 7F               [ 1]  836 	clr	(x)
                                    837 ;	beep.c: 329: if(++t->minute > 59) {
      008404 1E 01            [ 2]  838 	ldw	x, (0x01, sp)
      008406 5C               [ 2]  839 	incw	x
      008407 F6               [ 1]  840 	ld	a, (x)
      008408 4C               [ 1]  841 	inc	a
      008409 F7               [ 1]  842 	ld	(x), a
      00840A A1 3B            [ 1]  843 	cp	a, #0x3b
      00840C 23 0D            [ 2]  844 	jrule	00107$
                                    845 ;	beep.c: 330: t->minute= 0;
      00840E 7F               [ 1]  846 	clr	(x)
                                    847 ;	beep.c: 331: if(++t->hour > 23) {
      00840F 1E 01            [ 2]  848 	ldw	x, (0x01, sp)
      008411 5C               [ 2]  849 	incw	x
      008412 5C               [ 2]  850 	incw	x
      008413 F6               [ 1]  851 	ld	a, (x)
      008414 4C               [ 1]  852 	inc	a
      008415 F7               [ 1]  853 	ld	(x), a
      008416 A1 17            [ 1]  854 	cp	a, #0x17
      008418 23 01            [ 2]  855 	jrule	00107$
                                    856 ;	beep.c: 332: t->hour= 0;
      00841A 7F               [ 1]  857 	clr	(x)
      00841B                        858 00107$:
      00841B 5B 08            [ 2]  859 	addw	sp, #8
      00841D 81               [ 4]  860 	ret
                                    861 ;	beep.c: 342: void timer_isr(void) __interrupt(BEEP_ISR) {
                                    862 ;	-----------------------------------------
                                    863 ;	 function timer_isr
                                    864 ;	-----------------------------------------
      00841E                        865 _timer_isr:
                                    866 ;	beep.c: 343: if (++internteller > 500) {
      00841E CE 00 09         [ 2]  867 	ldw	x, _internteller+0
      008421 5C               [ 2]  868 	incw	x
      008422 CF 00 09         [ 2]  869 	ldw	_internteller+0, x
      008425 A3 01 F4         [ 2]  870 	cpw	x, #0x01f4
      008428 23 11            [ 2]  871 	jrule	00103$
                                    872 ;	beep.c: 344: internteller=0;
      00842A 72 5F 00 0A      [ 1]  873 	clr	_internteller+1
      00842E 72 5F 00 09      [ 1]  874 	clr	_internteller+0
                                    875 ;	beep.c: 345: rt_one_second_increment(&real_time);
      008432 AE 00 01         [ 2]  876 	ldw	x, #_real_time+0
      008435 89               [ 2]  877 	pushw	x
      008436 CD 83 CB         [ 4]  878 	call	_rt_one_second_increment
      008439 5B 02            [ 2]  879 	addw	sp, #2
      00843B                        880 00103$:
      00843B 80               [11]  881 	iret
                                    882 ;	beep.c: 396: void SetDefaultValues()
                                    883 ;	-----------------------------------------
                                    884 ;	 function SetDefaultValues
                                    885 ;	-----------------------------------------
      00843C                        886 _SetDefaultValues:
      00843C 52 0E            [ 2]  887 	sub	sp, #14
                                    888 ;	beep.c: 403: FLASH_DUKR = FLASH_DUKR_KEY1;
      00843E AE 50 64         [ 2]  889 	ldw	x, #0x5064
      008441 A6 AE            [ 1]  890 	ld	a, #0xae
      008443 F7               [ 1]  891 	ld	(x), a
                                    892 ;	beep.c: 404: FLASH_DUKR = FLASH_DUKR_KEY2;
      008444 AE 50 64         [ 2]  893 	ldw	x, #0x5064
      008447 A6 56            [ 1]  894 	ld	a, #0x56
      008449 F7               [ 1]  895 	ld	(x), a
                                    896 ;	beep.c: 413: *addrss++ = (char) numberOfValues;
      00844A AE 40 00         [ 2]  897 	ldw	x, #0x4000
      00844D C6 00 20         [ 1]  898 	ld	a, _numberOfValues+0
      008450 F7               [ 1]  899 	ld	(x), a
      008451 AE 40 01         [ 2]  900 	ldw	x, #0x4001
      008454 1F 03            [ 2]  901 	ldw	(0x03, sp), x
                                    902 ;	beep.c: 414: for (index = 0; index < numberOfValues; index++)
      008456 AE 00 0B         [ 2]  903 	ldw	x, #__pulseLength+0
      008459 1F 09            [ 2]  904 	ldw	(0x09, sp), x
      00845B AE 00 19         [ 2]  905 	ldw	x, #__onOrOff+0
      00845E 1F 0D            [ 2]  906 	ldw	(0x0d, sp), x
      008460 5F               [ 1]  907 	clrw	x
      008461 1F 01            [ 2]  908 	ldw	(0x01, sp), x
      008463                        909 00103$:
      008463 C6 00 20         [ 1]  910 	ld	a, _numberOfValues+0
      008466 6B 06            [ 1]  911 	ld	(0x06, sp), a
      008468 7B 06            [ 1]  912 	ld	a, (0x06, sp)
      00846A 49               [ 1]  913 	rlc	a
      00846B 4F               [ 1]  914 	clr	a
      00846C A2 00            [ 1]  915 	sbc	a, #0x00
      00846E 6B 05            [ 1]  916 	ld	(0x05, sp), a
      008470 1E 01            [ 2]  917 	ldw	x, (0x01, sp)
      008472 13 05            [ 2]  918 	cpw	x, (0x05, sp)
      008474 2E 30            [ 1]  919 	jrsge	00105$
                                    920 ;	beep.c: 416: *addrss++ = (char) (_pulseLength[index] & 0xff);
      008476 16 01            [ 2]  921 	ldw	y, (0x01, sp)
      008478 90 58            [ 2]  922 	sllw	y
      00847A 72 F9 09         [ 2]  923 	addw	y, (0x09, sp)
      00847D 93               [ 1]  924 	ldw	x, y
      00847E FE               [ 2]  925 	ldw	x, (x)
      00847F 4F               [ 1]  926 	clr	a
      008480 95               [ 1]  927 	ld	xh, a
      008481 9F               [ 1]  928 	ld	a, xl
      008482 1E 03            [ 2]  929 	ldw	x, (0x03, sp)
      008484 F7               [ 1]  930 	ld	(x), a
      008485 1E 03            [ 2]  931 	ldw	x, (0x03, sp)
      008487 5C               [ 2]  932 	incw	x
                                    933 ;	beep.c: 417: *addrss++ = (char) ((_pulseLength[index] >> 8) & 0xff);
      008488 90 FE            [ 2]  934 	ldw	y, (y)
      00848A 90 9E            [ 1]  935 	ld	a, yh
      00848C 0F 07            [ 1]  936 	clr	(0x07, sp)
      00848E 88               [ 1]  937 	push	a
      00848F 0F 0C            [ 1]  938 	clr	(0x0c, sp)
      008491 84               [ 1]  939 	pop	a
      008492 F7               [ 1]  940 	ld	(x), a
      008493 5C               [ 2]  941 	incw	x
                                    942 ;	beep.c: 418: *addrss++ = _onOrOff[index];
      008494 16 0D            [ 2]  943 	ldw	y, (0x0d, sp)
      008496 72 F9 01         [ 2]  944 	addw	y, (0x01, sp)
      008499 90 F6            [ 1]  945 	ld	a, (y)
      00849B F7               [ 1]  946 	ld	(x), a
      00849C 5C               [ 2]  947 	incw	x
      00849D 1F 03            [ 2]  948 	ldw	(0x03, sp), x
                                    949 ;	beep.c: 414: for (index = 0; index < numberOfValues; index++)
      00849F 1E 01            [ 2]  950 	ldw	x, (0x01, sp)
      0084A1 5C               [ 2]  951 	incw	x
      0084A2 1F 01            [ 2]  952 	ldw	(0x01, sp), x
      0084A4 20 BD            [ 2]  953 	jra	00103$
      0084A6                        954 00105$:
      0084A6 5B 0E            [ 2]  955 	addw	sp, #14
      0084A8 81               [ 4]  956 	ret
                                    957 ;	beep.c: 462: int main () {
                                    958 ;	-----------------------------------------
                                    959 ;	 function main
                                    960 ;	-----------------------------------------
      0084A9                        961 _main:
      0084A9 52 33            [ 2]  962 	sub	sp, #51
                                    963 ;	beep.c: 466: u8 startmeting=0;	
      0084AB 0F 11            [ 1]  964 	clr	(0x11, sp)
                                    965 ;	beep.c: 467: unsigned int val=0, current,periode;
      0084AD 5F               [ 1]  966 	clrw	x
      0084AE 1F 20            [ 2]  967 	ldw	(0x20, sp), x
                                    968 ;	beep.c: 469: InitializeSystemClock();
      0084B0 CD 80 A8         [ 4]  969 	call	_InitializeSystemClock
                                    970 ;	beep.c: 486: SetDefaultValues();
      0084B3 CD 84 3C         [ 4]  971 	call	_SetDefaultValues
                                    972 ;	beep.c: 488: BEEP_CSR = (0<<7) | (0<<6) | (1<<5) | 0x1E;
      0084B6 AE 50 F3         [ 2]  973 	ldw	x, #0x50f3
      0084B9 A6 3E            [ 1]  974 	ld	a, #0x3e
      0084BB F7               [ 1]  975 	ld	(x), a
                                    976 ;	beep.c: 489: PD_DDR = (1 << 3) | (1 << 2); // output mode
      0084BC AE 50 11         [ 2]  977 	ldw	x, #0x5011
      0084BF A6 0C            [ 1]  978 	ld	a, #0x0c
      0084C1 F7               [ 1]  979 	ld	(x), a
                                    980 ;	beep.c: 491: PD_DDR &=  ~(1 << 4); //PD4 input
      0084C2 AE 50 11         [ 2]  981 	ldw	x, #0x5011
      0084C5 F6               [ 1]  982 	ld	a, (x)
      0084C6 A4 EF            [ 1]  983 	and	a, #0xef
      0084C8 F7               [ 1]  984 	ld	(x), a
                                    985 ;	beep.c: 493: PD_CR1 = (1 << 3) | (1 << 2); // push-pull
      0084C9 AE 50 12         [ 2]  986 	ldw	x, #0x5012
      0084CC A6 0C            [ 1]  987 	ld	a, #0x0c
      0084CE F7               [ 1]  988 	ld	(x), a
                                    989 ;	beep.c: 494: PD_CR1 &= ~(1 << 4); // input with float
      0084CF AE 50 12         [ 2]  990 	ldw	x, #0x5012
      0084D2 F6               [ 1]  991 	ld	a, (x)
      0084D3 A4 EF            [ 1]  992 	and	a, #0xef
      0084D5 F7               [ 1]  993 	ld	(x), a
                                    994 ;	beep.c: 495: PD_CR2 = (1 << 3) | (1 << 2) | (1<< 4); // up to 10MHz speed + interrupt enabled 
      0084D6 AE 50 13         [ 2]  995 	ldw	x, #0x5013
      0084D9 A6 1C            [ 1]  996 	ld	a, #0x1c
      0084DB F7               [ 1]  997 	ld	(x), a
                                    998 ;	beep.c: 497: EXTI_CR1 = (1<<7); //Port D external sensitivity bits7:6 10: Falling edge only
      0084DC AE 50 A0         [ 2]  999 	ldw	x, #0x50a0
      0084DF A6 80            [ 1] 1000 	ld	a, #0x80
      0084E1 F7               [ 1] 1001 	ld	(x), a
                                   1002 ;	beep.c: 498: EXTI_CR1 &= ~(1<<6); //Port D external sensitivity bits7:6 10: Falling edge only
      0084E2 AE 50 A0         [ 2] 1003 	ldw	x, #0x50a0
      0084E5 F6               [ 1] 1004 	ld	a, (x)
      0084E6 A4 BF            [ 1] 1005 	and	a, #0xbf
      0084E8 F7               [ 1] 1006 	ld	(x), a
                                   1007 ;	beep.c: 501: tijd = &real_time;
      0084E9 AE 00 01         [ 2] 1008 	ldw	x, #_real_time+0
      0084EC 1F 24            [ 2] 1009 	ldw	(0x24, sp), x
      0084EE 7B 24            [ 1] 1010 	ld	a, (0x24, sp)
      0084F0 88               [ 1] 1011 	push	a
      0084F1 7B 26            [ 1] 1012 	ld	a, (0x26, sp)
      0084F3 6B 05            [ 1] 1013 	ld	(0x05, sp), a
      0084F5 84               [ 1] 1014 	pop	a
      0084F6 6B 03            [ 1] 1015 	ld	(0x03, sp), a
                                   1016 ;	beep.c: 506: tm1637Init();
      0084F8 CD 82 67         [ 4] 1017 	call	_tm1637Init
                                   1018 ;	beep.c: 508: InitializeUART();
      0084FB CD 81 EE         [ 4] 1019 	call	_InitializeUART
                                   1020 ;	beep.c: 512: __asm__("rim");
      0084FE 9A               [ 1] 1021 	rim
                                   1022 ;	beep.c: 516: while (1) {
      0084FF AE 00 01         [ 2] 1023 	ldw	x, #0x0001
      008502 1F 22            [ 2] 1024 	ldw	(0x22, sp), x
      008504                       1025 00112$:
                                   1026 ;	beep.c: 517: ADC_CR1 |= ADC_ADON; // ADC ON
      008504 72 10 54 01      [ 1] 1027 	bset	0x5401, #0
                                   1028 ;	beep.c: 518: ADC_CSR |= ((0x0F)&2); // select channel = 2 = PC4
      008508 AE 54 00         [ 2] 1029 	ldw	x, #0x5400
      00850B F6               [ 1] 1030 	ld	a, (x)
      00850C AA 02            [ 1] 1031 	or	a, #0x02
      00850E F7               [ 1] 1032 	ld	(x), a
                                   1033 ;	beep.c: 519: ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
      00850F AE 54 02         [ 2] 1034 	ldw	x, #0x5402
      008512 F6               [ 1] 1035 	ld	a, (x)
      008513 AA 08            [ 1] 1036 	or	a, #0x08
      008515 F7               [ 1] 1037 	ld	(x), a
                                   1038 ;	beep.c: 520: ADC_CR1 |= ADC_ADON; // start conversion
      008516 72 10 54 01      [ 1] 1039 	bset	0x5401, #0
                                   1040 ;	beep.c: 521: while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC
      00851A                       1041 00101$:
      00851A AE 54 00         [ 2] 1042 	ldw	x, #0x5400
      00851D F6               [ 1] 1043 	ld	a, (x)
      00851E 48               [ 1] 1044 	sll	a
      00851F 24 F9            [ 1] 1045 	jrnc	00101$
                                   1046 ;	beep.c: 523: val |= (unsigned int)ADC_DRL;
      008521 AE 54 05         [ 2] 1047 	ldw	x, #0x5405
      008524 F6               [ 1] 1048 	ld	a, (x)
      008525 5F               [ 1] 1049 	clrw	x
      008526 97               [ 1] 1050 	ld	xl, a
      008527 1A 21            [ 1] 1051 	or	a, (0x21, sp)
      008529 6B 1F            [ 1] 1052 	ld	(0x1f, sp), a
      00852B 9E               [ 1] 1053 	ld	a, xh
      00852C 1A 20            [ 1] 1054 	or	a, (0x20, sp)
      00852E 6B 01            [ 1] 1055 	ld	(0x01, sp), a
      008530 7B 1F            [ 1] 1056 	ld	a, (0x1f, sp)
      008532 6B 02            [ 1] 1057 	ld	(0x02, sp), a
                                   1058 ;	beep.c: 525: val |= (unsigned int)ADC_DRH<<8;
      008534 AE 54 04         [ 2] 1059 	ldw	x, #0x5404
      008537 F6               [ 1] 1060 	ld	a, (x)
      008538 5F               [ 1] 1061 	clrw	x
      008539 97               [ 1] 1062 	ld	xl, a
      00853A 58               [ 2] 1063 	sllw	x
      00853B 58               [ 2] 1064 	sllw	x
      00853C 58               [ 2] 1065 	sllw	x
      00853D 58               [ 2] 1066 	sllw	x
      00853E 58               [ 2] 1067 	sllw	x
      00853F 58               [ 2] 1068 	sllw	x
      008540 58               [ 2] 1069 	sllw	x
      008541 58               [ 2] 1070 	sllw	x
      008542 9F               [ 1] 1071 	ld	a, xl
      008543 1A 02            [ 1] 1072 	or	a, (0x02, sp)
      008545 6B 1D            [ 1] 1073 	ld	(0x1d, sp), a
      008547 9E               [ 1] 1074 	ld	a, xh
      008548 1A 01            [ 1] 1075 	or	a, (0x01, sp)
      00854A 6B 20            [ 1] 1076 	ld	(0x20, sp), a
      00854C 7B 1D            [ 1] 1077 	ld	a, (0x1d, sp)
      00854E 6B 21            [ 1] 1078 	ld	(0x21, sp), a
                                   1079 ;	beep.c: 526: ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
      008550 AE 54 01         [ 2] 1080 	ldw	x, #0x5401
      008553 F6               [ 1] 1081 	ld	a, (x)
      008554 A4 FE            [ 1] 1082 	and	a, #0xfe
      008556 F7               [ 1] 1083 	ld	(x), a
                                   1084 ;	beep.c: 527: current = val & 0x03ff;
      008557 7B 21            [ 1] 1085 	ld	a, (0x21, sp)
      008559 6B 10            [ 1] 1086 	ld	(0x10, sp), a
      00855B 7B 20            [ 1] 1087 	ld	a, (0x20, sp)
      00855D A4 03            [ 1] 1088 	and	a, #0x03
      00855F 6B 0F            [ 1] 1089 	ld	(0x0f, sp), a
                                   1090 ;	beep.c: 533: starttijd.hour = real_time.hour;
      008561 1E 24            [ 2] 1091 	ldw	x, (0x24, sp)
      008563 5C               [ 2] 1092 	incw	x
      008564 5C               [ 2] 1093 	incw	x
      008565 1F 1A            [ 2] 1094 	ldw	(0x1a, sp), x
                                   1095 ;	beep.c: 534: starttijd.ticker = real_time.ticker;
      008567 1E 24            [ 2] 1096 	ldw	x, (0x24, sp)
      008569 1C 00 04         [ 2] 1097 	addw	x, #0x0004
      00856C 1F 18            [ 2] 1098 	ldw	(0x18, sp), x
                                   1099 ;	beep.c: 529: if (current > MIN_CURRENT){ //start timing current consumption
      00856E 1E 0F            [ 2] 1100 	ldw	x, (0x0f, sp)
      008570 A3 00 0A         [ 2] 1101 	cpw	x, #0x000a
      008573 23 3F            [ 2] 1102 	jrule	00105$
                                   1103 ;	beep.c: 531: starttijd.second = real_time.second;
      008575 96               [ 1] 1104 	ldw	x, sp
      008576 1C 00 05         [ 2] 1105 	addw	x, #5
      008579 16 24            [ 2] 1106 	ldw	y, (0x24, sp)
      00857B 90 F6            [ 1] 1107 	ld	a, (y)
      00857D F7               [ 1] 1108 	ld	(x), a
                                   1109 ;	beep.c: 532: starttijd.minute = real_time.minute;
      00857E 96               [ 1] 1110 	ldw	x, sp
      00857F 1C 00 05         [ 2] 1111 	addw	x, #5
      008582 1F 16            [ 2] 1112 	ldw	(0x16, sp), x
      008584 1E 16            [ 2] 1113 	ldw	x, (0x16, sp)
      008586 5C               [ 2] 1114 	incw	x
      008587 16 24            [ 2] 1115 	ldw	y, (0x24, sp)
      008589 90 E6 01         [ 1] 1116 	ld	a, (0x1, y)
      00858C F7               [ 1] 1117 	ld	(x), a
                                   1118 ;	beep.c: 533: starttijd.hour = real_time.hour;
      00858D 1E 16            [ 2] 1119 	ldw	x, (0x16, sp)
      00858F 5C               [ 2] 1120 	incw	x
      008590 5C               [ 2] 1121 	incw	x
      008591 16 1A            [ 2] 1122 	ldw	y, (0x1a, sp)
      008593 90 F6            [ 1] 1123 	ld	a, (y)
      008595 F7               [ 1] 1124 	ld	(x), a
                                   1125 ;	beep.c: 534: starttijd.ticker = real_time.ticker;
      008596 1E 16            [ 2] 1126 	ldw	x, (0x16, sp)
      008598 1C 00 04         [ 2] 1127 	addw	x, #0x0004
      00859B 16 18            [ 2] 1128 	ldw	y, (0x18, sp)
      00859D 90 E6 03         [ 1] 1129 	ld	a, (0x3, y)
      0085A0 88               [ 1] 1130 	push	a
      0085A1 90 E6 02         [ 1] 1131 	ld	a, (0x2, y)
      0085A4 6B 15            [ 1] 1132 	ld	(0x15, sp), a
      0085A6 90 FE            [ 2] 1133 	ldw	y, (y)
      0085A8 84               [ 1] 1134 	pop	a
      0085A9 E7 03            [ 1] 1135 	ld	(0x3, x), a
      0085AB 7B 14            [ 1] 1136 	ld	a, (0x14, sp)
      0085AD E7 02            [ 1] 1137 	ld	(0x2, x), a
      0085AF FF               [ 2] 1138 	ldw	(x), y
                                   1139 ;	beep.c: 535: startmeting = 1;
      0085B0 A6 01            [ 1] 1140 	ld	a, #0x01
      0085B2 6B 11            [ 1] 1141 	ld	(0x11, sp), a
      0085B4                       1142 00105$:
                                   1143 ;	beep.c: 537: if ((current < MIN_CURRENT) && (startmeting)) //stop timing current consumption
      0085B4 1E 0F            [ 2] 1144 	ldw	x, (0x0f, sp)
      0085B6 A3 00 0A         [ 2] 1145 	cpw	x, #0x000a
      0085B9 24 49            [ 1] 1146 	jrnc	00107$
      0085BB 0D 11            [ 1] 1147 	tnz	(0x11, sp)
      0085BD 27 45            [ 1] 1148 	jreq	00107$
                                   1149 ;	beep.c: 539: periode += real_time.ticker - starttijd.ticker; //periode in seconds that application draws current
      0085BF 1E 18            [ 2] 1150 	ldw	x, (0x18, sp)
      0085C1 E6 03            [ 1] 1151 	ld	a, (0x3, x)
      0085C3 90 97            [ 1] 1152 	ld	yl, a
      0085C5 E6 02            [ 1] 1153 	ld	a, (0x2, x)
      0085C7 90 95            [ 1] 1154 	ld	yh, a
      0085C9 FE               [ 2] 1155 	ldw	x, (x)
      0085CA 1F 30            [ 2] 1156 	ldw	(0x30, sp), x
      0085CC 96               [ 1] 1157 	ldw	x, sp
      0085CD 1C 00 09         [ 2] 1158 	addw	x, #9
      0085D0 E6 03            [ 1] 1159 	ld	a, (0x3, x)
      0085D2 6B 2F            [ 1] 1160 	ld	(0x2f, sp), a
      0085D4 E6 02            [ 1] 1161 	ld	a, (0x2, x)
      0085D6 6B 2E            [ 1] 1162 	ld	(0x2e, sp), a
      0085D8 FE               [ 2] 1163 	ldw	x, (x)
      0085D9 72 F2 2E         [ 2] 1164 	subw	y, (0x2e, sp)
      0085DC 7B 31            [ 1] 1165 	ld	a, (0x31, sp)
      0085DE 89               [ 2] 1166 	pushw	x
      0085DF 12 02            [ 1] 1167 	sbc	a, (#2, sp)
      0085E1 85               [ 2] 1168 	popw	x
      0085E2 88               [ 1] 1169 	push	a
      0085E3 7B 31            [ 1] 1170 	ld	a, (0x31, sp)
      0085E5 89               [ 2] 1171 	pushw	x
      0085E6 12 01            [ 1] 1172 	sbc	a, (#1, sp)
      0085E8 85               [ 2] 1173 	popw	x
      0085E9 97               [ 1] 1174 	ld	xl, a
      0085EA 7B 28            [ 1] 1175 	ld	a, (0x28, sp)
      0085EC 6B 2C            [ 1] 1176 	ld	(0x2c, sp), a
      0085EE 7B 27            [ 1] 1177 	ld	a, (0x27, sp)
      0085F0 6B 2B            [ 1] 1178 	ld	(0x2b, sp), a
      0085F2 84               [ 1] 1179 	pop	a
      0085F3 0F 29            [ 1] 1180 	clr	(0x29, sp)
      0085F5 0F 28            [ 1] 1181 	clr	(0x28, sp)
      0085F7 72 F9 2A         [ 2] 1182 	addw	y, (0x2a, sp)
      0085FA 19 29            [ 1] 1183 	adc	a, (0x29, sp)
      0085FC 95               [ 1] 1184 	ld	xh, a
      0085FD 9F               [ 1] 1185 	ld	a, xl
      0085FE 19 28            [ 1] 1186 	adc	a, (0x28, sp)
      008600 17 26            [ 2] 1187 	ldw	(0x26, sp), y
                                   1188 ;	beep.c: 540: startmeting = 0;
      008602 0F 11            [ 1] 1189 	clr	(0x11, sp)
      008604                       1190 00107$:
                                   1191 ;	beep.c: 542: if (real_time.hour == urenteller)
      008604 1E 1A            [ 2] 1192 	ldw	x, (0x1a, sp)
      008606 F6               [ 1] 1193 	ld	a, (x)
      008607 5F               [ 1] 1194 	clrw	x
      008608 97               [ 1] 1195 	ld	xl, a
      008609 13 22            [ 2] 1196 	cpw	x, (0x22, sp)
      00860B 26 08            [ 1] 1197 	jrne	00110$
                                   1198 ;	beep.c: 543: {       ++urenteller;
      00860D 1E 22            [ 2] 1199 	ldw	x, (0x22, sp)
      00860F 5C               [ 2] 1200 	incw	x
      008610 1F 22            [ 2] 1201 	ldw	(0x22, sp), x
                                   1202 ;	beep.c: 544: periode = 0;
      008612 5F               [ 1] 1203 	clrw	x
      008613 1F 26            [ 2] 1204 	ldw	(0x26, sp), x
      008615                       1205 00110$:
                                   1206 ;	beep.c: 550: tm1637DisplayDecimal(tijd->minute, 0); // display minutes 
      008615 1E 03            [ 2] 1207 	ldw	x, (0x03, sp)
      008617 E6 01            [ 1] 1208 	ld	a, (0x1, x)
      008619 5F               [ 1] 1209 	clrw	x
      00861A 89               [ 2] 1210 	pushw	x
      00861B 88               [ 1] 1211 	push	a
      00861C CD 82 6E         [ 4] 1212 	call	_tm1637DisplayDecimal
      00861F 5B 03            [ 2] 1213 	addw	sp, #3
      008621 CC 85 04         [ 2] 1214 	jp	00112$
      008624 5B 33            [ 2] 1215 	addw	sp, #51
      008626 81               [ 4] 1216 	ret
                                   1217 	.area CODE
      008627                       1218 _segmentMap:
      008627 3F                    1219 	.db #0x3F	;  63
      008628 06                    1220 	.db #0x06	;  6
      008629 5B                    1221 	.db #0x5B	;  91
      00862A 4F                    1222 	.db #0x4F	;  79	'O'
      00862B 66                    1223 	.db #0x66	;  102	'f'
      00862C 6D                    1224 	.db #0x6D	;  109	'm'
      00862D 7D                    1225 	.db #0x7D	;  125
      00862E 07                    1226 	.db #0x07	;  7
      00862F 7F                    1227 	.db #0x7F	;  127
      008630 6F                    1228 	.db #0x6F	;  111	'o'
      008631 77                    1229 	.db #0x77	;  119	'w'
      008632 7C                    1230 	.db #0x7C	;  124
      008633 39                    1231 	.db #0x39	;  57	'9'
      008634 5E                    1232 	.db #0x5E	;  94
      008635 79                    1233 	.db #0x79	;  121	'y'
      008636 71                    1234 	.db #0x71	;  113	'q'
      008637 00                    1235 	.db #0x00	;  0
                                   1236 	.area INITIALIZER
      00868E                       1237 __xinit___pulseLength:
      00868E 07 D0                 1238 	.dw #0x07D0
      008690 6C B6                 1239 	.dw #0x6CB6
      008692 01 90                 1240 	.dw #0x0190
      008694 06 2C                 1241 	.dw #0x062C
      008696 01 90                 1242 	.dw #0x0190
      008698 0D FC                 1243 	.dw #0x0DFC
      00869A 01 90                 1244 	.dw #0x0190
      00869C                       1245 __xinit___onOrOff:
      00869C 01                    1246 	.db #0x01	; 1
      00869D 00                    1247 	.db #0x00	; 0
      00869E 01                    1248 	.db #0x01	; 1
      00869F 00                    1249 	.db #0x00	; 0
      0086A0 01                    1250 	.db #0x01	; 1
      0086A1 00                    1251 	.db #0x00	; 0
      0086A2 01                    1252 	.db #0x01	; 1
      0086A3                       1253 __xinit__numberOfValues:
      0086A3 07                    1254 	.db #0x07	;  7
                                   1255 	.area CABS (ABS)
