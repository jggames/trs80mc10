
; THIS PROGRAM PATHCES USURPATOR I 
; CHESS PROGRAM FOR 6800 MICROPROCESSOR
; (C) 1980 H.G.MULLER
; ALLOWING IT TO BE RUN IN 
; SIMH SWTPC 6800 SIMULATOR
;
; Patch by Roberto Sancho-Villa
; https://github.com/rsanchovilla/SimH_cpanel#swtpc-6800
; (mod to $A048 for the HM-68 homemade computer --dhh)

       ORG  $0106
       
       ; SET SWTBUG ROM VECTORS
       
OUPC    JMP  $E1D1	; OUTEEE OUT CHAR TO TTY
NLINE   JMP  PRTCRLF	; PRINT CR & LF
OUPST   JMP  $E07E 	; PDATA1 PRINT STRING IN X-REG
OUPHL   JMP  $E06B	; OUT4L PRINT 4 LOW ORDERED BITS IN A
INPCE   JMP  $E1AC	; INEEE INPUT CHAR WITH ECHO
MONITOR JMP  $E113	; SWTBUG RETURN TO MONITOR
      
	; PATCH MAIN PROGRAM

	ORG $0210

	JSR OUTSQ	; OUT CHAR=BOARD SQUARE
	
	ORG $0121
	
	LDX #MQRY	; PRINT ':' AS QUERY MVT PROMPT
	JSR OUPST	
	NOP
	
	ORG $03B5	; PATCH OUT DISPLAY
	NOP		; ON 7-SEGMENT LED 
	NOP
	NOP
	ORG $03BA
	NOP
	NOP
	NOP
	
	ORG $06C0
	
	; ASCII CHAR THAT REPRESENT EACH PIECE CODE IN A SQUARE
	; 0=FREE, 1=PAWN, 2=HORSE, 3=BISHOP (ALFIL), 4=ROOK (TORRE) 5=QUEEN, 6=KING (BLACK)
	;         8=PAWN, 10=KNIGHT (CABALLO), 11=BISHOP (ALFIL), 12=ROOK (TORRE) 13=QUEEN, 14=KING (WHITE)
	
	FCC '-'		; 0=FREE BLACK SQUARE 
	FCC 'P'		; 1=BLACK PAWN 
	FCC 'N'		; 2=      KNIGHT (CABALLO)
	FCC 'B'		; 3=      BISHOP (ALFIL)
	FCC 'R'		; 4=      ROOK (TORRE) 
	FCC 'Q'		; 5=      QUEEN, 
	FCC 'K'		; 6=      KING (BLACK)
	FCC '?'
	FCC 'p'		; 8=WHITE PAWN 
	FCC '?'
	FCC 'n'		; 10=     KNIGHT (CABALLO)
	FCC 'b'		; 11=     BISHOP (ALFIL)
	FCC 'r'		; 12=     ROOK (TORRE) 
	FCC 'q'		; 13=     QUEEN
	FCC 'k'		; 14=     KING (WHITE)
	

	; NEW ROUTINES FOR SWTPC 6800
	
	ORG $4000
	
PRTCRLF LDX #MCRLF	; PRINT CR & LF
	JMP OUPST	
MCRLF	FCB 13,10,4	
MQRY	FCC ':'
	FCB 4

OUTSQ	CMPA #$A3	; IS=WHITE FREE SQUARE?
	BEQ WHISQA	; BR BECAUSE IS A FREE BLACK SQUARE
	ANDA #$7F	; REMOVE BIT 7
	JMP OUPC	; PRINT THE CHAR FOR THE PIECE IN THE SQUARE
WHISQA  LDAA #' '	; FREE WHITE SQUARE
	JMP OUPC	
	
	ORG $7F48 	; SET START ADDRESS FOR "G" COMMAND
	FDB $0100	; (in the HM-68, at least --dhh)
	