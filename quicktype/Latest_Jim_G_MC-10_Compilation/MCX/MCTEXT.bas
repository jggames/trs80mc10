100 CLEAR7411:CLS:DIMA(1276),NW,L,K,C,W,J,Y,MAX,T,MN,EL,I,C$,L$,W$,CR$:MN=25:NW=0:L=1:CR$=CHR$(159)
110 DIML$(MN):GOSUB120:GOTO4000
120 PRINT:PRINT"WAIT...":L$="":FORT=1TO255:L$=L$+"*":NEXT:RETURN
145 PRINT:PRINTTAB(8);"ENTER FILENAME:"
150 PRINTTAB(10);:INPUTW$
160 IFLEN(W$)>8ORLEN(W$)<1THENSOUND150,3:W$=""
170 RETURN
180 C=LEN(C$):PRINTTAB((32-C)/2);C$
190 PRINTTAB((32-C)/2);LEFT$("================",C):PRINT:RETURN
200 PRINT@452,"press enter to continue";
220 C$=INKEY$:IFC$<>CHR$(13)ANDC$<>"4"THEN220
230 RETURN
500 PRINTTAB(6);"ARE YOU SURE (Y/N)?"
510 C$=INKEY$:IFC$="N"ORC$="n"THENC=0:GOTO540
520 IFC$="Y"ORC$="y"THENC=1:GOTO540
530 GOTO510
540 RETURN
2000 CLS
2030 C$="LOAD TEXT FILE":GOSUB180
2045 GOSUB145:IFW$=""THENRETURN
2065 PRINTTAB(11);"PRESS PLAY"
2070 LOAD*A,W$
2080 PRINT:PRINTTAB(11);"press stop"
2090 C=PEEK(VARPTR(L$)+2):T=PEEK(VARPTR(L$)+3)
2100 NW=A(0):FORK=1TONW:Y=VARPTR(L$):POKEY+2,INT((VARPTR(A(1))+(255*(K-1))+1)/256)
2110 POKEY+3,256*(((VARPTR(A(1))+(255*(K-1))+1)/256)-INT((VARPTR(A(1))+(255*(K-1))+1)/256))
2150 L$(K)=LEFT$(L$,PEEK(VARPTR(A(1))+(255*(K-1)))):PRINTNW-K+1;:NEXT:POKEY+2,C:POKEY+3,T:GOSUB120
2180 EL=MN-NW:L=1:RETURN
3000 CLS
3020 C$="SAVE TEXT FILE":GOSUB180
3040 GOSUB145:IFW$=""THENRETURN
3050 IFNW<1THENPRINTTAB(8);"no text to save":GOSUB135:RETURN
3070 FORK=1TONW:T=LEN(L$(K)):POKEVARPTR(A(1))+(255*(K-1)),T:FORI=1TOT:POKEVARPTR(A(1))+(255*(K-1))+I,ASC(MID$(L$(K),I,1)):NEXT
3071 PRINTNW-K+1;:NEXT
3075 PRINT:PRINTTAB(5);"PRESS PLAY AND RECORD":GOSUB200:PRINT:PRINTTAB(12);"saving"
3085 A(0)=NW:SAVE*A,W$:RETURN
3090 CLS:C$="RE-ORDER TEXT":GOSUB180:GOSUB500:IFNW<2ORC<>1THEN3170
3095 PRINT:J=1:IFRIGHT$(L$(1),1)<>" "THENL$(1)=L$(1)+" "
3100 FORK=2TONW:IFRIGHT$(L$(K),1)<>" "THENL$(K)=L$(K)+" "
3120 T=LEN(L$(J)):I=LEN(L$(K)):W=1:IFI=0THEN3160
3130 C=ASC(MID$(L$(K),W,1)):IFC<>32THENW=W+1:GOTO3130
3140 W$=LEFT$(L$(K),W):IFT+W<253THENL$(J)=L$(J)+W$:L$(K)=RIGHT$(L$(K),I-W):GOTO3120
3150 J=J+1:IFJ<KTHEN3120
3160 PRINTNW-K+1;:NEXT:NW=J:EL=MN-NW
3170 L=1:RETURN
4000 GOSUB4920
4010 C$=INKEY$:IFC$=""THEN4010
4020 IFL<25ANDC$=CHR$(13)THENL=L+1:GOTO4000
4030 IFL>1ANDC$="-"THENL=L-1:GOTO4000
4035 IFC$="0"THENGOSUB7000:GOTO4000
4040 IFC$="*"THENL=25
4050 IFC$=":"THENL=1
4100 C=VAL(C$)
4160 ONCGOSUB4660,4350,4530,5000,6000,4190,3090,2000,3000
4170 GOTO4000
4190 CLS
4210 C$="SEARCH":GOSUB180
4240 PRINT"SEARCH FOR:"
4245 L$(0)="":GOSUB7500
4250 W$=L$(0)
4255 IFW$=""THEN4340
4260 W=LEN(W$)
4265 PRINT"FOUND IN LINE:"
4270 FORI=1TONW
4280 T=LEN(L$(I))
4290 FORJ=1TOT-W+1
4300 IFW$=MID$(L$(I),J,W)THENPRINTI;
4310 NEXT:NEXT:PRINT:GOSUB200
4340 RETURN
4350 IFL>NWORNW>24THEN4520
4470 NW=NW+1:EL=EL-1
4480 FORI=NWTOLSTEP-1
4490 L$(I)=L$(I-1)
4500 NEXT
4510 L$(L)=""
4520 RETURN
4530 IFL>NWTHEN4650
4540 CLS
4550 C$="DELETE A LINE":GOSUB180
4610 GOSUB500:IFC<>1THEN4650
4620 NW=NW-1:EL=EL+1:FORI=LTONW:IFI=MNTHEN4640
4630 L$(I)=L$(I+1)
4640 NEXT
4645 L$(NW+1)=""
4650 RETURN
4660 IFL>NW+1THEN4800
4700 PRINT@2,"";
4760 L$(0)=L$(L)
4770 GOSUB7500:IFL$(0)<>""THENL$(L)=L$(0):IFL>NWTHENNW=L
4800 RETURN
4920 CLS
4940 PRINTRIGHT$(" "+STR$(L),2);L$(L):IFL<25THENPRINT@256,RIGHT$(" "+STR$(L+1),2);L$(L+1);
4942 POKE16384,PEEK(16384)-64:POKE16385,PEEK(16385)-64:POKE16640,PEEK(16640)-64:POKE16641,PEEK(16641)-64
4990 RETURN
5000 CLS
5020 C$="LIST TEXT":GOSUB180
5030 GOSUB500
5040 IFC=0THEN5250
5050 SW=30:C=0:L=1:CC=0:W=0
5070 W$=""
5080 PRINTTAB(1);
5090 FORI=1TONW
5100 L$(0)=L$(I):IFRIGHT$(L$(0),1)<>" "THENL$(0)=L$(0)+" "
5110 FORJ=1TOLEN(L$(0))
5120 C$=MID$(L$(0),J,1)
5130 IFC$=" "ORC$="^"ORC$=CHR$(95)THEN5160
5135 IFC$=CHR$(123)THENC$=CHR$(15)
5136 IFC$=CHR$(125)THENC$=CHR$(14)
5140 W$=W$+C$
5150 GOTO5200
5160 W=LEN(W$)
5170 IFCC+W>=SWTHENCC=0:PRINT:PRINTTAB(1);:IFC=7THENLPRINTLF$;:R=R+1
5175 IFR=LTHENPRINT:PRINT:GOSUB200:R=0:PRINT:PRINT
5180 PRINTW$;" ";:IFC=7THENLPRINTW$;" ";
5190 CC=CC+W+1:W$="":W=0
5195 IFC$=CHR$(95)THENCC=5:PRINT:PRINTTAB(6);:IFC=7THENLPRINTLF$;"     ";:R=R+1
5196 IFC$="^"THENCC=0:PRINT:PRINTTAB(1);:IFC=7THENLPRINTLF$;:R=R+1
5200 NEXT:NEXT
5220 PRINT:PRINT:GOSUB200
5250 L=1:RETURN
6000 LF$=CHR$(13)+"        ":L=54
6010 CLS
6020 C$="PRINT PAPER COPY":GOSUB180
6030 GOSUB500:IFC<>1THEN6170
6050 PRINT"RESET PRINT SETTINGS (Y/N)?"
6060 C$=INKEY$
6070 IFC$="Y"ORC$="y"THENR=0:CC=0:LPRINTLF$;:GOTO6100
6080 IFC$="N"ORC$="n"THEN6100
6090 GOTO6060
6100 INPUT"NUMBER OF COLUMNS";SW
6110 IFSW<1ORSW>132THENSOUND150,3:PRINTTAB(9);"bad number!":GOTO6100
6120 PRINT"DOUBLE SPACE (Y/N)?"
6130 C$=INKEY$:IFC$="Y"ORC$="y"THENL=27:LF$=CHR$(13)+LF$:GOTO6150
6140 IFC$="N"ORC$="n"THEN6150
6145 GOTO6130
6150 C=7
6160 GOSUB5070
6170 L=1:RETURN
7000 CLS
7010 C$="END PROGRAM":GOSUB180
7040 GOSUB500
7080 IFC=1THENEND
7090 RETURN
7500 W=0:MAX=LEN(L$(0)):PRINTCR$;
7505 C$=INKEY$:IFC$=""THEN7505
7510 K=ASC(C$)
7511 IFK>31ANDK<129THENIFW<252THEN7540
7515 IFK=129THENK=95:GOTO7540
7516 IFK=185THENGOSUB7600
7517 IFK=187THENK=123:GOTO7540
7518 IFK=183THENK=125:GOTO7540
7520 IFK=8ANDW>0THENW=W-1:GOSUB7570
7525 IFK=132THEN7585
7530 IFK=136THEN7580
7532 IFK=13THENPRINTCHR$(8):L$(0)=LEFT$(L$,W):RETURN
7534 IFK=144THENJ=254:GOSUB7595:GOTO7505
7535 IFK=21ANDW>0THENFORT=1TOW:PRINTCHR$(8);:NEXT:PRINTCHR$(8);:GOTO7500
7536 IFK=130THENJ=8:GOSUB7595
7537 IFK=10THENJ=32:GOSUB7595
7538 IFK=9THENGOSUB7590
7539 GOTO7505
7540 IFW=221THENSOUND150,1
7555 GOSUB7560:GOTO7505
7560 Y=VARPTR(L$):POKE(PEEK(Y+2)*256)+PEEK(Y+3)+W,K:W=W+1
7570 PRINTCHR$(8);CHR$(K);CR$;:RETURN
7580 IFW>0ANDW<MAXANDMAX<252THENMAX=MAX+1:L$(0)=LEFT$(L$,W)+" "+MID$(L$(0),W+1)
7581 GOTO7505
7585 IFMAX-1>0ANDW<MAXTHENMAX=MAX-1:L$(0)=LEFT$(L$,W)+MID$(L$(0),W+2)
7586 GOTO7505
7590 IFW<MAXTHENK=ASC(MID$(L$(0),W+1,1)):GOSUB7560
7591 RETURN
7595 PRINTCHR$(8);MID$(L$(0),W+1,J);
7597 FORT=1TOJ:IFW<MAXTHENK=ASC(MID$(L$(0),W+1,1)):Y=VARPTR(L$):POKE(PEEK(Y+2)*256)+PEEK(Y+3)+W,K:W=W+1
7598 NEXT:PRINTCR$;
7599 RETURN
7600 IFNW>24ORW>=LEN(L$(0))THEN7690
7610 L=L+1:GOSUB4350:IFL>NWTHENNW=NW+1
7620 L$(L)=RIGHT$(L$(0),LEN(L$(0))-W)
7630 K=13:L=L-1
7690 RETURN
