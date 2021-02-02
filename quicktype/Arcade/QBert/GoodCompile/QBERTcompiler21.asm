; Assembly for QBERTcompiler21.TXT
; compiled with mcbasic

; Equates for MC-10 MICROCOLOR BASIC 1.0
; 
; Direct page equates
DP_LNUM	.equ	$E2	; current line in BASIC
DP_TABW	.equ	$E4	; current tab width on console
DP_LPOS	.equ	$E6	; current line position on console
DP_LWID	.equ	$E7	; current line width of console
; 
; Memory equates
M_KBUF	.equ	$4231	; keystrobe buffer (8 bytes)
M_PMSK	.equ	$423C	; pixel mask for SET, RESET and POINT
M_IKEY	.equ	$427F	; key code for INKEY$
M_CRSR	.equ	$4280	; cursor location
M_LBUF	.equ	$42B2	; line input buffer (130 chars)
M_MSTR	.equ	$4334	; buffer for small string moves
M_CODE	.equ	$4346	; start of program space
; 
; ROM equates
R_BKMSG	.equ	$E1C1	; 'BREAK' string location
R_ERROR	.equ	$E238	; generate error and restore direct mode
R_BREAK	.equ	$E266	; generate break and restore direct mode
R_RESET	.equ	$E3EE	; setup stack and disable CONT
R_SPACE	.equ	$E7B9	; emit " " to console
R_QUEST	.equ	$E7BC	; emit "?" to console
R_REDO	.equ	$E7C1	; emit "?REDO" to console
R_EXTRA	.equ	$E8AB	; emit "?EXTRA IGNORED" to console
R_DMODE	.equ	$F7AA	; display OK prompt and restore direct mode
R_KPOLL	.equ	$F879	; if key is down, do KEYIN, else set Z CCR flag
R_KEYIN	.equ	$F883	; poll key for key-down transition set Z otherwise
R_PUTC	.equ	$F9C9	; write ACCA to console
R_MKTAB	.equ	$FA7B	; setup tabs for console
R_GETLN	.equ	$FAA4	; get line, returning with X pointing to M_BUF-1
R_SETPX	.equ	$FB44	; write pixel character to X
R_CLRPX	.equ	$FB59	; clear pixel character in X
R_MSKPX	.equ	$FB7C	; get pixel screen location X and mask in R_PMSK
R_CLSN	.equ	$FBC4	; clear screen with color code in ACCB
R_CLS	.equ	$FBD4	; clear screen with space character
R_SOUND	.equ	$FFAB	; play sound with pitch in ACCA and duration in ACCB
R_MCXID	.equ	$FFDA	; ID location for MCX BASIC

; direct page registers
	.org	$80
strbuf	.block	2
strend	.block	2
strfree	.block	2
strstop	.block	2
dataptr	.block	2
inptptr	.block	2
redoptr	.block	2
letptr	.block	2
	.org	$a3
r1	.block	5
r2	.block	5
r3	.block	5
rend
rvseed	.block	2
curinst	.block	2
nxtinst	.block	2
tmp1	.block	2
tmp2	.block	2
tmp3	.block	2
tmp4	.block	2
tmp5	.block	2
argv	.block	10

	.org	M_CODE

	.module	mdmain
	ldx	#program
	stx	nxtinst
mainloop
	ldx	nxtinst
	stx	curinst
	ldab	,x
	ldx	#catalog
	abx
	abx
	ldx	,x
	jsr	0,x
	bra	mainloop

program

	.byte	bytecode_progbegin

	.byte	bytecode_clear

LINE_1

	; CLS

	.byte	bytecode_cls

	; POKE 16925,0

	.byte	bytecode_ld_ir1_pb
	.byte	0

	.byte	bytecode_poke_pw_ir1
	.word	16925

	; POKE 16926,1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_poke_pw_ir1
	.word	16926

	; GOSUB 4000

	.byte	bytecode_gosub_ix
	.word	LINE_4000

	; CLEAR 4000

	.byte	bytecode_clear

	; GOTO 900

	.byte	bytecode_goto_ix
	.word	LINE_900

LINE_2

	; PRINT @L, X$(C,2);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L+W, Y$(C,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; X-=2

	.byte	bytecode_sub_ix_ix_pb
	.byte	bytecode_INTVAR_X
	.byte	2

	; Y-=2

	.byte	bytecode_sub_ix_ix_pb
	.byte	bytecode_INTVAR_Y
	.byte	2

	; L=(W*Y)+X

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_mul_ir1_ir1_ix
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_X

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_L

	; ON Y+3 GOTO 52

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_add_ir1_ir1_pb
	.byte	3

	.byte	bytecode_ongoto_ir1_is
	.byte	1
	.word	LINE_52

	; P=PEEK(M+L)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_P

	; PRINT @L, X$(C,1);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L+W, Y$(C,1);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; GOTO 24

	.byte	bytecode_goto_ix
	.word	LINE_24

LINE_3

	; PRINT @L, X$(C,2);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L+W, Y$(C,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; X+=2

	.byte	bytecode_add_ix_ix_pb
	.byte	bytecode_INTVAR_X
	.byte	2

	; Y-=2

	.byte	bytecode_sub_ix_ix_pb
	.byte	bytecode_INTVAR_Y
	.byte	2

	; L=(W*Y)+X

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_mul_ir1_ir1_ix
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_X

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_L

	; ON Y+3 GOTO 52

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_add_ir1_ir1_pb
	.byte	3

	.byte	bytecode_ongoto_ir1_is
	.byte	1
	.word	LINE_52

	; P=PEEK(M+L)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_P

	; PRINT @L, X$(C,0);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L+W, Y$(C,0);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; GOTO 24

	.byte	bytecode_goto_ix
	.word	LINE_24

LINE_4

	; PRINT @L, X$(C,2);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L+W, Y$(C,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; X-=2

	.byte	bytecode_sub_ix_ix_pb
	.byte	bytecode_INTVAR_X
	.byte	2

	; Y+=2

	.byte	bytecode_add_ix_ix_pb
	.byte	bytecode_INTVAR_Y
	.byte	2

	; L=(W*Y)+X

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_mul_ir1_ir1_ix
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_X

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_L

	; P=PEEK(M+L)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_P

	; PRINT @L, X$(C,1);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L+W, Y$(C,1);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; GOTO 24

	.byte	bytecode_goto_ix
	.word	LINE_24

LINE_5

	; PRINT @L, X$(C,2);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L+W, Y$(C,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; X+=2

	.byte	bytecode_add_ix_ix_pb
	.byte	bytecode_INTVAR_X
	.byte	2

	; Y+=2

	.byte	bytecode_add_ix_ix_pb
	.byte	bytecode_INTVAR_Y
	.byte	2

	; L=(W*Y)+X

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_mul_ir1_ir1_ix
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_X

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_L

	; P=PEEK(M+L)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_P

	; PRINT @L, X$(C,0);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L+W, Y$(C,0);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; GOTO 24

	.byte	bytecode_goto_ix
	.word	LINE_24

LINE_6

	; IF C<>K(P) THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_P

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ldne_ir1_ir1_ir2

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_7

	; J+=1

	.byte	bytecode_add_ix_ix_pb
	.byte	bytecode_INTVAR_J
	.byte	1

	; N+=1

	.byte	bytecode_add_ix_ix_pb
	.byte	bytecode_INTVAR_N
	.byte	1

	; PRINT @I, STR$(N);" ";

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_I

	.byte	bytecode_str_sr1_ix
	.byte	bytecode_INTVAR_N

	.byte	bytecode_pr_sr1

	.byte	bytecode_pr_ss
	.text	1, " "

	; WHEN J>27 GOTO 95

	.byte	bytecode_ld_ir1_pb
	.byte	27

	.byte	bytecode_ldlt_ir1_ir1_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_jmpne_ir1_ix
	.word	LINE_95

LINE_7

	; SOUND 10,1

	.byte	bytecode_ld_ir1_pb
	.byte	10

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; SOUND 20,1

	.byte	bytecode_ld_ir1_pb
	.byte	20

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; P=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_P
	.byte	0

	; RETURN

	.byte	bytecode_return

LINE_8

	; RETURN

	.byte	bytecode_return

LINE_9

	; D=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_D
	.byte	1

	; V=-2

	.byte	bytecode_ld_ix_nb
	.byte	bytecode_INTVAR_V
	.byte	-2

	; RETURN

	.byte	bytecode_return

LINE_10

	; V=-2

	.byte	bytecode_ld_ix_nb
	.byte	bytecode_INTVAR_V
	.byte	-2

	; RETURN

	.byte	bytecode_return

LINE_11

	; ON B GOTO 8,12,8,12,8,12,8,12,8,12,8,10

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_B

	.byte	bytecode_ongoto_ir1_is
	.byte	12
	.word	LINE_8, LINE_12, LINE_8, LINE_12, LINE_8, LINE_12, LINE_8, LINE_12, LINE_8, LINE_12, LINE_8, LINE_10

	; V=2

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_V
	.byte	2

	; RETURN

	.byte	bytecode_return

LINE_12

	; V=V(RND(2))

	.byte	bytecode_irnd_ir1_pb
	.byte	2

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_V

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_V

	; RETURN

	.byte	bytecode_return

LINE_13

	; D=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_D
	.byte	0

	; V=2

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_V
	.byte	2

	; RETURN

	.byte	bytecode_return

LINE_14

	; V=2

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_V
	.byte	2

	; RETURN

	.byte	bytecode_return

LINE_15

	; ON SGN(X-A)+2 GOSUB 9,11,13

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_X

	.byte	bytecode_sub_ir1_ir1_ix
	.byte	bytecode_INTVAR_A

	.byte	bytecode_sgn_ir1_ir1

	.byte	bytecode_add_ir1_ir1_pb
	.byte	2

	.byte	bytecode_ongosub_ir1_is
	.byte	3
	.word	LINE_9, LINE_11, LINE_13

	; U=V

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_V

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_U

	; ON SGN(Y-B)+2 GOSUB 10,11,14

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_sub_ir1_ir1_ix
	.byte	bytecode_INTVAR_B

	.byte	bytecode_sgn_ir1_ir1

	.byte	bytecode_add_ir1_ir1_pb
	.byte	2

	.byte	bytecode_ongosub_ir1_is
	.byte	3
	.word	LINE_10, LINE_11, LINE_14

	; G=K

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_K

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_G

	; K=K(PEEK(((B+V)*W)+A+U+M))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_B

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_V

	.byte	bytecode_mul_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_A

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_U

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_K

	; ON K GOTO 40,60,16,16,16,16,16,22,22

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_K

	.byte	bytecode_ongoto_ir1_is
	.byte	9
	.word	LINE_40, LINE_60, LINE_16, LINE_16, LINE_16, LINE_16, LINE_16, LINE_22, LINE_22

LINE_16

	; PRINT @O, X$(G,2);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_G

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @O+W, Y$(G,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_G

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; A+=U

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_U

	.byte	bytecode_add_ix_ix_ir1
	.byte	bytecode_INTVAR_A

	; B+=V

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_V

	.byte	bytecode_add_ix_ix_ir1
	.byte	bytecode_INTVAR_B

	; O=(W*B)+A

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_mul_ir1_ir1_ix
	.byte	bytecode_INTVAR_B

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_A

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_O

	; ON K GOSUB 42,90

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_K

	.byte	bytecode_ongosub_ir1_is
	.byte	2
	.word	LINE_42, LINE_90

	; PRINT @O, A$(K,D);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_K

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_D

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_pr_sr1

	; PRINT @O+W, B$(K,D);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_K

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_D

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_pr_sr1

	; SOUND H,1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_H

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; SOUND 50,1

	.byte	bytecode_ld_ir1_pb
	.byte	50

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; RETURN

	.byte	bytecode_return

LINE_18

	; ON A(T) GOTO 44

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ongoto_ir1_is
	.byte	1
	.word	LINE_44

	; PRINT @O(T), X$(I(T),2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @O(T)+W, Y$(I(T),2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; GOSUB 12

	.byte	bytecode_gosub_ix
	.word	LINE_12

	; U=2

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_U
	.byte	2

	; G(T)=I(T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_G

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ip_ir1

	; I(T)=K(PEEK(((B(T)+U)*W)+A(T)+V+M))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_U

	.byte	bytecode_mul_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_add_ir1_ir1_ir2

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_V

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_ir1

LINE_19

	; ON I(T) GOTO 46,90,20,20,20,20,20,21,21

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ongoto_ir1_is
	.byte	9
	.word	LINE_46, LINE_90, LINE_20, LINE_20, LINE_20, LINE_20, LINE_20, LINE_21, LINE_21

LINE_20

	; A(T)+=V

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_V

	.byte	bytecode_add_ip_ip_ir1

	; B(T)+=U

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_U

	.byte	bytecode_add_ip_ip_ir1

	; O(T)=(B(T)*W)+A(T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_mul_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_add_ir1_ir1_ir2

	.byte	bytecode_ld_ip_ir1

	; PRINT @O(T), A$(I(T),2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_pr_sr1

	; PRINT @O(T)+W, B$(I(T),2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_pr_sr1

	; ON A GOSUB 38

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_A

	.byte	bytecode_ongosub_ir1_is
	.byte	1
	.word	LINE_38

	; RETURN

	.byte	bytecode_return

LINE_21

	; PRINT @O(T), A$(G(T),2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_G

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_pr_sr1

	; PRINT @O(T)+W, B$(G(T),2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_G

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_pr_sr1

	; I(T)=G(T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_G

	.byte	bytecode_ld_ip_ir1

	; RETURN

	.byte	bytecode_return

LINE_22

	; PRINT @O, A$(G,D);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_G

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_D

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_pr_sr1

	; PRINT @O+W, B$(G,D);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_G

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_D

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_pr_sr1

	; K=G

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_G

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_K

	; RETURN

	.byte	bytecode_return

LINE_24

	; ON K(P) GOSUB 50,8,6,6,6,6,6,70,80,200

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_P

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ongosub_ir1_is
	.byte	10
	.word	LINE_50, LINE_8, LINE_6, LINE_6, LINE_6, LINE_6, LINE_6, LINE_70, LINE_80, LINE_200

	; RETURN

	.byte	bytecode_return

LINE_25

	; FOR Z=1 TO 65000

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_Z
	.byte	1

	.byte	bytecode_to_ip_pw
	.word	65000

	; GOSUB 83

	.byte	bytecode_gosub_ix
	.word	LINE_83

	; IF L>448 THEN

	.byte	bytecode_ld_ir1_pw
	.word	448

	.byte	bytecode_ldlt_ir1_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_26

	; L=14

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_L
	.byte	14

LINE_26

	; ON K(ASC(INKEY$+B$)) GOSUB 2,3,4,5

	.byte	bytecode_inkey_sr1

	.byte	bytecode_strinit_sr1_sr1

	.byte	bytecode_strcat_sr1_sr1_sx
	.byte	bytecode_STRVAR_B

	.byte	bytecode_asc_ir1_sr1

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ongosub_ir1_is
	.byte	4
	.word	LINE_2, LINE_3, LINE_4, LINE_5

	; ON RND(S) GOSUB 15

	.byte	bytecode_rnd_fr1_ix
	.byte	bytecode_INTVAR_S

	.byte	bytecode_ongosub_ir1_is
	.byte	1
	.word	LINE_15

	; FOR T=1 TO 2

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	1

	.byte	bytecode_to_ip_pb
	.byte	2

	; ON RND(S(T)) GOSUB 18

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_S

	.byte	bytecode_rnd_fr1_ir1

	.byte	bytecode_ongosub_ir1_is
	.byte	1
	.word	LINE_18

LINE_28

	; IF LC<>0 THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_LC

	.byte	bytecode_ldne_ir1_ir1_pb
	.byte	0

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_29

	; Z=65000

	.byte	bytecode_ld_ix_pw
	.byte	bytecode_INTVAR_Z
	.word	65000

	; J=28

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_J
	.byte	28

LINE_29

	; NEXT

	.byte	bytecode_next

	; NEXT

	.byte	bytecode_next

LINE_31

	; I$=INKEY$

	.byte	bytecode_inkey_sr1

	.byte	bytecode_ld_sx_sr1
	.byte	bytecode_STRVAR_I

	; IF J>27 THEN

	.byte	bytecode_ld_ir1_pb
	.byte	27

	.byte	bytecode_ldlt_ir1_ir1_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_32

	; N+=H

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_H

	.byte	bytecode_add_ix_ix_ir1
	.byte	bytecode_INTVAR_N

	; PRINT @I, STR$(N);" ";

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_I

	.byte	bytecode_str_sr1_ix
	.byte	bytecode_INTVAR_N

	.byte	bytecode_pr_sr1

	.byte	bytecode_pr_ss
	.text	1, " "

	; PRINT @480, "           NEXT LEVEL!";

	.byte	bytecode_prat_pw
	.word	480

	.byte	bytecode_pr_ss
	.text	22, "           NEXT LEVEL!"

	; GOSUB 6000

	.byte	bytecode_gosub_ix
	.word	LINE_6000

	; GOTO 120

	.byte	bytecode_goto_ix
	.word	LINE_120

LINE_32

	; LF-=1

	.byte	bytecode_sub_ix_ix_pb
	.byte	bytecode_INTVAR_LF
	.byte	1

	; IF LF>0 THEN

	.byte	bytecode_ld_ir1_pb
	.byte	0

	.byte	bytecode_ldlt_ir1_ir1_ix
	.byte	bytecode_INTVAR_LF

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_33

	; GOSUB 230

	.byte	bytecode_gosub_ix
	.word	LINE_230

	; PRINT @0, "         @!#@!";

	.byte	bytecode_prat_pb
	.byte	0

	.byte	bytecode_pr_ss
	.text	14, "         @!#@!"

	; FOR T=1 TO 10

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	1

	.byte	bytecode_to_ip_pb
	.byte	10

	; SOUND RND(H),1

	.byte	bytecode_rnd_fr1_ix
	.byte	bytecode_INTVAR_H

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; NEXT

	.byte	bytecode_next

	; PRINT @0, BL$;

	.byte	bytecode_prat_pb
	.byte	0

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_BL

	; GOTO 260

	.byte	bytecode_goto_ix
	.word	LINE_260

LINE_33

	; PRINT @21, "PLAY AGAIN?";

	.byte	bytecode_prat_pb
	.byte	21

	.byte	bytecode_pr_ss
	.text	11, "PLAY AGAIN?"

	; PRINT @218, STR$(LF);" ";

	.byte	bytecode_prat_pb
	.byte	218

	.byte	bytecode_str_sr1_ix
	.byte	bytecode_INTVAR_LF

	.byte	bytecode_pr_sr1

	.byte	bytecode_pr_ss
	.text	1, " "

LINE_34

	; I$=INKEY$

	.byte	bytecode_inkey_sr1

	.byte	bytecode_ld_sx_sr1
	.byte	bytecode_STRVAR_I

	; R=RND(1000)

	.byte	bytecode_irnd_ir1_pw
	.word	1000

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_R

	; WHEN I$="" GOTO 34

	.byte	bytecode_ld_sr1_sx
	.byte	bytecode_STRVAR_I

	.byte	bytecode_ldeq_ir1_sr1_ss
	.text	0, ""

	.byte	bytecode_jmpne_ir1_ix
	.word	LINE_34

LINE_35

	; WHEN I$="Y" GOTO 100

	.byte	bytecode_ld_sr1_sx
	.byte	bytecode_STRVAR_I

	.byte	bytecode_ldeq_ir1_sr1_ss
	.text	1, "Y"

	.byte	bytecode_jmpne_ir1_ix
	.word	LINE_100

LINE_36

	; IF I$="N" THEN

	.byte	bytecode_ld_sr1_sx
	.byte	bytecode_STRVAR_I

	.byte	bytecode_ldeq_ir1_sr1_ss
	.text	1, "N"

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_37

	; CLS

	.byte	bytecode_cls

	; END

	.byte	bytecode_progend

LINE_37

	; GOTO 33

	.byte	bytecode_goto_ix
	.word	LINE_33

LINE_38

	; IF RND(8)>1 THEN

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_irnd_ir2_pb
	.byte	8

	.byte	bytecode_ldlt_ir1_ir1_ir2

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_39

	; RETURN

	.byte	bytecode_return

LINE_39

	; S=SS

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_SS

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_S

	; O=O(T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_O

	; A=A(T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_A

	; B=B(T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_B

	; K=I(T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_K

	; G=G(T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_G

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_G

	; A(T)=1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	1

	; PRINT @O, A$(K,D);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_K

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_D

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_pr_sr1

	; FOR F=1 TO 10

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_F
	.byte	1

	.byte	bytecode_to_ip_pb
	.byte	10

	; SOUND H,1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_H

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; SOUND 50,1

	.byte	bytecode_ld_ir1_pb
	.byte	50

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; NEXT

	.byte	bytecode_next

	; PRINT @O+W, B$(K,D);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_K

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_D

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_pr_sr1

	; RETURN

	.byte	bytecode_return

LINE_40

	; S=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_S
	.byte	0

	; N+=H

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_H

	.byte	bytecode_add_ix_ix_ir1
	.byte	bytecode_INTVAR_N

	; PRINT @O, X$(G,2);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_G

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @O+W, Y$(G,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_G

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; A+=U

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_U

	.byte	bytecode_add_ix_ix_ir1
	.byte	bytecode_INTVAR_A

	; B+=V

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_V

	.byte	bytecode_add_ix_ix_ir1
	.byte	bytecode_INTVAR_B

	; O=(W*B)+A

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_mul_ir1_ir1_ix
	.byte	bytecode_INTVAR_B

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_A

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_O

	; PRINT @O, A$(K,D);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_K

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_D

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_pr_sr1

	; PRINT @O+W, B$(K,D);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_K

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_D

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_pr_sr1

LINE_42

	; FL=SHIFT(ABS(B),1)+2

	.byte	bytecode_abs_ir1_ix
	.byte	bytecode_INTVAR_B

	.byte	bytecode_shift_ir1_ir1_pb
	.byte	1

	.byte	bytecode_add_ir1_ir1_pb
	.byte	2

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_FL

	; PRINT @O, X$(1,2);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @O+W, Y$(1,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; O=(W*14)+A

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_mul_ir1_ir1_pb
	.byte	14

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_A

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_O

	; FOR F=30 TO 1 STEP -1

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_F
	.byte	30

	.byte	bytecode_to_ip_pb
	.byte	1

	.byte	bytecode_ld_ir1_nb
	.byte	-1

	.byte	bytecode_step_ip_ir1

	; IF F=FL THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_F

	.byte	bytecode_ldeq_ir1_ir1_ix
	.byte	bytecode_INTVAR_FL

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_43

	; PRINT @O, A$(1,D);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_D

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_pr_sr1

	; PRINT @O+W, B$(1,D);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_D

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_pr_sr1

LINE_43

	; SOUND F,1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_F

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; PRINT @O, X$(1,2);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @O+W, Y$(1,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; NEXT

	.byte	bytecode_next

	; SOUND 1,5

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	5

	.byte	bytecode_sound_ir1_ir2

	; PRINT @I, STR$(N);" ";

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_I

	.byte	bytecode_str_sr1_ix
	.byte	bytecode_INTVAR_N

	.byte	bytecode_pr_sr1

	.byte	bytecode_pr_ss
	.text	1, " "

	; A=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_A
	.byte	1

	; RETURN

	.byte	bytecode_return

LINE_44

	; ON RND(2) GOTO 8

	.byte	bytecode_irnd_ir1_pb
	.byte	2

	.byte	bytecode_ongoto_ir1_is
	.byte	1
	.word	LINE_8

	; A(T)=14

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	14

	; B(T)=0

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	0

	; O(T)=(B(T)*W)+A(T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_mul_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_add_ir1_ir1_ir2

	.byte	bytecode_ld_ip_ir1

	; I(T)=K(PEEK(O(T)+M))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_ir1

	; PRINT @O(T), A$(C,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_pr_sr1

	; PRINT @O(T)+W, B$(C,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_pr_sr1

	; G(T)=I(T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_G

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ip_ir1

LINE_45

	; SOUND 1,1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; PRINT @O(T), X$(C,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @O(T)+W, Y$(C,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; ON 1-(O(T)=L) GOTO 48,49

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_ldeq_ir2_ir2_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_sub_ir1_ir1_ir2

	.byte	bytecode_ongoto_ir1_is
	.byte	2
	.word	LINE_48, LINE_49

LINE_46

	; A(T)+=V

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_V

	.byte	bytecode_add_ip_ip_ir1

	; B(T)+=2

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_add_ip_ip_pb
	.byte	2

	; O(T)=(B(T)*W)+A(T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_mul_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_add_ir1_ir1_ir2

	.byte	bytecode_ld_ip_ir1

	; PRINT @O(T), A$(1,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_pr_sr1

	; PRINT @O(T)+W, B$(1,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_pr_sr1

LINE_47

	; PRINT @O(T), X$(1,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @O(T)+W, Y$(1,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; A(T)=1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	1

	; SOUND 200,1

	.byte	bytecode_ld_ir1_pb
	.byte	200

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; RETURN

	.byte	bytecode_return

LINE_48

	; PRINT @O(T), A$(C,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_pr_sr1

	; PRINT @O(T)+W, B$(C,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_pr_sr1

	; I(T)=C

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ip_ir1

	; RETURN

	.byte	bytecode_return

LINE_49

	; PRINT @O(T), A$(C,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_pr_sr1

	; PRINT @O(T)+W, B$(C,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_pr_sr1

	; I(T)=C

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ip_ir1

	; GOSUB 91

	.byte	bytecode_gosub_ix
	.word	LINE_91

	; GOSUB 18

	.byte	bytecode_gosub_ix
	.word	LINE_18

	; PRINT @L, X$(C,1);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L+W, Y$(C,1);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; RETURN

	.byte	bytecode_return

LINE_50

	; PRINT @L, X$(1,2);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L+W, Y$(1,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; PRINT @0, "@!#?@!        ";

	.byte	bytecode_prat_pb
	.byte	0

	.byte	bytecode_pr_ss
	.text	14, "@!#?@!        "

LINE_52

	; FL=SHIFT(ABS(Y),1)+2

	.byte	bytecode_abs_ir1_ix
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_shift_ir1_ir1_pb
	.byte	1

	.byte	bytecode_add_ir1_ir1_pb
	.byte	2

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_FL

	; L=(W*14)+X

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_mul_ir1_ir1_pb
	.byte	14

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_X

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_L

	; Z=65000

	.byte	bytecode_ld_ix_pw
	.byte	bytecode_INTVAR_Z
	.word	65000

	; FOR F=30 TO 1 STEP -1

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_F
	.byte	30

	.byte	bytecode_to_ip_pb
	.byte	1

	.byte	bytecode_ld_ir1_nb
	.byte	-1

	.byte	bytecode_step_ip_ir1

	; IF F=FL THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_F

	.byte	bytecode_ldeq_ir1_ir1_ix
	.byte	bytecode_INTVAR_FL

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_53

	; PRINT @L, X$(1,1);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L+W, Y$(1,1);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

LINE_53

	; SOUND F,1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_F

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; PRINT @L, X$(1,2);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L+W, Y$(1,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; NEXT

	.byte	bytecode_next

	; SOUND 1,5

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	5

	.byte	bytecode_sound_ir1_ir2

	; RETURN

	.byte	bytecode_return

LINE_60

	; K=C

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_K

	; GOSUB 16

	.byte	bytecode_gosub_ix
	.word	LINE_16

	; PRINT @0, "SNAKE BITE!   ";

	.byte	bytecode_prat_pb
	.byte	0

	.byte	bytecode_pr_ss
	.text	14, "SNAKE BITE!   "

	; GOSUB 99

	.byte	bytecode_gosub_ix
	.word	LINE_99

	; FOR Z2=1 TO 25

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_Z2
	.byte	1

	.byte	bytecode_to_ip_pb
	.byte	25

	; I$=INKEY$

	.byte	bytecode_inkey_sr1

	.byte	bytecode_ld_sx_sr1
	.byte	bytecode_STRVAR_I

	; NEXT

	.byte	bytecode_next

	; RETURN

	.byte	bytecode_return

LINE_70

	; PRINT @O, A$(K,D);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_K

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_D

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_pr_sr1

	; PRINT @O+W, B$(K,D);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_K

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_D

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_pr_sr1

	; PRINT @0, "HIT THE SNAKE!";

	.byte	bytecode_prat_pb
	.byte	0

	.byte	bytecode_pr_ss
	.text	14, "HIT THE SNAKE!"

	; GOSUB 99

	.byte	bytecode_gosub_ix
	.word	LINE_99

	; RETURN

	.byte	bytecode_return

LINE_80

	; FOR T=1 TO 2

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	1

	.byte	bytecode_to_ip_pb
	.byte	2

	; IF L=O(T) THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_ldeq_ir1_ir1_ir2

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_81

	; PRINT @O(T), A$(I(T),2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_pr_sr1

	; PRINT @O(T)+W, B$(I(T),2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_pr_sr1

LINE_81

	; NEXT

	.byte	bytecode_next

	; PRINT @0, "HIT AN EGG!   ";

	.byte	bytecode_prat_pb
	.byte	0

	.byte	bytecode_pr_ss
	.text	14, "HIT AN EGG!   "

	; GOSUB 99

	.byte	bytecode_gosub_ix
	.word	LINE_99

	; FOR Z2=1 TO 25

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_Z2
	.byte	1

	.byte	bytecode_to_ip_pb
	.byte	25

	; I$=INKEY$

	.byte	bytecode_inkey_sr1

	.byte	bytecode_ld_sx_sr1
	.byte	bytecode_STRVAR_I

	; NEXT

	.byte	bytecode_next

	; RETURN

	.byte	bytecode_return

LINE_83

	; FOR Z2=1 TO Z3

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_Z2
	.byte	1

	.byte	bytecode_to_ip_ix
	.byte	bytecode_FLTVAR_Z3

	; NEXT

	.byte	bytecode_next

	; RETURN

	.byte	bytecode_return

LINE_90

	; I(T)=C

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ip_ir1

	; GOSUB 20

	.byte	bytecode_gosub_ix
	.word	LINE_20

LINE_91

	; PRINT @0, "HIT BY EGG!   ";

	.byte	bytecode_prat_pb
	.byte	0

	.byte	bytecode_pr_ss
	.text	14, "HIT BY EGG!   "

	; GOSUB 99

	.byte	bytecode_gosub_ix
	.word	LINE_99

	; RETURN

	.byte	bytecode_return

LINE_95

	; LC=-1

	.byte	bytecode_ld_ix_nb
	.byte	bytecode_INTVAR_LC
	.byte	-1

	; PRINT @0, "LEVEL CLEARED!";

	.byte	bytecode_prat_pb
	.byte	0

	.byte	bytecode_pr_ss
	.text	14, "LEVEL CLEARED!"

	; FOR Z=1 TO 10

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_Z
	.byte	1

	.byte	bytecode_to_ip_pb
	.byte	10

	; SOUND Z*10,1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_Z

	.byte	bytecode_mul_ir1_ir1_pb
	.byte	10

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; NEXT Z

	.byte	bytecode_nextvar_ix
	.byte	bytecode_INTVAR_Z

	.byte	bytecode_next

LINE_99

	; FOR Z=1 TO 800

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_Z
	.byte	1

	.byte	bytecode_to_ip_pw
	.word	800

	; NEXT Z

	.byte	bytecode_nextvar_ix
	.byte	bytecode_INTVAR_Z

	.byte	bytecode_next

	; Z=65000

	.byte	bytecode_ld_ix_pw
	.byte	bytecode_INTVAR_Z
	.word	65000

	; RETURN

	.byte	bytecode_return

LINE_100

	; LV=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_LV
	.byte	0

	; SS=30

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_SS
	.byte	30

	; S(1)=20

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_S

	.byte	bytecode_ld_ip_pb
	.byte	20

	; S(2)=20

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_S

	.byte	bytecode_ld_ip_pb
	.byte	20

	; IF N>HS THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_HS

	.byte	bytecode_ldlt_ir1_ir1_ix
	.byte	bytecode_INTVAR_N

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_110

	; HS=N

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_N

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_HS

LINE_110

	; N=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_N
	.byte	0

	; LF=3

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_LF
	.byte	3

LINE_120

	; CLS 1

	.byte	bytecode_clsn_pb
	.byte	1

	; GOSUB 3000

	.byte	bytecode_gosub_ix
	.word	LINE_3000

	; GOSUB 2000

	.byte	bytecode_gosub_ix
	.word	LINE_2000

LINE_140

	; J=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_J
	.byte	0

	; X=14

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_X
	.byte	14

	; Y=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_Y
	.byte	0

	; L=14

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_L
	.byte	14

	; C=RND(5)+2

	.byte	bytecode_irnd_ir1_pb
	.byte	5

	.byte	bytecode_add_ir1_ir1_pb
	.byte	2

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_C

	; WHEN C=Q GOTO 140

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ldeq_ir1_ir1_ix
	.byte	bytecode_INTVAR_Q

	.byte	bytecode_jmpne_ir1_ix
	.word	LINE_140

LINE_145

	; GOSUB 250

	.byte	bytecode_gosub_ix
	.word	LINE_250

LINE_150

	; D=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_D
	.byte	0

	; A=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_A
	.byte	1

	; A(1)=1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	1

	; A(2)=1

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	1

	; SS-=2

	.byte	bytecode_sub_ix_ix_pb
	.byte	bytecode_INTVAR_SS
	.byte	2

	; S(1)-=1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_S

	.byte	bytecode_sub_ip_ip_pb
	.byte	1

	; S(2)-=1

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_S

	.byte	bytecode_sub_ip_ip_pb
	.byte	1

	; IF SS<10 THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_SS

	.byte	bytecode_ldlt_ir1_ir1_pb
	.byte	10

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_155

	; SS=10

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_SS
	.byte	10

	; S(1)=10

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_S

	.byte	bytecode_ld_ip_pb
	.byte	10

	; S(2)=10

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_S

	.byte	bytecode_ld_ip_pb
	.byte	10

LINE_155

	; S=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_S
	.byte	0

	; GOTO 260

	.byte	bytecode_goto_ix
	.word	LINE_260

LINE_200

	; PRINT @0, "              ";

	.byte	bytecode_prat_pb
	.byte	0

	.byte	bytecode_pr_ss
	.text	14, "              "

	; PRINT @L, X$(1,0);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L+W, Y$(1,0);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; IF S>0 THEN

	.byte	bytecode_ld_ir1_pb
	.byte	0

	.byte	bytecode_ldlt_ir1_ir1_ix
	.byte	bytecode_INTVAR_S

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_210

	; S=4

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_S
	.byte	4

LINE_210

	; FOR Y=Y TO 2 STEP -1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_for_ix_ir1
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_to_ip_pb
	.byte	2

	.byte	bytecode_ld_ir1_nb
	.byte	-1

	.byte	bytecode_step_ip_ir1

	; L=(W*Y)+X

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_mul_ir1_ir1_ix
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_X

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_L

	; PRINT @L, X$(1,2);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L+W, Y$(1,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

LINE_220

	; PRINT @L-64, X$(1,0);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_sub_ir1_ir1_pb
	.byte	64

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L-W, Y$(1,0);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_sub_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; SOUND H,1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_H

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; SOUND 30-SHIFT(Y,1),1

	.byte	bytecode_ld_ir1_pb
	.byte	30

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	1

	.byte	bytecode_sub_ir1_ir1_ir2

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; FOR T=1 TO 2

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	1

	.byte	bytecode_to_ip_pb
	.byte	2

LINE_221

	; WHEN (A(T)=14) AND (B(T)=0) GOSUB 18

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ldeq_ir1_ir1_pb
	.byte	14

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ldeq_ir2_ir2_pb
	.byte	0

	.byte	bytecode_and_ir1_ir1_ir2

	.byte	bytecode_jsrne_ir1_ix
	.word	LINE_18

LINE_222

	; NEXT

	.byte	bytecode_next

LINE_223

	; FOR T=1 TO 2

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	1

	.byte	bytecode_to_ip_pb
	.byte	2

	; ON RND(S(T)) GOSUB 18

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_S

	.byte	bytecode_rnd_fr1_ir1

	.byte	bytecode_ongosub_ir1_is
	.byte	1
	.word	LINE_18

	; ON RND(S) GOSUB 15

	.byte	bytecode_rnd_fr1_ix
	.byte	bytecode_INTVAR_S

	.byte	bytecode_ongosub_ir1_is
	.byte	1
	.word	LINE_15

LINE_225

	; NEXT

	.byte	bytecode_next

	; NEXT

	.byte	bytecode_next

	; PRINT @L-64, X$(1,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_sub_ir1_ir1_pb
	.byte	64

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L-W, Y$(1,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_sub_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; IF S=4 THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_S

	.byte	bytecode_ldeq_ir1_ir1_pb
	.byte	4

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_230

	; S=SS

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_SS

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_S

LINE_230

	; X=14

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_X
	.byte	14

	; Y=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_Y
	.byte	0

	; L=14

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_L
	.byte	14

LINE_250

	; P=PEEK(M+L)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_P

	; PRINT @L, X$(C,1);

	.byte	bytecode_prat_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	; PRINT @L+W, Y$(C,1);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

	; ON K(P) GOSUB 50,8,6,6,6,6,6,70,80,200

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_P

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ongosub_ir1_is
	.byte	10
	.word	LINE_50, LINE_8, LINE_6, LINE_6, LINE_6, LINE_6, LINE_6, LINE_70, LINE_80, LINE_200

	; RETURN

	.byte	bytecode_return

LINE_260

	; PRINT @218, STR$(LF);" ";

	.byte	bytecode_prat_pb
	.byte	218

	.byte	bytecode_str_sr1_ix
	.byte	bytecode_INTVAR_LF

	.byte	bytecode_pr_sr1

	.byte	bytecode_pr_ss
	.text	1, " "

	; FOR Z=1 TO 25

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_Z
	.byte	1

	.byte	bytecode_to_ip_pb
	.byte	25

	; GOSUB 83

	.byte	bytecode_gosub_ix
	.word	LINE_83

	; IF LC<>0 THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_LC

	.byte	bytecode_ldne_ir1_ir1_pb
	.byte	0

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_261

	; Z=65000

	.byte	bytecode_ld_ix_pw
	.byte	bytecode_INTVAR_Z
	.word	65000

	; J=28

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_J
	.byte	28

LINE_261

	; ON K(ASC(INKEY$+B$)) GOSUB 2,3,4,5

	.byte	bytecode_inkey_sr1

	.byte	bytecode_strinit_sr1_sr1

	.byte	bytecode_strcat_sr1_sr1_sx
	.byte	bytecode_STRVAR_B

	.byte	bytecode_asc_ir1_sr1

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ongosub_ir1_is
	.byte	4
	.word	LINE_2, LINE_3, LINE_4, LINE_5

	; NEXT

	.byte	bytecode_next

	; GOTO 25

	.byte	bytecode_goto_ix
	.word	LINE_25

LINE_900

	; DIM X$(9,2),Y$(9,2),A$(9,2),B$(9,2),K(255),V(2),A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z

	.byte	bytecode_ld_ir1_pb
	.byte	9

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrdim2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_ld_ir1_pb
	.byte	9

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrdim2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_ld_ir1_pb
	.byte	9

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrdim2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_ld_ir1_pb
	.byte	9

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrdim2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_ld_ir1_pb
	.byte	255

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_V

LINE_910

	; DIM O(2),I(2),G(2),A(2),B(2),S(2),LF,LV,FL,SS,I$,B$,BL$

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_O

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_G

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_S

	; GOSUB 1000

	.byte	bytecode_gosub_ix
	.word	LINE_1000

	; GOSUB 5000

	.byte	bytecode_gosub_ix
	.word	LINE_5000

	; GOTO 100

	.byte	bytecode_goto_ix
	.word	LINE_100

LINE_1000

	; FOR T=0 TO 7

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	0

	.byte	bytecode_to_ip_pb
	.byte	7

LINE_1010

	; X$(T+1,0)="””"+CHR$(SHIFT(T,4)+141)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_add_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrref2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_strinit_sr1_ss
	.text	2, "\x94\x94"

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	141

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_sp_sr1

	; Y$(T+1,0)=CHR$(SHIFT(T,4)+132)+CHR$(SHIFT(T,4)+138)+CHR$(SHIFT(T,4)+141)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_add_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrref2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir1_ir1_pb
	.byte	4

	.byte	bytecode_add_ir1_ir1_pb
	.byte	132

	.byte	bytecode_chr_sr1_ir1

	.byte	bytecode_strinit_sr1_sr1

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	138

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	141

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_sp_sr1

LINE_1020

	; X$(T+1,1)=CHR$(SHIFT(T,4)+142)+"˜˜"

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_add_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrref2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir1_ir1_pb
	.byte	4

	.byte	bytecode_add_ir1_ir1_pb
	.byte	142

	.byte	bytecode_chr_sr1_ir1

	.byte	bytecode_strinit_sr1_sr1

	.byte	bytecode_strcat_sr1_sr1_ss
	.text	2, "\x98\x98"

	.byte	bytecode_ld_sp_sr1

	; Y$(T+1,1)=CHR$(SHIFT(T,4)+142)+CHR$(SHIFT(T,4)+133)+CHR$(SHIFT(T,4)+136)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_add_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrref2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir1_ir1_pb
	.byte	4

	.byte	bytecode_add_ir1_ir1_pb
	.byte	142

	.byte	bytecode_chr_sr1_ir1

	.byte	bytecode_strinit_sr1_sr1

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	133

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	136

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_sp_sr1

LINE_1030

	; X$(T+1,2)=CHR$(SHIFT(T,4)+143)+CHR$(SHIFT(T,4)+143)+CHR$(SHIFT(T,4)+143)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_add_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrref2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir1_ir1_pb
	.byte	4

	.byte	bytecode_add_ir1_ir1_pb
	.byte	143

	.byte	bytecode_chr_sr1_ir1

	.byte	bytecode_strinit_sr1_sr1

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	143

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	143

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_sp_sr1

	; Y$(T+1,2)=CHR$(SHIFT(T,4)+143)+CHR$(SHIFT(T,4)+143)+CHR$(SHIFT(T,4)+143)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_add_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrref2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir1_ir1_pb
	.byte	4

	.byte	bytecode_add_ir1_ir1_pb
	.byte	143

	.byte	bytecode_chr_sr1_ir1

	.byte	bytecode_strinit_sr1_sr1

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	143

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	143

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_sp_sr1

LINE_1040

	; A$(T+1,0)=CHR$(SHIFT(T,4)+140)+CHR$(SHIFT(T,4)+141)+"ø"

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_add_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrref2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir1_ir1_pb
	.byte	4

	.byte	bytecode_add_ir1_ir1_pb
	.byte	140

	.byte	bytecode_chr_sr1_ir1

	.byte	bytecode_strinit_sr1_sr1

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	141

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_strcat_sr1_sr1_ss
	.text	1, "\xF8"

	.byte	bytecode_ld_sp_sr1

	; A$(T+1,1)="ô"+CHR$(SHIFT(T,4)+142)+CHR$(SHIFT(T,4)+140)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_add_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrref2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_strinit_sr1_ss
	.text	1, "\xF4"

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	142

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	140

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_sp_sr1

LINE_1045

	; B$(T+1,0)=CHR$(SHIFT(T,4)+133)+CHR$(SHIFT(T,4)+132)+CHR$(SHIFT(T,4)+133)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_add_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrref2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir1_ir1_pb
	.byte	4

	.byte	bytecode_add_ir1_ir1_pb
	.byte	133

	.byte	bytecode_chr_sr1_ir1

	.byte	bytecode_strinit_sr1_sr1

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	132

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	133

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_sp_sr1

	; B$(T+1,1)=CHR$(SHIFT(T,4)+138)+CHR$(SHIFT(T,4)+136)+CHR$(SHIFT(T,4)+138)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_add_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrref2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir1_ir1_pb
	.byte	4

	.byte	bytecode_add_ir1_ir1_pb
	.byte	138

	.byte	bytecode_chr_sr1_ir1

	.byte	bytecode_strinit_sr1_sr1

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	136

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	138

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_sp_sr1

LINE_1050

	; A$(T+1,2)=CHR$(SHIFT(T,4)+136)+"€"+CHR$(SHIFT(T,4)+141)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_add_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrref2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir1_ir1_pb
	.byte	4

	.byte	bytecode_add_ir1_ir1_pb
	.byte	136

	.byte	bytecode_chr_sr1_ir1

	.byte	bytecode_strinit_sr1_sr1

	.byte	bytecode_strcat_sr1_sr1_ss
	.text	1, "\x80"

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	141

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_sp_sr1

LINE_1055

	; B$(T+1,2)=CHR$(SHIFT(T,4)+130)+"€"+CHR$(SHIFT(T,4)+135)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_add_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrref2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir1_ir1_pb
	.byte	4

	.byte	bytecode_add_ir1_ir1_pb
	.byte	130

	.byte	bytecode_chr_sr1_ir1

	.byte	bytecode_strinit_sr1_sr1

	.byte	bytecode_strcat_sr1_sr1_ss
	.text	1, "\x80"

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	4

	.byte	bytecode_add_ir2_ir2_pb
	.byte	135

	.byte	bytecode_chr_sr2_ir2

	.byte	bytecode_strcat_sr1_sr1_sr2

	.byte	bytecode_ld_sp_sr1

LINE_1060

	; NEXT

	.byte	bytecode_next

	; C=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_C
	.byte	1

	; FOR T=143 TO 255 STEP 16

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	143

	.byte	bytecode_to_ip_pb
	.byte	255

	.byte	bytecode_ld_ir1_pb
	.byte	16

	.byte	bytecode_step_ip_ir1

	; K(T)=C

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ip_ir1

	; C+=1

	.byte	bytecode_add_ix_ix_pb
	.byte	bytecode_INTVAR_C
	.byte	1

	; NEXT

	.byte	bytecode_next

	; K(96)=10

	.byte	bytecode_ld_ir1_pb
	.byte	96

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	10

	; W=32

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_W
	.byte	32

	; I=122

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_I
	.byte	122

	; H=100

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_H
	.byte	100

LINE_1070

	; FOR T=142 TO 255 STEP 16

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	142

	.byte	bytecode_to_ip_pb
	.byte	255

	.byte	bytecode_ld_ir1_pb
	.byte	16

	.byte	bytecode_step_ip_ir1

	; K(T)=2

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	2

	; NEXT

	.byte	bytecode_next

	; K(148)=2

	.byte	bytecode_ld_ir1_pb
	.byte	148

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	2

LINE_1075

	; FOR T=140 TO 255 STEP 16

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	140

	.byte	bytecode_to_ip_pb
	.byte	255

	.byte	bytecode_ld_ir1_pb
	.byte	16

	.byte	bytecode_step_ip_ir1

	; K(T)=8

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	8

	; NEXT

	.byte	bytecode_next

	; K(244)=8

	.byte	bytecode_ld_ir1_pb
	.byte	244

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	8

LINE_1080

	; FOR T=136 TO 255 STEP 16

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	136

	.byte	bytecode_to_ip_pb
	.byte	255

	.byte	bytecode_ld_ir1_pb
	.byte	16

	.byte	bytecode_step_ip_ir1

	; K(T)=9

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	9

	; NEXT

	.byte	bytecode_next

LINE_1090

	; A$(8,0)="   "

	.byte	bytecode_ld_ir1_pb
	.byte	8

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrref2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_ld_sr1_ss
	.text	3, "   "

	.byte	bytecode_ld_sp_sr1

	; B$(8,0)="ŒŒŒ"

	.byte	bytecode_ld_ir1_pb
	.byte	8

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrref2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_ld_sr1_ss
	.text	3, "\x8C\x8C\x8C"

	.byte	bytecode_ld_sp_sr1

LINE_1095

	; Y$(1,0)="„ˆŒ"

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrref2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_ld_sr1_ss
	.text	3, "\x84\x88\x8C"

	.byte	bytecode_ld_sp_sr1

LINE_1110

	; K(65)=1

	.byte	bytecode_ld_ir1_pb
	.byte	65

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	1

	; K(83)=2

	.byte	bytecode_ld_ir1_pb
	.byte	83

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	2

	; K(90)=3

	.byte	bytecode_ld_ir1_pb
	.byte	90

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	3

	; K(88)=4

	.byte	bytecode_ld_ir1_pb
	.byte	88

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	4

	; B$="€"

	.byte	bytecode_ld_sr1_ss
	.text	1, "\x80"

	.byte	bytecode_ld_sx_sr1
	.byte	bytecode_STRVAR_B

	; M=16384

	.byte	bytecode_ld_ix_pw
	.byte	bytecode_INTVAR_M
	.word	16384

	; V(1)=-2

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_V

	.byte	bytecode_ld_ip_nb
	.byte	-2

	; V(2)=2

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_V

	.byte	bytecode_ld_ip_pb
	.byte	2

	; B1=200

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_B1
	.byte	200

LINE_1120

	; FOR T=1 TO 14

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	1

	.byte	bytecode_to_ip_pb
	.byte	14

	; BL$=BL$+""

	.byte	bytecode_strinit_sr1_sx
	.byte	bytecode_STRVAR_BL

	.byte	bytecode_strcat_sr1_sr1_ss
	.text	1, "\x8F"

	.byte	bytecode_ld_sx_sr1
	.byte	bytecode_STRVAR_BL

	; NEXT

	.byte	bytecode_next

LINE_1220

	; RETURN

	.byte	bytecode_return

LINE_2000

	; T=254

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	254

	; PRINT @T+4, A$(8,0);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_add_ir1_ir1_pb
	.byte	4

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	8

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_pr_sr1

LINE_2065

	; PRINT @T+36, B$(8,0);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_add_ir1_ir1_pb
	.byte	36

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	8

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_pr_sr1

LINE_2070

	; R=RND(3)-1

	.byte	bytecode_irnd_ir1_pb
	.byte	3

	.byte	bytecode_sub_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_R

	; T=SHIFT(R,1)+SHIFT(R,6)+80

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_R

	.byte	bytecode_shift_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_R

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	6

	.byte	bytecode_add_ir1_ir1_ir2

	.byte	bytecode_add_ir1_ir1_pb
	.byte	80

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_T

	; PRINT @T+4, A$(8,0);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_add_ir1_ir1_pb
	.byte	4

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	8

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_A

	.byte	bytecode_pr_sr1

LINE_2075

	; PRINT @T+36, B$(8,0);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_add_ir1_ir1_pb
	.byte	36

	.byte	bytecode_prat_ir1

	.byte	bytecode_ld_ir1_pb
	.byte	8

	.byte	bytecode_ld_ir2_pb
	.byte	0

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_B

	.byte	bytecode_pr_sr1

LINE_2090

	; RETURN

	.byte	bytecode_return

LINE_3000

	; Q=RND(5)+2

	.byte	bytecode_irnd_ir1_pb
	.byte	5

	.byte	bytecode_add_ir1_ir1_pb
	.byte	2

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_Q

	; X=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_X
	.byte	0

	; FOR Y=0 TO 6

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_Y
	.byte	0

	.byte	bytecode_to_ip_pb
	.byte	6

	; X+=1

	.byte	bytecode_add_ix_ix_pb
	.byte	bytecode_INTVAR_X
	.byte	1

LINE_3010

	; PRINT @SHIFT(Y,6)+16-SHIFT(X,1),

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_shift_ir1_ir1_pb
	.byte	6

	.byte	bytecode_add_ir1_ir1_pb
	.byte	16

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_X

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	1

	.byte	bytecode_sub_ir1_ir1_ir2

	.byte	bytecode_prat_ir1

	; FOR C=1 TO X

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_C
	.byte	1

	.byte	bytecode_to_ip_ix
	.byte	bytecode_INTVAR_X

	; PRINT X$(Q,2);" ";

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_Q

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_X

	.byte	bytecode_pr_sr1

	.byte	bytecode_pr_ss
	.text	1, " "

	; NEXT

	.byte	bytecode_next

LINE_3011

	; PRINT @SHIFT(Y,6)+48-SHIFT(X,1),

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_shift_ir1_ir1_pb
	.byte	6

	.byte	bytecode_add_ir1_ir1_pb
	.byte	48

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_X

	.byte	bytecode_shift_ir2_ir2_pb
	.byte	1

	.byte	bytecode_sub_ir1_ir1_ir2

	.byte	bytecode_prat_ir1

	; FOR C=1 TO X

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_C
	.byte	1

	.byte	bytecode_to_ip_ix
	.byte	bytecode_INTVAR_X

	; PRINT Y$(Q,2);

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_Q

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval2_ir1_sx
	.byte	bytecode_STRARR_Y

	.byte	bytecode_pr_sr1

LINE_3012

	; WHEN (Y=7) AND (C=8) GOTO 3020

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_ldeq_ir1_ir1_pb
	.byte	7

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ldeq_ir2_ir2_pb
	.byte	8

	.byte	bytecode_and_ir1_ir1_ir2

	.byte	bytecode_jmpne_ir1_ix
	.word	LINE_3020

LINE_3013

	; PRINT " ";

	.byte	bytecode_pr_ss
	.text	1, " "

LINE_3020

	; NEXT

	.byte	bytecode_next

	; NEXT

	.byte	bytecode_next

LINE_3030

	; LV+=1

	.byte	bytecode_add_ix_ix_pb
	.byte	bytecode_INTVAR_LV
	.byte	1

	; IF LV=99 THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_LV

	.byte	bytecode_ldeq_ir1_ir1_pb
	.byte	99

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_3035

	; CLS

	.byte	bytecode_cls

	; PRINT "JIM LOVES HIS PATTY, BOO,"

	.byte	bytecode_pr_ss
	.text	26, "JIM LOVES HIS PATTY, BOO,\r"

	; PRINT "CHUM AND NAY"

	.byte	bytecode_pr_ss
	.text	13, "CHUM AND NAY\r"

	; END

	.byte	bytecode_progend

LINE_3035

	; IF ((LV/3)-INT(LV/3))=0 THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_LV

	.byte	bytecode_div_fr1_ir1_pb
	.byte	3

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_LV

	.byte	bytecode_div_fr2_ir2_pb
	.byte	3

	.byte	bytecode_sub_fr1_fr1_ir2

	.byte	bytecode_ldeq_ir1_fr1_pb
	.byte	0

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_3040

	; LF+=1

	.byte	bytecode_add_ix_ix_pb
	.byte	bytecode_INTVAR_LF
	.byte	1

	; FOR Z2=1 TO 10

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_Z2
	.byte	1

	.byte	bytecode_to_ip_pb
	.byte	10

	; PRINT @0, "BONUS LIFE";

	.byte	bytecode_prat_pb
	.byte	0

	.byte	bytecode_pr_ss
	.text	10, "BONUS LIFE"

	; SOUND 100,2

	.byte	bytecode_ld_ir1_pb
	.byte	100

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_sound_ir1_ir2

	; PRINT @0, "          ";

	.byte	bytecode_prat_pb
	.byte	0

	.byte	bytecode_pr_ss
	.text	10, "          "

	; SOUND 50,2

	.byte	bytecode_ld_ir1_pb
	.byte	50

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_sound_ir1_ir2

	; NEXT

	.byte	bytecode_next

LINE_3040

	; PRINT @91, "LV";STR$(LV);" ";

	.byte	bytecode_prat_pb
	.byte	91

	.byte	bytecode_pr_ss
	.text	2, "LV"

	.byte	bytecode_str_sr1_ix
	.byte	bytecode_INTVAR_LV

	.byte	bytecode_pr_sr1

	.byte	bytecode_pr_ss
	.text	1, " "

	; PRINT @122, STR$(N);" ";

	.byte	bytecode_prat_pb
	.byte	122

	.byte	bytecode_str_sr1_ix
	.byte	bytecode_INTVAR_N

	.byte	bytecode_pr_sr1

	.byte	bytecode_pr_ss
	.text	1, " "

	; IF N>9999 THEN

	.byte	bytecode_ld_ir1_pw
	.word	9999

	.byte	bytecode_ldlt_ir1_ir1_ix
	.byte	bytecode_INTVAR_N

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_3041

	; PRINT @121, STR$(N);" ";

	.byte	bytecode_prat_pb
	.byte	121

	.byte	bytecode_str_sr1_ix
	.byte	bytecode_INTVAR_N

	.byte	bytecode_pr_sr1

	.byte	bytecode_pr_ss
	.text	1, " "

LINE_3041

	; PRINT @155, "HIGH";

	.byte	bytecode_prat_pb
	.byte	155

	.byte	bytecode_pr_ss
	.text	4, "HIGH"

	; PRINT @186, STR$(HS);" ";

	.byte	bytecode_prat_pb
	.byte	186

	.byte	bytecode_str_sr1_ix
	.byte	bytecode_INTVAR_HS

	.byte	bytecode_pr_sr1

	.byte	bytecode_pr_ss
	.text	1, " "

	; IF HS>9999 THEN

	.byte	bytecode_ld_ir1_pw
	.word	9999

	.byte	bytecode_ldlt_ir1_ir1_ix
	.byte	bytecode_INTVAR_HS

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_3050

	; PRINT @185, STR$(HS);" ";

	.byte	bytecode_prat_pb
	.byte	185

	.byte	bytecode_str_sr1_ix
	.byte	bytecode_INTVAR_HS

	.byte	bytecode_pr_sr1

	.byte	bytecode_pr_ss
	.text	1, " "

LINE_3050

	; RETURN

	.byte	bytecode_return

LINE_4000

	; CLS

	.byte	bytecode_cls

	; PRINT @77, "q*bert"

	.byte	bytecode_prat_pb
	.byte	77

	.byte	bytecode_pr_ss
	.text	7, "q*bert\r"

	; PRINT

	.byte	bytecode_pr_ss
	.text	1, "\r"

	; PRINT "  BY JIM GERRIE & GREG DIONNE"

	.byte	bytecode_pr_ss
	.text	30, "  BY JIM GERRIE & GREG DIONNE\r"

LINE_4010

	; PRINT

	.byte	bytecode_pr_ss
	.text	1, "\r"

LINE_4015

	; PRINT " USE THE A,S,Z&X KEYS TO MOVE."

	.byte	bytecode_pr_ss
	.text	31, " USE THE A,S,Z&X KEYS TO MOVE.\r"

LINE_4020

	; PRINT " JUMP ON EACH SQUARE TO CHANGE"

	.byte	bytecode_pr_ss
	.text	31, " JUMP ON EACH SQUARE TO CHANGE\r"

LINE_4030

	; PRINT " ITS COLOR. YOU GET A FREE MAN"

	.byte	bytecode_pr_ss
	.text	31, " ITS COLOR. YOU GET A FREE MAN\r"

LINE_4040

	; PRINT " EVERY 3 LEVELS. USE THE LIFTS"

	.byte	bytecode_pr_ss
	.text	31, " EVERY 3 LEVELS. USE THE LIFTS\r"

LINE_4050

	; PRINT " TO KILL THE SNAKE=100. MOVE  "

	.byte	bytecode_pr_ss
	.text	31, " TO KILL THE SNAKE=100. MOVE  \r"

LINE_4060

	; PRINT " QUICKLY FROM THE TOP SQUARE."

	.byte	bytecode_pr_ss
	.text	30, " QUICKLY FROM THE TOP SQUARE.\r"

LINE_4070

	; RETURN

	.byte	bytecode_return

LINE_5000

	; I$=INKEY$

	.byte	bytecode_inkey_sr1

	.byte	bytecode_ld_sx_sr1
	.byte	bytecode_STRVAR_I

	; PRINT @448, "     ENTER DIFFICULTY (1-3)?";

	.byte	bytecode_prat_pw
	.word	448

	.byte	bytecode_pr_ss
	.text	28, "     ENTER DIFFICULTY (1-3)?"

	; LC=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_LC
	.byte	0

LINE_5010

	; I$=INKEY$

	.byte	bytecode_inkey_sr1

	.byte	bytecode_ld_sx_sr1
	.byte	bytecode_STRVAR_I

	; R=RND(1000)

	.byte	bytecode_irnd_ir1_pw
	.word	1000

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_R

	; WHEN I$="" GOTO 5010

	.byte	bytecode_ld_sr1_sx
	.byte	bytecode_STRVAR_I

	.byte	bytecode_ldeq_ir1_sr1_ss
	.text	0, ""

	.byte	bytecode_jmpne_ir1_ix
	.word	LINE_5010

LINE_5015

	; WHEN (VAL(I$)<0) OR (VAL(I$)>3) GOTO 5010

	.byte	bytecode_val_fr1_sx
	.byte	bytecode_STRVAR_I

	.byte	bytecode_ldlt_ir1_fr1_pb
	.byte	0

	.byte	bytecode_ld_ir2_pb
	.byte	3

	.byte	bytecode_val_fr3_sx
	.byte	bytecode_STRVAR_I

	.byte	bytecode_ldlt_ir2_ir2_fr3

	.byte	bytecode_or_ir1_ir1_ir2

	.byte	bytecode_jmpne_ir1_ix
	.word	LINE_5010

LINE_5016

	; Z3=400-(VAL(I$)*100)

	.byte	bytecode_ld_ir1_pw
	.word	400

	.byte	bytecode_val_fr2_sx
	.byte	bytecode_STRVAR_I

	.byte	bytecode_mul_fr2_fr2_pb
	.byte	100

	.byte	bytecode_sub_fr1_ir1_fr2

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_Z3

LINE_5020

	; RETURN

	.byte	bytecode_return

LINE_6000

	; PRINT @448, "          GET READY FOR     ";

	.byte	bytecode_prat_pw
	.word	448

	.byte	bytecode_pr_ss
	.text	28, "          GET READY FOR     "

	; LC=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_LC
	.byte	0

LINE_6010

	; FOR Z2=1 TO 22000

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_Z2
	.byte	1

	.byte	bytecode_to_ip_pw
	.word	22000

	; NEXT

	.byte	bytecode_next

	; FOR Z2=1 TO 25

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_Z2
	.byte	1

	.byte	bytecode_to_ip_pb
	.byte	25

	; I$=INKEY$

	.byte	bytecode_inkey_sr1

	.byte	bytecode_ld_sx_sr1
	.byte	bytecode_STRVAR_I

	; NEXT

	.byte	bytecode_next

	; RETURN

	.byte	bytecode_return

LLAST

	; END

	.byte	bytecode_progend

; Library Catalog
bytecode_abs_ir1_ix	.equ	0
bytecode_add_ip_ip_ir1	.equ	1
bytecode_add_ip_ip_pb	.equ	2
bytecode_add_ir1_ir1_ir2	.equ	3
bytecode_add_ir1_ir1_ix	.equ	4
bytecode_add_ir1_ir1_pb	.equ	5
bytecode_add_ir2_ir2_pb	.equ	6
bytecode_add_ix_ix_ir1	.equ	7
bytecode_add_ix_ix_pb	.equ	8
bytecode_and_ir1_ir1_ir2	.equ	9
bytecode_arrdim1_ir1_ix	.equ	10
bytecode_arrdim2_ir1_sx	.equ	11
bytecode_arrref1_ir1_ix	.equ	12
bytecode_arrref2_ir1_sx	.equ	13
bytecode_arrval1_ir1_ix	.equ	14
bytecode_arrval1_ir2_ix	.equ	15
bytecode_arrval2_ir1_sx	.equ	16
bytecode_asc_ir1_sr1	.equ	17
bytecode_chr_sr1_ir1	.equ	18
bytecode_chr_sr2_ir2	.equ	19
bytecode_clear	.equ	20
bytecode_cls	.equ	21
bytecode_clsn_pb	.equ	22
bytecode_div_fr1_ir1_pb	.equ	23
bytecode_div_fr2_ir2_pb	.equ	24
bytecode_for_ix_ir1	.equ	25
bytecode_for_ix_pb	.equ	26
bytecode_gosub_ix	.equ	27
bytecode_goto_ix	.equ	28
bytecode_inkey_sr1	.equ	29
bytecode_irnd_ir1_pb	.equ	30
bytecode_irnd_ir1_pw	.equ	31
bytecode_irnd_ir2_pb	.equ	32
bytecode_jmpeq_ir1_ix	.equ	33
bytecode_jmpne_ir1_ix	.equ	34
bytecode_jsrne_ir1_ix	.equ	35
bytecode_ld_fx_fr1	.equ	36
bytecode_ld_ip_ir1	.equ	37
bytecode_ld_ip_nb	.equ	38
bytecode_ld_ip_pb	.equ	39
bytecode_ld_ir1_ix	.equ	40
bytecode_ld_ir1_nb	.equ	41
bytecode_ld_ir1_pb	.equ	42
bytecode_ld_ir1_pw	.equ	43
bytecode_ld_ir2_ix	.equ	44
bytecode_ld_ir2_pb	.equ	45
bytecode_ld_ix_ir1	.equ	46
bytecode_ld_ix_nb	.equ	47
bytecode_ld_ix_pb	.equ	48
bytecode_ld_ix_pw	.equ	49
bytecode_ld_sp_sr1	.equ	50
bytecode_ld_sr1_ss	.equ	51
bytecode_ld_sr1_sx	.equ	52
bytecode_ld_sx_sr1	.equ	53
bytecode_ldeq_ir1_fr1_pb	.equ	54
bytecode_ldeq_ir1_ir1_ir2	.equ	55
bytecode_ldeq_ir1_ir1_ix	.equ	56
bytecode_ldeq_ir1_ir1_pb	.equ	57
bytecode_ldeq_ir1_sr1_ss	.equ	58
bytecode_ldeq_ir2_ir2_ix	.equ	59
bytecode_ldeq_ir2_ir2_pb	.equ	60
bytecode_ldlt_ir1_fr1_pb	.equ	61
bytecode_ldlt_ir1_ir1_ir2	.equ	62
bytecode_ldlt_ir1_ir1_ix	.equ	63
bytecode_ldlt_ir1_ir1_pb	.equ	64
bytecode_ldlt_ir2_ir2_fr3	.equ	65
bytecode_ldne_ir1_ir1_ir2	.equ	66
bytecode_ldne_ir1_ir1_pb	.equ	67
bytecode_mul_fr2_fr2_pb	.equ	68
bytecode_mul_ir1_ir1_ix	.equ	69
bytecode_mul_ir1_ir1_pb	.equ	70
bytecode_next	.equ	71
bytecode_nextvar_ix	.equ	72
bytecode_ongosub_ir1_is	.equ	73
bytecode_ongoto_ir1_is	.equ	74
bytecode_or_ir1_ir1_ir2	.equ	75
bytecode_peek_ir1_ir1	.equ	76
bytecode_poke_pw_ir1	.equ	77
bytecode_pr_sr1	.equ	78
bytecode_pr_ss	.equ	79
bytecode_pr_sx	.equ	80
bytecode_prat_ir1	.equ	81
bytecode_prat_ix	.equ	82
bytecode_prat_pb	.equ	83
bytecode_prat_pw	.equ	84
bytecode_progbegin	.equ	85
bytecode_progend	.equ	86
bytecode_return	.equ	87
bytecode_rnd_fr1_ir1	.equ	88
bytecode_rnd_fr1_ix	.equ	89
bytecode_sgn_ir1_ir1	.equ	90
bytecode_shift_ir1_ir1_pb	.equ	91
bytecode_shift_ir2_ir2_pb	.equ	92
bytecode_sound_ir1_ir2	.equ	93
bytecode_step_ip_ir1	.equ	94
bytecode_str_sr1_ix	.equ	95
bytecode_strcat_sr1_sr1_sr2	.equ	96
bytecode_strcat_sr1_sr1_ss	.equ	97
bytecode_strcat_sr1_sr1_sx	.equ	98
bytecode_strinit_sr1_sr1	.equ	99
bytecode_strinit_sr1_ss	.equ	100
bytecode_strinit_sr1_sx	.equ	101
bytecode_sub_fr1_fr1_ir2	.equ	102
bytecode_sub_fr1_ir1_fr2	.equ	103
bytecode_sub_ip_ip_pb	.equ	104
bytecode_sub_ir1_ir1_ir2	.equ	105
bytecode_sub_ir1_ir1_ix	.equ	106
bytecode_sub_ir1_ir1_pb	.equ	107
bytecode_sub_ix_ix_pb	.equ	108
bytecode_to_ip_ix	.equ	109
bytecode_to_ip_pb	.equ	110
bytecode_to_ip_pw	.equ	111
bytecode_val_fr1_sx	.equ	112
bytecode_val_fr2_sx	.equ	113
bytecode_val_fr3_sx	.equ	114

catalog
	.word	abs_ir1_ix
	.word	add_ip_ip_ir1
	.word	add_ip_ip_pb
	.word	add_ir1_ir1_ir2
	.word	add_ir1_ir1_ix
	.word	add_ir1_ir1_pb
	.word	add_ir2_ir2_pb
	.word	add_ix_ix_ir1
	.word	add_ix_ix_pb
	.word	and_ir1_ir1_ir2
	.word	arrdim1_ir1_ix
	.word	arrdim2_ir1_sx
	.word	arrref1_ir1_ix
	.word	arrref2_ir1_sx
	.word	arrval1_ir1_ix
	.word	arrval1_ir2_ix
	.word	arrval2_ir1_sx
	.word	asc_ir1_sr1
	.word	chr_sr1_ir1
	.word	chr_sr2_ir2
	.word	clear
	.word	cls
	.word	clsn_pb
	.word	div_fr1_ir1_pb
	.word	div_fr2_ir2_pb
	.word	for_ix_ir1
	.word	for_ix_pb
	.word	gosub_ix
	.word	goto_ix
	.word	inkey_sr1
	.word	irnd_ir1_pb
	.word	irnd_ir1_pw
	.word	irnd_ir2_pb
	.word	jmpeq_ir1_ix
	.word	jmpne_ir1_ix
	.word	jsrne_ir1_ix
	.word	ld_fx_fr1
	.word	ld_ip_ir1
	.word	ld_ip_nb
	.word	ld_ip_pb
	.word	ld_ir1_ix
	.word	ld_ir1_nb
	.word	ld_ir1_pb
	.word	ld_ir1_pw
	.word	ld_ir2_ix
	.word	ld_ir2_pb
	.word	ld_ix_ir1
	.word	ld_ix_nb
	.word	ld_ix_pb
	.word	ld_ix_pw
	.word	ld_sp_sr1
	.word	ld_sr1_ss
	.word	ld_sr1_sx
	.word	ld_sx_sr1
	.word	ldeq_ir1_fr1_pb
	.word	ldeq_ir1_ir1_ir2
	.word	ldeq_ir1_ir1_ix
	.word	ldeq_ir1_ir1_pb
	.word	ldeq_ir1_sr1_ss
	.word	ldeq_ir2_ir2_ix
	.word	ldeq_ir2_ir2_pb
	.word	ldlt_ir1_fr1_pb
	.word	ldlt_ir1_ir1_ir2
	.word	ldlt_ir1_ir1_ix
	.word	ldlt_ir1_ir1_pb
	.word	ldlt_ir2_ir2_fr3
	.word	ldne_ir1_ir1_ir2
	.word	ldne_ir1_ir1_pb
	.word	mul_fr2_fr2_pb
	.word	mul_ir1_ir1_ix
	.word	mul_ir1_ir1_pb
	.word	next
	.word	nextvar_ix
	.word	ongosub_ir1_is
	.word	ongoto_ir1_is
	.word	or_ir1_ir1_ir2
	.word	peek_ir1_ir1
	.word	poke_pw_ir1
	.word	pr_sr1
	.word	pr_ss
	.word	pr_sx
	.word	prat_ir1
	.word	prat_ix
	.word	prat_pb
	.word	prat_pw
	.word	progbegin
	.word	progend
	.word	return
	.word	rnd_fr1_ir1
	.word	rnd_fr1_ix
	.word	sgn_ir1_ir1
	.word	shift_ir1_ir1_pb
	.word	shift_ir2_ir2_pb
	.word	sound_ir1_ir2
	.word	step_ip_ir1
	.word	str_sr1_ix
	.word	strcat_sr1_sr1_sr2
	.word	strcat_sr1_sr1_ss
	.word	strcat_sr1_sr1_sx
	.word	strinit_sr1_sr1
	.word	strinit_sr1_ss
	.word	strinit_sr1_sx
	.word	sub_fr1_fr1_ir2
	.word	sub_fr1_ir1_fr2
	.word	sub_ip_ip_pb
	.word	sub_ir1_ir1_ir2
	.word	sub_ir1_ir1_ix
	.word	sub_ir1_ir1_pb
	.word	sub_ix_ix_pb
	.word	to_ip_ix
	.word	to_ip_pb
	.word	to_ip_pw
	.word	val_fr1_sx
	.word	val_fr2_sx
	.word	val_fr3_sx

	.module	mdalloc
; alloc D bytes in array memory.
; then relink strings.
alloc
	std	tmp1
	ldx	strfree
	addd	strfree
	std	strfree
	ldd	strend
	addd	tmp1
	std	strend
	sts	tmp2
	subd	tmp2
	blo	_ok
	ldab	#OM_ERROR
	jmp	error
_ok
	lds	strfree
	des
_again
	dex
	dex
	ldd	,x
	pshb
	psha
	cpx	strbuf
	bhi	_again
	lds	tmp2
	ldx	strbuf
	ldd	strbuf
	addd	tmp1
	std	strbuf
	clra
_nxtz
	staa	,x
	inx
	cpx	strbuf
	blo	_nxtz
	ldx	strbuf
; relink permanent strings
; ENTRY:  X points to offending link word in strbuf
; EXIT:   X points to strend
strlink
	cpx	strend
	bhs	_rts
	stx	tmp1
	ldd	tmp1
	addd	#2
	ldx	,x
	std	1,x
	ldab	0,x
	ldx	1,x
	abx
	bra	strlink
_rts
	rts

	.module	mdbcode
noargs
	ldx	curinst
	inx
	stx	nxtinst
	rts
extend
	ldx	curinst
	inx
	ldab	,x
	inx
	stx	nxtinst
	ldx	#symstart
	abx
	rts
getaddr
	ldd	curinst
	addd	#3
	std	nxtinst
	ldx	curinst
	ldx	1,x
	rts
getbyte
	ldx	curinst
	inx
	ldab	,x
	inx
	stx	nxtinst
	rts
getword
	ldx	curinst
	inx
	ldd	,x
	inx
	inx
	stx	nxtinst
	rts
extbyte
	ldd	curinst
	addd	#3
	std	nxtinst
	ldx	curinst
	ldab	2,x
	pshb
	ldab	1,x
	ldx	#symstart
	abx
	pulb
	rts
extword
	ldd	curinst
	addd	#4
	std	nxtinst
	ldx	curinst
	ldd	2,x
	pshb
	ldab	1,x
	ldx	#symstart
	abx
	pulb
	rts
byteext
	ldd	curinst
	addd	#3
	std	nxtinst
	ldx	curinst
	ldab	1,x
	pshb
	ldab	2,x
	ldx	#symstart
	abx
	pulb
	rts
wordext
	ldd	curinst
	addd	#4
	std	nxtinst
	ldx	curinst
	ldd	1,x
	pshb
	ldab	3,x
	ldx	#symstart
	abx
	pulb
	rts
immstr
	ldx	curinst
	inx
	ldab	,x
	inx
	pshx
	abx
	stx	nxtinst
	pulx
	rts

	.module	mddivflt
; divide X by Y
;   ENTRY  X contains dividend in (0,x 1,x 2,x 3,x 4,x)
;                     scratch in  (5,x 6,x 7,x 8,x 9,x)
;          Y in 0+argv, 1+argv, 2+argv, 3+argv, 4+argv
;   EXIT   X/Y in (0,x 1,x 2,x 3,x 4,x)
;          uses tmp1,tmp1+1,tmp2,tmp2+1,tmp3,tmp3+1,tmp4
divflt
	ldaa	#8*5
	bsr	divmod
	tst	tmp4
	bmi	_add1
_com
	ldd	8,x
	coma
	comb
	std	3,x
	ldd	6,x
	coma
	comb
	std	1,x
	ldab	5,x
	comb
	stab	0,x
	rts
_add1
	ldd	8,x
	addd	#1
	std	3,x
	ldd	6,x
	adcb	#0
	adca	#0
	std	1,x
	ldab	5,x
	adcb	#0
	stab	0,x
	rts
divuflt
	clr	tmp4
	ldab	#8*5
	stab	tmp1
	bsr	divumod
	bra	_com

	.module	mddivmod
; divide/modulo X by Y with remainder
;   ENTRY  X contains dividend in (0,x 1,x 2,x 3,x 4,x)
;          Y in 0+argv, 1+argv, 2+argv, 3+argv, 4+argv
;          #shifts in ACCA (24 for modulus, 40 for division
;   EXIT   for division:
;            NOT ABS(X)/ABS(Y) in (5,x 6,x 7,x 8,x 9,x)
;   EXIT   for modulus:
;            NOT INT(ABS(X)/ABS(Y)) in (7,x 8,x 9,x)
;            FMOD(X,Y) in (0,x 1,x 2,x 3,x 4,x)
;          result sign in tmp4.(0 = pos, -1 = neg).
;          uses tmp1,tmp1+1,tmp2,tmp2+1,tmp3,tmp3+1,tmp4
divmod
	staa	tmp1
	clr	tmp4
	tst	0,x
	bpl	_posX
	com	tmp4
	bsr	negx
_posX
	tst	0+argv
	bpl	divumod
	com	tmp4
	bsr	negargv
divumod
	ldd	3,x
	std	6,x
	ldd	1,x
	std	4,x
	ldab	0,x
	stab	3,x
	clra
	clrb
	std	8,x
	std	1,x
	stab	0,x
_nxtdiv
	rol	7,x
	rol	6,x
	rol	5,x
	rol	4,x
	rol	3,x
	rol	2,x
	rol	1,x
	rol	0,x
	bcc	_trialsub
	; force subtraction
	ldd	3,x
	subd	3+argv
	std	3,x
	ldd	1,x
	sbcb	2+argv
	sbca	1+argv
	std	1,x
	ldab	0,x
	sbcb	0+argv
	stab	0,x
	clc
	bra	_shift
_trialsub
	ldd	3,x
	subd	3+argv
	std	tmp3
	ldd	1,x
	sbcb	2+argv
	sbca	1+argv
	std	tmp2
	ldab	0,x
	sbcb	0+argv
	stab	tmp1+1
	blo	_shift
	ldd	tmp3
	std	3,x
	ldd	tmp2
	std	1,x
	ldab	tmp1+1
	stab	0,x
_shift
	rol	9,x
	rol	8,x
	dec	tmp1
	bne	_nxtdiv
	rol	7,x
	rol	6,x
	rol	5,x
	rts
negx
	neg	4,x
	ngc	3,x
	ngc	2,x
	ngc	1,x
	ngc	0,x
	rts
negargv
	neg	4+argv
	ngc	3+argv
	ngc	2+argv
	ngc	1+argv
	ngc	0+argv
	rts

	.module	mdgeteq
geteq
	beq	_1
	ldd	#0
	rts
_1
	ldd	#-1
	rts

	.module	mdgetlt
getlt
	blt	_1
	ldd	#0
	rts
_1
	ldd	#-1
	rts

	.module	mdgetne
getne
	bne	_1
	ldd	#0
	rts
_1
	ldd	#-1
	rts

	.module	mdmul12
mul12
	ldaa	tmp1+1
	ldab	tmp2+1
	mul
	std	tmp3
	ldaa	tmp1
	ldab	tmp2+1
	mul
	addb	tmp3
	stab	tmp3
	ldaa	tmp1+1
	ldab	tmp2
	mul
	tba
	adda	tmp3
	ldab	tmp3+1
	rts

	.module	mdmulflt
mulfltx
	bsr	mulfltt
	ldab	tmp1+1
	stab	0,x
	ldd	tmp2
	std	1,x
	ldd	tmp3
	std	3,x
	rts
mulfltt
	jsr	mulhlf
	clr	tmp4
_4_3
	ldaa	4+argv
	beq	_3_4
	ldab	3,x
	bsr	_m43
_4_1
	ldaa	4+argv
	ldab	1,x
	bsr	_m41
_4_2
	ldaa	4+argv
	ldab	2,x
	bsr	_m42
_4_0
	ldaa	4+argv
	ldab	0,x
	bsr	_m40
	ldab	0,x
	bpl	_4_4
	ldd	tmp1+1
	subb	4+argv
	sbca	#0
	std	tmp1+1
_4_4
	ldaa	4+argv
	ldab	4,x
	beq	_rndup
	mul
	lslb
	adca	tmp4
	staa	tmp4
	bsr	mulflt3
_3_4
	ldab	4,x
	beq	_rndup
	ldaa	3+argv
	bsr	_m43
_1_4
	ldab	4,x
	ldaa	1+argv
	bsr	_m41
_2_4
	ldab	4,x
	ldaa	2+argv
	bsr	_m42
_0_4
	ldab	4,x
	ldaa	0+argv
	bsr	_m40
	ldaa	0+argv
	bpl	_rndup
	ldd	tmp1+1
	subb	4,x
	sbca	#0
	std	tmp1+1
_rndup
	ldaa	tmp4
	lsla
mulflt3
	ldd	tmp3
	adcb	#0
	adca	#0
	std	tmp3
	ldd	tmp2
	adcb	#0
	adca	#0
	jmp	mulhlf2
_m43
	mul
	addd	tmp3+1
	std	tmp3+1
	rol	tmp4+1
	rts
_m41
	mul
	lsr	tmp4+1
	adcb	tmp3
	adca	tmp2+1
	std	tmp2+1
	ldd	tmp1+1
	adcb	#0
	adca	#0
	std	tmp1+1
	rts
_m42
	mul
	addd	tmp3
	std	tmp3
	rol	tmp4+1
	rts
_m40
	mul
	lsr	tmp4+1
	adcb	tmp2+1
	adca	tmp2
	bra	mulhlf2

	.module	mdmulhlf
mulhlf
	bsr	mulint
	ldd	#0
	std	tmp3
	stab	tmp4+1
_3_2
	ldaa	3+argv
	beq	_2_3
	ldab	2,x
	bsr	_m32
_3_0
	ldaa	3+argv
	ldab	0,x
	bsr	_m30
	ldab	0,x
	bpl	_3_3
	ldab	tmp1+1
	subb	3+argv
	stab	tmp1+1
_3_3
	ldaa	3+argv
	ldab	3,x
	mul
	adda	tmp3
	std	tmp3
	rol	tmp4+1
_3_1
	ldaa	3+argv
	ldab	1,x
	bsr	_m31
_2_3
	ldab	3,x
	beq	_rts
	ldaa	2+argv
	bsr	_m32
_0_3
	ldab	3,x
	ldaa	0+argv
	bsr	_m30
	ldaa	0+argv
	bpl	_1_3
	ldab	tmp1+1
	subb	3,x
	stab	tmp1+1
_1_3
	ldab	3,x
	ldaa	1+argv
	clr	tmp4+1
_m31
	mul
	lsr	tmp4+1
	adcb	tmp2+1
	adca	tmp2
mulhlf2
	std	tmp2
	ldab	tmp1+1
	adcb	#0
	stab	tmp1+1
	rts
_m32
	mul
	addd	tmp2+1
	std	tmp2+1
	rol	tmp4+1
	rts
_m30
	mul
	lsr	tmp4+1
	adcb	tmp2
	adca	tmp1+1
	std	tmp1+1
_rts
	rts

	.module	mdmulint
mulint
	ldaa	2+argv
	ldab	2,x
	mul
	std	tmp2
	ldaa	1+argv
	ldab	1,x
	mul
	stab	tmp1+1
	ldaa	2+argv
	ldab	1,x
	mul
	addb	tmp2
	adca	tmp1+1
	std	tmp1+1
	ldaa	1+argv
	ldab	2,x
	mul
	addb	tmp2
	adca	tmp1+1
	std	tmp1+1
	ldaa	2+argv
	ldab	0,x
	mul
	addb	tmp1+1
	stab	tmp1+1
	ldaa	0+argv
	ldab	2,x
	mul
	addb	tmp1+1
	stab	tmp1+1
	rts
mulintx
	bsr	mulint
	ldab	tmp1+1
	stab	0,x
	ldd	tmp2
	std	1,x
	rts

	.module	mdpeek
; perform PEEK(X), emulating keypolling
;   ENTRY: X holds storage byte
;   EXIT:  ACCB holds peeked byte
peek
	cpx	#M_KBUF
	blo	_peek
	cpx	#M_IKEY
	bhi	_peek
	beq	_poll
	cpx	#M_KBUF+7
	bhi	_peek
_poll
	jsr	R_KPOLL
	beq	_peek
	staa	M_IKEY
_peek
	ldab	,x
	rts

	.module	mdprat
prat
	bita	#$FE
	bne	_fcerror
	anda	#$01
	oraa	#$40
	std	M_CRSR
	rts
_fcerror
	ldab	#FC_ERROR
	jmp	error

	.module	mdprint
print
_loop
	ldaa	,x
	jsr	R_PUTC
	inx
	decb
	bne	_loop
	rts

	.module	mdref1
; validate offset from 1D descriptor X and argv
; if empty desc, then alloc D bytes in array memory and 11 elements.
; return word offset in D and byte offset in tmp1
ref1
	std	tmp1
	ldd	,x
	bne	_preexist
	ldd	strbuf
	std	,x
	ldd	#11
	std	2,x
	ldd	tmp1
	pshx
	jsr	alloc
	pulx
_preexist
	ldd	0+argv
	subd	2,x
	bhi	_err
	ldd	0+argv
	std	tmp1
	lsld
	rts
_err
	ldab	#BS_ERROR
	jmp	error

	.module	mdref2
; get offset from 2D descriptor X and argv.
; return word offset in D and byte offset in tmp1
ref2
	ldd	2,x
	std	tmp1
	subd	0+argv
	bls	_err
	ldd	2+argv
	std	tmp2
	subd	4,x
	bhs	_err
	jsr	mul12
	addd	0+argv
	std	tmp1
	lsld
	rts
_err
	ldab	#BS_ERROR
	jmp	error

	.module	mdrefint
; return int/str array reference in D/tmp1
refint
	addd	tmp1
	addd	0,x
	std	tmp1
	rts

	.module	mdrnd
rnd
	ldab	tmp1+1
	bpl	gornd
	orab	#1
	pshb
	ldaa	tmp2
	mul
	std	rvseed
	ldaa	tmp2+1
	pulb
	mul
	addd	rvseed
	std	rvseed
gornd
	ldaa	rvseed
	ldab	#-2
	mul
	std	tmp3
	ldaa	rvseed+1
	ldab	#-2
	mul
	addb	#-2
	adca	tmp3+1
	sbcb	tmp3
	sbca	#0
	adcb	#0
	adca	#0
	std	rvseed
	rts
irnd
	bsr	rnd
	ldaa	tmp2+1
	ldab	rvseed+1
	mul
	staa	tmp3+1
	ldaa	tmp2+1
	ldab	rvseed
	mul
	addb	tmp3+1
	adca	#0
	std	tmp3
	ldaa	tmp2
	ldab	rvseed+1
	mul
	addd	tmp3
	staa	tmp3+1
	ldaa	#0
	adca	#0
	staa	tmp3
	ldaa	tmp2
	ldab	rvseed
	mul
	addd	tmp3
	std	tmp3
	ldaa	#0
	adca	#0
	staa	tmp1
	ldaa	tmp1+1
	beq	_done
	ldab	rvseed+1
	mul
	addb	tmp3
	stab	tmp3
	adca	tmp1
	staa	tmp1
	ldaa	tmp1+1
	ldab	rvseed
	mul
	addb	tmp1
	stab	tmp1
_done
	ldd	tmp3
	addd	#1
	bcc	_rts
	inc	tmp1
_rts
	rts

	.module	mdshlint
; multiply X by 2^ACCB
;   ENTRY  X contains multiplicand in (0,x 1,x 2,x)
;   EXIT   X*2^ACCB in (0,x 1,x 2,x)
;          uses tmp1
shlint
	cmpb	#8
	blo	_shlbit
	stab	tmp1
	ldd	1,x
	std	0,x
	clr	2,x
	ldab	tmp1
	subb	#8
	bne	shlint
	rts
_shlbit
	lsl	2,x
	rol	1,x
	rol	0,x
	decb
	bne	_shlbit
	rts

	.module	mdstrdel
; remove a permanent string
; then re-link trailing strings
strdel
	ldd	1,x
	subd	strbuf
	blo	_rts
	ldd	1,x
	subd	strend
	bhs	_rts
	ldd	strend
	subd	#2
	subb	0,x
	sbca	#0
	std	strend
	ldab	0,x
	ldx	1,x
	dex
	dex
	stx	tmp1
	abx
	inx
	inx
	sts	tmp2
	txs
	ldx	tmp1
_nxtwrd
	pula
	pulb
	std	,x
	inx
	inx
	cpx	strend
	blo	_nxtwrd
	lds	tmp2
	ldx	tmp1
	jmp	strlink
_rts
	rts

	.module	mdstreqbs
; compare string against bytecode "stack"
; ENTRY: tmp1+1 holds length, tmp2 holds compare
; EXIT:  we return correct Z flag for caller
streqbs
	jsr	immstr
	sts	tmp3
	cmpb	tmp1+1
	bne	_ne
	tstb
	beq	_eq
	txs
	ldx	tmp2
_nxtchr
	pula
	cmpa	,x
	bne	_ne
	inx
	decb
	bne	_nxtchr
_eq
	lds	tmp3
	clra
	rts
_ne
	lds	tmp3
	rts

	.module	mdstrflt
strflt
	pshx
	tst	tmp1+1
	bmi	_neg
	ldab	' '
	bra	_wdigs
_neg
	neg	tmp3+1
	ngc	tmp3
	ngc	tmp2+1
	ngc	tmp2
	ngc	tmp1+1
	ldab	'-'
_wdigs
	ldx	tmp3
	pshx
	ldx	strfree
	stab	,x
	clr	tmp1
_nxtwdig
	inc	tmp1
	lsr	tmp1+1
	ror	tmp2
	ror	tmp2+1
	ror	tmp3
	ldaa	tmp1+1
	adda	tmp2
	adca	tmp2+1
	adca	#0
	adca	#0
	tab
	lsra
	lsra
	lsra
	lsra
	andb	#$0F
	aba
_dec
	suba	#5
	bhs	_dec
	adda	#5
	staa	tmp3+1
	lsl	tmp3
	rola
	adda	#'0'
	psha
	ldd	tmp2
	subb	tmp3+1
	sbca	#0
	std	tmp2
	ldab	tmp1+1
	sbcb	#0
	stab	tmp1+1
	pshb
	ldd	tmp2
	psha
	ldaa	#$CC
	mul
	std	tmp3
	addd	tmp2
	std	tmp2
	ldab	tmp1+1
	adcb	tmp3+1
	stab	tmp1+1
	ldd	tmp1+1
	addd	tmp3
	std	tmp1+1
	pulb
	ldaa	#$CC
	mul
	stab	tmp3+1
	addd	tmp1+1
	std	tmp1+1
	pulb
	ldaa	#$CC
	mul
	addb	tmp1+1
	addb	tmp3+1
	stab	tmp1+1
	bne	_nxtwdig
	ldd	tmp2
	bne	_nxtwdig
	ldab	tmp1
_nxtc
	pula
	inx
	staa	,x
	decb
	bne	_nxtc
	inx
	inc	tmp1
	pula
	pulb
	subd	#0
	bne	_fdo
	jmp	_fdone
_fdo
	std	tmp2
	ldab	#'.'
	stab	,x
	inc	tmp1
	inx
	ldd	#6
	staa	tmp1+1
	stab	tmp3
_nxtf
	ldd	tmp2
	lsl	tmp2+1
	rol	tmp2
	rol	tmp1+1
	lsl	tmp2+1
	rol	tmp2
	rol	tmp1+1
	addd	tmp2
	std	tmp2
	ldab	tmp1+1
	adcb	#0
	stab	tmp1+1
	lsl	tmp2+1
	rol	tmp2
	rol	tmp1+1
	ldd	tmp1
	addb	#'0'
	stab	,x
	inx
	inc	tmp1
	clrb
	stab	tmp1+1
	dec	tmp3
	bne	_nxtf
	tst	tmp2
	bmi	_nxtrnd
_nxtzero
	dex
	dec	tmp1
	ldaa	,x
	cmpa	#'0'
	beq	_nxtzero
	bra	_zdone
_nxtrnd
	dex
	dec	tmp1
	ldaa	,x
	cmpa	#'.'
	beq	_dot
	inca
	cmpa	#'9'
	bhi	_nxtrnd
	bra	_rdone
_dot
	ldaa	#'0'
	staa	,x
	ldab	tmp1
_ndot
	decb
	beq	_dzero
	dex
	ldaa	,x
	inca
	cmpa	#'9'
	bls	_ddone
	bra	_ndot
_ddone
	staa	,x
	ldx	strfree
	ldab	tmp1
	abx
	bra	_fdone
_dzero
	ldaa	#'1'
	staa	,x
	ldx	strfree
	ldab	tmp1
	abx
	ldaa	#'0'
_rdone
	staa	,x
_zdone
	inx
	inc	tmp1
_fdone
	ldd	strfree
	stx	strfree
	pulx
	rts

	.module	mdstrprm
; make a permanent string
; ENTRY: argv -  input string descriptor
;          X  - output string descriptor
strprm
	stx	tmp1
	ldab	0+argv
	beq	_null
	decb
	beq	_char
	ldx	1+argv
	cpx	#M_LBUF
	blo	_const
	cpx	#M_MSTR
	blo	_trans
	cpx	strbuf
	blo	_const
_trans
	ldx	tmp1
	ldab	0,x
	ldx	1,x
	cpx	strbuf
	blo	_nalloc
	cmpb	0+argv
	beq	_copyip
_nalloc
	cpx	1+argv
	bhs	_notmp
	ldx	1+argv
	cpx	strend
	bhs	_notmp
	ldx	strend
	inx
	inx
	stx	strfree
	bsr	_copy
	ldd	strfree
	std	1+argv
_notmp
	ldx	tmp1
	pshx
	jsr	strdel
	pulx
	stx	tmp1
	ldx	strend
	ldd	tmp1
	std	,x
	inx
	inx
	stx	strfree
	cpx	argv+1
	beq	_nocopy
	bsr	_copy
	bra	_ready
_nocopy
	ldab	0+argv
	abx
_ready
	stx	strend
	ldd	strfree
	inx
	inx
	stx	strfree
	ldx	tmp1
	std	1,x
	ldab	0+argv
	stab	0,x
	rts
_char
	ldaa	#1
	ldx	1+argv
	ldab	,x
_null
	ldaa	#1
	std	1+argv
_const
	ldx	tmp1
	pshx
	jsr	strdel
	pulx
	ldab	0+argv
	stab	0,x
	ldd	1+argv
	std	1,x
	rts
_copyip
	dex
	dex
	ldd	tmp1
	std	,x
	inx
	inx
_copy
	sts	tmp2
	ldab	0+argv
	lds	1+argv
	des
_nxtchr
	pula
	staa	,x
	inx
	decb
	bne	_nxtchr
	lds	tmp2
	rts

	.module	mdstrrel
; release a temporary string
; ENTRY: X holds string start
; EXIT:  X holds new end of string space
strrel
	cpx	strend
	bls	_rts
	cpx	strstop
	bhs	_rts
	stx	strfree
_rts
	rts

	.module	mdstrtmp
; make a temporary clone of a string
; ENTRY: X holds string start
;        B holds string length
; EXIT:  D holds new string pointer
strtmp
	tstb
	beq	_null
	sts	tmp1
	txs
	ldx	strfree
_nxtcp
	pula
	staa	,x
	inx
	decb
	bne	_nxtcp
	lds	tmp1
	ldd	strfree
	stx	strfree
	rts
_null
	ldd	strfree
	rts

	.module	mdstrval
strval
	ldab	0,x
	ldx	1,x
	jsr	strrel
inptval
	clr	tmp1
	bsr	_getsgn
	jsr	_getint
	tstb
	beq	_dosign
	ldaa	,x
	cmpa	#'.'
	bne	_dosign
	inx
	decb
	beq	_dosign
	stab	tmp5
	ldd	tmp2
	pshb
	psha
	ldd	tmp1
	pshb
	psha
	ldab	tmp5
	bsr	_getint
	stx	tmp5
	ldab	tmp4
	ldx	#_tblten
	abx
	abx
	abx
	ldab	,x
	stab	0+argv
	ldd	1,x
	std	1+argv
	ldd	#0
	std	3+argv
	sts	tmp4
	ldd	tmp4
	subd	#10
	std	tmp4
	lds	tmp4
	tsx
	ldab	tmp1+1
	stab	0,x
	ldd	tmp2
	std	1,x
	ldd	#0
	std	3,x
	stab	tmp4
	jsr	divuflt
	ldd	3,x
	std	tmp3
	ldab	#10
	tsx
	abx
	txs
	pula
	pulb
	std	tmp1
	pula
	pulb
	std	tmp2
	ldx	tmp5
_dosign
	tst	tmp1
	beq	_rts
	neg	tmp3+1
	ngc	tmp3
	ngc	tmp2+1
	ngc	tmp2
	ngc	tmp1+1
_rts
	rts
_getsgn
	tstb
	beq	_srts
	ldaa	,x
	cmpa	#' '
	bne	_trysgn
	inx
	decb
	bra	_getsgn
_trysgn
	cmpa	#'+'
	beq	_prts
	cmpa	#'-'
	bne	_srts
	dec	tmp1
_prts
	inx
	decb
_srts
	rts
_getint
	clra
	staa	tmp1+1
	staa	tmp2
	staa	tmp2+1
	staa	tmp4
_nxtdig
	tstb
	beq	_crts
	ldaa	,x
	suba	#'0'
	blo	_crts
	cmpa	#10
	bhs	_crts
	inx
	decb
	pshb
	psha
	ldd	tmp2
	std	tmp3
	ldab	tmp1+1
	stab	tmp4+1
	bsr	_dbl
	bsr	_dbl
	ldd	tmp3
	addd	tmp2
	std	tmp2
	ldab	tmp4+1
	adcb	tmp1+1
	stab	tmp1+1
	bsr	_dbl
	pulb
	clra
	addd	tmp2
	std	tmp2
	ldab	tmp1+1
	adcb	#0
	stab	tmp1+1
	inc	tmp4
	ldd	tmp1+1
	subd	#$0CCC
	pulb
	blo	_nxtdig
	ldaa	tmp2+1
	cmpa	#$CC
	blo	_nxtdig
_crts
	clra
	staa	tmp3
	staa	tmp3+1
	rts
_dbl
	lsl	tmp2+1
	rol	tmp2
	rol	tmp1+1
	rts
_tblten
	.byte	$00,$00,$01
	.byte	$00,$00,$0A
	.byte	$00,$00,$64
	.byte	$00,$03,$E8
	.byte	$00,$27,$10
	.byte	$01,$86,$A0
	.byte	$0F,$42,$40
	.byte	$98,$96,$80

	.module	mdtobc
; push for-loop record on stack
; ENTRY:  ACCB  contains size of record
;         r1    contains stopping variable
;               and is always fixedpoint.
;         r1+3  must contain zero if an integer.
to
	clra
	std	tmp3
	pulx
	stx	tmp1
	tsx
	clrb
_nxtfor
	abx
	ldd	1,x
	subd	letptr
	beq	_oldfor
	ldab	,x
	cmpb	#3
	bhi	_nxtfor
	sts	tmp2
	ldd	tmp2
	subd	tmp3
	std	tmp2
	lds	tmp2
	tsx
	ldab	tmp3+1
	stab	0,x
	ldd	letptr
	std	1,x
_oldfor
	ldd	nxtinst
	std	3,x
	ldab	r1
	stab	5,x
	ldd	r1+1
	std	6,x
	ldd	r1+3
	std	8,x
	ldab	tmp3+1
	cmpb	#15
	beq	_flt
	inca
	staa	10,x
	bra	_done
_flt
	ldd	#0
	std	10,x
	std	13,x
	inca
	staa	12,x
_done
	ldx	tmp1
	jmp	,x

abs_ir1_ix			; numCalls = 2
	.module	modabs_ir1_ix
	jsr	extend
	ldaa	0,x
	bpl	_copy
	ldd	#0
	subd	1,x
	std	r1+1
	ldab	#0
	sbcb	0,x
	stab	r1
	rts
_copy
	ldd	1,x
	std	r1+1
	ldab	0,x
	stab	r1
	rts

add_ip_ip_ir1			; numCalls = 3
	.module	modadd_ip_ip_ir1
	jsr	noargs
	ldx	letptr
	ldd	1,x
	addd	r1+1
	std	1,x
	ldab	0,x
	adcb	r1
	stab	0,x
	rts

add_ip_ip_pb			; numCalls = 1
	.module	modadd_ip_ip_pb
	jsr	getbyte
	ldx	letptr
	clra
	addd	1,x
	std	1,x
	ldab	#0
	adcb	0,x
	stab	0,x
	rts

add_ir1_ir1_ir2			; numCalls = 5
	.module	modadd_ir1_ir1_ir2
	jsr	noargs
	ldd	r1+1
	addd	r2+1
	std	r1+1
	ldab	r1
	adcb	r2
	stab	r1
	rts

add_ir1_ir1_ix			; numCalls = 57
	.module	modadd_ir1_ir1_ix
	jsr	extend
	ldd	r1+1
	addd	1,x
	std	r1+1
	ldab	r1
	adcb	0,x
	stab	r1
	rts

add_ir1_ir1_pb			; numCalls = 37
	.module	modadd_ir1_ir1_pb
	jsr	getbyte
	clra
	addd	r1+1
	std	r1+1
	ldab	#0
	adcb	r1
	stab	r1
	rts

add_ir2_ir2_pb			; numCalls = 18
	.module	modadd_ir2_ir2_pb
	jsr	getbyte
	clra
	addd	r2+1
	std	r2+1
	ldab	#0
	adcb	r2
	stab	r2
	rts

add_ix_ix_ir1			; numCalls = 6
	.module	modadd_ix_ix_ir1
	jsr	extend
	ldd	1,x
	addd	r1+1
	std	1,x
	ldab	0,x
	adcb	r1
	stab	0,x
	rts

add_ix_ix_pb			; numCalls = 10
	.module	modadd_ix_ix_pb
	jsr	extbyte
	clra
	addd	1,x
	std	1,x
	ldab	#0
	adcb	0,x
	stab	0,x
	rts

and_ir1_ir1_ir2			; numCalls = 2
	.module	modand_ir1_ir1_ir2
	jsr	noargs
	ldd	r2+1
	andb	r1+2
	anda	r1+1
	std	r1+1
	ldab	r2
	andb	r1
	stab	r1
	rts

arrdim1_ir1_ix			; numCalls = 8
	.module	modarrdim1_ir1_ix
	jsr	extend
	ldd	,x
	beq	_ok
	ldab	#DD_ERROR
	jmp	error
_ok
	ldd	strbuf
	std	,x
	ldd	r1+1
	addd	#1
	std	2,x
	lsld
	addd	2,x
	jmp	alloc

arrdim2_ir1_sx			; numCalls = 4
	.module	modarrdim2_ir1_sx
	jsr	extend
	ldd	,x
	beq	_ok
	ldab	#DD_ERROR
	jmp	error
_ok
	ldd	strbuf
	std	,x
	ldd	r1+1
	addd	#1
	std	2,x
	std	tmp1
	ldd	r2+1
	addd	#1
	std	4,x
	std	tmp2
	jsr	mul12
	std	tmp3
	lsld
	addd	tmp3
	jmp	alloc

arrref1_ir1_ix			; numCalls = 40
	.module	modarrref1_ir1_ix
	jsr	extend
	ldd	r1+1
	std	0+argv
	ldd	#33
	jsr	ref1
	jsr	refint
	std	letptr
	rts

arrref2_ir1_sx			; numCalls = 15
	.module	modarrref2_ir1_sx
	jsr	extend
	ldd	r1+1
	std	0+argv
	ldd	r1+1+5
	std	2+argv
	jsr	ref2
	jsr	refint
	std	letptr
	rts

arrval1_ir1_ix			; numCalls = 54
	.module	modarrval1_ir1_ix
	jsr	extend
	ldd	r1+1
	std	0+argv
	ldd	#33
	jsr	ref1
	jsr	refint
	ldx	tmp1
	ldab	,x
	stab	r1
	ldd	1,x
	std	r1+1
	rts

arrval1_ir2_ix			; numCalls = 8
	.module	modarrval1_ir2_ix
	jsr	extend
	ldd	r2+1
	std	0+argv
	ldd	#33
	jsr	ref1
	jsr	refint
	ldx	tmp1
	ldab	,x
	stab	r2
	ldd	1,x
	std	r2+1
	rts

arrval2_ir1_sx			; numCalls = 80
	.module	modarrval2_ir1_sx
	jsr	extend
	ldd	r1+1
	std	0+argv
	ldd	r1+1+5
	std	2+argv
	jsr	ref2
	jsr	refint
	ldx	tmp1
	ldab	,x
	stab	r1
	ldd	1,x
	std	r1+1
	rts

asc_ir1_sr1			; numCalls = 2
	.module	modasc_ir1_sr1
	jsr	noargs
	ldab	r1
	beq	_fc_error
	ldx	r1+1
	ldab	,x
	jsr	strrel
_null
	stab	r1+2
	ldd	#0
	std	r1
	rts
_fc_error
	ldab	#FC_ERROR
	jmp	error

chr_sr1_ir1			; numCalls = 10
	.module	modchr_sr1_ir1
	jsr	noargs
	ldd	#$0101
	std	r1
	rts

chr_sr2_ir2			; numCalls = 18
	.module	modchr_sr2_ir2
	jsr	noargs
	ldd	#$0101
	std	r2
	rts

clear			; numCalls = 2
	.module	modclear
	jsr	noargs
	clra
	ldx	#bss
	bra	_start
_again
	staa	,x
	inx
_start
	cpx	#bes
	bne	_again
	stx	strbuf
	stx	strend
	inx
	inx
	stx	strfree
	ldx	#$8FFF
	stx	strstop
	ldx	#startdata
	stx	dataptr
	rts

cls			; numCalls = 4
	.module	modcls
	jsr	noargs
	jmp	R_CLS

clsn_pb			; numCalls = 1
	.module	modclsn_pb
	jsr	getbyte
	jmp	R_CLSN

div_fr1_ir1_pb			; numCalls = 1
	.module	moddiv_fr1_ir1_pb
	jsr	getbyte
	stab	2+argv
	ldd	#0
	std	0+argv
	std	3+argv
	std	r1+3
	ldx	#r1
	jmp	divflt

div_fr2_ir2_pb			; numCalls = 1
	.module	moddiv_fr2_ir2_pb
	jsr	getbyte
	stab	2+argv
	ldd	#0
	std	0+argv
	std	3+argv
	std	r2+3
	ldx	#r2
	jmp	divflt

for_ix_ir1			; numCalls = 1
	.module	modfor_ix_ir1
	jsr	extend
	stx	letptr
	ldd	r1+1
	std	1,x
	ldab	r1
	stab	0,x
	rts

for_ix_pb			; numCalls = 27
	.module	modfor_ix_pb
	jsr	extbyte
	stx	letptr
	clra
	staa	0,x
	std	1,x
	rts

gosub_ix			; numCalls = 19
	.module	modgosub_ix
	pulx
	jsr	getaddr
	ldd	nxtinst
	pshb
	psha
	ldab	#3
	pshb
	stx	nxtinst
	jmp	mainloop

goto_ix			; numCalls = 11
	.module	modgoto_ix
	jsr	getaddr
	stx	nxtinst
	rts

inkey_sr1			; numCalls = 9
	.module	modinkey_sr1
	jsr	noargs
	ldd	#$0101
	std	r1
	ldaa	M_IKEY
	bne	_gotkey
	jsr	R_KEYIN
_gotkey
	clr	M_IKEY
	staa	r1+2
	bne	_rts
	staa	r1
_rts
	rts

irnd_ir1_pb			; numCalls = 5
	.module	modirnd_ir1_pb
	jsr	getbyte
	clra
	staa	tmp1+1
	std	tmp2
	jsr	irnd
	std	r1+1
	ldab	tmp1
	stab	r1
	rts

irnd_ir1_pw			; numCalls = 2
	.module	modirnd_ir1_pw
	jsr	getword
	clr	tmp1+1
	std	tmp2
	jsr	irnd
	std	r1+1
	ldab	tmp1
	stab	r1
	rts

irnd_ir2_pb			; numCalls = 1
	.module	modirnd_ir2_pb
	jsr	getbyte
	clra
	staa	tmp1+1
	std	tmp2
	jsr	irnd
	std	r2+1
	ldab	tmp1
	stab	r2
	rts

jmpeq_ir1_ix			; numCalls = 19
	.module	modjmpeq_ir1_ix
	jsr	getaddr
	ldd	r1+1
	bne	_rts
	ldaa	r1
	bne	_rts
	stx	nxtinst
_rts
	rts

jmpne_ir1_ix			; numCalls = 7
	.module	modjmpne_ir1_ix
	jsr	getaddr
	ldd	r1+1
	bne	_go
	ldaa	r1
	beq	_rts
_go
	stx	nxtinst
_rts
	rts

jsrne_ir1_ix			; numCalls = 1
	.module	modjsrne_ir1_ix
	pulx
	jsr	getaddr
	ldd	r1+1
	bne	_go
	ldaa	r1
	beq	_rts
_go
	ldd	nxtinst
	pshb
	psha
	ldab	#3
	pshb
	stx	nxtinst
_rts
	jmp	mainloop

ld_fx_fr1			; numCalls = 1
	.module	modld_fx_fr1
	jsr	extend
	ldd	r1+3
	std	3,x
	ldd	r1+1
	std	1,x
	ldab	r1
	stab	0,x
	rts

ld_ip_ir1			; numCalls = 12
	.module	modld_ip_ir1
	jsr	noargs
	ldx	letptr
	ldd	r1+1
	std	1,x
	ldab	r1
	stab	0,x
	rts

ld_ip_nb			; numCalls = 1
	.module	modld_ip_nb
	jsr	getbyte
	ldx	letptr
	stab	2,x
	ldd	#-1
	std	0,x
	rts

ld_ip_pb			; numCalls = 21
	.module	modld_ip_pb
	jsr	getbyte
	ldx	letptr
	stab	2,x
	ldd	#0
	std	0,x
	rts

ld_ir1_ix			; numCalls = 236
	.module	modld_ir1_ix
	jsr	extend
	ldd	1,x
	std	r1+1
	ldab	0,x
	stab	r1
	rts

ld_ir1_nb			; numCalls = 3
	.module	modld_ir1_nb
	jsr	getbyte
	stab	r1+2
	ldd	#-1
	std	r1
	rts

ld_ir1_pb			; numCalls = 83
	.module	modld_ir1_pb
	jsr	getbyte
	stab	r1+2
	ldd	#0
	std	r1
	rts

ld_ir1_pw			; numCalls = 4
	.module	modld_ir1_pw
	jsr	getword
	std	r1+1
	ldab	#0
	stab	r1
	rts

ld_ir2_ix			; numCalls = 44
	.module	modld_ir2_ix
	jsr	extend
	ldd	1,x
	std	r2+1
	ldab	0,x
	stab	r2
	rts

ld_ir2_pb			; numCalls = 106
	.module	modld_ir2_pb
	jsr	getbyte
	stab	r2+2
	ldd	#0
	std	r2
	rts

ld_ix_ir1			; numCalls = 36
	.module	modld_ix_ir1
	jsr	extend
	ldd	r1+1
	std	1,x
	ldab	r1
	stab	0,x
	rts

ld_ix_nb			; numCalls = 3
	.module	modld_ix_nb
	jsr	extbyte
	stab	2,x
	ldd	#-1
	std	0,x
	rts

ld_ix_pb			; numCalls = 37
	.module	modld_ix_pb
	jsr	extbyte
	stab	2,x
	ldd	#0
	std	0,x
	rts

ld_ix_pw			; numCalls = 5
	.module	modld_ix_pw
	jsr	extword
	std	1,x
	ldab	#0
	stab	0,x
	rts

ld_sp_sr1			; numCalls = 15
	.module	modld_sp_sr1
	jsr	noargs
	ldx	letptr
	ldab	r1
	stab	0+argv
	ldd	r1+1
	std	1+argv
	jmp	strprm

ld_sr1_ss			; numCalls = 4
	.module	modld_sr1_ss
	ldx	curinst
	inx
	ldab	,x
	stab	r1
	inx
	stx	r1+1
	abx
	stx	nxtinst
	rts

ld_sr1_sx			; numCalls = 4
	.module	modld_sr1_sx
	jsr	extend
	ldd	1,x
	std	r1+1
	ldab	0,x
	stab	r1
	rts

ld_sx_sr1			; numCalls = 9
	.module	modld_sx_sr1
	jsr	extend
	ldab	r1
	stab	0+argv
	ldd	r1+1
	std	1+argv
	jmp	strprm

ldeq_ir1_fr1_pb			; numCalls = 1
	.module	modldeq_ir1_fr1_pb
	jsr	getbyte
	cmpb	r1+2
	bne	_done
	ldd	r1+3
	bne	_done
	ldd	r1
	bne	_done
_done
	jsr	geteq
	std	r1+1
	stab	r1
	rts

ldeq_ir1_ir1_ir2			; numCalls = 1
	.module	modldeq_ir1_ir1_ir2
	jsr	noargs
	ldd	r1+1
	subd	r2+1
	bne	_done
	ldab	r1
	cmpb	r2
_done
	jsr	geteq
	std	r1+1
	stab	r1
	rts

ldeq_ir1_ir1_ix			; numCalls = 3
	.module	modldeq_ir1_ir1_ix
	jsr	extend
	ldd	r1+1
	subd	1,x
	bne	_done
	ldab	r1
	cmpb	0,x
_done
	jsr	geteq
	std	r1+1
	stab	r1
	rts

ldeq_ir1_ir1_pb			; numCalls = 4
	.module	modldeq_ir1_ir1_pb
	jsr	getbyte
	cmpb	r1+2
	bne	_done
	ldd	r1
_done
	jsr	geteq
	std	r1+1
	stab	r1
	rts

ldeq_ir1_sr1_ss			; numCalls = 4
	.module	modldeq_ir1_sr1_ss
	ldab	r1
	stab	tmp1+1
	ldd	r1+1
	std	tmp2
	jsr	streqbs
	jsr	geteq
	std	r1+1
	stab	r1
	rts

ldeq_ir2_ir2_ix			; numCalls = 1
	.module	modldeq_ir2_ir2_ix
	jsr	extend
	ldd	r2+1
	subd	1,x
	bne	_done
	ldab	r2
	cmpb	0,x
_done
	jsr	geteq
	std	r2+1
	stab	r2
	rts

ldeq_ir2_ir2_pb			; numCalls = 2
	.module	modldeq_ir2_ir2_pb
	jsr	getbyte
	cmpb	r2+2
	bne	_done
	ldd	r2
_done
	jsr	geteq
	std	r2+1
	stab	r2
	rts

ldlt_ir1_fr1_pb			; numCalls = 1
	.module	modldlt_ir1_fr1_pb
	jsr	getbyte
	clra
	std	tmp1
	ldd	r1+1
	subd	tmp1
	ldab	r1
	sbcb	#0
	jsr	getlt
	std	r1+1
	stab	r1
	rts

ldlt_ir1_ir1_ir2			; numCalls = 1
	.module	modldlt_ir1_ir1_ir2
	jsr	noargs
	ldd	r1+1
	subd	r2+1
	ldab	r1
	sbcb	r2
	jsr	getlt
	std	r1+1
	stab	r1
	rts

ldlt_ir1_ir1_ix			; numCalls = 8
	.module	modldlt_ir1_ir1_ix
	jsr	extend
	ldd	r1+1
	subd	1,x
	ldab	r1
	sbcb	0,x
	jsr	getlt
	std	r1+1
	stab	r1
	rts

ldlt_ir1_ir1_pb			; numCalls = 1
	.module	modldlt_ir1_ir1_pb
	jsr	getbyte
	clra
	std	tmp1
	ldd	r1+1
	subd	tmp1
	ldab	r1
	sbcb	#0
	jsr	getlt
	std	r1+1
	stab	r1
	rts

ldlt_ir2_ir2_fr3			; numCalls = 1
	.module	modldlt_ir2_ir2_fr3
	jsr	noargs
	ldd	#0
	subd	r3+3
	ldd	r2+1
	sbcb	r3+2
	sbca	r3+1
	ldab	r2
	sbcb	r3
	jsr	getlt
	std	r2+1
	stab	r2
	rts

ldne_ir1_ir1_ir2			; numCalls = 1
	.module	modldne_ir1_ir1_ir2
	jsr	noargs
	ldd	r1+1
	subd	r2+1
	bne	_done
	ldab	r1
	cmpb	r2
_done
	jsr	getne
	std	r1+1
	stab	r1
	rts

ldne_ir1_ir1_pb			; numCalls = 2
	.module	modldne_ir1_ir1_pb
	jsr	getbyte
	cmpb	r1+2
	bne	_done
	ldd	r1
_done
	jsr	getne
	std	r1+1
	stab	r1
	rts

mul_fr2_fr2_pb			; numCalls = 1
	.module	modmul_fr2_fr2_pb
	jsr	getbyte
	stab	2+argv
	ldd	#0
	std	0+argv
	std	3+argv
	ldx	#r2
	jmp	mulfltx

mul_ir1_ir1_ix			; numCalls = 12
	.module	modmul_ir1_ir1_ix
	jsr	extend
	ldab	0,x
	stab	0+argv
	ldd	1,x
	std	1+argv
	ldx	#r1
	jmp	mulintx

mul_ir1_ir1_pb			; numCalls = 3
	.module	modmul_ir1_ir1_pb
	jsr	getbyte
	stab	2+argv
	ldd	#0
	std	0+argv
	ldx	#r1
	jmp	mulintx

next			; numCalls = 28
	.module	modnext
	jsr	noargs
	pulx
	tsx
	ldab	,x
	cmpb	#3
	bhi	_ok
	ldab	#NF_ERROR
	jmp	error
_ok
	cmpb	#11
	bne	_flt
	ldd	9,x
	std	r1+1
	ldab	8,x
	stab	r1
	ldx	1,x
	ldd	r1+1
	addd	1,x
	std	r1+1
	std	1,x
	ldab	r1
	adcb	,x
	stab	r1
	stab	,x
	tsx
	tst	8,x
	bpl	_iopp
	ldd	r1+1
	subd	6,x
	ldab	r1
	sbcb	5,x
	blt	_idone
	ldx	3,x
	stx	nxtinst
	jmp	mainloop
_iopp
	ldd	6,x
	subd	r1+1
	ldab	5,x
	sbcb	r1
	blt	_idone
	ldx	3,x
	stx	nxtinst
	jmp	mainloop
_idone
	ldab	#11
	bra	_done
_flt
	ldd	13,x
	std	r1+3
	ldd	11,x
	std	r1+1
	ldab	10,x
	stab	r1
	ldx	1,x
	ldd	r1+3
	addd	3,x
	std	r1+3
	std	3,x
	ldd	1,x
	adcb	r1+2
	adca	r1+1
	std	r1+1
	std	1,x
	ldab	r1
	adcb	,x
	stab	r1
	stab	,x
	tsx
	tst	10,x
	bpl	_fopp
	ldd	r1+3
	subd	8,x
	ldd	r1+1
	sbcb	7,x
	sbca	6,x
	ldab	r1
	sbcb	5,x
	blt	_fdone
	ldx	3,x
	stx	nxtinst
	jmp	mainloop
_fopp
	ldd	8,x
	subd	r1+3
	ldd	6,x
	sbcb	r1+2
	sbca	r1+1
	ldab	5,x
	sbcb	r1
	blt	_fdone
	ldx	3,x
	stx	nxtinst
	jmp	mainloop
_fdone
	ldab	#15
_done
	abx
	txs
	jmp	mainloop

nextvar_ix			; numCalls = 2
	.module	modnextvar_ix
	jsr	extend
	stx	letptr
	pulx
	tsx
	clrb
_nxtvar
	abx
	ldd	1,x
	subd	letptr
	beq	_ok
	ldab	,x
	cmpb	#3
	bhi	_nxtvar
_ok
	txs
	jmp	mainloop

ongosub_ir1_is			; numCalls = 12
	.module	modongosub_ir1_is
	pulx
	ldx	curinst
	inx
	ldd	r1
	bne	_fail
	ldab	r1+2
	decb
	cmpb	0,x
	bhs	_fail
	stx	tmp1
	stab	tmp2
	ldab	,x
	abx
	abx
	inx
	pshx
	ldaa	#3
	psha
	ldx	tmp1
	ldab	tmp2
	abx
	abx
	ldx	1,x
	stx	nxtinst
	jmp	mainloop
_fail
	ldab	,x
	abx
	abx
	inx
	stx	nxtinst
	jmp	mainloop

ongoto_ir1_is			; numCalls = 8
	.module	modongoto_ir1_is
	ldx	curinst
	inx
	ldd	r1
	bne	_fail
	ldab	r1+2
	decb
	cmpb	0,x
	bhs	_fail
	abx
	abx
	ldx	1,x
	stx	nxtinst
	rts
_fail
	ldab	,x
	abx
	abx
	inx
	stx	nxtinst
	rts

or_ir1_ir1_ir2			; numCalls = 1
	.module	modor_ir1_ir1_ir2
	jsr	noargs
	ldd	r2+1
	orab	r1+2
	oraa	r1+1
	std	r1+1
	ldab	r2
	orab	r1
	stab	r1
	rts

peek_ir1_ir1			; numCalls = 8
	.module	modpeek_ir1_ir1
	jsr	noargs
	ldx	r1+1
	jsr	peek
	stab	r1+2
	ldd	#0
	std	r1
	rts

poke_pw_ir1			; numCalls = 2
	.module	modpoke_pw_ir1
	jsr	getword
	std	tmp1
	ldab	r1+2
	ldx	tmp1
	stab	,x
	rts

pr_sr1			; numCalls = 90
	.module	modpr_sr1
	jsr	noargs
	ldab	r1
	beq	_rts
	ldx	r1+1
	jsr	print
	ldx	r1+1
	jmp	strrel
_rts
	rts

pr_ss			; numCalls = 40
	.module	modpr_ss
	ldx	curinst
	inx
	ldab	,x
	beq	_null
	inx
	jsr	print
	stx	nxtinst
	rts
_null
	inx
	stx	nxtinst
	rts

pr_sx			; numCalls = 1
	.module	modpr_sx
	jsr	extend
	ldab	0,x
	beq	_rts
	ldx	1,x
	jsr	print
_rts
	rts

prat_ir1			; numCalls = 55
	.module	modprat_ir1
	jsr	noargs
	ldaa	r1
	bne	_fcerror
	ldd	r1+1
	jmp	prat
_fcerror
	ldab	#FC_ERROR
	jmp	error

prat_ix			; numCalls = 28
	.module	modprat_ix
	jsr	extend
	ldaa	0,x
	bne	_fcerror
	ldd	1,x
	jmp	prat
_fcerror
	ldab	#FC_ERROR
	jmp	error

prat_pb			; numCalls = 21
	.module	modprat_pb
	jsr	getbyte
	ldaa	#$40
	std	M_CRSR
	rts

prat_pw			; numCalls = 3
	.module	modprat_pw
	jsr	getword
	jmp	prat

progbegin			; numCalls = 1
	.module	modprogbegin
	jsr	noargs
	ldx	R_MCXID
	cpx	#'h'*256+'C'
	bne	_mcbasic
	pulx
	clrb
	pshb
	pshb
	pshb
	jmp	,x
_reqmsg	.text	"?MICROCOLOR BASIC ROM REQUIRED"
_mcbasic
	ldx	#_reqmsg
	ldab	#30
	jsr	print
	pulx
	rts

progend			; numCalls = 3
	.module	modprogend
	jsr	noargs
	pulx
	pula
	pula
	pula
	jsr	R_RESET
	jmp	R_DMODE
NF_ERROR	.equ	0
RG_ERROR	.equ	4
OD_ERROR	.equ	6
FC_ERROR	.equ	8
OV_ERROR	.equ	10
OM_ERROR	.equ	12
BS_ERROR	.equ	16
DD_ERROR	.equ	18
error
	jmp	R_ERROR

return			; numCalls = 33
	.module	modreturn
	pulx
	tsx
	clrb
_nxt
	abx
	ldab	,x
	bne	_ok
	ldab	#RG_ERROR
	jmp	error
_ok
	cmpb	#3
	bne	_nxt
	inx
	txs
	pulx
	stx	nxtinst
	jmp	mainloop

rnd_fr1_ir1			; numCalls = 2
	.module	modrnd_fr1_ir1
	jsr	noargs
	ldab	r1
	stab	tmp1+1
	bmi	_neg
	ldd	r1+1
	std	tmp2
	beq	_flt
	jsr	irnd
	std	r1+1
	ldab	tmp1
	stab	r1
	ldd	#0
	std	r1+3
	rts
_neg
	ldd	r1+1
	std	tmp2
_flt
	jsr	rnd
	std	r1+3
	ldd	#0
	std	r1+1
	stab	r1
	rts

rnd_fr1_ix			; numCalls = 3
	.module	modrnd_fr1_ix
	jsr	extend
	ldab	0,x
	stab	tmp1+1
	bmi	_neg
	ldd	1,x
	std	tmp2
	beq	_flt
	jsr	irnd
	std	r1+1
	ldab	tmp1
	stab	r1
	ldd	#0
	std	r1+3
	rts
_neg
	ldd	1,x
	std	tmp2
_flt
	jsr	rnd
	std	r1+3
	ldd	#0
	std	r1+1
	stab	r1
	rts

sgn_ir1_ir1			; numCalls = 2
	.module	modsgn_ir1_ir1
	jsr	noargs
	ldab	r1
	bmi	_neg
	bne	_pos
	ldd	r1+1
	bne	_pos
	ldd	#0
	stab	r1+2
	bra	_done
_pos
	ldd	#1
	stab	r1+2
	clrb
	bra	_done
_neg
	ldd	#-1
	stab	r1+2
_done
	std	r1
	rts

shift_ir1_ir1_pb			; numCalls = 15
	.module	modshift_ir1_ir1_pb
	jsr	getbyte
	ldx	#r1
	jmp	shlint

shift_ir2_ir2_pb			; numCalls = 22
	.module	modshift_ir2_ir2_pb
	jsr	getbyte
	ldx	#r2
	jmp	shlint

sound_ir1_ir2			; numCalls = 18
	.module	modsound_ir1_ir2
	jsr	noargs
	ldaa	r1+2
	ldab	r2+2
	jmp	R_SOUND

step_ip_ir1			; numCalls = 7
	.module	modstep_ip_ir1
	jsr	noargs
	tsx
	ldab	r1
	stab	10,x
	ldd	r1+1
	std	11,x
	ldd	nxtinst
	std	5,x
	rts

str_sr1_ix			; numCalls = 10
	.module	modstr_sr1_ix
	jsr	extend
	ldd	1,x
	std	tmp2
	ldab	0,x
	stab	tmp1+1
	ldd	#0
	std	tmp3
	jsr	strflt
	std	r1+1
	ldab	tmp1
	stab	r1
	rts

strcat_sr1_sr1_sr2			; numCalls = 18
	.module	modstrcat_sr1_sr1_sr2
	jsr	noargs
	ldab	r2
	addb	r1
	stab	r1
	ldab	r2
	ldx	r2+1
	jmp	strtmp

strcat_sr1_sr1_ss			; numCalls = 5
	.module	modstrcat_sr1_sr1_ss
	ldx	curinst
	inx
	ldab	,x
	addb	r1
	stab	r1
	ldab	,x
	inx
	pshx
	abx
	stx	nxtinst
	pulx
	jmp	strtmp

strcat_sr1_sr1_sx			; numCalls = 2
	.module	modstrcat_sr1_sr1_sx
	jsr	extend
	ldab	0,x
	addb	r1
	stab	r1
	ldab	0,x
	ldx	1,x
	jmp	strtmp

strinit_sr1_sr1			; numCalls = 12
	.module	modstrinit_sr1_sr1
	jsr	noargs
	ldab	r1
	stab	r1
	ldx	r1+1
	jsr	strtmp
	std	r1+1
	rts

strinit_sr1_ss			; numCalls = 2
	.module	modstrinit_sr1_ss
	ldx	curinst
	inx
	ldab	,x
	stab	r1
	inx
	pshx
	abx
	stx	nxtinst
	pulx
	jsr	strtmp
	std	r1+1
	rts

strinit_sr1_sx			; numCalls = 1
	.module	modstrinit_sr1_sx
	jsr	extend
	ldab	0,x
	stab	r1
	ldx	1,x
	jsr	strtmp
	std	r1+1
	rts

sub_fr1_fr1_ir2			; numCalls = 1
	.module	modsub_fr1_fr1_ir2
	jsr	noargs
	ldd	r1+1
	subd	r2+1
	std	r1+1
	ldab	r1
	sbcb	r2
	stab	r1
	rts

sub_fr1_ir1_fr2			; numCalls = 1
	.module	modsub_fr1_ir1_fr2
	jsr	noargs
	ldd	#0
	subd	r2+3
	std	r1+3
	ldd	r1+1
	sbcb	r2+2
	sbca	r2+1
	std	r1+1
	ldab	r1
	sbcb	r2
	stab	r1
	rts

sub_ip_ip_pb			; numCalls = 2
	.module	modsub_ip_ip_pb
	jsr	getbyte
	ldx	letptr
	stab	tmp1
	ldd	1,x
	subb	tmp1
	sbca	#0
	std	1,x
	ldab	0,x
	sbcb	#0
	stab	0,x
	rts

sub_ir1_ir1_ir2			; numCalls = 4
	.module	modsub_ir1_ir1_ir2
	jsr	noargs
	ldd	r1+1
	subd	r2+1
	std	r1+1
	ldab	r1
	sbcb	r2
	stab	r1
	rts

sub_ir1_ir1_ix			; numCalls = 4
	.module	modsub_ir1_ir1_ix
	jsr	extend
	ldd	r1+1
	subd	1,x
	std	r1+1
	ldab	r1
	sbcb	0,x
	stab	r1
	rts

sub_ir1_ir1_pb			; numCalls = 3
	.module	modsub_ir1_ir1_pb
	jsr	getbyte
	stab	tmp1
	ldd	r1+1
	subb	tmp1
	sbca	#0
	std	r1+1
	ldab	r1
	sbcb	#0
	stab	r1
	rts

sub_ix_ix_pb			; numCalls = 6
	.module	modsub_ix_ix_pb
	jsr	extbyte
	stab	tmp1
	ldd	1,x
	subb	tmp1
	sbca	#0
	std	1,x
	ldab	0,x
	sbcb	#0
	stab	0,x
	rts

to_ip_ix			; numCalls = 3
	.module	modto_ip_ix
	jsr	extend
	ldab	0,x
	stab	r1
	ldd	1,x
	std	r1+1
	ldd	#0
	std	r1+3
	ldab	#11
	jmp	to

to_ip_pb			; numCalls = 22
	.module	modto_ip_pb
	jsr	getbyte
	stab	r1+2
	ldd	#0
	std	r1
	std	r1+3
	ldab	#11
	jmp	to

to_ip_pw			; numCalls = 3
	.module	modto_ip_pw
	jsr	getword
	std	r1+1
	ldd	#0
	stab	r1
	std	r1+3
	ldab	#11
	jmp	to

val_fr1_sx			; numCalls = 1
	.module	modval_fr1_sx
	jsr	extend
	jsr	strval
	ldab	tmp1+1
	stab	r1
	ldd	tmp2
	std	r1+1
	ldd	tmp3
	std	r1+3
	rts

val_fr2_sx			; numCalls = 1
	.module	modval_fr2_sx
	jsr	extend
	jsr	strval
	ldab	tmp1+1
	stab	r2
	ldd	tmp2
	std	r2+1
	ldd	tmp3
	std	r2+3
	rts

val_fr3_sx			; numCalls = 1
	.module	modval_fr3_sx
	jsr	extend
	jsr	strval
	ldab	tmp1+1
	stab	r3
	ldd	tmp2
	std	r3+1
	ldd	tmp3
	std	r3+3
	rts

; data table
startdata
enddata

; Bytecode equates


bytecode_INTVAR_A	.equ	INTVAR_A-symstart
bytecode_INTVAR_B	.equ	INTVAR_B-symstart
bytecode_INTVAR_B1	.equ	INTVAR_B1-symstart
bytecode_INTVAR_C	.equ	INTVAR_C-symstart
bytecode_INTVAR_D	.equ	INTVAR_D-symstart
bytecode_INTVAR_E	.equ	INTVAR_E-symstart
bytecode_INTVAR_F	.equ	INTVAR_F-symstart
bytecode_INTVAR_FL	.equ	INTVAR_FL-symstart
bytecode_INTVAR_G	.equ	INTVAR_G-symstart
bytecode_INTVAR_H	.equ	INTVAR_H-symstart
bytecode_INTVAR_HS	.equ	INTVAR_HS-symstart
bytecode_INTVAR_I	.equ	INTVAR_I-symstart
bytecode_INTVAR_J	.equ	INTVAR_J-symstart
bytecode_INTVAR_K	.equ	INTVAR_K-symstart
bytecode_INTVAR_L	.equ	INTVAR_L-symstart
bytecode_INTVAR_LC	.equ	INTVAR_LC-symstart
bytecode_INTVAR_LF	.equ	INTVAR_LF-symstart
bytecode_INTVAR_LV	.equ	INTVAR_LV-symstart
bytecode_INTVAR_M	.equ	INTVAR_M-symstart
bytecode_INTVAR_N	.equ	INTVAR_N-symstart
bytecode_INTVAR_O	.equ	INTVAR_O-symstart
bytecode_INTVAR_P	.equ	INTVAR_P-symstart
bytecode_INTVAR_Q	.equ	INTVAR_Q-symstart
bytecode_INTVAR_R	.equ	INTVAR_R-symstart
bytecode_INTVAR_S	.equ	INTVAR_S-symstart
bytecode_INTVAR_SS	.equ	INTVAR_SS-symstart
bytecode_INTVAR_T	.equ	INTVAR_T-symstart
bytecode_INTVAR_U	.equ	INTVAR_U-symstart
bytecode_INTVAR_V	.equ	INTVAR_V-symstart
bytecode_INTVAR_W	.equ	INTVAR_W-symstart
bytecode_INTVAR_X	.equ	INTVAR_X-symstart
bytecode_INTVAR_Y	.equ	INTVAR_Y-symstart
bytecode_INTVAR_Z	.equ	INTVAR_Z-symstart
bytecode_INTVAR_Z2	.equ	INTVAR_Z2-symstart
bytecode_FLTVAR_Z3	.equ	FLTVAR_Z3-symstart
bytecode_STRVAR_B	.equ	STRVAR_B-symstart
bytecode_STRVAR_BL	.equ	STRVAR_BL-symstart
bytecode_STRVAR_I	.equ	STRVAR_I-symstart
bytecode_INTARR_A	.equ	INTARR_A-symstart
bytecode_INTARR_B	.equ	INTARR_B-symstart
bytecode_INTARR_G	.equ	INTARR_G-symstart
bytecode_INTARR_I	.equ	INTARR_I-symstart
bytecode_INTARR_K	.equ	INTARR_K-symstart
bytecode_INTARR_O	.equ	INTARR_O-symstart
bytecode_INTARR_S	.equ	INTARR_S-symstart
bytecode_INTARR_V	.equ	INTARR_V-symstart
bytecode_STRARR_A	.equ	STRARR_A-symstart
bytecode_STRARR_B	.equ	STRARR_B-symstart
bytecode_STRARR_X	.equ	STRARR_X-symstart
bytecode_STRARR_Y	.equ	STRARR_Y-symstart

symstart

; block started by symbol
bss

; Numeric Variables
INTVAR_A	.block	3
INTVAR_B	.block	3
INTVAR_B1	.block	3
INTVAR_C	.block	3
INTVAR_D	.block	3
INTVAR_E	.block	3
INTVAR_F	.block	3
INTVAR_FL	.block	3
INTVAR_G	.block	3
INTVAR_H	.block	3
INTVAR_HS	.block	3
INTVAR_I	.block	3
INTVAR_J	.block	3
INTVAR_K	.block	3
INTVAR_L	.block	3
INTVAR_LC	.block	3
INTVAR_LF	.block	3
INTVAR_LV	.block	3
INTVAR_M	.block	3
INTVAR_N	.block	3
INTVAR_O	.block	3
INTVAR_P	.block	3
INTVAR_Q	.block	3
INTVAR_R	.block	3
INTVAR_S	.block	3
INTVAR_SS	.block	3
INTVAR_T	.block	3
INTVAR_U	.block	3
INTVAR_V	.block	3
INTVAR_W	.block	3
INTVAR_X	.block	3
INTVAR_Y	.block	3
INTVAR_Z	.block	3
INTVAR_Z2	.block	3
FLTVAR_Z3	.block	5
; String Variables
STRVAR_B	.block	3
STRVAR_BL	.block	3
STRVAR_I	.block	3
; Numeric Arrays
INTARR_A	.block	4	; dims=1
INTARR_B	.block	4	; dims=1
INTARR_G	.block	4	; dims=1
INTARR_I	.block	4	; dims=1
INTARR_K	.block	4	; dims=1
INTARR_O	.block	4	; dims=1
INTARR_S	.block	4	; dims=1
INTARR_V	.block	4	; dims=1
; String Arrays
STRARR_A	.block	6	; dims=2
STRARR_B	.block	6	; dims=2
STRARR_X	.block	6	; dims=2
STRARR_Y	.block	6	; dims=2

; block ended by symbol
bes
	.end
