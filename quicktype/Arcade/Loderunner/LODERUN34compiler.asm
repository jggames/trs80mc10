; Assembly for LODERUN34compiler.TXT
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

LINE_0

	; CLS

	.byte	bytecode_cls

	; INPUT "DELAY"; Z1

	.byte	bytecode_pr_ss
	.text	5, "DELAY"

	.byte	bytecode_input

	.byte	bytecode_readbuf_fx
	.byte	bytecode_FLTVAR_Z1

	.byte	bytecode_ignxtra

LINE_1

	; CLS

	.byte	bytecode_cls

	; GOSUB 100

	.byte	bytecode_gosub_ix
	.word	LINE_100

	; GOTO 90

	.byte	bytecode_goto_ix
	.word	LINE_90

LINE_2

	; RETURN

	.byte	bytecode_return

LINE_3

	; M=C(T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_C

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_M

	; GOTO 7

	.byte	bytecode_goto_ix
	.word	LINE_7

LINE_4

	; C(T)=W(RND(2))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_C

	.byte	bytecode_irnd_ir1_pb
	.byte	2

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_W

	.byte	bytecode_ld_ip_ir1

	; M=C(T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_C

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_M

	; GOTO 7

	.byte	bytecode_goto_ix
	.word	LINE_7

LINE_5

	; ON K(N(1)) GOTO 2,2,2,2,8

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_N

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ongoto_ir1_is
	.byte	5
	.word	LINE_2, LINE_2, LINE_2, LINE_2, LINE_8

	; RETURN

	.byte	bytecode_return

LINE_6

	; P=PEEK(P(A(T),B(T)+Y(M)))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ir3_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_arrval1_ir3_ix
	.byte	bytecode_INTARR_Y

	.byte	bytecode_add_ir2_ir2_ir3

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_P

	; ON K(P) GOTO 9,3,15,9,9,42,3,9,9,61

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_P

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ongoto_ir1_is
	.byte	10
	.word	LINE_9, LINE_3, LINE_15, LINE_9, LINE_9, LINE_42, LINE_3, LINE_9, LINE_9, LINE_61

LINE_7

	; P=PEEK(P(A(T)+X(M),B(T)))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_X

	.byte	bytecode_add_ir1_ir1_ir2

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_P

	; ON K(P) GOTO 9,12,15,9,9,42,12,9,9,61

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_P

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ongoto_ir1_is
	.byte	10
	.word	LINE_9, LINE_12, LINE_15, LINE_9, LINE_9, LINE_42, LINE_12, LINE_9, LINE_9, LINE_61

LINE_8

	; P=PEEK(P(A(T)+X(M),B(T)+Y(M)))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_X

	.byte	bytecode_add_ir1_ir1_ir2

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ir3_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_arrval1_ir3_ix
	.byte	bytecode_INTARR_Y

	.byte	bytecode_add_ir2_ir2_ir3

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_P

	; ON K(P) GOTO 9,2,15,9,9,42,2,9,9,61

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_P

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ongoto_ir1_is
	.byte	10
	.word	LINE_9, LINE_2, LINE_15, LINE_9, LINE_9, LINE_42, LINE_2, LINE_9, LINE_9, LINE_61

LINE_9

	; A=P(A(T),B(T))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; B=N(T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_N

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_B

	; POKE A,B

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_B

	.byte	bytecode_poke_ix_ir1
	.byte	bytecode_FLTVAR_A

	; N(T)=P

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_N

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_P

	.byte	bytecode_ld_ip_ir1

	; A(T)+=X(M)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_X

	.byte	bytecode_add_ip_ip_ir1

	; B(T)+=Y(M)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_Y

	.byte	bytecode_add_ip_ip_ir1

	; A=P(A(T),B(T))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; B=D(M,T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval2_ir1_ix
	.byte	bytecode_INTARR_D

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_B

	; POKE A,B

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_B

	.byte	bytecode_poke_ix_ir1
	.byte	bytecode_FLTVAR_A

LINE_10

	; F(T)=PEEK(P(A(T),B(T)+1))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_F

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_add_ir2_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ip_ir1

	; ON K(N(T)) GOTO 11,2,2,2,11

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_N

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ongoto_ir1_is
	.byte	5
	.word	LINE_11, LINE_2, LINE_2, LINE_2, LINE_11

	; RETURN

	.byte	bytecode_return

LINE_11

	; F(T)=2

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_F

	.byte	bytecode_ld_ip_pb
	.byte	2

	; RETURN

	.byte	bytecode_return

LINE_12

	; C(T)=W2(M)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_C

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_W2

	.byte	bytecode_ld_ip_ir1

	; M=C(T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_C

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_M

	; P=PEEK(P(A(T)+X(M),B(T)))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_X

	.byte	bytecode_add_ir1_ir1_ir2

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_P

	; ON K(P) GOTO 9,2,15,9,9,42,2,9,9,61

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_P

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ongoto_ir1_is
	.byte	10
	.word	LINE_9, LINE_2, LINE_15, LINE_9, LINE_9, LINE_42, LINE_2, LINE_9, LINE_9, LINE_61

LINE_13

	; M=5

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_M
	.byte	5

	; GOSUB 8

	.byte	bytecode_gosub_ix
	.word	LINE_8

	; GOTO 22

	.byte	bytecode_goto_ix
	.word	LINE_22

LINE_14

	; M=5

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_M
	.byte	5

	; GOSUB 6

	.byte	bytecode_gosub_ix
	.word	LINE_6

	; NEXT

	.byte	bytecode_next

	; NEXT

	.byte	bytecode_next

	; GOSUB 43

	.byte	bytecode_gosub_ix
	.word	LINE_43

	; NEXT

	.byte	bytecode_next

	; GOTO 50

	.byte	bytecode_goto_ix
	.word	LINE_50

LINE_15

	; P=G

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_G

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_P

	; G(T)+=1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_G

	.byte	bytecode_add_ip_ip_pb
	.byte	1

	; SOUND 100,1

	.byte	bytecode_ld_ir1_pb
	.byte	100

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; WHEN G(T)THENW GOTO 9

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_G

	.byte	bytecode_ldne_ir1_ir1_ix
	.byte	bytecode_INTVAR_W

	.byte	bytecode_jmpne_ir1_ix
	.word	LINE_9

LINE_16

	; A=P(E(1),E(2))

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; POKE A,240

	.byte	bytecode_poke_ix_pb
	.byte	bytecode_FLTVAR_A
	.byte	240

	; GOSUB 9

	.byte	bytecode_gosub_ix
	.word	LINE_9

	; SOUND 50,1

	.byte	bytecode_ld_ir1_pb
	.byte	50

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; SOUND 20,2

	.byte	bytecode_ld_ir1_pb
	.byte	20

	.byte	bytecode_ld_ir2_pb
	.byte	2

	.byte	bytecode_sound_ir1_ir2

	; SOUND 100,3

	.byte	bytecode_ld_ir1_pb
	.byte	100

	.byte	bytecode_ld_ir2_pb
	.byte	3

	.byte	bytecode_sound_ir1_ir2

	; RETURN

	.byte	bytecode_return

LINE_17

	; ON K(N(T)) GOSUB 3,3,3,3,6,42,3

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_N

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ongosub_ir1_is
	.byte	7
	.word	LINE_3, LINE_3, LINE_3, LINE_3, LINE_6, LINE_42, LINE_3

	; NEXT

	.byte	bytecode_next

	; NEXT

	.byte	bytecode_next

	; GOSUB 43

	.byte	bytecode_gosub_ix
	.word	LINE_43

	; NEXT

	.byte	bytecode_next

	; GOTO 50

	.byte	bytecode_goto_ix
	.word	LINE_50

LINE_18

	; GOSUB 6

	.byte	bytecode_gosub_ix
	.word	LINE_6

	; NEXT

	.byte	bytecode_next

	; NEXT

	.byte	bytecode_next

	; GOSUB 43

	.byte	bytecode_gosub_ix
	.word	LINE_43

	; NEXT

	.byte	bytecode_next

	; GOTO 50

	.byte	bytecode_goto_ix
	.word	LINE_50

LINE_19

	; GOSUB 7

	.byte	bytecode_gosub_ix
	.word	LINE_7

	; ON RND(4) GOTO 22

	.byte	bytecode_irnd_ir1_pb
	.byte	4

	.byte	bytecode_ongoto_ir1_is
	.byte	1
	.word	LINE_22

	; NEXT

	.byte	bytecode_next

	; NEXT

	.byte	bytecode_next

	; GOSUB 43

	.byte	bytecode_gosub_ix
	.word	LINE_43

	; NEXT

	.byte	bytecode_next

	; GOTO 50

	.byte	bytecode_goto_ix
	.word	LINE_50

LINE_20

	; FOR Z=1 TO 64000

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_Z
	.byte	1

	.byte	bytecode_to_ip_pw
	.word	64000

	; FOR S=1 TO V

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_S
	.byte	1

	.byte	bytecode_to_ip_ix
	.byte	bytecode_INTVAR_V

	; FOR C=2 TO F

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_C
	.byte	2

	.byte	bytecode_to_ip_ix
	.byte	bytecode_INTVAR_F

	; T=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	1

	; ON K(F(T)) GOTO 13,21,13,13,21,21,21,38,39

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_F

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ongoto_ir1_is
	.byte	9
	.word	LINE_13, LINE_21, LINE_13, LINE_13, LINE_21, LINE_21, LINE_21, LINE_38, LINE_39

LINE_21

	; FOR ZZ=1 TO Z1

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_ZZ
	.byte	1

	.byte	bytecode_to_ip_ix
	.byte	bytecode_FLTVAR_Z1

	; NEXT

	.byte	bytecode_next

	; M=K(PEEK(K) AND PEEK(2))

	.byte	bytecode_peek_ir1_ix
	.byte	bytecode_INTVAR_K

	.byte	bytecode_peek_ir2_pb
	.byte	2

	.byte	bytecode_and_ir1_ir1_ir2

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_M

	; ON M GOSUB 25,8,5,8,8,27,80

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_ongosub_ir1_is
	.byte	7
	.word	LINE_25, LINE_8, LINE_5, LINE_8, LINE_8, LINE_27, LINE_80

LINE_22

	; T=C

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_C

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_T

	; ON K(F(T)) GOTO 14,23,23,14,23,14,23,30,31

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_F

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ongoto_ir1_is
	.byte	9
	.word	LINE_14, LINE_23, LINE_23, LINE_14, LINE_23, LINE_14, LINE_23, LINE_30, LINE_31

LINE_23

	; M=U(B(T)+L-B(1))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_L

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_sub_ir1_ir1_ir2

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_U

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_M

	; ON M GOTO 24,24,17,24,18

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_ongoto_ir1_is
	.byte	5
	.word	LINE_24, LINE_24, LINE_17, LINE_24, LINE_18

	; M=V(A(T)+N-A(1))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_N

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_sub_ir1_ir1_ir2

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_V

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_M

	; ON M GOTO 24,19,24,19

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_ongoto_ir1_is
	.byte	4
	.word	LINE_24, LINE_19, LINE_24, LINE_19

LINE_24

	; NEXT

	.byte	bytecode_next

	; NEXT

	.byte	bytecode_next

	; GOSUB 43

	.byte	bytecode_gosub_ix
	.word	LINE_43

	; NEXT

	.byte	bytecode_next

	; GOTO 50

	.byte	bytecode_goto_ix
	.word	LINE_50

LINE_25

	; A=P(A(T),B(T))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; POKE A,141

	.byte	bytecode_poke_ix_pb
	.byte	bytecode_FLTVAR_A
	.byte	141

	; P=PEEK(P(A(T)-1,B(T)))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_sub_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_P

	; IF (PORG) OR (PTHENQ) THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_P

	.byte	bytecode_ldne_ir1_ir1_ix
	.byte	bytecode_INTVAR_G

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_P

	.byte	bytecode_ldne_ir2_ir2_ix
	.byte	bytecode_INTVAR_Q

	.byte	bytecode_or_ir1_ir1_ir2

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_26

	; IF PEEK(P(A(T)-1,B(T)+1))THENI THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_sub_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_add_ir2_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ldne_ir1_ir1_ix
	.byte	bytecode_INTVAR_I

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_26

	; S=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_S
	.byte	1

	; O+=1

	.byte	bytecode_add_ix_ix_pb
	.byte	bytecode_INTVAR_O
	.byte	1

	; H(O)=A(T)-1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_H

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_sub_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ip_ir1

	; GOTO 49

	.byte	bytecode_goto_ix
	.word	LINE_49

LINE_26

	; RETURN

	.byte	bytecode_return

LINE_27

	; A=P(A(T),B(T))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; POKE A,G1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_G1

	.byte	bytecode_poke_ix_ir1
	.byte	bytecode_FLTVAR_A

	; P=PEEK(P(A(T)+1,B(T)))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_add_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_P

	; IF (PORG) OR (PTHENQ) THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_P

	.byte	bytecode_ldne_ir1_ir1_ix
	.byte	bytecode_INTVAR_G

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_P

	.byte	bytecode_ldne_ir2_ir2_ix
	.byte	bytecode_INTVAR_Q

	.byte	bytecode_or_ir1_ir1_ir2

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_28

	; IF PEEK(P(A(T)+1,B(T)+1))THENI THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_add_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_add_ir2_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ldne_ir1_ir1_ix
	.byte	bytecode_INTVAR_I

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_28

	; S=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_S
	.byte	1

	; O+=1

	.byte	bytecode_add_ix_ix_pb
	.byte	bytecode_INTVAR_O
	.byte	1

	; H(O)=A(T)+1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_H

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_add_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ip_ir1

	; GOTO 49

	.byte	bytecode_goto_ix
	.word	LINE_49

LINE_28

	; RETURN

	.byte	bytecode_return

LINE_29

	; I(J)=1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ip_pb
	.byte	1

	; J=15

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_J
	.byte	15

	; NEXT

	.byte	bytecode_next

	; B(T)-=1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_sub_ip_ip_pb
	.byte	1

	; RETURN

	.byte	bytecode_return

LINE_30

	; WHEN G(T)>0 GOTO 37

	.byte	bytecode_ld_ir1_pb
	.byte	0

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_G

	.byte	bytecode_ldlt_ir1_ir1_ir2

	.byte	bytecode_jmpne_ir1_ix
	.word	LINE_37

	; A=P(A(T),B(T))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; POKE A,G

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_G

	.byte	bytecode_poke_ix_ir1
	.byte	bytecode_FLTVAR_A

	; B(T)+=1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_add_ip_ip_pb
	.byte	1

	; A=P(A(T),B(T))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; POKE A,G2

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_G2

	.byte	bytecode_poke_ix_ir1
	.byte	bytecode_FLTVAR_A

	; F(T)=144

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_F

	.byte	bytecode_ld_ip_pb
	.byte	144

	; NEXT

	.byte	bytecode_next

	; NEXT

	.byte	bytecode_next

	; GOSUB 43

	.byte	bytecode_gosub_ix
	.word	LINE_43

	; NEXT

	.byte	bytecode_next

	; GOTO 50

	.byte	bytecode_goto_ix
	.word	LINE_50

LINE_31

	; A=P(A(T),B(T))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; POKE A,RND(2)+D

	.byte	bytecode_irnd_ir1_pb
	.byte	2

	.byte	bytecode_add_ir1_ir1_ix
	.byte	bytecode_INTVAR_D

	.byte	bytecode_poke_ix_ir1
	.byte	bytecode_FLTVAR_A

	; T(T)+=1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_T

	.byte	bytecode_add_ip_ip_pb
	.byte	1

	; IF T(T)THENE THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_T

	.byte	bytecode_ldne_ir1_ir1_ix
	.byte	bytecode_INTVAR_E

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_32

	; NEXT

	.byte	bytecode_next

	; NEXT

	.byte	bytecode_next

	; GOSUB 43

	.byte	bytecode_gosub_ix
	.word	LINE_43

	; NEXT

	.byte	bytecode_next

	; GOTO 50

	.byte	bytecode_goto_ix
	.word	LINE_50

LINE_32

	; P=PEEK(P(A(T),B(T)-1))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_sub_ir2_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_P

	; ON K(P) GOSUB 2,2,35,34,2,41,2,2,2

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_P

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ongosub_ir1_is
	.byte	9
	.word	LINE_2, LINE_2, LINE_35, LINE_34, LINE_2, LINE_41, LINE_2, LINE_2, LINE_2

	; NEXT

	.byte	bytecode_next

	; NEXT

	.byte	bytecode_next

	; GOSUB 43

	.byte	bytecode_gosub_ix
	.word	LINE_43

	; NEXT

	.byte	bytecode_next

	; GOTO 50

	.byte	bytecode_goto_ix
	.word	LINE_50

LINE_33

	; FOR J=1 TO 15

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_J
	.byte	1

	.byte	bytecode_to_ip_pb
	.byte	15

	; WHEN (H(J)ANDA(T)) AND (I(J)=B(T)) GOTO 29

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_H

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ldne_ir1_ir1_ir2

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ir3_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir3_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ldeq_ir2_ir2_ir3

	.byte	bytecode_and_ir1_ir1_ir2

	.byte	bytecode_jmpne_ir1_ix
	.word	LINE_29

	; NEXT

	.byte	bytecode_next

	; RETURN

	.byte	bytecode_return

LINE_34

	; A=P(A(T),B(T))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; POKE A,I

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_I

	.byte	bytecode_poke_ix_ir1
	.byte	bytecode_FLTVAR_A

	; POKE P(A(T),B(T)-1),G2

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_sub_ir2_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_poke_ir1_ix
	.byte	bytecode_INTVAR_G2

	; F(T)=I

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_F

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_I

	.byte	bytecode_ld_ip_ir1

	; T(T)=0

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_T

	.byte	bytecode_ld_ip_pb
	.byte	0

	; SOUND 1,1

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; GOTO 33

	.byte	bytecode_goto_ix
	.word	LINE_33

LINE_35

	; A=P(A(T),B(T))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; POKE A,I

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_I

	.byte	bytecode_poke_ix_ir1
	.byte	bytecode_FLTVAR_A

	; POKE P(A(T),B(T)-1),G2

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_sub_ir2_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_poke_ir1_ix
	.byte	bytecode_INTVAR_G2

	; F(T)=I

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_F

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_I

	.byte	bytecode_ld_ip_ir1

	; T(T)=0

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_T

	.byte	bytecode_ld_ip_pb
	.byte	0

	; SOUND 200,1

	.byte	bytecode_ld_ir1_pb
	.byte	200

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_sound_ir1_ir2

	; G(T)+=1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_G

	.byte	bytecode_add_ip_ip_pb
	.byte	1

	; GOTO 33

	.byte	bytecode_goto_ix
	.word	LINE_33

LINE_37

	; A=P(A(T),B(T))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; POKE A,146

	.byte	bytecode_poke_ix_pb
	.byte	bytecode_FLTVAR_A
	.byte	146

	; G(T)-=1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_G

	.byte	bytecode_sub_ip_ip_pb
	.byte	1

	; B(T)+=1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_add_ip_ip_pb
	.byte	1

	; A=P(A(T),B(T))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; POKE A,G2

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_G2

	.byte	bytecode_poke_ix_ir1
	.byte	bytecode_FLTVAR_A

	; F(T)=144

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_F

	.byte	bytecode_ld_ip_pb
	.byte	144

	; NEXT

	.byte	bytecode_next

	; NEXT

	.byte	bytecode_next

	; GOSUB 43

	.byte	bytecode_gosub_ix
	.word	LINE_43

	; NEXT

	.byte	bytecode_next

	; GOTO 50

	.byte	bytecode_goto_ix
	.word	LINE_50

LINE_38

	; A=P(A(T),B(T))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; POKE A,N(T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_N

	.byte	bytecode_poke_ix_ir1
	.byte	bytecode_FLTVAR_A

	; B(T)+=1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_add_ip_ip_pb
	.byte	1

	; WHEN B(T)>14 GOTO 54

	.byte	bytecode_ld_ir1_pb
	.byte	14

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ldlt_ir1_ir1_ir2

	.byte	bytecode_jmpne_ir1_ix
	.word	LINE_54

	; A=P(A(T),B(T))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; POKE A,D(M,T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval2_ir1_ix
	.byte	bytecode_INTARR_D

	.byte	bytecode_poke_ix_ir1
	.byte	bytecode_FLTVAR_A

	; F(T)=PEEK(P(A(T),B(T)+1))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_F

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_add_ir2_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ip_ir1

	; N(T)=Q

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_N

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_Q

	.byte	bytecode_ld_ip_ir1

	; GOTO 22

	.byte	bytecode_goto_ix
	.word	LINE_22

LINE_39

	; A=P(A(T),B(T))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; POKE A,D(M,T)

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_M

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval2_ir1_ix
	.byte	bytecode_INTARR_D

	.byte	bytecode_poke_ix_ir1
	.byte	bytecode_FLTVAR_A

	; F(T)=144

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_F

	.byte	bytecode_ld_ip_pb
	.byte	144

	; GOTO 22

	.byte	bytecode_goto_ix
	.word	LINE_22

LINE_40

	; PRINT @0, "YOU GOT CAUGHT!";

	.byte	bytecode_prat_pb
	.byte	0

	.byte	bytecode_pr_ss
	.text	15, "YOU GOT CAUGHT!"

	; Z=65000

	.byte	bytecode_ld_ix_pw
	.byte	bytecode_INTVAR_Z
	.word	65000

	; C=F

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_F

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_C

	; S=999

	.byte	bytecode_ld_ix_pw
	.byte	bytecode_INTVAR_S
	.word	999

	; RETURN

	.byte	bytecode_return

LINE_41

	; GOSUB 35

	.byte	bytecode_gosub_ix
	.word	LINE_35

	; GOSUB 40

	.byte	bytecode_gosub_ix
	.word	LINE_40

	; RETURN

	.byte	bytecode_return

LINE_42

	; GOSUB 9

	.byte	bytecode_gosub_ix
	.word	LINE_9

	; GOSUB 40

	.byte	bytecode_gosub_ix
	.word	LINE_40

	; RETURN

	.byte	bytecode_return

LINE_43

	; IF UTHENO THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_U

	.byte	bytecode_ldne_ir1_ir1_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_44

	; RETURN

	.byte	bytecode_return

LINE_44

	; U+=1

	.byte	bytecode_add_ix_ix_pb
	.byte	bytecode_INTVAR_U
	.byte	1

	; ON U GOTO 45,45,45,45,45,45,45,45,45,45,45,45,45,45,45

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_U

	.byte	bytecode_ongoto_ir1_is
	.byte	15
	.word	LINE_45, LINE_45, LINE_45, LINE_45, LINE_45, LINE_45, LINE_45, LINE_45, LINE_45, LINE_45, LINE_45, LINE_45, LINE_45, LINE_45, LINE_45

	; U=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_U
	.byte	1

LINE_45

	; ON I(U) GOTO 2

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_U

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ongoto_ir1_is
	.byte	1
	.word	LINE_2

	; ON K(PEEK(P(H(U),I(U)))) GOTO 82,82,82,82,82,47,47,46,82,82

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_U

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_H

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_U

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ongoto_ir1_is
	.byte	10
	.word	LINE_82, LINE_82, LINE_82, LINE_82, LINE_82, LINE_47, LINE_47, LINE_46, LINE_82, LINE_82

LINE_46

	; A=P(H(U),I(U))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_U

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_H

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_U

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; POKE A,I

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_I

	.byte	bytecode_poke_ix_ir1
	.byte	bytecode_FLTVAR_A

	; I(U)=1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_U

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ip_pb
	.byte	1

	; RETURN

	.byte	bytecode_return

LINE_47

	; FOR J=2 TO F

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_J
	.byte	2

	.byte	bytecode_to_ip_ix
	.byte	bytecode_INTVAR_F

	; WHEN (H(U)ANDA(J)) AND (I(U)=B(J)) GOTO 48

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_U

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_H

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ldne_ir1_ir1_ir2

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_U

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ir3_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_arrval1_ir3_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ldeq_ir2_ir2_ir3

	.byte	bytecode_and_ir1_ir1_ir2

	.byte	bytecode_jmpne_ir1_ix
	.word	LINE_48

	; NEXT

	.byte	bytecode_next

	; GOSUB 40

	.byte	bytecode_gosub_ix
	.word	LINE_40

	; PRINT @0, "BURIED ALIVE!!!";

	.byte	bytecode_prat_pb
	.byte	0

	.byte	bytecode_pr_ss
	.text	15, "BURIED ALIVE!!!"

	; RETURN

	.byte	bytecode_return

LINE_48

	; N(J)=PEEK(P(NX,NY))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_N

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_NX

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_NY

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ip_ir1

	; A(J)=NX

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_NX

	.byte	bytecode_ld_ip_ir1

	; B(J)=NY

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_NY

	.byte	bytecode_ld_ip_ir1

	; POKE P(A(J),B(J)),G2

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_poke_ir1_ix
	.byte	bytecode_INTVAR_G2

	; SOUND 1,5

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_ld_ir2_pb
	.byte	5

	.byte	bytecode_sound_ir1_ir2

	; F(J)=PEEK(P(A(J),B(J)+1))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_F

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_add_ir2_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ip_ir1

	; T(J)=0

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_T

	.byte	bytecode_ld_ip_pb
	.byte	0

	; J=F

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_F

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_J

	; NEXT

	.byte	bytecode_next

	; GOTO 46

	.byte	bytecode_goto_ix
	.word	LINE_46

LINE_49

	; I(O)=B(T)+1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_add_ir1_ir1_pb
	.byte	1

	.byte	bytecode_ld_ip_ir1

	; A=P(H(O),I(O))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_H

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; POKE A,Q

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_Q

	.byte	bytecode_poke_ix_ir1
	.byte	bytecode_FLTVAR_A

	; ON O GOTO 2,2,2,2,2,2,2,2,2,2,2,2,2,2

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_O

	.byte	bytecode_ongoto_ir1_is
	.byte	14
	.word	LINE_2, LINE_2, LINE_2, LINE_2, LINE_2, LINE_2, LINE_2, LINE_2, LINE_2, LINE_2, LINE_2, LINE_2, LINE_2, LINE_2

	; O=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_O
	.byte	0

	; RETURN

	.byte	bytecode_return

LINE_50

	; IF STHEN999 THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_S

	.byte	bytecode_ldne_ir1_ir1_pw
	.word	999

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_51

	; MN-=1

	.byte	bytecode_sub_ix_ix_pb
	.byte	bytecode_INTVAR_MN
	.byte	1

LINE_51

	; PRINT @480, "LIVES=";STR$(MN);" ";

	.byte	bytecode_prat_pw
	.word	480

	.byte	bytecode_pr_ss
	.text	6, "LIVES="

	.byte	bytecode_str_sr1_ix
	.byte	bytecode_INTVAR_MN

	.byte	bytecode_pr_sr1

	.byte	bytecode_pr_ss
	.text	1, " "

	; PRINT @502, "HIT c KEY";

	.byte	bytecode_prat_pw
	.word	502

	.byte	bytecode_pr_ss
	.text	9, "HIT c KEY"

LINE_52

	; I$=INKEY$

	.byte	bytecode_inkey_sr1

	.byte	bytecode_ld_sx_sr1
	.byte	bytecode_STRVAR_I

	; WHEN I$THEN"C" GOTO 52

	.byte	bytecode_ld_sr1_sx
	.byte	bytecode_STRVAR_I

	.byte	bytecode_ldne_ir1_sr1_ss
	.text	1, "C"

	.byte	bytecode_jmpne_ir1_ix
	.word	LINE_52

LINE_53

	; GOTO 900

	.byte	bytecode_goto_ix
	.word	LINE_900

LINE_54

	; PRINT @0, "OOPS!";

	.byte	bytecode_prat_pb
	.byte	0

	.byte	bytecode_pr_ss
	.text	5, "OOPS!"

	; Z=65000

	.byte	bytecode_ld_ix_pw
	.byte	bytecode_INTVAR_Z
	.word	65000

	; C=F

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_F

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_C

	; S=999

	.byte	bytecode_ld_ix_pw
	.byte	bytecode_INTVAR_S
	.word	999

	; GOTO 22

	.byte	bytecode_goto_ix
	.word	LINE_22

LINE_55

	; PRINT @480, "PLAY AGAIN (y/n)?¯¯¯¯¯¯¯¯¯¯¯¯¯¯";

	.byte	bytecode_prat_pw
	.word	480

	.byte	bytecode_pr_ss
	.text	31, "PLAY AGAIN (y/n)?\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF"

LINE_56

	; I$=INKEY$

	.byte	bytecode_inkey_sr1

	.byte	bytecode_ld_sx_sr1
	.byte	bytecode_STRVAR_I

	; WHEN I$THEN"" GOTO 56

	.byte	bytecode_ld_sr1_sx
	.byte	bytecode_STRVAR_I

	.byte	bytecode_ldne_ir1_sr1_ss
	.text	0, ""

	.byte	bytecode_jmpne_ir1_ix
	.word	LINE_56

LINE_57

	; IF I$THEN"Y" THEN

	.byte	bytecode_ld_sr1_sx
	.byte	bytecode_STRVAR_I

	.byte	bytecode_ldne_ir1_sr1_ss
	.text	1, "Y"

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_58

	; LC=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_LC
	.byte	0

	; MN=3

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_MN
	.byte	3

	; S=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_S
	.byte	0

	; LV=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_LV
	.byte	0

	; GOTO 900

	.byte	bytecode_goto_ix
	.word	LINE_900

LINE_58

	; IF I$THEN"N" THEN

	.byte	bytecode_ld_sr1_sx
	.byte	bytecode_STRVAR_I

	.byte	bytecode_ldne_ir1_sr1_ss
	.text	1, "N"

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_59

	; CLS

	.byte	bytecode_cls

	; GOTO 70

	.byte	bytecode_goto_ix
	.word	LINE_70

LINE_59

	; GOTO 56

	.byte	bytecode_goto_ix
	.word	LINE_56

LINE_61

	; GOSUB 9

	.byte	bytecode_gosub_ix
	.word	LINE_9

	; SOUND 193,3

	.byte	bytecode_ld_ir1_pb
	.byte	193

	.byte	bytecode_ld_ir2_pb
	.byte	3

	.byte	bytecode_sound_ir1_ir2

	; SOUND 204,3

	.byte	bytecode_ld_ir1_pb
	.byte	204

	.byte	bytecode_ld_ir2_pb
	.byte	3

	.byte	bytecode_sound_ir1_ir2

	; SOUND 204,3

	.byte	bytecode_ld_ir1_pb
	.byte	204

	.byte	bytecode_ld_ir2_pb
	.byte	3

	.byte	bytecode_sound_ir1_ir2

	; LC+=1

	.byte	bytecode_add_ix_ix_pb
	.byte	bytecode_INTVAR_LC
	.byte	1

	; Z=65000

	.byte	bytecode_ld_ix_pw
	.byte	bytecode_INTVAR_Z
	.word	65000

	; C=F

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_F

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_C

	; S=V

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_V

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_S

	; RETURN

	.byte	bytecode_return

LINE_70

	; PRINT "YOU COMPLETED";STR$(LC*10);"% OF THE"

	.byte	bytecode_pr_ss
	.text	13, "YOU COMPLETED"

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_LC

	.byte	bytecode_mul_ir1_ir1_pb
	.byte	10

	.byte	bytecode_str_sr1_ir1

	.byte	bytecode_pr_sr1

	.byte	bytecode_pr_ss
	.text	9, "% OF THE\r"

	; PRINT "LEVELS OF MC-LODE RUNNER"

	.byte	bytecode_pr_ss
	.text	25, "LEVELS OF MC-LODE RUNNER\r"

	; END

	.byte	bytecode_progend

LINE_80

	; MN=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_MN
	.byte	1

	; GOTO 40

	.byte	bytecode_goto_ix
	.word	LINE_40

LINE_82

	; I(U)=1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_U

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ip_pb
	.byte	1

	; RETURN

	.byte	bytecode_return

LINE_90

	; DIM P(31,15),A(5),B(5),M,P,S,V,C,F,T,A,B,K(255),V(63),F(5),G(8),M(88),X(5),Y(5),D(5,5),N(5),C(5),U(31),T(5),W(2),W2(4)

	.byte	bytecode_ld_ir1_pb
	.byte	31

	.byte	bytecode_ld_ir2_pb
	.byte	15

	.byte	bytecode_arrdim2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ir1_pb
	.byte	255

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ir1_pb
	.byte	63

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_V

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_F

	.byte	bytecode_ld_ir1_pb
	.byte	8

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_G

	.byte	bytecode_ld_ir1_pb
	.byte	88

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_M

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_X

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_Y

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_ld_ir2_pb
	.byte	5

	.byte	bytecode_arrdim2_ir1_ix
	.byte	bytecode_INTARR_D

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_N

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_C

	.byte	bytecode_ld_ir1_pb
	.byte	31

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_U

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_T

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_W

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_W2

LINE_91

	; DIM H(15),I(15),K,G,Q,I,O,D,E,H,J,L,N,U,W,X,Y,Z,LV,LC,NX,NY,NT,G1,G2,MC,I$,A$,MN

	.byte	bytecode_ld_ir1_pb
	.byte	15

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_H

	.byte	bytecode_ld_ir1_pb
	.byte	15

	.byte	bytecode_arrdim1_ir1_ix
	.byte	bytecode_INTARR_I

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

	; GOSUB 800

	.byte	bytecode_gosub_ix
	.word	LINE_800

	; GOTO 50

	.byte	bytecode_goto_ix
	.word	LINE_50

LINE_100

	; CLS

	.byte	bytecode_cls

	; PRINT @2, "mc-lode runner by jim gerrie"

	.byte	bytecode_prat_pb
	.byte	2

	.byte	bytecode_pr_ss
	.text	29, "mc-lode runner by jim gerrie\r"

LINE_110

	; PRINT

	.byte	bytecode_pr_ss
	.text	1, "\r"

LINE_120

	; PRINT "TO MOVE USE:"

	.byte	bytecode_pr_ss
	.text	13, "TO MOVE USE:\r"

LINE_130

	; PRINT "    W           T"

	.byte	bytecode_pr_ss
	.text	18, "    W           T\r"

LINE_140

	; PRINT "  A   S  OR   F G H"

	.byte	bytecode_pr_ss
	.text	20, "  A   S  OR   F G H\r"

LINE_155

	; PRINT "    Z"

	.byte	bytecode_pr_ss
	.text	6, "    Z\r"

LINE_156

	; PRINT "                  TO DIG USE:"

	.byte	bytecode_pr_ss
	.text	30, "                  TO DIG USE:\r"

LINE_160

	; PRINT "                     < >"

	.byte	bytecode_pr_ss
	.text	25, "                     < >\r"

	; PRINT

	.byte	bytecode_pr_ss
	.text	1, "\r"

LINE_180

	; PRINT "AFTER LEVEL IS DISPLAYED PRESS"

	.byte	bytecode_pr_ss
	.text	31, "AFTER LEVEL IS DISPLAYED PRESS\r"

LINE_190

	; PRINT "n TO SKIP TO NEXT LEVEL. GUARDS"

	.byte	bytecode_pr_ss
	.text	32, "n TO SKIP TO NEXT LEVEL. GUARDS\r"

LINE_195

	; PRINT "ONLY GIVE UP ONE GOLD WHEN THEY"

	.byte	bytecode_pr_ss
	.text	32, "ONLY GIVE UP ONE GOLD WHEN THEY\r"

LINE_196

	; PRINT "FALL IN PITS. THERE ARE 10"

	.byte	bytecode_pr_ss
	.text	27, "FALL IN PITS. THERE ARE 10\r"

LINE_197

	; PRINT "LEVELS. HIT enter TO QUIT."

	.byte	bytecode_pr_ss
	.text	27, "LEVELS. HIT enter TO QUIT.\r"

LINE_200

	; RETURN

	.byte	bytecode_return

LINE_800

	; X=RND(-(PEEK(9)*256)-PEEK(10))

	.byte	bytecode_peek_ir1_pb
	.byte	9

	.byte	bytecode_mul_ir1_ir1_pw
	.word	256

	.byte	bytecode_peek_ir2_pb
	.byte	10

	.byte	bytecode_add_ir1_ir1_ir2

	.byte	bytecode_neg_ir1_ir1

	.byte	bytecode_rnd_fr1_ir1

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_X

	; W2(4)=2

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_W2

	.byte	bytecode_ld_ip_pb
	.byte	2

	; W2(2)=4

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_W2

	.byte	bytecode_ld_ip_pb
	.byte	4

	; D=188

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_D
	.byte	188

	; Q=160

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_Q
	.byte	160

LINE_805

	; K(44)=1

	.byte	bytecode_ld_ir1_pb
	.byte	44

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	1

	; K(65)=2

	.byte	bytecode_ld_ir1_pb
	.byte	65

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	2

	; K(87)=3

	.byte	bytecode_ld_ir1_pb
	.byte	87

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	3

	; K(83)=4

	.byte	bytecode_ld_ir1_pb
	.byte	83

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	4

	; K(90)=5

	.byte	bytecode_ld_ir1_pb
	.byte	90

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	5

	; K(46)=6

	.byte	bytecode_ld_ir1_pb
	.byte	46

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	6

	; MC=16384

	.byte	bytecode_ld_ix_pw
	.byte	bytecode_INTVAR_MC
	.word	16384

	; K=17023

	.byte	bytecode_ld_ix_pw
	.byte	bytecode_INTVAR_K
	.word	17023

	; G=128

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_G
	.byte	128

	; H=220

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_H
	.byte	220

	; I=175

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_I
	.byte	175

	; L=16

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_L
	.byte	16

	; N=32

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_N
	.byte	32

	; W(1)=4

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_W

	.byte	bytecode_ld_ip_pb
	.byte	4

	; W(2)=2

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_W

	.byte	bytecode_ld_ip_pb
	.byte	2

LINE_806

	; K(70)=2

	.byte	bytecode_ld_ir1_pb
	.byte	70

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	2

	; K(84)=3

	.byte	bytecode_ld_ir1_pb
	.byte	84

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	3

	; K(72)=4

	.byte	bytecode_ld_ir1_pb
	.byte	72

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	4

	; K(71)=5

	.byte	bytecode_ld_ir1_pb
	.byte	71

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	5

	; K(13)=7

	.byte	bytecode_ld_ir1_pb
	.byte	13

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	7

	; G1=142

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_G1
	.byte	142

	; G2=190

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_G2
	.byte	190

LINE_810

	; M(32)=128

	.byte	bytecode_ld_ir1_pb
	.byte	32

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_M

	.byte	bytecode_ld_ip_pb
	.byte	128

	; M(88)=175

	.byte	bytecode_ld_ir1_pb
	.byte	88

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_M

	.byte	bytecode_ld_ip_pb
	.byte	175

	; M(72)=220

	.byte	bytecode_ld_ir1_pb
	.byte	72

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_M

	.byte	bytecode_ld_ip_pb
	.byte	220

	; M(45)=204

	.byte	bytecode_ld_ir1_pb
	.byte	45

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_M

	.byte	bytecode_ld_ip_pb
	.byte	204

	; M(42)=146

	.byte	bytecode_ld_ir1_pb
	.byte	42

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_M

	.byte	bytecode_ld_ip_pb
	.byte	146

	; M(79)=239

	.byte	bytecode_ld_ir1_pb
	.byte	79

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_M

	.byte	bytecode_ld_ip_pb
	.byte	239

	; FOR T=1 TO 5

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	1

	.byte	bytecode_to_ip_pb
	.byte	5

	; C(T)=W(RND(2))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_C

	.byte	bytecode_irnd_ir1_pb
	.byte	2

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_W

	.byte	bytecode_ld_ip_ir1

	; NEXT

	.byte	bytecode_next

	; K(176)=2

	.byte	bytecode_ld_ir1_pb
	.byte	176

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	2

LINE_815

	; K(204)=1

	.byte	bytecode_ld_ir1_pb
	.byte	204

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	1

	; K(175)=2

	.byte	bytecode_ld_ir1_pb
	.byte	175

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	2

	; K(239)=2

	.byte	bytecode_ld_ir1_pb
	.byte	239

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	2

	; K(146)=3

	.byte	bytecode_ld_ir1_pb
	.byte	146

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	3

	; K(128)=4

	.byte	bytecode_ld_ir1_pb
	.byte	128

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	4

	; K(220)=5

	.byte	bytecode_ld_ir1_pb
	.byte	220

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	5

	; K(142)=6

	.byte	bytecode_ld_ir1_pb
	.byte	142

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	6

	; K(141)=6

	.byte	bytecode_ld_ir1_pb
	.byte	141

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	6

	; K(189)=7

	.byte	bytecode_ld_ir1_pb
	.byte	189

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	7

	; K(190)=7

	.byte	bytecode_ld_ir1_pb
	.byte	190

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	7

	; K(160)=8

	.byte	bytecode_ld_ir1_pb
	.byte	160

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	8

	; K(144)=9

	.byte	bytecode_ld_ir1_pb
	.byte	144

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	9

	; K(240)=10

	.byte	bytecode_ld_ir1_pb
	.byte	240

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_K

	.byte	bytecode_ld_ip_pb
	.byte	10

LINE_820

	; FOR X=0 TO 31

	.byte	bytecode_for_fx_pb
	.byte	bytecode_FLTVAR_X
	.byte	0

	.byte	bytecode_to_fp_pb
	.byte	31

	; FOR Y=0 TO 15

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_Y
	.byte	0

	.byte	bytecode_to_ip_pb
	.byte	15

	; P(X,Y)=(32*Y)+X+MC

	.byte	bytecode_ld_fr1_fx
	.byte	bytecode_FLTVAR_X

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_arrref2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_ir1_pb
	.byte	32

	.byte	bytecode_mul_ir1_ir1_ix
	.byte	bytecode_INTVAR_Y

	.byte	bytecode_add_fr1_ir1_fx
	.byte	bytecode_FLTVAR_X

	.byte	bytecode_add_fr1_fr1_ix
	.byte	bytecode_INTVAR_MC

	.byte	bytecode_ld_fp_fr1

	; NEXT

	.byte	bytecode_next

	; NEXT

	.byte	bytecode_next

LINE_830

	; X(2)=-1

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_X

	.byte	bytecode_ld_ip_nb
	.byte	-1

	; Y(2)=0

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_Y

	.byte	bytecode_ld_ip_pb
	.byte	0

	; D(2,1)=141

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrref2_ir1_ix
	.byte	bytecode_INTARR_D

	.byte	bytecode_ld_ip_pb
	.byte	141

	; FOR T=2 TO 5

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	2

	.byte	bytecode_to_ip_pb
	.byte	5

	; D(2,T)=189

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref2_ir1_ix
	.byte	bytecode_INTARR_D

	.byte	bytecode_ld_ip_pb
	.byte	189

	; NEXT

	.byte	bytecode_next

LINE_831

	; X(3)=0

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_X

	.byte	bytecode_ld_ip_pb
	.byte	0

	; Y(3)=-1

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_Y

	.byte	bytecode_ld_ip_nb
	.byte	-1

	; D(3,1)=141

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrref2_ir1_ix
	.byte	bytecode_INTARR_D

	.byte	bytecode_ld_ip_pb
	.byte	141

	; FOR T=2 TO 5

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	2

	.byte	bytecode_to_ip_pb
	.byte	5

	; D(3,T)=189

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref2_ir1_ix
	.byte	bytecode_INTARR_D

	.byte	bytecode_ld_ip_pb
	.byte	189

	; NEXT

	.byte	bytecode_next

LINE_832

	; X(4)=1

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_X

	.byte	bytecode_ld_ip_pb
	.byte	1

	; Y(4)=0

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_Y

	.byte	bytecode_ld_ip_pb
	.byte	0

	; D(4,1)=142

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrref2_ir1_ix
	.byte	bytecode_INTARR_D

	.byte	bytecode_ld_ip_pb
	.byte	142

	; FOR T=2 TO 5

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	2

	.byte	bytecode_to_ip_pb
	.byte	5

	; D(4,T)=190

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref2_ir1_ix
	.byte	bytecode_INTARR_D

	.byte	bytecode_ld_ip_pb
	.byte	190

	; NEXT

	.byte	bytecode_next

LINE_833

	; X(5)=0

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_X

	.byte	bytecode_ld_ip_pb
	.byte	0

	; Y(5)=1

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_Y

	.byte	bytecode_ld_ip_pb
	.byte	1

	; D(5,1)=142

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrref2_ir1_ix
	.byte	bytecode_INTARR_D

	.byte	bytecode_ld_ip_pb
	.byte	142

	; FOR T=2 TO 5

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	2

	.byte	bytecode_to_ip_pb
	.byte	5

	; D(5,T)=190

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref2_ir1_ix
	.byte	bytecode_INTARR_D

	.byte	bytecode_ld_ip_pb
	.byte	190

	; NEXT

	.byte	bytecode_next

LINE_840

	; FOR T=0 TO 15

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	0

	.byte	bytecode_to_ip_pb
	.byte	15

	; U(T)=5

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_U

	.byte	bytecode_ld_ip_pb
	.byte	5

	; NEXT

	.byte	bytecode_next

	; FOR T=17 TO 31

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	17

	.byte	bytecode_to_ip_pb
	.byte	31

	; U(T)=3

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_U

	.byte	bytecode_ld_ip_pb
	.byte	3

	; NEXT

	.byte	bytecode_next

LINE_845

	; FOR T=0 TO 31

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	0

	.byte	bytecode_to_ip_pb
	.byte	31

	; V(T)=4

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_V

	.byte	bytecode_ld_ip_pb
	.byte	4

	; NEXT

	.byte	bytecode_next

	; FOR T=33 TO 63

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	33

	.byte	bytecode_to_ip_pb
	.byte	63

	; V(T)=2

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_V

	.byte	bytecode_ld_ip_pb
	.byte	2

	; NEXT

	.byte	bytecode_next

LINE_860

	; A$="¯¯¯"

	.byte	bytecode_ld_sr1_ss
	.text	3, "\xAF\xAF\xAF"

	.byte	bytecode_ld_sx_sr1
	.byte	bytecode_STRVAR_A

	; MN=3

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_MN
	.byte	3

	; RETURN

	.byte	bytecode_return

LINE_870

	; SOUND 38,4

	.byte	bytecode_ld_ir1_pb
	.byte	38

	.byte	bytecode_ld_ir2_pb
	.byte	4

	.byte	bytecode_sound_ir1_ir2

	; SOUND 58,4

	.byte	bytecode_ld_ir1_pb
	.byte	58

	.byte	bytecode_ld_ir2_pb
	.byte	4

	.byte	bytecode_sound_ir1_ir2

	; SOUND 78,4

	.byte	bytecode_ld_ir1_pb
	.byte	78

	.byte	bytecode_ld_ir2_pb
	.byte	4

	.byte	bytecode_sound_ir1_ir2

	; SOUND 89,4

	.byte	bytecode_ld_ir1_pb
	.byte	89

	.byte	bytecode_ld_ir2_pb
	.byte	4

	.byte	bytecode_sound_ir1_ir2

	; SOUND 108,4

	.byte	bytecode_ld_ir1_pb
	.byte	108

	.byte	bytecode_ld_ir2_pb
	.byte	4

	.byte	bytecode_sound_ir1_ir2

	; SOUND 125,4

	.byte	bytecode_ld_ir1_pb
	.byte	125

	.byte	bytecode_ld_ir2_pb
	.byte	4

	.byte	bytecode_sound_ir1_ir2

	; SOUND 133,4

	.byte	bytecode_ld_ir1_pb
	.byte	133

	.byte	bytecode_ld_ir2_pb
	.byte	4

	.byte	bytecode_sound_ir1_ir2

	; SOUND 147,4

	.byte	bytecode_ld_ir1_pb
	.byte	147

	.byte	bytecode_ld_ir2_pb
	.byte	4

	.byte	bytecode_sound_ir1_ir2

LINE_880

	; SOUND 159,4

	.byte	bytecode_ld_ir1_pb
	.byte	159

	.byte	bytecode_ld_ir2_pb
	.byte	4

	.byte	bytecode_sound_ir1_ir2

	; SOUND 170,4

	.byte	bytecode_ld_ir1_pb
	.byte	170

	.byte	bytecode_ld_ir2_pb
	.byte	4

	.byte	bytecode_sound_ir1_ir2

	; SOUND 176,4

	.byte	bytecode_ld_ir1_pb
	.byte	176

	.byte	bytecode_ld_ir2_pb
	.byte	4

	.byte	bytecode_sound_ir1_ir2

	; SOUND 185,4

	.byte	bytecode_ld_ir1_pb
	.byte	185

	.byte	bytecode_ld_ir2_pb
	.byte	4

	.byte	bytecode_sound_ir1_ir2

	; RETURN

	.byte	bytecode_return

LINE_900

	; WHEN STHEN999 GOTO 904

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_S

	.byte	bytecode_ldne_ir1_ir1_pw
	.word	999

	.byte	bytecode_jmpne_ir1_ix
	.word	LINE_904

LINE_901

	; LV+=1

	.byte	bytecode_add_ix_ix_pb
	.byte	bytecode_INTVAR_LV
	.byte	1

	; WHEN (LVAND10) AND (LCTHEN10) GOSUB 870

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_LV

	.byte	bytecode_ldne_ir1_ir1_pb
	.byte	10

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_LC

	.byte	bytecode_ldne_ir2_ir2_pb
	.byte	10

	.byte	bytecode_and_ir1_ir1_ir2

	.byte	bytecode_jsrne_ir1_ix
	.word	LINE_870

LINE_902

	; IF LVTHEN11 THEN

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_LV

	.byte	bytecode_ldne_ir1_ir1_pb
	.byte	11

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_904

	; PRINT "GAME OVER."

	.byte	bytecode_pr_ss
	.text	11, "GAME OVER.\r"

	; GOTO 70

	.byte	bytecode_goto_ix
	.word	LINE_70

LINE_904

	; ON MN GOTO 905,905,905

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_MN

	.byte	bytecode_ongoto_ir1_is
	.byte	3
	.word	LINE_905, LINE_905, LINE_905

	; GOTO 55

	.byte	bytecode_goto_ix
	.word	LINE_55

LINE_905

	; CLS 0

	.byte	bytecode_clsn_pb
	.byte	0

	; FOR T=16384 TO 16415

	.byte	bytecode_for_ix_pw
	.byte	bytecode_INTVAR_T
	.word	16384

	.byte	bytecode_to_ip_pw
	.word	16415

	; POKE T,175

	.byte	bytecode_poke_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	175

	; NEXT

	.byte	bytecode_next

	; PRINT @32, "";

	.byte	bytecode_prat_pb
	.byte	32

	.byte	bytecode_pr_ss
	.text	0, ""

	; ON LV GOSUB 1000,1100,1200,1300,1400,1500,1600,1700,1800,1900

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_LV

	.byte	bytecode_ongosub_ir1_is
	.byte	10
	.word	LINE_1000, LINE_1100, LINE_1200, LINE_1300, LINE_1400, LINE_1500, LINE_1600, LINE_1700, LINE_1800, LINE_1900

	; E=V

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_V

	.byte	bytecode_ld_ix_ir1
	.byte	bytecode_INTVAR_E

LINE_910

	; FOR C=16864 TO 16895

	.byte	bytecode_for_ix_pw
	.byte	bytecode_INTVAR_C
	.word	16864

	.byte	bytecode_to_ip_pw
	.word	16895

	; POKE C,175

	.byte	bytecode_poke_ix_pb
	.byte	bytecode_INTVAR_C
	.byte	175

	; NEXT

	.byte	bytecode_next

LINE_930

	; N(1)=128

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_N

	.byte	bytecode_ld_ip_pb
	.byte	128

	; POKE P(A(1),B(1)),141

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_poke_ir1_pb
	.byte	141

	; F(1)=PEEK(P(A(1),B(1)+1))

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_F

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_pb
	.byte	1

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_add_ir2_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ip_ir1

	; G(1)=0

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_G

	.byte	bytecode_ld_ip_pb
	.byte	0

LINE_940

	; F+=1

	.byte	bytecode_add_ix_ix_pb
	.byte	bytecode_INTVAR_F
	.byte	1

	; FOR T=2 TO F

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_T
	.byte	2

	.byte	bytecode_to_ip_ix
	.byte	bytecode_INTVAR_F

	; N(T)=128

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_N

	.byte	bytecode_ld_ip_pb
	.byte	128

	; A=P(A(T),B(T))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_ld_fx_fr1
	.byte	bytecode_FLTVAR_A

	; POKE A,G2

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_G2

	.byte	bytecode_poke_ix_ir1
	.byte	bytecode_FLTVAR_A

	; F(T)=PEEK(P(A(T),B(T)+1))

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_F

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ir2_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrval1_ir2_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_add_ir2_ir2_pb
	.byte	1

	.byte	bytecode_arrval2_ir1_fx
	.byte	bytecode_FLTARR_P

	.byte	bytecode_peek_ir1_ir1

	.byte	bytecode_ld_ip_ir1

	; G(T)=0

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_G

	.byte	bytecode_ld_ip_pb
	.byte	0

	; T(T)=0

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_T

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_T

	.byte	bytecode_ld_ip_pb
	.byte	0

	; NEXT

	.byte	bytecode_next

LINE_950

	; U=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_U
	.byte	0

	; O=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_O
	.byte	0

	; FOR J=0 TO 15

	.byte	bytecode_for_ix_pb
	.byte	bytecode_INTVAR_J
	.byte	0

	.byte	bytecode_to_ip_pb
	.byte	15

	; H(J)=0

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_H

	.byte	bytecode_ld_ip_pb
	.byte	0

	; I(J)=1

	.byte	bytecode_ld_ir1_ix
	.byte	bytecode_INTVAR_J

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_I

	.byte	bytecode_ld_ip_pb
	.byte	1

	; NEXT

	.byte	bytecode_next

LINE_960

	; I$=INKEY$

	.byte	bytecode_inkey_sr1

	.byte	bytecode_ld_sx_sr1
	.byte	bytecode_STRVAR_I

	; WHEN I$THEN"" GOTO 960

	.byte	bytecode_ld_sr1_sx
	.byte	bytecode_STRVAR_I

	.byte	bytecode_ldne_ir1_sr1_ss
	.text	0, ""

	.byte	bytecode_jmpne_ir1_ix
	.word	LINE_960

LINE_970

	; IF I$THEN"N" THEN

	.byte	bytecode_ld_sr1_sx
	.byte	bytecode_STRVAR_I

	.byte	bytecode_ldne_ir1_sr1_ss
	.text	1, "N"

	.byte	bytecode_jmpeq_ir1_ix
	.word	LINE_990

	; S=0

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_S
	.byte	0

	; GOTO 900

	.byte	bytecode_goto_ix
	.word	LINE_900

LINE_990

	; GOTO 20

	.byte	bytecode_goto_ix
	.word	LINE_20

LINE_1000

	; V=8

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_V
	.byte	8

	; PRINT A$;"€€€€’€€€€€€€€€€€€Ü€€€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x92\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1002

	; PRINT A$;"¯¯¯¯¯¯Ü¯¯¯¯¯¯¯€€€Ü€€€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xAF\xAF\xAF\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1003

	; PRINT A$;"€€€€€€ÜÌÌÌÌÌÌÌÌÌÌÜ€€€€’€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\x80\xDC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xDC\x80\x80\x80\x80\x92\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1004

	; PRINT A$;"€€€€€€Ü€€€€¯¯Ü€€€¯¯¯¯¯¯Ü¯¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\xAF\xAF\xDC\x80\x80\x80\xAF\xAF\xAF\xAF\xAF\xAF\xDC\xAF\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1005

	; PRINT A$;"€€€€€€Ü€€€€¯¯Ü€€€€€€€€€Ü€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\xAF\xAF\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1006

	; PRINT A$;"€€€€€€Ü€€€€¯¯Ü€€€€€€€’€Ü€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\xAF\xAF\xDC\x80\x80\x80\x80\x80\x80\x80\x92\x80\xDC\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1007

	; PRINT A$;"¯¯Ü¯¯¯¯€€€€¯¯¯¯¯¯¯¯Ü¯¯¯¯¯¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xDC\xAF\xAF\xAF\xAF\x80\x80\x80\x80\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\xAF\xAF\xAF\xAF\xAF\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1008

	; PRINT A$;"€€Ü€€€€€€€€€€€€€€€€Ü€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1009

	; PRINT A$;"€€Ü€€€€€€€€€€€€€€€€Ü€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1010

	; PRINT A$;"¯¯¯¯¯¯¯¯Ü¯¯¯¯¯¯¯¯¯¯Ü€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1011

	; PRINT A$;"€€€€€€€€Ü€€€€€€€€€€Ü€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1012

	; PRINT A$;"€€€€€€’€ÜÌÌÌÌÌÌÌÌÌÌÜ€€’€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\x80\x92\x80\xDC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xDC\x80\x80\x92\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1013

	; PRINT A$;"€€€€Ü¯¯¯¯¯€€€€€€€€€¯¯¯¯¯¯Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xAF\xAF\x80\x80\x80\x80\x80\x80\x80\x80\x80\xAF\xAF\xAF\xAF\xAF\xAF\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1014

	; PRINT A$;"€€€€Ü€€€€€€€€€€€’€€€€€€€€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x92\x80\x80\x80\x80\x80\x80\x80\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1015

	; W=6

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_W
	.byte	6

	; E(1)=20

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	20

	; E(2)=0

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	0

	; A(1)=16

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	16

	; B(1)=14

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	14

	; F=3

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_F
	.byte	3

	; A(2)=8

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	8

	; B(2)=6

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	6

	; A(3)=25

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	25

	; B(3)=6

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	6

	; A(4)=16

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	16

	; B(4)=9

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	9

	; NX=16

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NX
	.byte	16

	; NY=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NY
	.byte	1

	; RETURN

	.byte	bytecode_return

LINE_1100

	; V=8

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_V
	.byte	8

	; PRINT A$;"€€€’€€€€€€€€€€€€€€€€€€€€€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x92\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1102

	; PRINT A$;"Ü¯¯ï¯¯Ü€€€€€€€€€€’€€€€€€€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\xAF\xAF\xEF\xAF\xAF\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x92\x80\x80\x80\x80\x80\x80\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1103

	; PRINT A$;"Ü€€€€€Ü€€€€Ü¯¯¯¯¯¯¯¯Ü€’€€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x92\x80\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1104

	; PRINT A$;"Ü€’€€€Ü€€€€Ü€€€€€€€€Ü¯¯¯°Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x92\x80\x80\x80\xDC\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xB0\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1105

	; PRINT A$;"Üï¯ï¯ïÜ€€€€Ü€€€€€€€€Ü€€€€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\xEF\xAF\xEF\xAF\xEF\xDC\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1106

	; PRINT A$;"Ü€€€€€ÜÌÌÌÌÜÌÌÌÌÌ€€€Ü€€€€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\xDC\xCC\xCC\xCC\xCC\xDC\xCC\xCC\xCC\xCC\xCC\x80\x80\x80\xDC\x80\x80\x80\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1107

	; PRINT A$;"Ü€€€€€Ü€€€€Ü€€€€Ü¯¯¯ïïïïïÜ";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\xDC\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xEF\xEF\xEF\xEF\xEF\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1108

	; PRINT A$;"Ü€€€€€Ü€€€€Ü€’€€Ü€€€€€€€€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\xDC\x80\x92\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1109

	; PRINT A$;"Ü€€€€€Ü€’€€Ü¯¯¯¯Ü€€€€€€€€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\xDC\x80\x92\x80\x80\xDC\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\x80\x80\x80\x80\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1110

	; PRINT A$;"ï¯¯¯ï¯¯ï¯¯ïÜ€€€€€€€€Ü¯¯Ü¯¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xEF\xAF\xAF\xAF\xEF\xAF\xAF\xEF\xAF\xAF\xEF\xDC\x80\x80\x80\x80\x80\x80\x80\x80\xDC\xAF\xAF\xDC\xAF\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1111

	; PRINT A$;"ï¯¯¯ï€€€€€€Ü€€€€€€€€Ü€€Ü€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xEF\xAF\xAF\xAF\xEF\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\xDC\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1112

	; PRINT A$;"ï’€€ï€€€€€€Ü€€ÌÌÌÌÌÌÜ€€Ü€’";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xEF\x92\x80\x80\xEF\x80\x80\x80\x80\x80\x80\xDC\x80\x80\xCC\xCC\xCC\xCC\xCC\xCC\xDC\x80\x80\xDC\x80\x92"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1113

	; PRINT A$;"ï¯¯¯ï¯¯¯Ü¯¯¯ïïï€€€€€Ü€¯¯¯¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xEF\xAF\xAF\xAF\xEF\xAF\xAF\xAF\xDC\xAF\xAF\xAF\xEF\xEF\xEF\x80\x80\x80\x80\x80\xDC\x80\xAF\xAF\xAF\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1114

	; PRINT A$;"€€€€€€€€Ü€€€€€€€€€€€Ü€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1115

	; W=8

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_W
	.byte	8

	; E(1)=28

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	28

	; E(2)=0

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	0

	; A(1)=15

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	15

	; B(1)=14

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	14

	; F=3

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_F
	.byte	3

	; A(2)=7

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	7

	; B(2)=4

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	4

	; A(3)=22

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	22

	; B(3)=6

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	6

	; A(4)=7

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	7

	; B(4)=9

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	9

	; NX=16

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NX
	.byte	16

	; NY=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NY
	.byte	1

	; RETURN

	.byte	bytecode_return

LINE_1200

	; V=8

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_V
	.byte	8

	; PRINT A$;"ÌÌÌÌÌÌÌÌÌ€€€’€€€€€€€€€€€€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\x80\x80\x80\x92\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1202

	; PRINT A$;"Ü’€€€€€€Ü¯¯¯¯¯¯¯¯¯Ü€€€€€€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x92\x80\x80\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\x80\x80\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1203

	; PRINT A$;"¯¯¯¯Ü€€€Ü€€€€€€€€€Üïïïïïïï";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\xEF\xEF\xEF\xEF\xEF\xEF\xEF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1204

	; PRINT A$;"€€€€Ü€€€Ü€€€€’€€€€Ü€€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\xDC\x80\x80\x80\xDC\x80\x80\x80\x80\x92\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1205

	; PRINT A$;"€€€€Ü¯¯¯¯¯Ü¯¯¯¯¯Ü¯¯€€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xAF\xAF\xDC\xAF\xAF\xAF\xAF\xAF\xDC\xAF\xAF\x80\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1206

	; PRINT A$;"€’€€Ü€€€€€Ü€€€€€Ü€€ÌÌ€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x92\x80\x80\xDC\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\xDC\x80\x80\xCC\xCC\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1207

	; PRINT A$;"¯¯¯Ü¯€€€€€Ü€€€€€Ü€€€€ÌÌ€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xDC\xAF\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\xCC\xCC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1208

	; PRINT A$;"€€€Ü€€€€Ü¯¯¯¯¯Ü¯¯€€€€€€ÌÌ’";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\xDC\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xAF\xAF\xDC\xAF\xAF\x80\x80\x80\x80\x80\x80\xCC\xCC\x92"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1209

	; PRINT A$;"€€€ÜÌÌÌÌÜ€€€€€Ü€€€€€€€€€€¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\xDC\xCC\xCC\xCC\xCC\xDC\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1210

	; PRINT A$;"€€€Ü€€€€€€Ü¯¯¯¯¯¯¯¯¯Ü€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1211

	; PRINT A$;"€€€Ü€€€€€€Ü¯¯¯¯¯¯¯¯¯Ü€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1212

	; PRINT A$;"¯¯Ü¯¯¯¯¯¯¯¯¯€€€’€€€¯¯¯¯¯Ü¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\x80\x80\x80\x92\x80\x80\x80\xAF\xAF\xAF\xAF\xAF\xDC\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1213

	; PRINT A$;"¯¯Ü¯¯¯¯¯¯¯¯¯€Ü¯¯¯Ü€¯¯¯¯¯Ü¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\x80\xDC\xAF\xAF\xAF\xDC\x80\xAF\xAF\xAF\xAF\xAF\xDC\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1214

	; PRINT A$;"€€Ü€€€€€€€€€€Ü¯¯¯Ü€€€€€€Ü€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xDC\x80\x80\x80\x80\x80\x80\xDC\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1215

	; W=6

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_W
	.byte	6

	; E(1)=28

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	28

	; E(2)=0

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	0

	; A(1)=12

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	12

	; B(1)=14

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	14

	; F=3

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_F
	.byte	3

	; A(2)=9

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	9

	; B(2)=4

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	4

	; A(3)=16

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	16

	; B(3)=7

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	7

	; A(4)=20

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	20

	; B(4)=9

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	9

	; NX=16

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NX
	.byte	16

	; NY=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NY
	.byte	1

	; RETURN

	.byte	bytecode_return

LINE_1300

	; V=8

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_V
	.byte	8

	; PRINT A$;"ÜÌÌÌÌÌÌÌÌÌÌ€€€€€€€€€€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1302

	; PRINT A$;"Ü€€€€Ü€€€€€¯€’€¯€€€€€Ü€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\xAF\x80\x92\x80\xAF\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1303

	; PRINT A$;"Ü’€€ÜÜÜ€€’€¯¯¯¯¯€’€€ÜÜÜ€€’";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x92\x80\x80\xDC\xDC\xDC\x80\x80\x92\x80\xAF\xAF\xAF\xAF\xAF\x80\x92\x80\x80\xDC\xDC\xDC\x80\x80\x92"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1304

	; PRINT A$;"€ÜÜ€€Ü€€ÜÜ€€€€€€€ÜÜ€€Ü€€ÜÜ";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\xDC\xDC\x80\x80\xDC\x80\x80\xDC\xDC\x80\x80\x80\x80\x80\x80\x80\xDC\xDC\x80\x80\xDC\x80\x80\xDC\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1305

	; PRINT A$;"€Ü€ÜÜÜÜÜ€Ü€€€€€€€Ü€ÜÜÜÜÜ€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\xDC\x80\xDC\xDC\xDC\xDC\xDC\x80\xDC\x80\x80\x80\x80\x80\x80\x80\xDC\x80\xDC\xDC\xDC\xDC\xDC\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1306

	; PRINT A$;"€Ü€€’€’€€Ü€€€Ü€€€Ü€€’€’€€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\xDC\x80\x80\x92\x80\x92\x80\x80\xDC\x80\x80\x80\xDC\x80\x80\x80\xDC\x80\x80\x92\x80\x92\x80\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1307

	; PRINT A$;"Ü€Ü¯¯¯¯¯Ü€€€ÜÜÜ€€€Ü¯¯¯¯¯Ü€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\xDC\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\xDC\xDC\xDC\x80\x80\x80\xDC\xAF\xAF\xAF\xAF\xAF\xDC\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1308

	; PRINT A$;"Ü€€ÜÜÜÜÜ€ÜÜ€€Ü€€ÜÜ€ÜÜÜÜÜ€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\xDC\xDC\xDC\xDC\xDC\x80\xDC\xDC\x80\x80\xDC\x80\x80\xDC\xDC\x80\xDC\xDC\xDC\xDC\xDC\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1309

	; PRINT A$;"Ü€€€€€€€€Ü€ÜÜÜÜÜ€Ü€€€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\xDC\xDC\xDC\xDC\xDC\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1310

	; PRINT A$;"Ü€€€’€€€€Ü€€’€’€€Ü€€€€’€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x92\x80\x80\x80\x80\xDC\x80\x80\x92\x80\x92\x80\x80\xDC\x80\x80\x80\x80\x92\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1311

	; PRINT A$;"Ü¯¯¯¯¯Ü€€€Ü¯¯¯¯¯Ü€€Ü¯¯¯¯¯¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\xDC\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\xDC\xAF\xAF\xAF\xAF\xAF\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1312

	; PRINT A$;"Ü€€€€€Ü€€€€ÜÜÜÜÜ€€€Ü€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\xDC\xDC\xDC\xDC\xDC\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1313

	; PRINT A$;"Ü€€€€€Ü€€€€€€€€€€€€Ü€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1314

	; PRINT A$;"Ü€€€€€Ü€€€€€€€’€€€€Ü€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x92\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1315

	; W=14

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_W
	.byte	14

	; E(1)=3

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	3

	; E(2)=0

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	0

	; A(1)=20

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	20

	; B(1)=14

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	14

	; F=3

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_F
	.byte	3

	; A(2)=8

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	8

	; B(2)=6

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	6

	; A(3)=24

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	24

	; B(3)=6

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	6

	; A(4)=16

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	16

	; B(4)=10

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	10

	; NX=16

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NX
	.byte	16

	; NY=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NY
	.byte	1

	; RETURN

	.byte	bytecode_return

LINE_1400

	; V=10

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_V
	.byte	10

	; PRINT A$;"€€€€€€€€ÜÌÌÌ€€€€€€’€€€€€Ü€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\x80\x80\x80\xDC\xCC\xCC\xCC\x80\x80\x80\x80\x80\x80\x92\x80\x80\x80\x80\x80\xDC\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1402

	; PRINT A$;"€€€€’€€€Ü€€€¯¯¯¯¯¯¯¯€€€€Ü€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x92\x80\x80\x80\xDC\x80\x80\x80\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\x80\x80\x80\x80\xDC\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1403

	; PRINT A$;"¯¯¯¯¯¯¯¯¯¯Ü€€€€€€€€’€€€€Ü€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x92\x80\x80\x80\x80\xDC\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1404

	; PRINT A$;"€€€€€€€€€€Ü¯¯¯¯¯¯Ü¯¯¯¯Ü¯¯€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xDC\xAF\xAF\xAF\xAF\xDC\xAF\xAF\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1405

	; PRINT A$;"€€€€€€€€€€Ü€€€€€€Ü€€€€Ü€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\xDC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1406

	; PRINT A$;"¯¯¯¯¯¯¯¯¯¯Ü€€€€€€Ü€€€€Ü€€’";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\xDC\x80\x80\x92"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1407

	; PRINT A$;"¯¯¯¯¯¯¯¯¯¯Ü¯¯¯¯¯¯¯ïï€€Ü¯¯¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xEF\xEF\x80\x80\xDC\xAF\xAF\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1408

	; PRINT A$;"¯¯¯¯¯¯¯¯¯¯Ü€€€€€€€€€€€Ü€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1409

	; PRINT A$;"¯¯¯¯¯¯¯¯¯¯Ü€€€€€€’€ÌÌÌÜ€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\x80\x80\x80\x92\x80\xCC\xCC\xCC\xDC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1410

	; PRINT A$;"¯¯€€€€€€¯¯Ü€€€€€€¯¯€€€Ü€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\x80\x80\x80\x80\x80\x80\xAF\xAF\xDC\x80\x80\x80\x80\x80\x80\xAF\xAF\x80\x80\x80\xDC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1411

	; PRINT A$;"¯¯€€’’€€¯¯Ü€€€€’€€€€€€Ü€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\x80\x80\x92\x92\x80\x80\xAF\xAF\xDC\x80\x80\x80\x80\x92\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1412

	; PRINT A$;"¯¯¯¯¯¯¯¯¯¯¯Ü¯¯¯¯¯¯Ü€€€Ü€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\xDC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1413

	; PRINT A$;"€€€€€€€€€€€Ü€€€€€€¯¯¯¯¯¯¯Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1414

	; PRINT A$;"€€€€’€€€€€€Ü€€€€€€€€€€€€€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x92\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1415

	; W=9

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_W
	.byte	9

	; E(1)=27

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	27

	; E(2)=0

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	0

	; A(1)=12

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	12

	; B(1)=14

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	14

	; F=2

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_F
	.byte	2

	; A(2)=3

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	3

	; B(2)=5

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	5

	; A(3)=21

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	21

	; B(3)=6

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	6

	; NX=16

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NX
	.byte	16

	; NY=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NY
	.byte	1

	; RETURN

	.byte	bytecode_return

LINE_1500

	; V=6

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_V
	.byte	6

	; PRINT A$;"€€€€€€€€€Ü€€€€€€€’€€€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x92\x80\x80\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1502

	; PRINT A$;"¯¯¯€€€€€€Ü€€€€€€¯¯¯Ü¯¯¯¯¯¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\xAF\xAF\xAF\xDC\xAF\xAF\xAF\xAF\xAF\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1503

	; PRINT A$;"€€€¯€€€€€Ü€€€€€¯¯€€Ü€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\xAF\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\xAF\xAF\x80\x80\xDC\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1504

	; PRINT A$;"€€€¯¯€€€€Ü€€€€¯¯€€€Ü€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\xAF\xAF\x80\x80\x80\x80\xDC\x80\x80\x80\x80\xAF\xAF\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1505

	; PRINT A$;"’€€¯¯¯€€€Ü€€’¯¯¯€€€Ü€€€’€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x92\x80\x80\xAF\xAF\xAF\x80\x80\x80\xDC\x80\x80\x92\xAF\xAF\xAF\x80\x80\x80\xDC\x80\x80\x80\x92\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1506

	; PRINT A$;"¯¯Ü¯¯¯¯€€Ü€€¯¯¯¯Ü¯¯Ü¯¯¯¯¯¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xDC\xAF\xAF\xAF\xAF\x80\x80\xDC\x80\x80\xAF\xAF\xAF\xAF\xDC\xAF\xAF\xDC\xAF\xAF\xAF\xAF\xAF\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1507

	; PRINT A$;"€€Ü€€€¯¯€Ü€¯¯€€€Ü€€€€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\xDC\x80\x80\x80\xAF\xAF\x80\xDC\x80\xAF\xAF\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1508

	; PRINT A$;"€€Ü’€€€¯¯Ü¯¯€€€€Ü€€€€’€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\xDC\x92\x80\x80\x80\xAF\xAF\xDC\xAF\xAF\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x92\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1509

	; PRINT A$;"Ü¯¯¯Ü€€€€Ü€€€€€¯Ü¯Ü¯¯¯€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\xAF\xAF\xAF\xDC\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\xAF\xDC\xAF\xDC\xAF\xAF\xAF\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1510

	; PRINT A$;"Ü€€€Ü€€€€€€€€€€€€€Ü€€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1511

	; PRINT A$;"Ü€€€Ü€€€€’€€€€€€€€Ü€€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\xDC\x80\x80\x80\x80\x92\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1512

	; PRINT A$;"Ü€€€Ü¯¯¯¯¯¯¯Ü¯¯¯¯¯Ü¯¯¯¯Ü¯¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\xAF\xAF\xAF\xAF\xAF\xDC\xAF\xAF\xAF\xAF\xDC\xAF\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1513

	; PRINT A$;"Ü€€€€€€€€€€€Ü€€€€€€€€€€Ü€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1514

	; PRINT A$;"Ü€€€€€€€€€€€Ü€€€€€€€€€€Ü€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1515

	; W=7

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_W
	.byte	7

	; E(1)=12

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	12

	; E(2)=0

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	0

	; A(1)=18

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	18

	; B(1)=14

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	14

	; F=4

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_F
	.byte	4

	; A(2)=26

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	26

	; B(2)=1

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	1

	; A(3)=4

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	4

	; B(3)=5

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	5

	; A(4)=7

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	7

	; B(4)=8

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	8

	; A(5)=18

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	18

	; B(5)=11

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	11

	; NX=16

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NX
	.byte	16

	; NY=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NY
	.byte	1

	; RETURN

	.byte	bytecode_return

LINE_1600

	; V=6

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_V
	.byte	6

	; PRINT A$;"€Ü€€€€€€€€€€€€€€€€ÌÌÌÌÌÌÌÌ";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1602

	; PRINT A$;"€Ü€€€€€€€€€€€€€€€€Ü€€€€€€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1603

	; PRINT A$;"¯¯¯¯Ü¯€€€¯Ü¯¯¯€€€€Ü€€€€’€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xAF\xDC\xAF\x80\x80\x80\xAF\xDC\xAF\xAF\xAF\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x92\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1604

	; PRINT A$;"€€€€Ü€€€€€Ü€€€€¯¯¯Ü¯¯¯¯¯¯¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\xAF\xAF\xAF\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1605

	; PRINT A$;"€€€€Ü€€’€€Ü€€€€€€€Ü€€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\xDC\x80\x80\x92\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1606

	; PRINT A$;"¯¯¯¯Ü¯¯¯€€Ü€€€€€€€Ü€€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xAF\xDC\xAF\xAF\xAF\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1607

	; PRINT A$;"€€€€Ü€€€€€Ü€€€€€€€Ü€€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1608

	; PRINT A$;"€’€€Ü€€’€€Ü€€€€€€€Ü€€€€€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x92\x80\x80\xDC\x80\x80\x92\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1609

	; PRINT A$;"¯Ü¯¯¯¯¯¯¯¯¯¯¯Ü€€€€Ü€¯¯¯¯€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\x80\xDC\x80\xAF\xAF\xAF\xAF\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1610

	; PRINT A$;"€Ü€€€€€€€€€€€Ü€’€€Ü€¯¯¯¯€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x92\x80\x80\xDC\x80\xAF\xAF\xAF\xAF\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1611

	; PRINT A$;"€Ü€€’€€€€€€€€ÜÌÌÌÌÜ€¯€’¯€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\xDC\x80\x80\x92\x80\x80\x80\x80\x80\x80\x80\x80\xDC\xCC\xCC\xCC\xCC\xDC\x80\xAF\x80\x92\xAF\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1612

	; PRINT A$;"¯¯¯¯¯¯Ü€€€€€€€€€€€Ü€¯¯¯¯¯Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\xAF\xAF\xAF\xAF\xAF\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1613

	; PRINT A$;"€€€€€€Ü€€€€€€€€€€€Ü€€€€€€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1614

	; PRINT A$;"€€€€€€Ü€€€€€€€€€’€Ü€€€€€€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x92\x80\xDC\x80\x80\x80\x80\x80\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1615

	; W=8

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_W
	.byte	8

	; E(1)=4

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	4

	; E(2)=0

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	0

	; A(1)=11

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	11

	; B(1)=14

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	14

	; F=4

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_F
	.byte	4

	; A(2)=14

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	14

	; B(2)=2

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	2

	; A(3)=20

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	20

	; B(3)=3

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	3

	; A(4)=4

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	4

	; B(4)=5

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	5

	; A(5)=24

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	24

	; B(5)=14

	.byte	bytecode_ld_ir1_pb
	.byte	5

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	14

	; NX=16

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NX
	.byte	16

	; NY=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NY
	.byte	1

	; RETURN

	.byte	bytecode_return

LINE_1700

	; V=8

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_V
	.byte	8

	; PRINT A$;"€€€€€€’€€€€’€€€€€€€€€€Ü€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\x80\x92\x80\x80\x80\x80\x92\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1702

	; PRINT A$;"Ü¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯Ü€€€€€Ü€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\x80\x80\xDC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1703

	; PRINT A$;"Ü€€€€€€€€€€€€’€€ÜÌÌÌÌÌÜ€€’";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x92\x80\x80\xDC\xCC\xCC\xCC\xCC\xCC\xDC\x80\x80\x92"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1704

	; PRINT A$;"¯¯¯¯¯¯¯¯¯Ü¯¯¯¯¯¯¯€€€€€Ü¯¯¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\x80\x80\x80\x80\x80\xDC\xAF\xAF\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1705

	; PRINT A$;"¯¯¯¯¯¯¯¯ÜÜ€€€€€€€€€€€€Ü€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1706

	; PRINT A$;"¯¯¯¯¯¯¯ÜÜÌÌÌÌÌÌÜ€€€€€€Ü€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\xDC\xCC\xCC\xCC\xCC\xCC\xCC\xDC\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1707

	; PRINT A$;"¯’€’¯¯ÜÜ€€€€€€€Ü€’€€€€Ü€€’";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\x92\x80\x92\xAF\xAF\xDC\xDC\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x92\x80\x80\x80\x80\xDC\x80\x80\x92"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1708

	; PRINT A$;"¯¯¯¯¯ÜÜ€€€€Ü¯¯¯¯ïï¯¯¯¯Ü¯¯¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xAF\xAF\xAF\xAF\xAF\xDC\xDC\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xAF\xEF\xEF\xAF\xAF\xAF\xAF\xDC\xAF\xAF\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1709

	; PRINT A$;"€€€€€Ü€€€€€Ü€€€€€€€€€€Ü€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1710

	; PRINT A$;"€€€€€Ü€€€’€ÜÌÌÌÌÌÌÌÌÌÌÜ€€’";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x92\x80\xDC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xCC\xDC\x80\x80\x92"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1711

	; PRINT A$;"Ü¯¯¯¯¯¯¯¯¯¯Ü€€’€€€€’€€Ü¯¯¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x92\x80\x80\x80\x80\x92\x80\x80\xDC\xAF\xAF\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1712

	; PRINT A$;"Ü€€€€€€€€€€Ü€¯¯¯¯¯¯¯¯€Ü€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\x80\xDC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1713

	; PRINT A$;"Ü€€€€€€€€€€Ü€€€€€€€€€€Ü€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1714

	; PRINT A$;"Ü€€€€€€’€€€Ü€€€€€€’€€€Ü€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\x80\x92\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x92\x80\x80\x80\xDC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1715

	; W=14

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_W
	.byte	14

	; E(1)=25

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	25

	; E(2)=0

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	0

	; A(1)=19

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	19

	; B(1)=14

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	14

	; F=3

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_F
	.byte	3

	; A(2)=16

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	16

	; B(2)=7

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	7

	; A(3)=23

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	23

	; B(3)=7

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	7

	; A(4)=7

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	7

	; B(4)=10

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	10

	; NX=16

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NX
	.byte	16

	; NY=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NY
	.byte	1

	; RETURN

	.byte	bytecode_return

LINE_1800

	; V=8

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_V
	.byte	8

	; PRINT A$;"€€€€€€€€€€€€€€€€€€€€€€€€Ü€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1802

	; PRINT A$;"Ü¯¯¯¯¯¯¯¯¯¯Ü€€€€€’€€€’€€Ü€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\x80\x80\x92\x80\x80\x80\x92\x80\x80\xDC\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1803

	; PRINT A$;"Ü€€€€€€€€€€Ü¯¯¯¯¯Ü€€¯¯Ü¯¯¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\xAF\xAF\xDC\xAF\xAF\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1804

	; PRINT A$;"Ü€’€€€€€€’€Ü€€€€ïÜ€€€€Ü€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x92\x80\x80\x80\x80\x80\x80\x92\x80\xDC\x80\x80\x80\x80\xEF\xDC\x80\x80\x80\x80\xDC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1805

	; PRINT A$;"Ü€¯€€¯¯¯€¯€Ü€’’€ïÜ€€€€Ü€€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\xAF\x80\x80\xAF\xAF\xAF\x80\xAF\x80\xDC\x80\x92\x92\x80\xEF\xDC\x80\x80\x80\x80\xDC\x80\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1806

	; PRINT A$;"Ü€¯€¯¯¯€€¯€Ü€ïï€ï¯¯¯¯¯¯¯¯ï";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\xAF\x80\xAF\xAF\xAF\x80\x80\xAF\x80\xDC\x80\xEF\xEF\x80\xEF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xEF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1807

	; PRINT A$;"Ü€¯€€¯¯¯€¯€Ü€ïï€€€€€€€€€ï’";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\xAF\x80\x80\xAF\xAF\xAF\x80\xAF\x80\xDC\x80\xEF\xEF\x80\x80\x80\x80\x80\x80\x80\x80\x80\xEF\x92"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1808

	; PRINT A$;"Ü€¯€¯¯¯€€¯€Ü€ïÌÌÌÌÌÌ€’€€ïÜ";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\xAF\x80\xAF\xAF\xAF\x80\x80\xAF\x80\xDC\x80\xEF\xCC\xCC\xCC\xCC\xCC\xCC\x80\x92\x80\x80\xEF\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1809

	; PRINT A$;"Ü€¯’€¯¯¯€¯€Ü€ï’€€€€€¯¯¯ÜïÜ";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\xAF\x92\x80\xAF\xAF\xAF\x80\xAF\x80\xDC\x80\xEF\x92\x80\x80\x80\x80\x80\xAF\xAF\xAF\xDC\xEF\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1810

	; PRINT A$;"Ü€¯¯¯¯¯€€¯€Ü€ïï€€€€€€€€Ü€Ü";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\xAF\xAF\xAF\xAF\xAF\x80\x80\xAF\x80\xDC\x80\xEF\xEF\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\xDC"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1811

	; PRINT A$;"Ü€¯¯¯¯¯¯¯¯€Ü€ïï€€€’€€€€Ü¯¯";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\x80\xDC\x80\xEF\xEF\x80\x80\x80\x92\x80\x80\x80\x80\xDC\xAF\xAF"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1812

	; PRINT A$;"Ü€€€€€€€€€€Ü€ïï€¯¯¯¯€€€Ü€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\xEF\xEF\x80\xAF\xAF\xAF\xAF\x80\x80\x80\xDC\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1813

	; PRINT A$;"Üïïïïïïïï¯ïïïïï€€€€€€€€Ü€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xAF\xEF\xEF\xEF\xEF\xEF\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1814

	; PRINT A$;"Ü€€€€€€€€€€€€€€€€€€€€€€Ü€€";A$;

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

	.byte	bytecode_pr_ss
	.text	26, "\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80"

	.byte	bytecode_pr_sx
	.byte	bytecode_STRVAR_A

LINE_1815

	; W=11

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_W
	.byte	11

	; E(1)=27

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	27

	; E(2)=0

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	0

	; A(1)=17

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	17

	; B(1)=14

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	14

	; F=3

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_F
	.byte	3

	; A(2)=8

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	8

	; B(2)=1

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	1

	; A(3)=17

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	17

	; B(3)=2

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	2

	; A(4)=23

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	23

	; B(4)=5

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	5

	; NX=16

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NX
	.byte	16

	; NY=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NY
	.byte	1

	; RETURN

	.byte	bytecode_return

LINE_1900

	; V=8

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_V
	.byte	8

	; PRINT "¯€€€€€€€€€€€€€€€Ü€€€€€€€€€€€€€€¯";

	.byte	bytecode_pr_ss
	.text	32, "\xAF\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xDC\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\x80\xAF"

LINE_1902

	; PRINT "¯€€€ÌÌÌÌÌ€€€€€€Ü¯Ü€€€€€€ÌÌÌÌÌ€€¯";

	.byte	bytecode_pr_ss
	.text	32, "\xAF\x80\x80\x80\xCC\xCC\xCC\xCC\xCC\x80\x80\x80\x80\x80\x80\xDC\xAF\xDC\x80\x80\x80\x80\x80\x80\xCC\xCC\xCC\xCC\xCC\x80\x80\xAF"

LINE_1903

	; PRINT "¯€€€€€€€ÜÌÌÌÜ¯’Ü¯Ü’¯ÜÌÌÌÜ€€€€€€¯";

	.byte	bytecode_pr_ss
	.text	32, "\xAF\x80\x80\x80\x80\x80\x80\x80\xDC\xCC\xCC\xCC\xDC\xAF\x92\xDC\xAF\xDC\x92\xAF\xDC\xCC\xCC\xCC\xDC\x80\x80\x80\x80\x80\x80\xAF"

LINE_1904

	; PRINT "¯€€€Ü¯’¯Ü€€€Ü¯¯¯¯¯¯¯Ü€€€Ü¯’¯Ü€€¯";

	.byte	bytecode_pr_ss
	.text	32, "\xAF\x80\x80\x80\xDC\xAF\x92\xAF\xDC\x80\x80\x80\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\xDC\xAF\x92\xAF\xDC\x80\x80\xAF"

LINE_1905

	; PRINT "¯€€€Ü¯¯¯€€€€ÜÌÜ¯€¯ÜÌÜ€€€€¯¯¯Ü€€¯";

	.byte	bytecode_pr_ss
	.text	32, "\xAF\x80\x80\x80\xDC\xAF\xAF\xAF\x80\x80\x80\x80\xDC\xCC\xDC\xAF\x80\xAF\xDC\xCC\xDC\x80\x80\x80\x80\xAF\xAF\xAF\xDC\x80\x80\xAF"

LINE_1906

	; PRINT "¯€€€ÜÜ¯€€€€€€€Ü¯¯¯Ü€€€€€€€¯ÜÜ€€¯";

	.byte	bytecode_pr_ss
	.text	32, "\xAF\x80\x80\x80\xDC\xDC\xAF\x80\x80\x80\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xDC\x80\x80\x80\x80\x80\x80\x80\xAF\xDC\xDC\x80\x80\xAF"

LINE_1907

	; PRINT "¯€€€€Ü¯€€€€€€€Ü¯€¯Ü€€€€€€€¯Ü€€€¯";

	.byte	bytecode_pr_ss
	.text	32, "\xAF\x80\x80\x80\x80\xDC\xAF\x80\x80\x80\x80\x80\x80\x80\xDC\xAF\x80\xAF\xDC\x80\x80\x80\x80\x80\x80\x80\xAF\xDC\x80\x80\x80\xAF"

LINE_1908

	; PRINT "¯€€€€Ü¯€€€€€€€Ü¯¯¯Ü€€€€€€€¯Ü€€€¯";

	.byte	bytecode_pr_ss
	.text	32, "\xAF\x80\x80\x80\x80\xDC\xAF\x80\x80\x80\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xDC\x80\x80\x80\x80\x80\x80\x80\xAF\xDC\x80\x80\x80\xAF"

LINE_1909

	; PRINT "¯€€€€Ü¯€€€€€€€Ü¯€¯Ü€€€€€€€¯Ü€€€¯";

	.byte	bytecode_pr_ss
	.text	32, "\xAF\x80\x80\x80\x80\xDC\xAF\x80\x80\x80\x80\x80\x80\x80\xDC\xAF\x80\xAF\xDC\x80\x80\x80\x80\x80\x80\x80\xAF\xDC\x80\x80\x80\xAF"

LINE_1910

	; PRINT "¯€€€€Ü¯€€€€€€€Ü¯¯¯Ü€€€€€€€¯Ü€€€¯";

	.byte	bytecode_pr_ss
	.text	32, "\xAF\x80\x80\x80\x80\xDC\xAF\x80\x80\x80\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xDC\x80\x80\x80\x80\x80\x80\x80\xAF\xDC\x80\x80\x80\xAF"

LINE_1911

	; PRINT "¯€€€€Ü¯€€€€€€€Ü¯€¯Ü€€€€€€€¯Ü€€€¯";

	.byte	bytecode_pr_ss
	.text	32, "\xAF\x80\x80\x80\x80\xDC\xAF\x80\x80\x80\x80\x80\x80\x80\xDC\xAF\x80\xAF\xDC\x80\x80\x80\x80\x80\x80\x80\xAF\xDC\x80\x80\x80\xAF"

LINE_1912

	; PRINT "¯€€€€Ü¯¯¯¯¯¯¯¯Ü¯¯¯Ü¯¯¯¯¯¯¯¯Ü€€€¯";

	.byte	bytecode_pr_ss
	.text	32, "\xAF\x80\x80\x80\x80\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\xAF\xAF\xAF\xDC\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xAF\xDC\x80\x80\x80\xAF"

LINE_1913

	; PRINT "¯€€’€Ü¯€€€’€€¯Ü€’€Ü¯€€’€€€¯Ü’€€¯";

	.byte	bytecode_pr_ss
	.text	32, "\xAF\x80\x80\x92\x80\xDC\xAF\x80\x80\x80\x92\x80\x80\xAF\xDC\x80\x92\x80\xDC\xAF\x80\x80\x92\x80\x80\x80\xAF\xDC\x92\x80\x80\xAF"

LINE_1914

	; PRINT "¯ïïïïïïïïïïïïïïïïïïïïïïïïïïïïïï¯";

	.byte	bytecode_pr_ss
	.text	32, "\xAF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xEF\xAF"

LINE_1915

	; W=9

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_W
	.byte	9

	; E(1)=16

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	16

	; E(2)=0

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_E

	.byte	bytecode_ld_ip_pb
	.byte	0

	; A(1)=20

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	20

	; B(1)=11

	.byte	bytecode_ld_ir1_pb
	.byte	1

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	11

	; F=3

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_F
	.byte	3

	; A(2)=12

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	12

	; B(2)=2

	.byte	bytecode_ld_ir1_pb
	.byte	2

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	2

	; A(3)=20

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	20

	; B(3)=2

	.byte	bytecode_ld_ir1_pb
	.byte	3

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	2

	; A(4)=24

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_A

	.byte	bytecode_ld_ip_pb
	.byte	24

	; B(4)=11

	.byte	bytecode_ld_ir1_pb
	.byte	4

	.byte	bytecode_arrref1_ir1_ix
	.byte	bytecode_INTARR_B

	.byte	bytecode_ld_ip_pb
	.byte	11

	; NX=16

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NX
	.byte	16

	; NY=1

	.byte	bytecode_ld_ix_pb
	.byte	bytecode_INTVAR_NY
	.byte	1

	; RETURN

	.byte	bytecode_return

LINE_9998

LINE_9999

LLAST

	; END

	.byte	bytecode_progend

; Library Catalog
bytecode_add_fr1_fr1_ix	.equ	0
bytecode_add_fr1_ir1_fx	.equ	1
bytecode_add_ip_ip_ir1	.equ	2
bytecode_add_ip_ip_pb	.equ	3
bytecode_add_ir1_ir1_ir2	.equ	4
bytecode_add_ir1_ir1_ix	.equ	5
bytecode_add_ir1_ir1_pb	.equ	6
bytecode_add_ir2_ir2_ir3	.equ	7
bytecode_add_ir2_ir2_pb	.equ	8
bytecode_add_ix_ix_pb	.equ	9
bytecode_and_ir1_ir1_ir2	.equ	10
bytecode_arrdim1_ir1_ix	.equ	11
bytecode_arrdim2_ir1_fx	.equ	12
bytecode_arrdim2_ir1_ix	.equ	13
bytecode_arrref1_ir1_ix	.equ	14
bytecode_arrref2_ir1_fx	.equ	15
bytecode_arrref2_ir1_ix	.equ	16
bytecode_arrval1_ir1_ix	.equ	17
bytecode_arrval1_ir2_ix	.equ	18
bytecode_arrval1_ir3_ix	.equ	19
bytecode_arrval2_ir1_fx	.equ	20
bytecode_arrval2_ir1_ix	.equ	21
bytecode_clear	.equ	22
bytecode_cls	.equ	23
bytecode_clsn_pb	.equ	24
bytecode_for_fx_pb	.equ	25
bytecode_for_ix_pb	.equ	26
bytecode_for_ix_pw	.equ	27
bytecode_gosub_ix	.equ	28
bytecode_goto_ix	.equ	29
bytecode_ignxtra	.equ	30
bytecode_inkey_sr1	.equ	31
bytecode_input	.equ	32
bytecode_irnd_ir1_pb	.equ	33
bytecode_jmpeq_ir1_ix	.equ	34
bytecode_jmpne_ir1_ix	.equ	35
bytecode_jsrne_ir1_ix	.equ	36
bytecode_ld_fp_fr1	.equ	37
bytecode_ld_fr1_fx	.equ	38
bytecode_ld_fx_fr1	.equ	39
bytecode_ld_ip_ir1	.equ	40
bytecode_ld_ip_nb	.equ	41
bytecode_ld_ip_pb	.equ	42
bytecode_ld_ir1_ix	.equ	43
bytecode_ld_ir1_pb	.equ	44
bytecode_ld_ir2_ix	.equ	45
bytecode_ld_ir2_pb	.equ	46
bytecode_ld_ir3_ix	.equ	47
bytecode_ld_ix_ir1	.equ	48
bytecode_ld_ix_pb	.equ	49
bytecode_ld_ix_pw	.equ	50
bytecode_ld_sr1_ss	.equ	51
bytecode_ld_sr1_sx	.equ	52
bytecode_ld_sx_sr1	.equ	53
bytecode_ldeq_ir2_ir2_ir3	.equ	54
bytecode_ldlt_ir1_ir1_ir2	.equ	55
bytecode_ldne_ir1_ir1_ir2	.equ	56
bytecode_ldne_ir1_ir1_ix	.equ	57
bytecode_ldne_ir1_ir1_pb	.equ	58
bytecode_ldne_ir1_ir1_pw	.equ	59
bytecode_ldne_ir1_sr1_ss	.equ	60
bytecode_ldne_ir2_ir2_ix	.equ	61
bytecode_ldne_ir2_ir2_pb	.equ	62
bytecode_mul_ir1_ir1_ix	.equ	63
bytecode_mul_ir1_ir1_pb	.equ	64
bytecode_mul_ir1_ir1_pw	.equ	65
bytecode_neg_ir1_ir1	.equ	66
bytecode_next	.equ	67
bytecode_ongosub_ir1_is	.equ	68
bytecode_ongoto_ir1_is	.equ	69
bytecode_or_ir1_ir1_ir2	.equ	70
bytecode_peek_ir1_ir1	.equ	71
bytecode_peek_ir1_ix	.equ	72
bytecode_peek_ir1_pb	.equ	73
bytecode_peek_ir2_pb	.equ	74
bytecode_poke_ir1_ix	.equ	75
bytecode_poke_ir1_pb	.equ	76
bytecode_poke_ix_ir1	.equ	77
bytecode_poke_ix_pb	.equ	78
bytecode_poke_pw_ir1	.equ	79
bytecode_pr_sr1	.equ	80
bytecode_pr_ss	.equ	81
bytecode_pr_sx	.equ	82
bytecode_prat_pb	.equ	83
bytecode_prat_pw	.equ	84
bytecode_progbegin	.equ	85
bytecode_progend	.equ	86
bytecode_readbuf_fx	.equ	87
bytecode_return	.equ	88
bytecode_rnd_fr1_ir1	.equ	89
bytecode_sound_ir1_ir2	.equ	90
bytecode_str_sr1_ir1	.equ	91
bytecode_str_sr1_ix	.equ	92
bytecode_sub_ip_ip_pb	.equ	93
bytecode_sub_ir1_ir1_ir2	.equ	94
bytecode_sub_ir1_ir1_pb	.equ	95
bytecode_sub_ir2_ir2_pb	.equ	96
bytecode_sub_ix_ix_pb	.equ	97
bytecode_to_fp_pb	.equ	98
bytecode_to_ip_ix	.equ	99
bytecode_to_ip_pb	.equ	100
bytecode_to_ip_pw	.equ	101

catalog
	.word	add_fr1_fr1_ix
	.word	add_fr1_ir1_fx
	.word	add_ip_ip_ir1
	.word	add_ip_ip_pb
	.word	add_ir1_ir1_ir2
	.word	add_ir1_ir1_ix
	.word	add_ir1_ir1_pb
	.word	add_ir2_ir2_ir3
	.word	add_ir2_ir2_pb
	.word	add_ix_ix_pb
	.word	and_ir1_ir1_ir2
	.word	arrdim1_ir1_ix
	.word	arrdim2_ir1_fx
	.word	arrdim2_ir1_ix
	.word	arrref1_ir1_ix
	.word	arrref2_ir1_fx
	.word	arrref2_ir1_ix
	.word	arrval1_ir1_ix
	.word	arrval1_ir2_ix
	.word	arrval1_ir3_ix
	.word	arrval2_ir1_fx
	.word	arrval2_ir1_ix
	.word	clear
	.word	cls
	.word	clsn_pb
	.word	for_fx_pb
	.word	for_ix_pb
	.word	for_ix_pw
	.word	gosub_ix
	.word	goto_ix
	.word	ignxtra
	.word	inkey_sr1
	.word	input
	.word	irnd_ir1_pb
	.word	jmpeq_ir1_ix
	.word	jmpne_ir1_ix
	.word	jsrne_ir1_ix
	.word	ld_fp_fr1
	.word	ld_fr1_fx
	.word	ld_fx_fr1
	.word	ld_ip_ir1
	.word	ld_ip_nb
	.word	ld_ip_pb
	.word	ld_ir1_ix
	.word	ld_ir1_pb
	.word	ld_ir2_ix
	.word	ld_ir2_pb
	.word	ld_ir3_ix
	.word	ld_ix_ir1
	.word	ld_ix_pb
	.word	ld_ix_pw
	.word	ld_sr1_ss
	.word	ld_sr1_sx
	.word	ld_sx_sr1
	.word	ldeq_ir2_ir2_ir3
	.word	ldlt_ir1_ir1_ir2
	.word	ldne_ir1_ir1_ir2
	.word	ldne_ir1_ir1_ix
	.word	ldne_ir1_ir1_pb
	.word	ldne_ir1_ir1_pw
	.word	ldne_ir1_sr1_ss
	.word	ldne_ir2_ir2_ix
	.word	ldne_ir2_ir2_pb
	.word	mul_ir1_ir1_ix
	.word	mul_ir1_ir1_pb
	.word	mul_ir1_ir1_pw
	.word	neg_ir1_ir1
	.word	next
	.word	ongosub_ir1_is
	.word	ongoto_ir1_is
	.word	or_ir1_ir1_ir2
	.word	peek_ir1_ir1
	.word	peek_ir1_ix
	.word	peek_ir1_pb
	.word	peek_ir2_pb
	.word	poke_ir1_ix
	.word	poke_ir1_pb
	.word	poke_ix_ir1
	.word	poke_ix_pb
	.word	poke_pw_ir1
	.word	pr_sr1
	.word	pr_ss
	.word	pr_sx
	.word	prat_pb
	.word	prat_pw
	.word	progbegin
	.word	progend
	.word	readbuf_fx
	.word	return
	.word	rnd_fr1_ir1
	.word	sound_ir1_ir2
	.word	str_sr1_ir1
	.word	str_sr1_ix
	.word	sub_ip_ip_pb
	.word	sub_ir1_ir1_ir2
	.word	sub_ir1_ir1_pb
	.word	sub_ir2_ir2_pb
	.word	sub_ix_ix_pb
	.word	to_fp_pb
	.word	to_ip_ix
	.word	to_ip_pb
	.word	to_ip_pw

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
	clr	tmp4
	tst	0,x
	bpl	_posX
	com	tmp4
	neg	4,x
	ngc	3,x
	ngc	2,x
	ngc	1,x
	ngc	0,x
_posX
	tst	0+argv
	bpl	_posA
	com	tmp4
	neg	4+argv
	ngc	3+argv
	ngc	2+argv
	ngc	1+argv
	ngc	0+argv
divufl
_posA
	ldd	3,x
	std	6,x
	ldd	1,x
	std	4,x
	ldab	0,x
	stab	3,x
	ldd	#0
	std	8,x
	std	1,x
	stab	0,x
	ldaa	#41
	staa	tmp1
_nxtdiv
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
	rol	7,x
	rol	6,x
	rol	5,x
	rol	4,x
	rol	3,x
	rol	2,x
	rol	1,x
	rol	0,x
	dec	tmp1
	bne	_nxtdiv
	tst	tmp4
	bne	_add1
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

	.module	mdinput
inputqqs
	jsr	R_QUEST
inputqs
	jsr	R_QUEST
	jsr	R_SPACE
	jsr	R_GETLN
	ldaa	#','
	staa	,x
_done
	stx	inptptr
	rts
rdinit
	ldx	inptptr
	ldaa	,x
	inx
	cmpa	','
	beq	_skpspc
	jsr	inputqqs
	bra	rdinit
_skpspc
	ldaa	,x
	cmpa	#' '
	bne	_done
	inx
	bra	_skpspc
rdredo
	ldx	inptptr
	bsr	_skpspc
	tsta
	beq	_rts
	cmpa	#','
	beq	_rts
	ldx	#R_REDO
	ldab	#6
	jsr	print
	ldx	redoptr
_rts
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

	.module	mdrefflt
; return flt array reference in D/tmp1
refflt
	lsld
	addd	0,x
	std	tmp1
	rts

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
	jsr	divufl
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
	pulb
	ldaa	tmp4
	inca
	staa	tmp4
	cmpa	#6
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
	.byte	$00,$86,$80
	.byte	$0F,$42,$40

	.module	mdtobc
; push for-loop record on stack
; ENTRY:  ACCB  contains size of record
;         r1    contains stopping variable and is always float.
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

add_fr1_fr1_ix			; numCalls = 1
	.module	modadd_fr1_fr1_ix
	jsr	extend
	ldd	r1+1
	addd	1,x
	std	r1+1
	ldab	r1
	adcb	0,x
	stab	r1
	rts

add_fr1_ir1_fx			; numCalls = 1
	.module	modadd_fr1_ir1_fx
	jsr	extend
	ldd	3,x
	std	r1+3
	ldd	r1+1
	addd	1,x
	std	r1+1
	ldab	r1
	adcb	0,x
	stab	r1
	rts

add_ip_ip_ir1			; numCalls = 2
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

add_ip_ip_pb			; numCalls = 6
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

add_ir1_ir1_ir2			; numCalls = 4
	.module	modadd_ir1_ir1_ir2
	jsr	noargs
	ldd	r1+1
	addd	r2+1
	std	r1+1
	ldab	r1
	adcb	r2
	stab	r1
	rts

add_ir1_ir1_ix			; numCalls = 3
	.module	modadd_ir1_ir1_ix
	jsr	extend
	ldd	r1+1
	addd	1,x
	std	r1+1
	ldab	r1
	adcb	0,x
	stab	r1
	rts

add_ir1_ir1_pb			; numCalls = 4
	.module	modadd_ir1_ir1_pb
	jsr	getbyte
	clra
	addd	r1+1
	std	r1+1
	ldab	#0
	adcb	r1
	stab	r1
	rts

add_ir2_ir2_ir3			; numCalls = 2
	.module	modadd_ir2_ir2_ir3
	jsr	noargs
	ldd	r2+1
	addd	r3+1
	std	r2+1
	ldab	r2
	adcb	r3
	stab	r2
	rts

add_ir2_ir2_pb			; numCalls = 7
	.module	modadd_ir2_ir2_pb
	jsr	getbyte
	clra
	addd	r2+1
	std	r2+1
	ldab	#0
	adcb	r2
	stab	r2
	rts

add_ix_ix_pb			; numCalls = 6
	.module	modadd_ix_ix_pb
	jsr	extbyte
	clra
	addd	1,x
	std	1,x
	ldab	#0
	adcb	0,x
	stab	0,x
	rts

and_ir1_ir1_ir2			; numCalls = 4
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

arrdim1_ir1_ix			; numCalls = 17
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

arrdim2_ir1_fx			; numCalls = 1
	.module	modarrdim2_ir1_fx
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
	lsld
	addd	tmp3
	jmp	alloc

arrdim2_ir1_ix			; numCalls = 1
	.module	modarrdim2_ir1_ix
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

arrref1_ir1_ix			; numCalls = 194
	.module	modarrref1_ir1_ix
	jsr	extend
	ldd	r1+1
	std	0+argv
	ldd	#33
	jsr	ref1
	jsr	refint
	std	letptr
	rts

arrref2_ir1_fx			; numCalls = 1
	.module	modarrref2_ir1_fx
	jsr	extend
	ldd	r1+1
	std	0+argv
	ldd	r1+1+5
	std	2+argv
	jsr	ref2
	jsr	refflt
	std	letptr
	rts

arrref2_ir1_ix			; numCalls = 8
	.module	modarrref2_ir1_ix
	jsr	extend
	ldd	r1+1
	std	0+argv
	ldd	r1+1+5
	std	2+argv
	jsr	ref2
	jsr	refint
	std	letptr
	rts

arrval1_ir1_ix			; numCalls = 76
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

arrval1_ir2_ix			; numCalls = 48
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

arrval1_ir3_ix			; numCalls = 4
	.module	modarrval1_ir3_ix
	jsr	extend
	ldd	r3+1
	std	0+argv
	ldd	#33
	jsr	ref1
	jsr	refint
	ldx	tmp1
	ldab	,x
	stab	r3
	ldd	1,x
	std	r3+1
	rts

arrval2_ir1_fx			; numCalls = 38
	.module	modarrval2_ir1_fx
	jsr	extend
	ldd	r1+1
	std	0+argv
	ldd	r1+1+5
	std	2+argv
	jsr	ref2
	jsr	refflt
	ldx	tmp1
	ldab	,x
	stab	r1
	ldd	1,x
	std	r1+1
	ldd	3,x
	std	r1+3
	rts

arrval2_ir1_ix			; numCalls = 3
	.module	modarrval2_ir1_ix
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

clear			; numCalls = 1
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

for_fx_pb			; numCalls = 1
	.module	modfor_fx_pb
	jsr	extbyte
	stx	letptr
	clra
	staa	0,x
	std	1,x
	clrb
	std	3,x
	rts

for_ix_pb			; numCalls = 18
	.module	modfor_ix_pb
	jsr	extbyte
	stx	letptr
	clra
	staa	0,x
	std	1,x
	rts

for_ix_pw			; numCalls = 2
	.module	modfor_ix_pw
	jsr	extword
	stx	letptr
	clr	0,x
	std	1,x
	rts

gosub_ix			; numCalls = 22
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

goto_ix			; numCalls = 31
	.module	modgoto_ix
	jsr	getaddr
	stx	nxtinst
	rts

ignxtra			; numCalls = 1
	.module	modignxtra
	jsr	noargs
	ldx	inptptr
	ldaa	,x
	beq	_rts
	ldx	#R_EXTRA
	ldab	#15
	jmp	print
_rts
	rts

inkey_sr1			; numCalls = 3
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

input			; numCalls = 1
	.module	modinput
	jsr	noargs
	ldx	curinst
	stx	redoptr
	jmp	inputqs

irnd_ir1_pb			; numCalls = 4
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

jmpeq_ir1_ix			; numCalls = 11
	.module	modjmpeq_ir1_ix
	jsr	getaddr
	ldd	r1+1
	bne	_rts
	ldaa	r1
	bne	_rts
	stx	nxtinst
_rts
	rts

jmpne_ir1_ix			; numCalls = 9
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

ld_fp_fr1			; numCalls = 1
	.module	modld_fp_fr1
	jsr	noargs
	ldx	letptr
	ldd	r1+3
	std	3,x
	ldd	r1+1
	std	1,x
	ldab	r1
	stab	0,x
	rts

ld_fr1_fx			; numCalls = 1
	.module	modld_fr1_fx
	jsr	extend
	ldd	3,x
	std	r1+3
	ldd	1,x
	std	r1+1
	ldab	0,x
	stab	r1
	rts

ld_fx_fr1			; numCalls = 19
	.module	modld_fx_fr1
	jsr	extend
	ldd	r1+3
	std	3,x
	ldd	r1+1
	std	1,x
	ldab	r1
	stab	0,x
	rts

ld_ip_ir1			; numCalls = 18
	.module	modld_ip_ir1
	jsr	noargs
	ldx	letptr
	ldd	r1+1
	std	1,x
	ldab	r1
	stab	0,x
	rts

ld_ip_nb			; numCalls = 2
	.module	modld_ip_nb
	jsr	getbyte
	ldx	letptr
	stab	2,x
	ldd	#-1
	std	0,x
	rts

ld_ip_pb			; numCalls = 172
	.module	modld_ip_pb
	jsr	getbyte
	ldx	letptr
	stab	2,x
	ldd	#0
	std	0,x
	rts

ld_ir1_ix			; numCalls = 151
	.module	modld_ir1_ix
	jsr	extend
	ldd	1,x
	std	r1+1
	ldab	0,x
	stab	r1
	rts

ld_ir1_pb			; numCalls = 206
	.module	modld_ir1_pb
	jsr	getbyte
	stab	r1+2
	ldd	#0
	std	r1
	rts

ld_ir2_ix			; numCalls = 55
	.module	modld_ir2_ix
	jsr	extend
	ldd	1,x
	std	r2+1
	ldab	0,x
	stab	r2
	rts

ld_ir2_pb			; numCalls = 33
	.module	modld_ir2_pb
	jsr	getbyte
	stab	r2+2
	ldd	#0
	std	r2
	rts

ld_ir3_ix			; numCalls = 4
	.module	modld_ir3_ix
	jsr	extend
	ldd	1,x
	std	r3+1
	ldab	0,x
	stab	r3
	rts

ld_ix_ir1			; numCalls = 23
	.module	modld_ix_ir1
	jsr	extend
	ldd	r1+1
	std	1,x
	ldab	r1
	stab	0,x
	rts

ld_ix_pb			; numCalls = 76
	.module	modld_ix_pb
	jsr	extbyte
	stab	2,x
	ldd	#0
	std	0,x
	rts

ld_ix_pw			; numCalls = 7
	.module	modld_ix_pw
	jsr	extword
	std	1,x
	ldab	#0
	stab	0,x
	rts

ld_sr1_ss			; numCalls = 1
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

ld_sr1_sx			; numCalls = 6
	.module	modld_sr1_sx
	jsr	extend
	ldd	1,x
	std	r1+1
	ldab	0,x
	stab	r1
	rts

ld_sx_sr1			; numCalls = 4
	.module	modld_sx_sr1
	jsr	extend
	ldab	r1
	stab	0+argv
	ldd	r1+1
	std	1+argv
	jmp	strprm

ldeq_ir2_ir2_ir3			; numCalls = 2
	.module	modldeq_ir2_ir2_ir3
	jsr	noargs
	ldd	r2+1
	subd	r3+1
	bne	_done
	ldab	r2
	cmpb	r3
_done
	jsr	geteq
	std	r2+1
	stab	r2
	rts

ldlt_ir1_ir1_ir2			; numCalls = 2
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

ldne_ir1_ir1_ir2			; numCalls = 2
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

ldne_ir1_ir1_ix			; numCalls = 7
	.module	modldne_ir1_ir1_ix
	jsr	extend
	ldd	r1+1
	subd	1,x
	bne	_done
	ldab	r1
	cmpb	0,x
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

ldne_ir1_ir1_pw			; numCalls = 2
	.module	modldne_ir1_ir1_pw
	jsr	getword
	subd	r1+1
	bne	_done
	ldab	r1
_done
	jsr	getne
	std	r1+1
	stab	r1
	rts

ldne_ir1_sr1_ss			; numCalls = 6
	.module	modldne_ir1_sr1_ss
	ldab	r1
	stab	tmp1+1
	ldd	r1+1
	std	tmp2
	jsr	streqbs
	jsr	getne
	std	r1+1
	stab	r1
	rts

ldne_ir2_ir2_ix			; numCalls = 2
	.module	modldne_ir2_ir2_ix
	jsr	extend
	ldd	r2+1
	subd	1,x
	bne	_done
	ldab	r2
	cmpb	0,x
_done
	jsr	getne
	std	r2+1
	stab	r2
	rts

ldne_ir2_ir2_pb			; numCalls = 1
	.module	modldne_ir2_ir2_pb
	jsr	getbyte
	cmpb	r2+2
	bne	_done
	ldd	r2
_done
	jsr	getne
	std	r2+1
	stab	r2
	rts

mul_ir1_ir1_ix			; numCalls = 1
	.module	modmul_ir1_ir1_ix
	jsr	extend
	ldab	0,x
	stab	0+argv
	ldd	1,x
	std	1+argv
	ldx	#r1
	jmp	mulintx

mul_ir1_ir1_pb			; numCalls = 1
	.module	modmul_ir1_ir1_pb
	jsr	getbyte
	stab	2+argv
	ldd	#0
	std	0+argv
	ldx	#r1
	jmp	mulintx

mul_ir1_ir1_pw			; numCalls = 1
	.module	modmul_ir1_ir1_pw
	jsr	getword
	std	1+argv
	clrb
	stab	0+argv
	ldx	#r1
	jmp	mulintx

neg_ir1_ir1			; numCalls = 1
	.module	modneg_ir1_ir1
	jsr	noargs
	neg	r1+2
	ngc	r1+1
	ngc	r1
	rts

next			; numCalls = 47
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

ongosub_ir1_is			; numCalls = 4
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

ongoto_ir1_is			; numCalls = 16
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

or_ir1_ir1_ir2			; numCalls = 2
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

peek_ir1_ir1			; numCalls = 16
	.module	modpeek_ir1_ir1
	jsr	noargs
	ldx	r1+1
	cpx	#M_IKEY
	bne	_nostore
	jsr	R_KPOLL
	beq	_nostore
	staa	M_IKEY
_nostore
	ldab	,x
	stab	r1+2
	ldd	#0
	std	r1
	rts

peek_ir1_ix			; numCalls = 1
	.module	modpeek_ir1_ix
	jsr	extend
	ldx	1,x
	cpx	#M_IKEY
	bne	_nostore
	jsr	R_KPOLL
	beq	_nostore
	staa	M_IKEY
_nostore
	ldab	,x
	stab	r1+2
	ldd	#0
	std	r1
	rts

peek_ir1_pb			; numCalls = 1
	.module	modpeek_ir1_pb
	jsr	getbyte
	clra
	std	tmp1
	ldx	tmp1
	ldab	,x
	stab	r1+2
	ldd	#0
	std	r1
	rts

peek_ir2_pb			; numCalls = 2
	.module	modpeek_ir2_pb
	jsr	getbyte
	clra
	std	tmp1
	ldx	tmp1
	ldab	,x
	stab	r2+2
	ldd	#0
	std	r2
	rts

poke_ir1_ix			; numCalls = 3
	.module	modpoke_ir1_ix
	jsr	extend
	ldab	2,x
	ldx	r1+1
	stab	,x
	rts

poke_ir1_pb			; numCalls = 1
	.module	modpoke_ir1_pb
	jsr	getbyte
	ldx	r1+1
	stab	,x
	rts

poke_ix_ir1			; numCalls = 15
	.module	modpoke_ix_ir1
	jsr	extend
	ldab	r1+2
	ldx	1,x
	stab	,x
	rts

poke_ix_pb			; numCalls = 5
	.module	modpoke_ix_pb
	jsr	extbyte
	ldx	1,x
	stab	,x
	rts

poke_pw_ir1			; numCalls = 2
	.module	modpoke_pw_ir1
	jsr	getword
	std	tmp1
	ldab	r1+2
	ldx	tmp1
	stab	,x
	rts

pr_sr1			; numCalls = 2
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

pr_ss			; numCalls = 167
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

pr_sx			; numCalls = 252
	.module	modpr_sx
	jsr	extend
	ldab	0,x
	beq	_rts
	ldx	1,x
	jsr	print
_rts
	rts

prat_pb			; numCalls = 5
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

progend			; numCalls = 2
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
OM_ERROR	.equ	12
BS_ERROR	.equ	16
DD_ERROR	.equ	18
error
	jmp	R_ERROR

readbuf_fx			; numCalls = 1
	.module	modreadbuf_fx
	jsr	extend
	stx	letptr
	jsr	rdinit
	ldab	#128
	jsr	inptval
	stx	inptptr
	ldaa	,x
	ldx	letptr
	ldab	tmp1+1
	stab	0,x
	ldd	tmp2
	std	1,x
	ldd	tmp3
	std	3,x
	jsr	rdredo
	beq	_rts
	stx	nxtinst
_rts
	rts

return			; numCalls = 31
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

rnd_fr1_ir1			; numCalls = 1
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

sound_ir1_ir2			; numCalls = 22
	.module	modsound_ir1_ir2
	jsr	noargs
	ldaa	r1+2
	ldab	r2+2
	jmp	R_SOUND

str_sr1_ir1			; numCalls = 1
	.module	modstr_sr1_ir1
	jsr	noargs
	ldd	r1+1
	std	tmp2
	ldab	r1
	stab	tmp1+1
	ldd	#0
	std	tmp3
	jsr	strflt
	std	r1+1
	ldab	tmp1
	stab	r1
	rts

str_sr1_ix			; numCalls = 1
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

sub_ir1_ir1_ir2			; numCalls = 2
	.module	modsub_ir1_ir1_ir2
	jsr	noargs
	ldd	r1+1
	subd	r2+1
	std	r1+1
	ldab	r1
	sbcb	r2
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

sub_ir2_ir2_pb			; numCalls = 3
	.module	modsub_ir2_ir2_pb
	jsr	getbyte
	stab	tmp1
	ldd	r2+1
	subb	tmp1
	sbca	#0
	std	r2+1
	ldab	r2
	sbcb	#0
	stab	r2
	rts

sub_ix_ix_pb			; numCalls = 1
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

to_fp_pb			; numCalls = 1
	.module	modto_fp_pb
	jsr	getbyte
	stab	r1+2
	ldd	#0
	std	r1
	std	r1+3
	ldab	#15
	jmp	to

to_ip_ix			; numCalls = 5
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

to_ip_pb			; numCalls = 12
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

; data table
startdata
	.byte	60, 54, 55, 150, 246, 129
	.byte	126, 38, 25, 220, 247, 195
	.byte	1, 5, 131, 1, 1, 221
	.byte	252, 206, 67, 113, 236, 1
	.byte	221, 246, 236, 3, 221, 248
	.byte	236, 5, 221, 250, 51, 50
	.byte	56, 57, 240, 129, 58, 37
	.byte	1, 57, 126
enddata

; Bytecode equates


bytecode_INTVAR_B	.equ	INTVAR_B-symstart
bytecode_INTVAR_C	.equ	INTVAR_C-symstart
bytecode_INTVAR_D	.equ	INTVAR_D-symstart
bytecode_INTVAR_E	.equ	INTVAR_E-symstart
bytecode_INTVAR_F	.equ	INTVAR_F-symstart
bytecode_INTVAR_G	.equ	INTVAR_G-symstart
bytecode_INTVAR_G1	.equ	INTVAR_G1-symstart
bytecode_INTVAR_G2	.equ	INTVAR_G2-symstart
bytecode_INTVAR_H	.equ	INTVAR_H-symstart
bytecode_INTVAR_I	.equ	INTVAR_I-symstart
bytecode_INTVAR_J	.equ	INTVAR_J-symstart
bytecode_INTVAR_K	.equ	INTVAR_K-symstart
bytecode_INTVAR_L	.equ	INTVAR_L-symstart
bytecode_INTVAR_LC	.equ	INTVAR_LC-symstart
bytecode_INTVAR_LV	.equ	INTVAR_LV-symstart
bytecode_INTVAR_M	.equ	INTVAR_M-symstart
bytecode_INTVAR_MC	.equ	INTVAR_MC-symstart
bytecode_INTVAR_MN	.equ	INTVAR_MN-symstart
bytecode_INTVAR_N	.equ	INTVAR_N-symstart
bytecode_INTVAR_NT	.equ	INTVAR_NT-symstart
bytecode_INTVAR_NX	.equ	INTVAR_NX-symstart
bytecode_INTVAR_NY	.equ	INTVAR_NY-symstart
bytecode_INTVAR_O	.equ	INTVAR_O-symstart
bytecode_INTVAR_P	.equ	INTVAR_P-symstart
bytecode_INTVAR_Q	.equ	INTVAR_Q-symstart
bytecode_INTVAR_S	.equ	INTVAR_S-symstart
bytecode_INTVAR_T	.equ	INTVAR_T-symstart
bytecode_INTVAR_U	.equ	INTVAR_U-symstart
bytecode_INTVAR_V	.equ	INTVAR_V-symstart
bytecode_INTVAR_W	.equ	INTVAR_W-symstart
bytecode_INTVAR_Y	.equ	INTVAR_Y-symstart
bytecode_INTVAR_Z	.equ	INTVAR_Z-symstart
bytecode_INTVAR_ZZ	.equ	INTVAR_ZZ-symstart
bytecode_FLTVAR_A	.equ	FLTVAR_A-symstart
bytecode_FLTVAR_X	.equ	FLTVAR_X-symstart
bytecode_FLTVAR_Z1	.equ	FLTVAR_Z1-symstart
bytecode_STRVAR_A	.equ	STRVAR_A-symstart
bytecode_STRVAR_I	.equ	STRVAR_I-symstart
bytecode_INTARR_A	.equ	INTARR_A-symstart
bytecode_INTARR_B	.equ	INTARR_B-symstart
bytecode_INTARR_C	.equ	INTARR_C-symstart
bytecode_INTARR_D	.equ	INTARR_D-symstart
bytecode_INTARR_E	.equ	INTARR_E-symstart
bytecode_INTARR_F	.equ	INTARR_F-symstart
bytecode_INTARR_G	.equ	INTARR_G-symstart
bytecode_INTARR_H	.equ	INTARR_H-symstart
bytecode_INTARR_I	.equ	INTARR_I-symstart
bytecode_INTARR_K	.equ	INTARR_K-symstart
bytecode_INTARR_M	.equ	INTARR_M-symstart
bytecode_INTARR_N	.equ	INTARR_N-symstart
bytecode_INTARR_T	.equ	INTARR_T-symstart
bytecode_INTARR_U	.equ	INTARR_U-symstart
bytecode_INTARR_V	.equ	INTARR_V-symstart
bytecode_INTARR_W	.equ	INTARR_W-symstart
bytecode_INTARR_W2	.equ	INTARR_W2-symstart
bytecode_INTARR_X	.equ	INTARR_X-symstart
bytecode_INTARR_Y	.equ	INTARR_Y-symstart
bytecode_FLTARR_P	.equ	FLTARR_P-symstart

symstart

; block started by symbol
bss

; Numeric Variables
INTVAR_B	.block	3
INTVAR_C	.block	3
INTVAR_D	.block	3
INTVAR_E	.block	3
INTVAR_F	.block	3
INTVAR_G	.block	3
INTVAR_G1	.block	3
INTVAR_G2	.block	3
INTVAR_H	.block	3
INTVAR_I	.block	3
INTVAR_J	.block	3
INTVAR_K	.block	3
INTVAR_L	.block	3
INTVAR_LC	.block	3
INTVAR_LV	.block	3
INTVAR_M	.block	3
INTVAR_MC	.block	3
INTVAR_MN	.block	3
INTVAR_N	.block	3
INTVAR_NT	.block	3
INTVAR_NX	.block	3
INTVAR_NY	.block	3
INTVAR_O	.block	3
INTVAR_P	.block	3
INTVAR_Q	.block	3
INTVAR_S	.block	3
INTVAR_T	.block	3
INTVAR_U	.block	3
INTVAR_V	.block	3
INTVAR_W	.block	3
INTVAR_Y	.block	3
INTVAR_Z	.block	3
INTVAR_ZZ	.block	3
FLTVAR_A	.block	5
FLTVAR_X	.block	5
FLTVAR_Z1	.block	5
; String Variables
STRVAR_A	.block	3
STRVAR_I	.block	3
; Numeric Arrays
INTARR_A	.block	4	; dims=1
INTARR_B	.block	4	; dims=1
INTARR_C	.block	4	; dims=1
INTARR_D	.block	6	; dims=2
INTARR_E	.block	4	; dims=1
INTARR_F	.block	4	; dims=1
INTARR_G	.block	4	; dims=1
INTARR_H	.block	4	; dims=1
INTARR_I	.block	4	; dims=1
INTARR_K	.block	4	; dims=1
INTARR_M	.block	4	; dims=1
INTARR_N	.block	4	; dims=1
INTARR_T	.block	4	; dims=1
INTARR_U	.block	4	; dims=1
INTARR_V	.block	4	; dims=1
INTARR_W	.block	4	; dims=1
INTARR_W2	.block	4	; dims=1
INTARR_X	.block	4	; dims=1
INTARR_Y	.block	4	; dims=1
FLTARR_P	.block	6	; dims=2
; String Arrays

; block ended by symbol
bes
	.end
