 5 PAGE: PRINT "ESC:SEITE/CURSOR": PRINT "CTRL:UP": PRINT "REPEAT:DOWN"
 6  PRINT "SCHIFT:RECHTS LINKS": PRINT "LINE FEED:SEITENWECHSEL"
 7  PRINT "RETURN:SONDER": PRINT "       0:SETZEN/LOESCHEN"
 8  PRINT "       1-8 ZEICHEN,PROG": PRINT "       9:LADEN/SPEICHERN"
 10  POKE 134,31: CLEAR :SET30000: POKE 251,0: POKE 61440,17
 15  DEF  FN FR(R)=R- INT (R)
 20  FOR R=576  TO 692: READ P: POKE R,P: NEXT 
 25  FOR R=7936 TO 8071: READ P: POKE R,P: NEXT 
 30  POKE 58,80:CALL647,0: POKE 58,32:CALL647,0
 45 RA(7)=2:RA(6)=1:RA(1)=7:RA(2)=6
 47 SC(7)=1:SC(6)=2:SC(1)=6:SC(2)=7
 50  GOSUB 9000:PAGE:AD=53281:C=0
 60  POKE 63,0: POKE 61,0: POKE 62,0
 65  POKE 61440,81:CLG1:X=64:Y=32:S=1:QZ=32:CALL8060,0
 70  IF C=1 THEN  1010
 75 A=CALL7936,0
 80  ON A GOTO 200,150,70,70,700,250,300
 150 Y=Y-1: IF Y<1 THEN Y=1: GOTO 500
 160  GOTO 500
 200 Y=Y+1: IF Y>62 THEN Y=62: GOTO 500
 210  GOTO 500
 250 X=X-1: IF X<1 THEN X=1: GOTO 500
 260  GOTO 500
 300 X=X+1: IF X>126 THEN X=126: GOTO 500
 310  GOTO 500
 500  IF QZ<10 THEN  RETURN 
 505 X0= PEEK (61)+X/4:Y0= PEEK (63)+Y/2: POKE AD,B
 510 AD=53248+X/4+32* INT (Y/2)
 520 DA=(1+30* FN FR(Y/2))*2 ^ (4* FN FR(X/4))
 525 AG= PEEK (58)*256+ INT (X0)+64* INT (Y0)
 530 D0= PEEK (AD):D1=D0 OR DA:D2=256+ NOT (D0 AND DA):B=D0:D0=D1 AND D2
 535 DG= PEEK (AG):D1=DG OR DA:D2=256+ NOT (DG AND DA):DG=D1 AND D2
 540  IF S=0 THEN 550
 545 B=D0: POKE AD,D0: POKE AG,DG
 546  IF C=0 THEN 70
 547 DG= PEEK (AG+12288)
 548 D1=DG OR DA:D2=256+ NOT (DG AND DA):DG=D1 AND D2: POKE AG+12288,DG: GOTO 70
 550  POKE AD,D1: GOTO 70
 700 A$= CHR$ (CALL64768,0)
 710 SV=1:SP=1:A= VAL (A$): IF A=0 THEN S= ABS (S-1): GOTO 500
 720 SZ=S:S=0:C=1: ON A GOTO 730,760,790,820,900,920,850,800,980
 730 SET1900:M=7: GOTO 1000
 760 SET1910:M=6: GOTO 1000
 790 SET1920:M=1: GOTO 1000
 800 A=CALL7936,0:C=0:QZ=1: GOSUB 80:A=SC(A)
 810 QZ=32:S=SZ: GOTO 80
 820 SET1930:M=2: GOTO 1000
 850 SET1940:SZ=0:SP=0:SV=0
 860 A$= CHR$ (CALL64768,0): IF A$="K" THEN SET1960
 865  GOTO 1005
 900 P=20: GOTO 930
 920 P=38
 930  IF M=0 THEN C=0: GOTO 70
 940 A=RA(M)
 950 SV=0:SP=0: FOR R=1 TO P: GOTO 80
 980  POKE 61440,17:PAGE: PRINT "LADEN ODER SPEICHERN ? L/S"
 982 P= PEEK (58)*256:C=0: IF (CALL64768,0)=76 THEN 987
 983  GOSUB 1100
 984 STRNA$, PEEK (57368),1,0,P,P+12287: GOTO 989
 987  GOSUB 1100
 988 OLDNA$
 989  PRINT "READY":CALL64768,0: GOTO 60
 1000  FOR R=1 TO 4:A=M: GOTO 80
 1005 QZ= PEEK (58): POKE 58,32:S=1:C=1: READ P
 1007  FOR R=1 TO P: READ A: GOTO 80
 1010  NEXT :C=0:S=SZ
 1020  IF S=1 OR (SP=0 AND SV=0) THEN  POKE 58,QZ: GOTO 70
 1025  IF SV=1 THEN SV=0: GOTO 1005
 1030 C=1:SP=0: FOR R=1 TO 2:A=M: GOTO 80
 1100  INPUT "NAME DER SEITE";NA$: RETURN 
 1900  DATA 22,2,2,2,2,2,2,6,6,1,7,1,6,7,1,6,1,7,1,6,1,7,7
 1910  DATA 22,2,2,2,2,2,2,7,7,1,6,1,7,1,6,1,7,6,1,7,1,6,6
 1920  DATA 22,7,7,7,7,7,7,2,2,6,1,6,2,1,6,2,6,1,6,2,6,1,1
 1930  DATA 22,7,7,7,7,7,7,1,1,6,2,6,1,6,2,6,1,2,6,1,6,2,2
 1940  DATA 23,1,1,7,2,7,1,7,7,2,6,2,7,2,2,6,1
 1950  DATA  6,2,6,6,1,7,1
 1960  DATA 12,7,1,7,7,2,2,6,6,1,7,6,7
 8999  FOR 
 9000  REM  **RAND ZEICHNEN**
 9020  FOR R=0 TO 58: POKE 8192+R,15: POKE 20480+R,15
 9030  POKE 20224+R,240: POKE 32512+R,240: NEXT 
 9040  FOR R=64 TO 11968 STEP 64: POKE R+8192,17: POKE R+8250,136
 9050  POKE R+20480,17: POKE R+20538,136: NEXT : RETURN 
 30000  DATA 162,6,6,56,38,57,202,208,249,24,165,56,101,61
 30010  DATA 133,56,165,58,101,57,133,57,169,0,133,59,169
 30020  DATA 208,133,60,96
 30030  DATA 32,64,2,162,4,160,31,177,56,145,59,136,16,249
 30040  DATA 24,169,64,101,56,133,56,144,2,230,57
 30050  DATA 24,169,32,101,59,133,59,144,227,230,60,202
 30060  DATA 208,222,96,165,58
 30070  DATA 133,57,162,48,169,0,133,56,160,0,145,56,200,208
 30080  DATA 251,230,57,202,208,246,96
 30090  DATA 72,173,0,240,74,74,144,249,104,141,1,240,96
 30100  DATA 173,0,240,74,144,250,173,1,240,96
 40000  DATA 169,222,141,0,223,173,0,223,74,162,7,74,144,5,202
 40010  DATA 208,250,240,242,224,3,208,8,165,62,73,239,133,62
 40020  DATA 176,80,224,4,208,8,165,58,73,112,133,58,208,68
 40030  DATA 165,62,240,4,138,162,0,96,165,63,133,56,160,0,132
 40040  DATA 57,200,224,6,144,21,208,3,198,61,44,230,61,165,61
 40050  DATA 201,28,240,4,144,29,132,61,198,61,176,23,224,2
 40060  DATA 240,5,176,20,230,63,44,198,63,165,63,201,158,240,4
 40070  DATA 144,4,132,63,198,63,169,72,44,169,254,56,72,233,1
 40080  DATA 208,252,104,233,1,208,246,133,57,165,63,133,56
 40090  DATA 32,95,2,76,0,31
 19461 I
