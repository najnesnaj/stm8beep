                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.0 #8981 (Jul  5 2014) (Linux)
                                      4 ; This file was generated Sun Apr 23 20:27:52 2017
                                      5 ;--------------------------------------------------------
                                      6 	.module beep
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _segmentMap
                                     13 	.globl _main
                                     14 	.globl _option_bytes_unlock
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
                                     26 	.globl _internteller
                                     27 	.globl _real_time
                                     28 	.globl _tm1637SetBrightness
                                     29 	.globl __tm1637Start
                                     30 	.globl __tm1637Stop
                                     31 	.globl __tm1637ReadResult
                                     32 	.globl __tm1637WriteByte
                                     33 	.globl __tm1637ClkHigh
                                     34 	.globl __tm1637ClkLow
                                     35 	.globl __tm1637DioHigh
                                     36 	.globl __tm1637DioLow
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DATA
      000001                         41 _real_time::
      000001                         42 	.ds 8
      000009                         43 _internteller::
      000009                         44 	.ds 2
                                     45 ;--------------------------------------------------------
                                     46 ; ram data
                                     47 ;--------------------------------------------------------
                                     48 	.area INITIALIZED
                                     49 ;--------------------------------------------------------
                                     50 ; Stack segment in internal ram 
                                     51 ;--------------------------------------------------------
                                     52 	.area	SSEG
      000000                         53 __start__stack:
      000000                         54 	.ds	1
                                     55 
                                     56 ;--------------------------------------------------------
                                     57 ; absolute external ram data
                                     58 ;--------------------------------------------------------
                                     59 	.area DABS (ABS)
                                     60 ;--------------------------------------------------------
                                     61 ; interrupt vector 
                                     62 ;--------------------------------------------------------
                                     63 	.area HOME
      008000                         64 __interrupt_vect:
      008000 82 00 80 83             65 	int s_GSINIT ;reset
      008004 82 00 00 00             66 	int 0x0000 ;trap
      008008 82 00 00 00             67 	int 0x0000 ;int0
      00800C 82 00 00 00             68 	int 0x0000 ;int1
      008010 82 00 00 00             69 	int 0x0000 ;int2
      008014 82 00 00 00             70 	int 0x0000 ;int3
      008018 82 00 00 00             71 	int 0x0000 ;int4
      00801C 82 00 00 00             72 	int 0x0000 ;int5
      008020 82 00 84 1E             73 	int _timer_isr ;int6
      008024 82 00 00 00             74 	int 0x0000 ;int7
      008028 82 00 00 00             75 	int 0x0000 ;int8
      00802C 82 00 00 00             76 	int 0x0000 ;int9
      008030 82 00 00 00             77 	int 0x0000 ;int10
      008034 82 00 00 00             78 	int 0x0000 ;int11
      008038 82 00 00 00             79 	int 0x0000 ;int12
      00803C 82 00 00 00             80 	int 0x0000 ;int13
      008040 82 00 00 00             81 	int 0x0000 ;int14
      008044 82 00 00 00             82 	int 0x0000 ;int15
      008048 82 00 00 00             83 	int 0x0000 ;int16
      00804C 82 00 00 00             84 	int 0x0000 ;int17
      008050 82 00 00 00             85 	int 0x0000 ;int18
      008054 82 00 00 00             86 	int 0x0000 ;int19
      008058 82 00 00 00             87 	int 0x0000 ;int20
      00805C 82 00 00 00             88 	int 0x0000 ;int21
      008060 82 00 00 00             89 	int 0x0000 ;int22
      008064 82 00 00 00             90 	int 0x0000 ;int23
      008068 82 00 00 00             91 	int 0x0000 ;int24
      00806C 82 00 00 00             92 	int 0x0000 ;int25
      008070 82 00 00 00             93 	int 0x0000 ;int26
      008074 82 00 00 00             94 	int 0x0000 ;int27
      008078 82 00 00 00             95 	int 0x0000 ;int28
      00807C 82 00 00 00             96 	int 0x0000 ;int29
                                     97 ;--------------------------------------------------------
                                     98 ; global & static initialisations
                                     99 ;--------------------------------------------------------
                                    100 	.area HOME
                                    101 	.area GSINIT
                                    102 	.area GSFINAL
                                    103 	.area GSINIT
      008083                        104 __sdcc_gs_init_startup:
      008083                        105 __sdcc_init_data:
                                    106 ; stm8_genXINIT() start
      008083 AE 00 0A         [ 2]  107 	ldw x, #l_DATA
      008086 27 07            [ 1]  108 	jreq	00002$
      008088                        109 00001$:
      008088 72 4F 00 00      [ 1]  110 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  111 	decw x
      00808D 26 F9            [ 1]  112 	jrne	00001$
      00808F                        113 00002$:
      00808F AE 00 00         [ 2]  114 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  115 	jreq	00004$
      008094                        116 00003$:
      008094 D6 86 14         [ 1]  117 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 0A         [ 1]  118 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  119 	decw	x
      00809B 26 F7            [ 1]  120 	jrne	00003$
      00809D                        121 00004$:
                                    122 ; stm8_genXINIT() end
                                    123 	.area GSFINAL
      00809D CC 80 80         [ 2]  124 	jp	__sdcc_program_startup
                                    125 ;--------------------------------------------------------
                                    126 ; Home
                                    127 ;--------------------------------------------------------
                                    128 	.area HOME
                                    129 	.area HOME
      008080                        130 __sdcc_program_startup:
      008080 CC 84 45         [ 2]  131 	jp	_main
                                    132 ;	return from main will return to caller
                                    133 ;--------------------------------------------------------
                                    134 ; code
                                    135 ;--------------------------------------------------------
                                    136 	.area CODE
                                    137 ;	beep.c: 27: void delayTenMicro (void) {
                                    138 ;	-----------------------------------------
                                    139 ;	 function delayTenMicro
                                    140 ;	-----------------------------------------
      0080A0                        141 _delayTenMicro:
                                    142 ;	beep.c: 29: for (a = 0; a < 50; ++a)
      0080A0 A6 32            [ 1]  143 	ld	a, #0x32
      0080A2                        144 00104$:
                                    145 ;	beep.c: 30: __asm__("nop");
      0080A2 9D               [ 1]  146 	nop
      0080A3 4A               [ 1]  147 	dec	a
                                    148 ;	beep.c: 29: for (a = 0; a < 50; ++a)
      0080A4 4D               [ 1]  149 	tnz	a
      0080A5 26 FB            [ 1]  150 	jrne	00104$
      0080A7 81               [ 4]  151 	ret
                                    152 ;	beep.c: 33: void InitializeSystemClock() {
                                    153 ;	-----------------------------------------
                                    154 ;	 function InitializeSystemClock
                                    155 ;	-----------------------------------------
      0080A8                        156 _InitializeSystemClock:
                                    157 ;	beep.c: 34: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
      0080A8 AE 50 C0         [ 2]  158 	ldw	x, #0x50c0
      0080AB 7F               [ 1]  159 	clr	(x)
                                    160 ;	beep.c: 35: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
      0080AC AE 50 C0         [ 2]  161 	ldw	x, #0x50c0
      0080AF A6 01            [ 1]  162 	ld	a, #0x01
      0080B1 F7               [ 1]  163 	ld	(x), a
                                    164 ;	beep.c: 36: CLK_ECKR = 0;                       //  Disable the external clock.
      0080B2 AE 50 C1         [ 2]  165 	ldw	x, #0x50c1
      0080B5 7F               [ 1]  166 	clr	(x)
                                    167 ;	beep.c: 37: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
      0080B6                        168 00101$:
      0080B6 AE 50 C0         [ 2]  169 	ldw	x, #0x50c0
      0080B9 F6               [ 1]  170 	ld	a, (x)
      0080BA A5 02            [ 1]  171 	bcp	a, #0x02
      0080BC 27 F8            [ 1]  172 	jreq	00101$
                                    173 ;	beep.c: 38: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
      0080BE AE 50 C6         [ 2]  174 	ldw	x, #0x50c6
      0080C1 7F               [ 1]  175 	clr	(x)
                                    176 ;	beep.c: 39: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
      0080C2 AE 50 C7         [ 2]  177 	ldw	x, #0x50c7
      0080C5 A6 FF            [ 1]  178 	ld	a, #0xff
      0080C7 F7               [ 1]  179 	ld	(x), a
                                    180 ;	beep.c: 40: CLK_PCKENR2 = 0xff;                 //  Ditto.
      0080C8 AE 50 CA         [ 2]  181 	ldw	x, #0x50ca
      0080CB A6 FF            [ 1]  182 	ld	a, #0xff
      0080CD F7               [ 1]  183 	ld	(x), a
                                    184 ;	beep.c: 41: CLK_CCOR = 0;                       //  Turn off CCO.
      0080CE AE 50 C9         [ 2]  185 	ldw	x, #0x50c9
      0080D1 7F               [ 1]  186 	clr	(x)
                                    187 ;	beep.c: 42: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
      0080D2 AE 50 CC         [ 2]  188 	ldw	x, #0x50cc
      0080D5 7F               [ 1]  189 	clr	(x)
                                    190 ;	beep.c: 43: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
      0080D6 AE 50 CD         [ 2]  191 	ldw	x, #0x50cd
      0080D9 7F               [ 1]  192 	clr	(x)
                                    193 ;	beep.c: 44: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
      0080DA AE 50 C4         [ 2]  194 	ldw	x, #0x50c4
      0080DD A6 E1            [ 1]  195 	ld	a, #0xe1
      0080DF F7               [ 1]  196 	ld	(x), a
                                    197 ;	beep.c: 45: CLK_SWCR = 0;                       //  Reset the clock switch control register.
      0080E0 AE 50 C5         [ 2]  198 	ldw	x, #0x50c5
      0080E3 7F               [ 1]  199 	clr	(x)
                                    200 ;	beep.c: 46: CLK_SWCR = CLK_SWEN;                //  Enable switching.
      0080E4 AE 50 C5         [ 2]  201 	ldw	x, #0x50c5
      0080E7 A6 02            [ 1]  202 	ld	a, #0x02
      0080E9 F7               [ 1]  203 	ld	(x), a
                                    204 ;	beep.c: 47: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
      0080EA                        205 00104$:
      0080EA AE 50 C5         [ 2]  206 	ldw	x, #0x50c5
      0080ED F6               [ 1]  207 	ld	a, (x)
      0080EE 44               [ 1]  208 	srl	a
      0080EF 25 F9            [ 1]  209 	jrc	00104$
      0080F1 81               [ 4]  210 	ret
                                    211 ;	beep.c: 49: void delay (int time_ms) {
                                    212 ;	-----------------------------------------
                                    213 ;	 function delay
                                    214 ;	-----------------------------------------
      0080F2                        215 _delay:
      0080F2 52 0A            [ 2]  216 	sub	sp, #10
                                    217 ;	beep.c: 51: for (x = 0; x < 1036*time_ms; ++x)
      0080F4 5F               [ 1]  218 	clrw	x
      0080F5 1F 03            [ 2]  219 	ldw	(0x03, sp), x
      0080F7 1F 01            [ 2]  220 	ldw	(0x01, sp), x
      0080F9 1E 0D            [ 2]  221 	ldw	x, (0x0d, sp)
      0080FB 89               [ 2]  222 	pushw	x
      0080FC 4B 0C            [ 1]  223 	push	#0x0c
      0080FE 4B 04            [ 1]  224 	push	#0x04
      008100 CD 85 BF         [ 4]  225 	call	__mulint
      008103 5B 04            [ 2]  226 	addw	sp, #4
      008105 1F 09            [ 2]  227 	ldw	(0x09, sp), x
      008107                        228 00103$:
      008107 16 09            [ 2]  229 	ldw	y, (0x09, sp)
      008109 17 07            [ 2]  230 	ldw	(0x07, sp), y
      00810B 7B 07            [ 1]  231 	ld	a, (0x07, sp)
      00810D 49               [ 1]  232 	rlc	a
      00810E 4F               [ 1]  233 	clr	a
      00810F A2 00            [ 1]  234 	sbc	a, #0x00
      008111 6B 06            [ 1]  235 	ld	(0x06, sp), a
      008113 6B 05            [ 1]  236 	ld	(0x05, sp), a
      008115 1E 03            [ 2]  237 	ldw	x, (0x03, sp)
      008117 13 07            [ 2]  238 	cpw	x, (0x07, sp)
      008119 7B 02            [ 1]  239 	ld	a, (0x02, sp)
      00811B 12 06            [ 1]  240 	sbc	a, (0x06, sp)
      00811D 7B 01            [ 1]  241 	ld	a, (0x01, sp)
      00811F 12 05            [ 1]  242 	sbc	a, (0x05, sp)
      008121 2E 17            [ 1]  243 	jrsge	00105$
                                    244 ;	beep.c: 52: __asm__("nop");
      008123 9D               [ 1]  245 	nop
                                    246 ;	beep.c: 51: for (x = 0; x < 1036*time_ms; ++x)
      008124 16 03            [ 2]  247 	ldw	y, (0x03, sp)
      008126 72 A9 00 01      [ 2]  248 	addw	y, #0x0001
      00812A 7B 02            [ 1]  249 	ld	a, (0x02, sp)
      00812C A9 00            [ 1]  250 	adc	a, #0x00
      00812E 97               [ 1]  251 	ld	xl, a
      00812F 7B 01            [ 1]  252 	ld	a, (0x01, sp)
      008131 A9 00            [ 1]  253 	adc	a, #0x00
      008133 95               [ 1]  254 	ld	xh, a
      008134 17 03            [ 2]  255 	ldw	(0x03, sp), y
      008136 1F 01            [ 2]  256 	ldw	(0x01, sp), x
      008138 20 CD            [ 2]  257 	jra	00103$
      00813A                        258 00105$:
      00813A 5B 0A            [ 2]  259 	addw	sp, #10
      00813C 81               [ 4]  260 	ret
                                    261 ;	beep.c: 55: void UARTPrintF (char *message) {
                                    262 ;	-----------------------------------------
                                    263 ;	 function UARTPrintF
                                    264 ;	-----------------------------------------
      00813D                        265 _UARTPrintF:
                                    266 ;	beep.c: 56: char *ch = message;
      00813D 16 03            [ 2]  267 	ldw	y, (0x03, sp)
                                    268 ;	beep.c: 57: while (*ch) {
      00813F                        269 00104$:
      00813F 90 F6            [ 1]  270 	ld	a, (y)
      008141 4D               [ 1]  271 	tnz	a
      008142 27 0F            [ 1]  272 	jreq	00107$
                                    273 ;	beep.c: 58: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
      008144 AE 52 31         [ 2]  274 	ldw	x, #0x5231
      008147 F7               [ 1]  275 	ld	(x), a
                                    276 ;	beep.c: 59: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
      008148                        277 00101$:
      008148 AE 52 30         [ 2]  278 	ldw	x, #0x5230
      00814B F6               [ 1]  279 	ld	a, (x)
      00814C 48               [ 1]  280 	sll	a
      00814D 24 F9            [ 1]  281 	jrnc	00101$
                                    282 ;	beep.c: 60: ch++;                               //  Grab the next character.
      00814F 90 5C            [ 2]  283 	incw	y
      008151 20 EC            [ 2]  284 	jra	00104$
      008153                        285 00107$:
      008153 81               [ 4]  286 	ret
                                    287 ;	beep.c: 64: void print_UCHAR_hex (unsigned char buffer) {
                                    288 ;	-----------------------------------------
                                    289 ;	 function print_UCHAR_hex
                                    290 ;	-----------------------------------------
      008154                        291 _print_UCHAR_hex:
      008154 52 0C            [ 2]  292 	sub	sp, #12
                                    293 ;	beep.c: 67: a = (buffer >> 4);
      008156 7B 0F            [ 1]  294 	ld	a, (0x0f, sp)
      008158 4E               [ 1]  295 	swap	a
      008159 A4 0F            [ 1]  296 	and	a, #0x0f
      00815B 5F               [ 1]  297 	clrw	x
      00815C 97               [ 1]  298 	ld	xl, a
                                    299 ;	beep.c: 68: if (a > 9)
      00815D A3 00 09         [ 2]  300 	cpw	x, #0x0009
      008160 2D 07            [ 1]  301 	jrsle	00102$
                                    302 ;	beep.c: 69: a = a + 'a' - 10;
      008162 1C 00 57         [ 2]  303 	addw	x, #0x0057
      008165 1F 03            [ 2]  304 	ldw	(0x03, sp), x
      008167 20 05            [ 2]  305 	jra	00103$
      008169                        306 00102$:
                                    307 ;	beep.c: 71: a += '0';
      008169 1C 00 30         [ 2]  308 	addw	x, #0x0030
      00816C 1F 03            [ 2]  309 	ldw	(0x03, sp), x
      00816E                        310 00103$:
                                    311 ;	beep.c: 72: b = buffer & 0x0f;
      00816E 7B 0F            [ 1]  312 	ld	a, (0x0f, sp)
      008170 A4 0F            [ 1]  313 	and	a, #0x0f
      008172 5F               [ 1]  314 	clrw	x
      008173 97               [ 1]  315 	ld	xl, a
                                    316 ;	beep.c: 73: if (b > 9)
      008174 A3 00 09         [ 2]  317 	cpw	x, #0x0009
      008177 2D 07            [ 1]  318 	jrsle	00105$
                                    319 ;	beep.c: 74: b = b + 'a' - 10;
      008179 1C 00 57         [ 2]  320 	addw	x, #0x0057
      00817C 1F 01            [ 2]  321 	ldw	(0x01, sp), x
      00817E 20 05            [ 2]  322 	jra	00106$
      008180                        323 00105$:
                                    324 ;	beep.c: 76: b += '0';
      008180 1C 00 30         [ 2]  325 	addw	x, #0x0030
      008183 1F 01            [ 2]  326 	ldw	(0x01, sp), x
      008185                        327 00106$:
                                    328 ;	beep.c: 77: message[0] = a;
      008185 90 96            [ 1]  329 	ldw	y, sp
      008187 72 A9 00 05      [ 2]  330 	addw	y, #5
      00818B 7B 04            [ 1]  331 	ld	a, (0x04, sp)
      00818D 90 F7            [ 1]  332 	ld	(y), a
                                    333 ;	beep.c: 78: message[1] = b;
      00818F 93               [ 1]  334 	ldw	x, y
      008190 5C               [ 2]  335 	incw	x
      008191 7B 02            [ 1]  336 	ld	a, (0x02, sp)
      008193 F7               [ 1]  337 	ld	(x), a
                                    338 ;	beep.c: 79: message[2] = 0;
      008194 93               [ 1]  339 	ldw	x, y
      008195 5C               [ 2]  340 	incw	x
      008196 5C               [ 2]  341 	incw	x
      008197 7F               [ 1]  342 	clr	(x)
                                    343 ;	beep.c: 80: UARTPrintF (message);
      008198 90 89            [ 2]  344 	pushw	y
      00819A CD 81 3D         [ 4]  345 	call	_UARTPrintF
      00819D 5B 02            [ 2]  346 	addw	sp, #2
      00819F 5B 0C            [ 2]  347 	addw	sp, #12
      0081A1 81               [ 4]  348 	ret
                                    349 ;	beep.c: 88: void print_byte_hex (unsigned char buffer) {
                                    350 ;	-----------------------------------------
                                    351 ;	 function print_byte_hex
                                    352 ;	-----------------------------------------
      0081A2                        353 _print_byte_hex:
      0081A2 52 0C            [ 2]  354 	sub	sp, #12
                                    355 ;	beep.c: 91: a = (buffer >> 4);
      0081A4 7B 0F            [ 1]  356 	ld	a, (0x0f, sp)
      0081A6 4E               [ 1]  357 	swap	a
      0081A7 A4 0F            [ 1]  358 	and	a, #0x0f
      0081A9 5F               [ 1]  359 	clrw	x
      0081AA 97               [ 1]  360 	ld	xl, a
                                    361 ;	beep.c: 92: if (a > 9)
      0081AB A3 00 09         [ 2]  362 	cpw	x, #0x0009
      0081AE 2D 07            [ 1]  363 	jrsle	00102$
                                    364 ;	beep.c: 93: a = a + 'a' - 10;
      0081B0 1C 00 57         [ 2]  365 	addw	x, #0x0057
      0081B3 1F 0B            [ 2]  366 	ldw	(0x0b, sp), x
      0081B5 20 05            [ 2]  367 	jra	00103$
      0081B7                        368 00102$:
                                    369 ;	beep.c: 95: a += '0'; 
      0081B7 1C 00 30         [ 2]  370 	addw	x, #0x0030
      0081BA 1F 0B            [ 2]  371 	ldw	(0x0b, sp), x
      0081BC                        372 00103$:
                                    373 ;	beep.c: 96: b = buffer & 0x0f;
      0081BC 7B 0F            [ 1]  374 	ld	a, (0x0f, sp)
      0081BE A4 0F            [ 1]  375 	and	a, #0x0f
      0081C0 5F               [ 1]  376 	clrw	x
      0081C1 97               [ 1]  377 	ld	xl, a
                                    378 ;	beep.c: 97: if (b > 9)
      0081C2 A3 00 09         [ 2]  379 	cpw	x, #0x0009
      0081C5 2D 07            [ 1]  380 	jrsle	00105$
                                    381 ;	beep.c: 98: b = b + 'a' - 10;
      0081C7 1C 00 57         [ 2]  382 	addw	x, #0x0057
      0081CA 1F 09            [ 2]  383 	ldw	(0x09, sp), x
      0081CC 20 05            [ 2]  384 	jra	00106$
      0081CE                        385 00105$:
                                    386 ;	beep.c: 100: b += '0'; 
      0081CE 1C 00 30         [ 2]  387 	addw	x, #0x0030
      0081D1 1F 09            [ 2]  388 	ldw	(0x09, sp), x
      0081D3                        389 00106$:
                                    390 ;	beep.c: 101: message[0] = a;
      0081D3 90 96            [ 1]  391 	ldw	y, sp
      0081D5 90 5C            [ 2]  392 	incw	y
      0081D7 7B 0C            [ 1]  393 	ld	a, (0x0c, sp)
      0081D9 90 F7            [ 1]  394 	ld	(y), a
                                    395 ;	beep.c: 102: message[1] = b;
      0081DB 93               [ 1]  396 	ldw	x, y
      0081DC 5C               [ 2]  397 	incw	x
      0081DD 7B 0A            [ 1]  398 	ld	a, (0x0a, sp)
      0081DF F7               [ 1]  399 	ld	(x), a
                                    400 ;	beep.c: 103: message[2] = 0;
      0081E0 93               [ 1]  401 	ldw	x, y
      0081E1 5C               [ 2]  402 	incw	x
      0081E2 5C               [ 2]  403 	incw	x
      0081E3 7F               [ 1]  404 	clr	(x)
                                    405 ;	beep.c: 104: UARTPrintF (message);
      0081E4 90 89            [ 2]  406 	pushw	y
      0081E6 CD 81 3D         [ 4]  407 	call	_UARTPrintF
      0081E9 5B 02            [ 2]  408 	addw	sp, #2
      0081EB 5B 0C            [ 2]  409 	addw	sp, #12
      0081ED 81               [ 4]  410 	ret
                                    411 ;	beep.c: 109: void InitializeUART() {
                                    412 ;	-----------------------------------------
                                    413 ;	 function InitializeUART
                                    414 ;	-----------------------------------------
      0081EE                        415 _InitializeUART:
                                    416 ;	beep.c: 119: UART1_CR1 = 0;
      0081EE AE 52 34         [ 2]  417 	ldw	x, #0x5234
      0081F1 7F               [ 1]  418 	clr	(x)
                                    419 ;	beep.c: 120: UART1_CR2 = 0;
      0081F2 AE 52 35         [ 2]  420 	ldw	x, #0x5235
      0081F5 7F               [ 1]  421 	clr	(x)
                                    422 ;	beep.c: 121: UART1_CR4 = 0;
      0081F6 AE 52 37         [ 2]  423 	ldw	x, #0x5237
      0081F9 7F               [ 1]  424 	clr	(x)
                                    425 ;	beep.c: 122: UART1_CR3 = 0;
      0081FA AE 52 36         [ 2]  426 	ldw	x, #0x5236
      0081FD 7F               [ 1]  427 	clr	(x)
                                    428 ;	beep.c: 123: UART1_CR5 = 0;
      0081FE AE 52 38         [ 2]  429 	ldw	x, #0x5238
      008201 7F               [ 1]  430 	clr	(x)
                                    431 ;	beep.c: 124: UART1_GTR = 0;
      008202 AE 52 39         [ 2]  432 	ldw	x, #0x5239
      008205 7F               [ 1]  433 	clr	(x)
                                    434 ;	beep.c: 125: UART1_PSCR = 0;
      008206 AE 52 3A         [ 2]  435 	ldw	x, #0x523a
      008209 7F               [ 1]  436 	clr	(x)
                                    437 ;	beep.c: 129: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
      00820A AE 52 34         [ 2]  438 	ldw	x, #0x5234
      00820D F6               [ 1]  439 	ld	a, (x)
      00820E A4 EF            [ 1]  440 	and	a, #0xef
      008210 F7               [ 1]  441 	ld	(x), a
                                    442 ;	beep.c: 130: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
      008211 AE 52 34         [ 2]  443 	ldw	x, #0x5234
      008214 F6               [ 1]  444 	ld	a, (x)
      008215 A4 FB            [ 1]  445 	and	a, #0xfb
      008217 F7               [ 1]  446 	ld	(x), a
                                    447 ;	beep.c: 131: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
      008218 AE 52 36         [ 2]  448 	ldw	x, #0x5236
      00821B F6               [ 1]  449 	ld	a, (x)
      00821C A4 DF            [ 1]  450 	and	a, #0xdf
      00821E F7               [ 1]  451 	ld	(x), a
                                    452 ;	beep.c: 132: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
      00821F AE 52 36         [ 2]  453 	ldw	x, #0x5236
      008222 F6               [ 1]  454 	ld	a, (x)
      008223 A4 EF            [ 1]  455 	and	a, #0xef
      008225 F7               [ 1]  456 	ld	(x), a
                                    457 ;	beep.c: 133: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
      008226 AE 52 33         [ 2]  458 	ldw	x, #0x5233
      008229 A6 0A            [ 1]  459 	ld	a, #0x0a
      00822B F7               [ 1]  460 	ld	(x), a
                                    461 ;	beep.c: 134: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
      00822C AE 52 32         [ 2]  462 	ldw	x, #0x5232
      00822F A6 08            [ 1]  463 	ld	a, #0x08
      008231 F7               [ 1]  464 	ld	(x), a
                                    465 ;	beep.c: 138: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
      008232 AE 52 35         [ 2]  466 	ldw	x, #0x5235
      008235 F6               [ 1]  467 	ld	a, (x)
      008236 A4 F7            [ 1]  468 	and	a, #0xf7
      008238 F7               [ 1]  469 	ld	(x), a
                                    470 ;	beep.c: 139: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
      008239 AE 52 35         [ 2]  471 	ldw	x, #0x5235
      00823C F6               [ 1]  472 	ld	a, (x)
      00823D A4 FB            [ 1]  473 	and	a, #0xfb
      00823F F7               [ 1]  474 	ld	(x), a
                                    475 ;	beep.c: 143: SET (UART1_CR3, CR3_CPOL);
      008240 AE 52 36         [ 2]  476 	ldw	x, #0x5236
      008243 F6               [ 1]  477 	ld	a, (x)
      008244 AA 04            [ 1]  478 	or	a, #0x04
      008246 F7               [ 1]  479 	ld	(x), a
                                    480 ;	beep.c: 144: SET (UART1_CR3, CR3_CPHA);
      008247 AE 52 36         [ 2]  481 	ldw	x, #0x5236
      00824A F6               [ 1]  482 	ld	a, (x)
      00824B AA 02            [ 1]  483 	or	a, #0x02
      00824D F7               [ 1]  484 	ld	(x), a
                                    485 ;	beep.c: 145: SET (UART1_CR3, CR3_LBCL);
      00824E 72 10 52 36      [ 1]  486 	bset	0x5236, #0
                                    487 ;	beep.c: 149: SET (UART1_CR2, CR2_TEN);
      008252 AE 52 35         [ 2]  488 	ldw	x, #0x5235
      008255 F6               [ 1]  489 	ld	a, (x)
      008256 AA 08            [ 1]  490 	or	a, #0x08
      008258 F7               [ 1]  491 	ld	(x), a
                                    492 ;	beep.c: 150: SET (UART1_CR2, CR2_REN);
      008259 AE 52 35         [ 2]  493 	ldw	x, #0x5235
      00825C F6               [ 1]  494 	ld	a, (x)
      00825D AA 04            [ 1]  495 	or	a, #0x04
      00825F F7               [ 1]  496 	ld	(x), a
                                    497 ;	beep.c: 151: UART1_CR3 = CR3_CLKEN;
      008260 AE 52 36         [ 2]  498 	ldw	x, #0x5236
      008263 A6 08            [ 1]  499 	ld	a, #0x08
      008265 F7               [ 1]  500 	ld	(x), a
      008266 81               [ 4]  501 	ret
                                    502 ;	beep.c: 179: void tm1637Init(void)
                                    503 ;	-----------------------------------------
                                    504 ;	 function tm1637Init
                                    505 ;	-----------------------------------------
      008267                        506 _tm1637Init:
                                    507 ;	beep.c: 181: tm1637SetBrightness(8);
      008267 4B 08            [ 1]  508 	push	#0x08
      008269 CD 83 07         [ 4]  509 	call	_tm1637SetBrightness
      00826C 84               [ 1]  510 	pop	a
      00826D 81               [ 4]  511 	ret
                                    512 ;	beep.c: 186: void tm1637DisplayDecimal(u8 TT,unsigned int displaySeparator)
                                    513 ;	-----------------------------------------
                                    514 ;	 function tm1637DisplayDecimal
                                    515 ;	-----------------------------------------
      00826E                        516 _tm1637DisplayDecimal:
      00826E 52 0F            [ 2]  517 	sub	sp, #15
                                    518 ;	beep.c: 188: unsigned int v = TT ;
      008270 5F               [ 1]  519 	clrw	x
      008271 7B 12            [ 1]  520 	ld	a, (0x12, sp)
      008273 97               [ 1]  521 	ld	xl, a
      008274 1F 05            [ 2]  522 	ldw	(0x05, sp), x
                                    523 ;	beep.c: 194: for (ii = 0; ii < 4; ++ii) {
      008276 96               [ 1]  524 	ldw	x, sp
      008277 5C               [ 2]  525 	incw	x
      008278 1F 0E            [ 2]  526 	ldw	(0x0e, sp), x
      00827A AE 85 AE         [ 2]  527 	ldw	x, #_segmentMap+0
      00827D 1F 0C            [ 2]  528 	ldw	(0x0c, sp), x
      00827F 90 5F            [ 1]  529 	clrw	y
      008281                        530 00106$:
                                    531 ;	beep.c: 195: digitArr[ii] = segmentMap[v % 10];
      008281 93               [ 1]  532 	ldw	x, y
      008282 72 FB 0E         [ 2]  533 	addw	x, (0x0e, sp)
      008285 1F 0A            [ 2]  534 	ldw	(0x0a, sp), x
      008287 90 89            [ 2]  535 	pushw	y
      008289 1E 07            [ 2]  536 	ldw	x, (0x07, sp)
      00828B 90 AE 00 0A      [ 2]  537 	ldw	y, #0x000a
      00828F 65               [ 2]  538 	divw	x, y
      008290 93               [ 1]  539 	ldw	x, y
      008291 90 85            [ 2]  540 	popw	y
      008293 72 FB 0C         [ 2]  541 	addw	x, (0x0c, sp)
      008296 F6               [ 1]  542 	ld	a, (x)
      008297 1E 0A            [ 2]  543 	ldw	x, (0x0a, sp)
      008299 F7               [ 1]  544 	ld	(x), a
                                    545 ;	beep.c: 196: if (ii == 2 && displaySeparator) {
      00829A 90 A3 00 02      [ 2]  546 	cpw	y, #0x0002
      00829E 26 0C            [ 1]  547 	jrne	00102$
      0082A0 1E 13            [ 2]  548 	ldw	x, (0x13, sp)
      0082A2 27 08            [ 1]  549 	jreq	00102$
                                    550 ;	beep.c: 197: digitArr[ii] |= 1 << 7;
      0082A4 1E 0A            [ 2]  551 	ldw	x, (0x0a, sp)
      0082A6 F6               [ 1]  552 	ld	a, (x)
      0082A7 AA 80            [ 1]  553 	or	a, #0x80
      0082A9 1E 0A            [ 2]  554 	ldw	x, (0x0a, sp)
      0082AB F7               [ 1]  555 	ld	(x), a
      0082AC                        556 00102$:
                                    557 ;	beep.c: 199: v /= 10;
      0082AC 90 89            [ 2]  558 	pushw	y
      0082AE 1E 07            [ 2]  559 	ldw	x, (0x07, sp)
      0082B0 90 AE 00 0A      [ 2]  560 	ldw	y, #0x000a
      0082B4 65               [ 2]  561 	divw	x, y
      0082B5 90 85            [ 2]  562 	popw	y
      0082B7 1F 05            [ 2]  563 	ldw	(0x05, sp), x
                                    564 ;	beep.c: 194: for (ii = 0; ii < 4; ++ii) {
      0082B9 90 5C            [ 2]  565 	incw	y
      0082BB 90 A3 00 04      [ 2]  566 	cpw	y, #0x0004
      0082BF 25 C0            [ 1]  567 	jrc	00106$
                                    568 ;	beep.c: 202: _tm1637Start();
      0082C1 CD 83 19         [ 4]  569 	call	__tm1637Start
                                    570 ;	beep.c: 203: _tm1637WriteByte(0x40);
      0082C4 4B 40            [ 1]  571 	push	#0x40
      0082C6 CD 83 6D         [ 4]  572 	call	__tm1637WriteByte
      0082C9 84               [ 1]  573 	pop	a
                                    574 ;	beep.c: 204: _tm1637ReadResult();
      0082CA CD 83 52         [ 4]  575 	call	__tm1637ReadResult
                                    576 ;	beep.c: 205: _tm1637Stop();
      0082CD CD 83 2B         [ 4]  577 	call	__tm1637Stop
                                    578 ;	beep.c: 207: _tm1637Start();
      0082D0 CD 83 19         [ 4]  579 	call	__tm1637Start
                                    580 ;	beep.c: 208: _tm1637WriteByte(0xc0);
      0082D3 4B C0            [ 1]  581 	push	#0xc0
      0082D5 CD 83 6D         [ 4]  582 	call	__tm1637WriteByte
      0082D8 84               [ 1]  583 	pop	a
                                    584 ;	beep.c: 209: _tm1637ReadResult();
      0082D9 CD 83 52         [ 4]  585 	call	__tm1637ReadResult
                                    586 ;	beep.c: 211: for (ii = 0; ii < 4; ++ii) {
      0082DC 5F               [ 1]  587 	clrw	x
      0082DD 1F 07            [ 2]  588 	ldw	(0x07, sp), x
      0082DF                        589 00108$:
                                    590 ;	beep.c: 212: _tm1637WriteByte(digitArr[3 - ii]);
      0082DF 7B 08            [ 1]  591 	ld	a, (0x08, sp)
      0082E1 6B 09            [ 1]  592 	ld	(0x09, sp), a
      0082E3 A6 03            [ 1]  593 	ld	a, #0x03
      0082E5 10 09            [ 1]  594 	sub	a, (0x09, sp)
      0082E7 5F               [ 1]  595 	clrw	x
      0082E8 97               [ 1]  596 	ld	xl, a
      0082E9 72 FB 0E         [ 2]  597 	addw	x, (0x0e, sp)
      0082EC F6               [ 1]  598 	ld	a, (x)
      0082ED 88               [ 1]  599 	push	a
      0082EE CD 83 6D         [ 4]  600 	call	__tm1637WriteByte
      0082F1 84               [ 1]  601 	pop	a
                                    602 ;	beep.c: 213: _tm1637ReadResult();
      0082F2 CD 83 52         [ 4]  603 	call	__tm1637ReadResult
                                    604 ;	beep.c: 211: for (ii = 0; ii < 4; ++ii) {
      0082F5 1E 07            [ 2]  605 	ldw	x, (0x07, sp)
      0082F7 5C               [ 2]  606 	incw	x
      0082F8 1F 07            [ 2]  607 	ldw	(0x07, sp), x
      0082FA 1E 07            [ 2]  608 	ldw	x, (0x07, sp)
      0082FC A3 00 04         [ 2]  609 	cpw	x, #0x0004
      0082FF 25 DE            [ 1]  610 	jrc	00108$
                                    611 ;	beep.c: 216: _tm1637Stop();
      008301 CD 83 2B         [ 4]  612 	call	__tm1637Stop
      008304 5B 0F            [ 2]  613 	addw	sp, #15
      008306 81               [ 4]  614 	ret
                                    615 ;	beep.c: 221: void tm1637SetBrightness(char brightness)
                                    616 ;	-----------------------------------------
                                    617 ;	 function tm1637SetBrightness
                                    618 ;	-----------------------------------------
      008307                        619 _tm1637SetBrightness:
                                    620 ;	beep.c: 228: _tm1637Start();
      008307 CD 83 19         [ 4]  621 	call	__tm1637Start
                                    622 ;	beep.c: 229: _tm1637WriteByte(0x87 + brightness);
      00830A 7B 03            [ 1]  623 	ld	a, (0x03, sp)
      00830C AB 87            [ 1]  624 	add	a, #0x87
      00830E 88               [ 1]  625 	push	a
      00830F CD 83 6D         [ 4]  626 	call	__tm1637WriteByte
      008312 84               [ 1]  627 	pop	a
                                    628 ;	beep.c: 230: _tm1637ReadResult();
      008313 CD 83 52         [ 4]  629 	call	__tm1637ReadResult
                                    630 ;	beep.c: 231: _tm1637Stop();
      008316 CC 83 2B         [ 2]  631 	jp	__tm1637Stop
                                    632 ;	beep.c: 234: void _tm1637Start(void)
                                    633 ;	-----------------------------------------
                                    634 ;	 function _tm1637Start
                                    635 ;	-----------------------------------------
      008319                        636 __tm1637Start:
                                    637 ;	beep.c: 236: _tm1637ClkHigh();
      008319 CD 83 AB         [ 4]  638 	call	__tm1637ClkHigh
                                    639 ;	beep.c: 237: _tm1637DioHigh();
      00831C CD 83 BB         [ 4]  640 	call	__tm1637DioHigh
                                    641 ;	beep.c: 238: delay(5);
      00831F 4B 05            [ 1]  642 	push	#0x05
      008321 4B 00            [ 1]  643 	push	#0x00
      008323 CD 80 F2         [ 4]  644 	call	_delay
      008326 5B 02            [ 2]  645 	addw	sp, #2
                                    646 ;	beep.c: 239: _tm1637DioLow();
      008328 CC 83 C3         [ 2]  647 	jp	__tm1637DioLow
                                    648 ;	beep.c: 242: void _tm1637Stop(void)
                                    649 ;	-----------------------------------------
                                    650 ;	 function _tm1637Stop
                                    651 ;	-----------------------------------------
      00832B                        652 __tm1637Stop:
                                    653 ;	beep.c: 244: _tm1637ClkLow();
      00832B CD 83 B3         [ 4]  654 	call	__tm1637ClkLow
                                    655 ;	beep.c: 245: delay(5);
      00832E 4B 05            [ 1]  656 	push	#0x05
      008330 4B 00            [ 1]  657 	push	#0x00
      008332 CD 80 F2         [ 4]  658 	call	_delay
      008335 5B 02            [ 2]  659 	addw	sp, #2
                                    660 ;	beep.c: 246: _tm1637DioLow();
      008337 CD 83 C3         [ 4]  661 	call	__tm1637DioLow
                                    662 ;	beep.c: 247: delay(5);
      00833A 4B 05            [ 1]  663 	push	#0x05
      00833C 4B 00            [ 1]  664 	push	#0x00
      00833E CD 80 F2         [ 4]  665 	call	_delay
      008341 5B 02            [ 2]  666 	addw	sp, #2
                                    667 ;	beep.c: 248: _tm1637ClkHigh();
      008343 CD 83 AB         [ 4]  668 	call	__tm1637ClkHigh
                                    669 ;	beep.c: 249: delay(5);
      008346 4B 05            [ 1]  670 	push	#0x05
      008348 4B 00            [ 1]  671 	push	#0x00
      00834A CD 80 F2         [ 4]  672 	call	_delay
      00834D 5B 02            [ 2]  673 	addw	sp, #2
                                    674 ;	beep.c: 250: _tm1637DioHigh();
      00834F CC 83 BB         [ 2]  675 	jp	__tm1637DioHigh
                                    676 ;	beep.c: 253: void _tm1637ReadResult(void)
                                    677 ;	-----------------------------------------
                                    678 ;	 function _tm1637ReadResult
                                    679 ;	-----------------------------------------
      008352                        680 __tm1637ReadResult:
                                    681 ;	beep.c: 255: _tm1637ClkLow();
      008352 CD 83 B3         [ 4]  682 	call	__tm1637ClkLow
                                    683 ;	beep.c: 256: delay(5);
      008355 4B 05            [ 1]  684 	push	#0x05
      008357 4B 00            [ 1]  685 	push	#0x00
      008359 CD 80 F2         [ 4]  686 	call	_delay
      00835C 5B 02            [ 2]  687 	addw	sp, #2
                                    688 ;	beep.c: 258: _tm1637ClkHigh();
      00835E CD 83 AB         [ 4]  689 	call	__tm1637ClkHigh
                                    690 ;	beep.c: 259: delay(5);
      008361 4B 05            [ 1]  691 	push	#0x05
      008363 4B 00            [ 1]  692 	push	#0x00
      008365 CD 80 F2         [ 4]  693 	call	_delay
      008368 5B 02            [ 2]  694 	addw	sp, #2
                                    695 ;	beep.c: 260: _tm1637ClkLow();
      00836A CC 83 B3         [ 2]  696 	jp	__tm1637ClkLow
                                    697 ;	beep.c: 263: void _tm1637WriteByte(unsigned char b)
                                    698 ;	-----------------------------------------
                                    699 ;	 function _tm1637WriteByte
                                    700 ;	-----------------------------------------
      00836D                        701 __tm1637WriteByte:
      00836D 52 02            [ 2]  702 	sub	sp, #2
                                    703 ;	beep.c: 265: for (ii = 0; ii < 8; ++ii) {
      00836F 5F               [ 1]  704 	clrw	x
      008370 1F 01            [ 2]  705 	ldw	(0x01, sp), x
      008372                        706 00105$:
                                    707 ;	beep.c: 266: _tm1637ClkLow();
      008372 CD 83 B3         [ 4]  708 	call	__tm1637ClkLow
                                    709 ;	beep.c: 267: if (b & 0x01) {
      008375 7B 05            [ 1]  710 	ld	a, (0x05, sp)
      008377 44               [ 1]  711 	srl	a
      008378 24 05            [ 1]  712 	jrnc	00102$
                                    713 ;	beep.c: 268: _tm1637DioHigh();
      00837A CD 83 BB         [ 4]  714 	call	__tm1637DioHigh
      00837D 20 03            [ 2]  715 	jra	00103$
      00837F                        716 00102$:
                                    717 ;	beep.c: 271: _tm1637DioLow();
      00837F CD 83 C3         [ 4]  718 	call	__tm1637DioLow
      008382                        719 00103$:
                                    720 ;	beep.c: 273: delay(15);
      008382 4B 0F            [ 1]  721 	push	#0x0f
      008384 4B 00            [ 1]  722 	push	#0x00
      008386 CD 80 F2         [ 4]  723 	call	_delay
      008389 5B 02            [ 2]  724 	addw	sp, #2
                                    725 ;	beep.c: 274: b >>= 1;
      00838B 7B 05            [ 1]  726 	ld	a, (0x05, sp)
      00838D 44               [ 1]  727 	srl	a
      00838E 6B 05            [ 1]  728 	ld	(0x05, sp), a
                                    729 ;	beep.c: 275: _tm1637ClkHigh();
      008390 CD 83 AB         [ 4]  730 	call	__tm1637ClkHigh
                                    731 ;	beep.c: 276: delay(15);
      008393 4B 0F            [ 1]  732 	push	#0x0f
      008395 4B 00            [ 1]  733 	push	#0x00
      008397 CD 80 F2         [ 4]  734 	call	_delay
      00839A 5B 02            [ 2]  735 	addw	sp, #2
                                    736 ;	beep.c: 265: for (ii = 0; ii < 8; ++ii) {
      00839C 1E 01            [ 2]  737 	ldw	x, (0x01, sp)
      00839E 5C               [ 2]  738 	incw	x
      00839F 1F 01            [ 2]  739 	ldw	(0x01, sp), x
      0083A1 1E 01            [ 2]  740 	ldw	x, (0x01, sp)
      0083A3 A3 00 08         [ 2]  741 	cpw	x, #0x0008
      0083A6 2F CA            [ 1]  742 	jrslt	00105$
      0083A8 5B 02            [ 2]  743 	addw	sp, #2
      0083AA 81               [ 4]  744 	ret
                                    745 ;	beep.c: 282: void _tm1637ClkHigh(void)
                                    746 ;	-----------------------------------------
                                    747 ;	 function _tm1637ClkHigh
                                    748 ;	-----------------------------------------
      0083AB                        749 __tm1637ClkHigh:
                                    750 ;	beep.c: 287: PD_ODR |= 1 << 2;
      0083AB AE 50 0F         [ 2]  751 	ldw	x, #0x500f
      0083AE F6               [ 1]  752 	ld	a, (x)
      0083AF AA 04            [ 1]  753 	or	a, #0x04
      0083B1 F7               [ 1]  754 	ld	(x), a
      0083B2 81               [ 4]  755 	ret
                                    756 ;	beep.c: 290: void _tm1637ClkLow(void)
                                    757 ;	-----------------------------------------
                                    758 ;	 function _tm1637ClkLow
                                    759 ;	-----------------------------------------
      0083B3                        760 __tm1637ClkLow:
                                    761 ;	beep.c: 294: PD_ODR &= ~(1 << 2);
      0083B3 AE 50 0F         [ 2]  762 	ldw	x, #0x500f
      0083B6 F6               [ 1]  763 	ld	a, (x)
      0083B7 A4 FB            [ 1]  764 	and	a, #0xfb
      0083B9 F7               [ 1]  765 	ld	(x), a
      0083BA 81               [ 4]  766 	ret
                                    767 ;	beep.c: 300: void _tm1637DioHigh(void)
                                    768 ;	-----------------------------------------
                                    769 ;	 function _tm1637DioHigh
                                    770 ;	-----------------------------------------
      0083BB                        771 __tm1637DioHigh:
                                    772 ;	beep.c: 304: PD_ODR |= 1 << 3;
      0083BB AE 50 0F         [ 2]  773 	ldw	x, #0x500f
      0083BE F6               [ 1]  774 	ld	a, (x)
      0083BF AA 08            [ 1]  775 	or	a, #0x08
      0083C1 F7               [ 1]  776 	ld	(x), a
      0083C2 81               [ 4]  777 	ret
                                    778 ;	beep.c: 308: void _tm1637DioLow(void)
                                    779 ;	-----------------------------------------
                                    780 ;	 function _tm1637DioLow
                                    781 ;	-----------------------------------------
      0083C3                        782 __tm1637DioLow:
                                    783 ;	beep.c: 310: PD_ODR &= ~(1 << 3);
      0083C3 AE 50 0F         [ 2]  784 	ldw	x, #0x500f
      0083C6 F6               [ 1]  785 	ld	a, (x)
      0083C7 A4 F7            [ 1]  786 	and	a, #0xf7
      0083C9 F7               [ 1]  787 	ld	(x), a
      0083CA 81               [ 4]  788 	ret
                                    789 ;	beep.c: 325: void rt_one_second_increment (st_time *t) {
                                    790 ;	-----------------------------------------
                                    791 ;	 function rt_one_second_increment
                                    792 ;	-----------------------------------------
      0083CB                        793 _rt_one_second_increment:
      0083CB 52 08            [ 2]  794 	sub	sp, #8
                                    795 ;	beep.c: 326: ++t->ticker; //   
      0083CD 16 0B            [ 2]  796 	ldw	y, (0x0b, sp)
      0083CF 17 01            [ 2]  797 	ldw	(0x01, sp), y
      0083D1 1E 01            [ 2]  798 	ldw	x, (0x01, sp)
      0083D3 1C 00 04         [ 2]  799 	addw	x, #0x0004
      0083D6 1F 03            [ 2]  800 	ldw	(0x03, sp), x
      0083D8 1E 03            [ 2]  801 	ldw	x, (0x03, sp)
      0083DA E6 03            [ 1]  802 	ld	a, (0x3, x)
      0083DC 90 97            [ 1]  803 	ld	yl, a
      0083DE E6 02            [ 1]  804 	ld	a, (0x2, x)
      0083E0 FE               [ 2]  805 	ldw	x, (x)
      0083E1 90 95            [ 1]  806 	ld	yh, a
      0083E3 72 A9 00 01      [ 2]  807 	addw	y, #0x0001
      0083E7 9F               [ 1]  808 	ld	a, xl
      0083E8 A9 00            [ 1]  809 	adc	a, #0x00
      0083EA 6B 06            [ 1]  810 	ld	(0x06, sp), a
      0083EC 9E               [ 1]  811 	ld	a, xh
      0083ED A9 00            [ 1]  812 	adc	a, #0x00
      0083EF 6B 05            [ 1]  813 	ld	(0x05, sp), a
      0083F1 1E 03            [ 2]  814 	ldw	x, (0x03, sp)
      0083F3 EF 02            [ 2]  815 	ldw	(0x2, x), y
      0083F5 16 05            [ 2]  816 	ldw	y, (0x05, sp)
      0083F7 FF               [ 2]  817 	ldw	(x), y
                                    818 ;	beep.c: 327: if(++t->second > 59) {
      0083F8 1E 01            [ 2]  819 	ldw	x, (0x01, sp)
      0083FA F6               [ 1]  820 	ld	a, (x)
      0083FB 4C               [ 1]  821 	inc	a
      0083FC F7               [ 1]  822 	ld	(x), a
      0083FD A1 3B            [ 1]  823 	cp	a, #0x3b
      0083FF 23 1A            [ 2]  824 	jrule	00107$
                                    825 ;	beep.c: 328: t->second= 0;
      008401 1E 01            [ 2]  826 	ldw	x, (0x01, sp)
      008403 7F               [ 1]  827 	clr	(x)
                                    828 ;	beep.c: 329: if(++t->minute > 59) {
      008404 1E 01            [ 2]  829 	ldw	x, (0x01, sp)
      008406 5C               [ 2]  830 	incw	x
      008407 F6               [ 1]  831 	ld	a, (x)
      008408 4C               [ 1]  832 	inc	a
      008409 F7               [ 1]  833 	ld	(x), a
      00840A A1 3B            [ 1]  834 	cp	a, #0x3b
      00840C 23 0D            [ 2]  835 	jrule	00107$
                                    836 ;	beep.c: 330: t->minute= 0;
      00840E 7F               [ 1]  837 	clr	(x)
                                    838 ;	beep.c: 331: if(++t->hour > 23) {
      00840F 1E 01            [ 2]  839 	ldw	x, (0x01, sp)
      008411 5C               [ 2]  840 	incw	x
      008412 5C               [ 2]  841 	incw	x
      008413 F6               [ 1]  842 	ld	a, (x)
      008414 4C               [ 1]  843 	inc	a
      008415 F7               [ 1]  844 	ld	(x), a
      008416 A1 17            [ 1]  845 	cp	a, #0x17
      008418 23 01            [ 2]  846 	jrule	00107$
                                    847 ;	beep.c: 332: t->hour= 0;
      00841A 7F               [ 1]  848 	clr	(x)
      00841B                        849 00107$:
      00841B 5B 08            [ 2]  850 	addw	sp, #8
      00841D 81               [ 4]  851 	ret
                                    852 ;	beep.c: 342: void timer_isr(void) __interrupt(BEEP_ISR) {
                                    853 ;	-----------------------------------------
                                    854 ;	 function timer_isr
                                    855 ;	-----------------------------------------
      00841E                        856 _timer_isr:
                                    857 ;	beep.c: 343: if (++internteller > 500) {
      00841E CE 00 09         [ 2]  858 	ldw	x, _internteller+0
      008421 5C               [ 2]  859 	incw	x
      008422 CF 00 09         [ 2]  860 	ldw	_internteller+0, x
      008425 A3 01 F4         [ 2]  861 	cpw	x, #0x01f4
      008428 23 11            [ 2]  862 	jrule	00103$
                                    863 ;	beep.c: 344: internteller=0;
      00842A 72 5F 00 0A      [ 1]  864 	clr	_internteller+1
      00842E 72 5F 00 09      [ 1]  865 	clr	_internteller+0
                                    866 ;	beep.c: 345: rt_one_second_increment(&real_time);
      008432 AE 00 01         [ 2]  867 	ldw	x, #_real_time+0
      008435 89               [ 2]  868 	pushw	x
      008436 CD 83 CB         [ 4]  869 	call	_rt_one_second_increment
      008439 5B 02            [ 2]  870 	addw	sp, #2
      00843B                        871 00103$:
      00843B 80               [11]  872 	iret
                                    873 ;	beep.c: 374: void option_bytes_unlock() {
                                    874 ;	-----------------------------------------
                                    875 ;	 function option_bytes_unlock
                                    876 ;	-----------------------------------------
      00843C                        877 _option_bytes_unlock:
                                    878 ;	beep.c: 375: FLASH_CR2 |= (1 << FLASH_CR2_OPT);
      00843C 72 17 50 5B      [ 1]  879 	bset	0x505b, #7
                                    880 ;	beep.c: 376: FLASH_NCR2 &= ~(1 << FLASH_NCR2_NOPT);
      008440 72 17 50 5C      [ 1]  881 	bres	0x505c, #7
      008444 81               [ 4]  882 	ret
                                    883 ;	beep.c: 380: int main () {
                                    884 ;	-----------------------------------------
                                    885 ;	 function main
                                    886 ;	-----------------------------------------
      008445                        887 _main:
      008445 52 1D            [ 2]  888 	sub	sp, #29
                                    889 ;	beep.c: 384: u8 startmeting=0;	
      008447 0F 01            [ 1]  890 	clr	(0x01, sp)
                                    891 ;	beep.c: 385: unsigned int val=0, current,periode;
      008449 5F               [ 1]  892 	clrw	x
      00844A 1F 1C            [ 2]  893 	ldw	(0x1c, sp), x
                                    894 ;	beep.c: 387: InitializeSystemClock();
      00844C CD 80 A8         [ 4]  895 	call	_InitializeSystemClock
                                    896 ;	beep.c: 390: option_bytes_unlock();
      00844F CD 84 3C         [ 4]  897 	call	_option_bytes_unlock
                                    898 ;	beep.c: 392: tm1637DisplayDecimal(1, 0); // display minutes
      008452 5F               [ 1]  899 	clrw	x
      008453 89               [ 2]  900 	pushw	x
      008454 4B 01            [ 1]  901 	push	#0x01
      008456 CD 82 6E         [ 4]  902 	call	_tm1637DisplayDecimal
      008459 5B 03            [ 2]  903 	addw	sp, #3
                                    904 ;	beep.c: 393: FLASH_DUKR = FLASH_DUKR_KEY1;
      00845B AE 50 64         [ 2]  905 	ldw	x, #0x5064
      00845E A6 AE            [ 1]  906 	ld	a, #0xae
      008460 F7               [ 1]  907 	ld	(x), a
                                    908 ;	beep.c: 394: FLASH_DUKR = FLASH_DUKR_KEY2;
      008461 AE 50 64         [ 2]  909 	ldw	x, #0x5064
      008464 A6 56            [ 1]  910 	ld	a, #0x56
      008466 F7               [ 1]  911 	ld	(x), a
                                    912 ;	beep.c: 395: while (!(FLASH_IAPSR & (1 << FLASH_IAPSR_DUL)));
      008467                        913 00101$:
      008467 AE 50 5F         [ 2]  914 	ldw	x, #0x505f
      00846A F6               [ 1]  915 	ld	a, (x)
      00846B A5 08            [ 1]  916 	bcp	a, #0x08
      00846D 27 F8            [ 1]  917 	jreq	00101$
                                    918 ;	beep.c: 396: tm1637DisplayDecimal(2, 0); // display minutes
      00846F 5F               [ 1]  919 	clrw	x
      008470 89               [ 2]  920 	pushw	x
      008471 4B 02            [ 1]  921 	push	#0x02
      008473 CD 82 6E         [ 4]  922 	call	_tm1637DisplayDecimal
      008476 5B 03            [ 2]  923 	addw	sp, #3
                                    924 ;	beep.c: 397: for (addr = EEPROM_START_ADDR; addr < EEPROM_END_ADDR; addr++)
      008478 AE 40 00         [ 2]  925 	ldw	x, #0x4000
      00847B                        926 00116$:
                                    927 ;	beep.c: 398: _MEM_(addr) = 0x1A;
      00847B 90 93            [ 1]  928 	ldw	y, x
      00847D A6 1A            [ 1]  929 	ld	a, #0x1a
      00847F 90 E7 01         [ 1]  930 	ld	(0x1, y), a
      008482 90 7F            [ 1]  931 	clr	(y)
                                    932 ;	beep.c: 397: for (addr = EEPROM_START_ADDR; addr < EEPROM_END_ADDR; addr++)
      008484 5C               [ 2]  933 	incw	x
      008485 A3 42 80         [ 2]  934 	cpw	x, #0x4280
      008488 25 F1            [ 1]  935 	jrc	00116$
                                    936 ;	beep.c: 399: tm1637DisplayDecimal(3, 0); // display minutes
      00848A 5F               [ 1]  937 	clrw	x
      00848B 89               [ 2]  938 	pushw	x
      00848C 4B 03            [ 1]  939 	push	#0x03
      00848E CD 82 6E         [ 4]  940 	call	_tm1637DisplayDecimal
      008491 5B 03            [ 2]  941 	addw	sp, #3
                                    942 ;	beep.c: 402: FLASH_IAPSR &= ~(1 << FLASH_IAPSR_DUL);
      008493 AE 50 5F         [ 2]  943 	ldw	x, #0x505f
      008496 F6               [ 1]  944 	ld	a, (x)
      008497 A4 F7            [ 1]  945 	and	a, #0xf7
      008499 F7               [ 1]  946 	ld	(x), a
                                    947 ;	beep.c: 404: tm1637DisplayDecimal(4, 0); // display minutes
      00849A 5F               [ 1]  948 	clrw	x
      00849B 89               [ 2]  949 	pushw	x
      00849C 4B 04            [ 1]  950 	push	#0x04
      00849E CD 82 6E         [ 4]  951 	call	_tm1637DisplayDecimal
      0084A1 5B 03            [ 2]  952 	addw	sp, #3
                                    953 ;	beep.c: 411: BEEP_CSR = (0<<7) | (0<<6) | (1<<5) | 0x1E;
      0084A3 AE 50 F3         [ 2]  954 	ldw	x, #0x50f3
      0084A6 A6 3E            [ 1]  955 	ld	a, #0x3e
      0084A8 F7               [ 1]  956 	ld	(x), a
                                    957 ;	beep.c: 412: PD_DDR = (1 << 3) | (1 << 2); // output mode
      0084A9 AE 50 11         [ 2]  958 	ldw	x, #0x5011
      0084AC A6 0C            [ 1]  959 	ld	a, #0x0c
      0084AE F7               [ 1]  960 	ld	(x), a
                                    961 ;	beep.c: 414: PD_DDR &=  ~(1 << 4); //PD4 input
      0084AF AE 50 11         [ 2]  962 	ldw	x, #0x5011
      0084B2 F6               [ 1]  963 	ld	a, (x)
      0084B3 A4 EF            [ 1]  964 	and	a, #0xef
      0084B5 F7               [ 1]  965 	ld	(x), a
                                    966 ;	beep.c: 415: PD_CR1 = (1 << 3) | (1 << 2); // push-pull
      0084B6 AE 50 12         [ 2]  967 	ldw	x, #0x5012
      0084B9 A6 0C            [ 1]  968 	ld	a, #0x0c
      0084BB F7               [ 1]  969 	ld	(x), a
                                    970 ;	beep.c: 416: PD_CR1 &= ~(1 << 4); // input with float
      0084BC AE 50 12         [ 2]  971 	ldw	x, #0x5012
      0084BF F6               [ 1]  972 	ld	a, (x)
      0084C0 A4 EF            [ 1]  973 	and	a, #0xef
      0084C2 F7               [ 1]  974 	ld	(x), a
                                    975 ;	beep.c: 417: PD_CR2 = (1 << 3) | (1 << 2) | (1<< 4); // up to 10MHz speed + interrupt enabled 
      0084C3 AE 50 13         [ 2]  976 	ldw	x, #0x5013
      0084C6 A6 1C            [ 1]  977 	ld	a, #0x1c
      0084C8 F7               [ 1]  978 	ld	(x), a
                                    979 ;	beep.c: 419: EXTI_CR1 = (1<<7); //Port D external sensitivity bits7:6 10: Falling edge only
      0084C9 AE 50 A0         [ 2]  980 	ldw	x, #0x50a0
      0084CC A6 80            [ 1]  981 	ld	a, #0x80
      0084CE F7               [ 1]  982 	ld	(x), a
                                    983 ;	beep.c: 420: EXTI_CR1 &= ~(1<<6); //Port D external sensitivity bits7:6 10: Falling edge only
      0084CF AE 50 A0         [ 2]  984 	ldw	x, #0x50a0
      0084D2 F6               [ 1]  985 	ld	a, (x)
      0084D3 A4 BF            [ 1]  986 	and	a, #0xbf
      0084D5 F7               [ 1]  987 	ld	(x), a
                                    988 ;	beep.c: 423: tijd = &real_time;
      0084D6 AE 00 01         [ 2]  989 	ldw	x, #_real_time+0
      0084D9 1F 1A            [ 2]  990 	ldw	(0x1a, sp), x
      0084DB 7B 1A            [ 1]  991 	ld	a, (0x1a, sp)
      0084DD 88               [ 1]  992 	push	a
      0084DE 7B 1C            [ 1]  993 	ld	a, (0x1c, sp)
      0084E0 6B 0C            [ 1]  994 	ld	(0x0c, sp), a
      0084E2 84               [ 1]  995 	pop	a
      0084E3 6B 0A            [ 1]  996 	ld	(0x0a, sp), a
                                    997 ;	beep.c: 428: tm1637Init();
      0084E5 CD 82 67         [ 4]  998 	call	_tm1637Init
                                    999 ;	beep.c: 430: InitializeUART();
      0084E8 CD 81 EE         [ 4] 1000 	call	_InitializeUART
                                   1001 ;	beep.c: 434: __asm__("rim");
      0084EB 9A               [ 1] 1002 	rim
                                   1003 ;	beep.c: 438: while (1) {
      0084EC                       1004 00114$:
                                   1005 ;	beep.c: 439: ADC_CR1 |= ADC_ADON; // ADC ON
      0084EC 72 10 54 01      [ 1] 1006 	bset	0x5401, #0
                                   1007 ;	beep.c: 440: ADC_CSR |= ((0x0F)&2); // select channel = 2 = PC4
      0084F0 AE 54 00         [ 2] 1008 	ldw	x, #0x5400
      0084F3 F6               [ 1] 1009 	ld	a, (x)
      0084F4 AA 02            [ 1] 1010 	or	a, #0x02
      0084F6 F7               [ 1] 1011 	ld	(x), a
                                   1012 ;	beep.c: 441: ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
      0084F7 AE 54 02         [ 2] 1013 	ldw	x, #0x5402
      0084FA F6               [ 1] 1014 	ld	a, (x)
      0084FB AA 08            [ 1] 1015 	or	a, #0x08
      0084FD F7               [ 1] 1016 	ld	(x), a
                                   1017 ;	beep.c: 442: ADC_CR1 |= ADC_ADON; // start conversion
      0084FE 72 10 54 01      [ 1] 1018 	bset	0x5401, #0
                                   1019 ;	beep.c: 443: while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC
      008502                       1020 00105$:
      008502 AE 54 00         [ 2] 1021 	ldw	x, #0x5400
      008505 F6               [ 1] 1022 	ld	a, (x)
      008506 48               [ 1] 1023 	sll	a
      008507 24 F9            [ 1] 1024 	jrnc	00105$
                                   1025 ;	beep.c: 445: val |= (unsigned int)ADC_DRL;
      008509 AE 54 05         [ 2] 1026 	ldw	x, #0x5405
      00850C F6               [ 1] 1027 	ld	a, (x)
      00850D 5F               [ 1] 1028 	clrw	x
      00850E 97               [ 1] 1029 	ld	xl, a
      00850F 1A 1D            [ 1] 1030 	or	a, (0x1d, sp)
      008511 6B 19            [ 1] 1031 	ld	(0x19, sp), a
      008513 9E               [ 1] 1032 	ld	a, xh
      008514 1A 1C            [ 1] 1033 	or	a, (0x1c, sp)
      008516 6B 0E            [ 1] 1034 	ld	(0x0e, sp), a
      008518 7B 19            [ 1] 1035 	ld	a, (0x19, sp)
      00851A 6B 0F            [ 1] 1036 	ld	(0x0f, sp), a
                                   1037 ;	beep.c: 447: val |= (unsigned int)ADC_DRH<<8;
      00851C AE 54 04         [ 2] 1038 	ldw	x, #0x5404
      00851F F6               [ 1] 1039 	ld	a, (x)
      008520 5F               [ 1] 1040 	clrw	x
      008521 97               [ 1] 1041 	ld	xl, a
      008522 58               [ 2] 1042 	sllw	x
      008523 58               [ 2] 1043 	sllw	x
      008524 58               [ 2] 1044 	sllw	x
      008525 58               [ 2] 1045 	sllw	x
      008526 58               [ 2] 1046 	sllw	x
      008527 58               [ 2] 1047 	sllw	x
      008528 58               [ 2] 1048 	sllw	x
      008529 58               [ 2] 1049 	sllw	x
      00852A 9F               [ 1] 1050 	ld	a, xl
      00852B 1A 0F            [ 1] 1051 	or	a, (0x0f, sp)
      00852D 6B 17            [ 1] 1052 	ld	(0x17, sp), a
      00852F 9E               [ 1] 1053 	ld	a, xh
      008530 1A 0E            [ 1] 1054 	or	a, (0x0e, sp)
      008532 6B 1C            [ 1] 1055 	ld	(0x1c, sp), a
      008534 7B 17            [ 1] 1056 	ld	a, (0x17, sp)
      008536 6B 1D            [ 1] 1057 	ld	(0x1d, sp), a
                                   1058 ;	beep.c: 448: ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
      008538 AE 54 01         [ 2] 1059 	ldw	x, #0x5401
      00853B F6               [ 1] 1060 	ld	a, (x)
      00853C A4 FE            [ 1] 1061 	and	a, #0xfe
      00853E F7               [ 1] 1062 	ld	(x), a
                                   1063 ;	beep.c: 449: current = val & 0x03ff;
      00853F 7B 1D            [ 1] 1064 	ld	a, (0x1d, sp)
      008541 6B 0D            [ 1] 1065 	ld	(0x0d, sp), a
      008543 7B 1C            [ 1] 1066 	ld	a, (0x1c, sp)
      008545 A4 03            [ 1] 1067 	and	a, #0x03
      008547 6B 0C            [ 1] 1068 	ld	(0x0c, sp), a
                                   1069 ;	beep.c: 451: if (current > MIN_CURRENT){ //start timing current consumption
      008549 1E 0C            [ 2] 1070 	ldw	x, (0x0c, sp)
      00854B A3 00 0A         [ 2] 1071 	cpw	x, #0x000a
      00854E 23 3F            [ 2] 1072 	jrule	00109$
                                   1073 ;	beep.c: 453: starttijd.second = real_time.second;
      008550 96               [ 1] 1074 	ldw	x, sp
      008551 5C               [ 2] 1075 	incw	x
      008552 5C               [ 2] 1076 	incw	x
      008553 16 1A            [ 2] 1077 	ldw	y, (0x1a, sp)
      008555 90 F6            [ 1] 1078 	ld	a, (y)
      008557 F7               [ 1] 1079 	ld	(x), a
                                   1080 ;	beep.c: 454: starttijd.minute = real_time.minute;
      008558 96               [ 1] 1081 	ldw	x, sp
      008559 5C               [ 2] 1082 	incw	x
      00855A 5C               [ 2] 1083 	incw	x
      00855B 1F 14            [ 2] 1084 	ldw	(0x14, sp), x
      00855D 1E 14            [ 2] 1085 	ldw	x, (0x14, sp)
      00855F 5C               [ 2] 1086 	incw	x
      008560 16 1A            [ 2] 1087 	ldw	y, (0x1a, sp)
      008562 90 E6 01         [ 1] 1088 	ld	a, (0x1, y)
      008565 F7               [ 1] 1089 	ld	(x), a
                                   1090 ;	beep.c: 455: starttijd.hour = real_time.hour;
      008566 1E 14            [ 2] 1091 	ldw	x, (0x14, sp)
      008568 5C               [ 2] 1092 	incw	x
      008569 5C               [ 2] 1093 	incw	x
      00856A 16 1A            [ 2] 1094 	ldw	y, (0x1a, sp)
      00856C 90 E6 02         [ 1] 1095 	ld	a, (0x2, y)
      00856F F7               [ 1] 1096 	ld	(x), a
                                   1097 ;	beep.c: 456: starttijd.ticker = real_time.ticker;
      008570 1E 14            [ 2] 1098 	ldw	x, (0x14, sp)
      008572 1C 00 04         [ 2] 1099 	addw	x, #0x0004
      008575 16 1A            [ 2] 1100 	ldw	y, (0x1a, sp)
      008577 90 E6 07         [ 1] 1101 	ld	a, (0x7, y)
      00857A 88               [ 1] 1102 	push	a
      00857B 90 E6 06         [ 1] 1103 	ld	a, (0x6, y)
      00857E 6B 13            [ 1] 1104 	ld	(0x13, sp), a
      008580 90 EE 04         [ 2] 1105 	ldw	y, (0x4, y)
      008583 84               [ 1] 1106 	pop	a
      008584 E7 03            [ 1] 1107 	ld	(0x3, x), a
      008586 7B 12            [ 1] 1108 	ld	a, (0x12, sp)
      008588 E7 02            [ 1] 1109 	ld	(0x2, x), a
      00858A FF               [ 2] 1110 	ldw	(x), y
                                   1111 ;	beep.c: 457: startmeting = 1;
      00858B A6 01            [ 1] 1112 	ld	a, #0x01
      00858D 6B 01            [ 1] 1113 	ld	(0x01, sp), a
      00858F                       1114 00109$:
                                   1115 ;	beep.c: 459: if ((current < MIN_CURRENT) && (startmeting)) //stop timing current consumption
      00858F 1E 0C            [ 2] 1116 	ldw	x, (0x0c, sp)
      008591 A3 00 0A         [ 2] 1117 	cpw	x, #0x000a
      008594 24 06            [ 1] 1118 	jrnc	00111$
      008596 0D 01            [ 1] 1119 	tnz	(0x01, sp)
      008598 27 02            [ 1] 1120 	jreq	00111$
                                   1121 ;	beep.c: 462: startmeting = 0;
      00859A 0F 01            [ 1] 1122 	clr	(0x01, sp)
      00859C                       1123 00111$:
                                   1124 ;	beep.c: 467: tm1637DisplayDecimal(tijd->minute, 0); // display minutes 
      00859C 1E 0A            [ 2] 1125 	ldw	x, (0x0a, sp)
      00859E E6 01            [ 1] 1126 	ld	a, (0x1, x)
      0085A0 5F               [ 1] 1127 	clrw	x
      0085A1 89               [ 2] 1128 	pushw	x
      0085A2 88               [ 1] 1129 	push	a
      0085A3 CD 82 6E         [ 4] 1130 	call	_tm1637DisplayDecimal
      0085A6 5B 03            [ 2] 1131 	addw	sp, #3
      0085A8 CC 84 EC         [ 2] 1132 	jp	00114$
      0085AB 5B 1D            [ 2] 1133 	addw	sp, #29
      0085AD 81               [ 4] 1134 	ret
                                   1135 	.area CODE
      0085AE                       1136 _segmentMap:
      0085AE 3F                    1137 	.db #0x3F	;  63
      0085AF 06                    1138 	.db #0x06	;  6
      0085B0 5B                    1139 	.db #0x5B	;  91
      0085B1 4F                    1140 	.db #0x4F	;  79	'O'
      0085B2 66                    1141 	.db #0x66	;  102	'f'
      0085B3 6D                    1142 	.db #0x6D	;  109	'm'
      0085B4 7D                    1143 	.db #0x7D	;  125
      0085B5 07                    1144 	.db #0x07	;  7
      0085B6 7F                    1145 	.db #0x7F	;  127
      0085B7 6F                    1146 	.db #0x6F	;  111	'o'
      0085B8 77                    1147 	.db #0x77	;  119	'w'
      0085B9 7C                    1148 	.db #0x7C	;  124
      0085BA 39                    1149 	.db #0x39	;  57	'9'
      0085BB 5E                    1150 	.db #0x5E	;  94
      0085BC 79                    1151 	.db #0x79	;  121	'y'
      0085BD 71                    1152 	.db #0x71	;  113	'q'
      0085BE 00                    1153 	.db #0x00	;  0
                                   1154 	.area INITIALIZER
                                   1155 	.area CABS (ABS)
