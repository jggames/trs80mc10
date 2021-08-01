5 CLS:CLEAR1000:DIMA$(12),B$(12),C$(12),D$(5),E$(5),F$(5),G$(5),H$(5),I$(5),J$(5),A(22,22),F(5,7):GOSUB9900
6 PRINT@235,"CAVEHUNT 3D":PRINT@295,"HIT enter TO BEGIN":KP=RND(1000):IFINKEY$=""THEN6
11 KP=0:CLS:PRINT"PLEASE WAIT..."
13 FORI=1TO5:FORN=1TO7:READF(I,N):NEXTN,I
19 DATA7,0,5,-2,-5,5,12,8,4,2,4,0,0,-5,3,3,0,1,1,-4,-8,12,0,12,-5,0,12,12,6,5,2,4,-1,-2,-7
25 RESTORE
70 FORX=0TO21:FORY=0TO21:A(X,Y)=0:NEXTY,X
120 FORY=1TO20:FORI=1TO6:X=RND(20):A(X,Y)=1:NEXTI,Y
172 Y=0:FORX=0TO21:A(X,Y)=-1:NEXTX
176 Y=21:FORX=0TO21:A(X,Y)=-1:NEXTX
180 X=0:FORY=1TO20:A(X,Y)=-1:NEXTY
184 X=21:FORY=1TO20:A(X,Y)=-1:NEXTY
190 FORY=1TO20:FORI=1TO5
205 X=RND(20)
210 IFA(X,Y)<>0THEN205
220 A(X,Y)=RND(5)+1
230 NEXTI,Y
250 PX=RND(4)+8:PY=RND(4)+8:LX=PX:LY=PY
290 FORY=1TO20:FORI=1TO3
300 X=RND(20)
310 IFA(X,Y)<>0THEN300
320 A(X,Y)=RND(7)+6
330 NEXTI,Y
332 GOSUB4000
345 CLS:PRINTTAB(10);"CAVEHUNT 3D":PRINT
350 PRINT"YOU FIND YOURSELF IN A DARK "
352 PRINT"CAVE, ARMED ONLY WITH A KNIFE."
354 PRINT"YOU MAY CARRY ONLY TWO WEAPONS,"
356 PRINT"THOSE TWO OF YOUR CHOICE. YOU"
358 PRINT"MAY PICK UP WEAPONS AS YOU GO,"
360 PRINT"BUT MAY HAVE TO PUT SOME DOWN."
362 PRINT"SOME WEAPONS ARE MORE EFFECTIVE"
364 PRINT"THAN OTHERS AGAINST CREATURES "
366 PRINT"YOU MAY MEET. YOU GET POINTS "
368 PRINT"FOR CREATURES YOU KILL.":PRINT
370 PRINT"GOOD LUCK! HIT enter TO BEGIN."
371 IFINKEY$<>CHR$(13)THEN371
375 W(1)=7:W(2)=20:D=1
380 A(PX,PY)=0:CLS0
390 PRINT@0,"";
420 N=A(PX,PY-1):S=A(PX,PY+1):E=A(PX+1,PY):W=A(PX-1,PY):LX=PX:LY=PY:GOSUB500
430 SO=ABS(N>1ANDN<7)+ABS(S>1ANDS<7)+ABS(E>1ANDE<7)+ABS(W>1ANDW<7)
460 I$=INKEY$:IFSO>0THENIFRND(100)<=SOTHENSOUNDRND(50)+100,1
470 IFI$="A"THEND=D-1:IFD=0THEND=4
480 IFI$="S"THEND=D+1:IFD=5THEND=1
490 IFI$="W"THEN600
495 IFI$="A"ORI$="S"THENCLS0:GOSUB500
496 GOTO460
500 PRINT@0,"";:ONDGOSUB505,510,515,520:ONDGOSUB530,540,550,560:RETURN
505 C1=ABS(W=1):C2=ABS(N=1):C3=ABS(E=1):GOSUB8500:RETURN
510 C1=ABS(N=1):C2=ABS(E=1):C3=ABS(S=1):GOSUB8500:RETURN
515 C1=ABS(E=1):C2=ABS(S=1):C3=ABS(W=1):GOSUB8500:RETURN
520 C1=ABS(S=1):C2=ABS(W=1):C3=ABS(N=1):GOSUB8500:RETURN
530 POKE16895,14:RETURN
540 POKE16895,5:RETURN
550 POKE16895,19:RETURN
560 POKE16895,23:RETURN
600 IFN=1ANDD=1ORS=1ANDD=3ORE=1ANDD=2ORW=1ANDD=4THENSOUND1,1:GOTO460
620 ONDGOTO650,670,690,710
640 GOTO610
650 PY=PY-1
660 GOTO720
670 PX=PX+1
680 GOTO720
690 PY=PY+1
700 GOTO720
710 PX=PX-1
720 IFA(PX,PY)=-1THEN3000
725 IFA(PX,PY)<2THENCLS0:GOTO390
726 N=A(PX,PY-1):S=A(PX,PY+1):E=A(PX+1,PY):W=A(PX-1,PY):CLS0:GOSUB500
729 IFA(PX,PY)>1ANDA(PX,PY)<7THEN1080
730 PRINT@480,"YOU FOUND ";:ONA(PX,PY)-6GOSUB5000,5010,5020,5030,5040,5050,5060
800 GOSUB9995:ONA(PX,PY)-6GOSUB8700,8710,8720,8730,8740,8750,8760
810 GOSUB9990:PRINT@480,"DO YOU WANT TO PICK IT UP?     ";
820 A$=INKEY$:IFA$=""THEN820
890 IFA$="Y"THEN920
900 IFA$="N"THEN390
910 GOTO820
920 IFW(1)=20ORW(2)=20THEN1040
930 GOSUB9990:PRINT@480,"LEAVE ";:ON(W(1)-6)GOSUB5000,5010,5020,5030,5040,5050,5060:PRINT"?";
945 A$=INKEY$:IFA$=""THEN945
946 IFA$="Y"THENA=1:GOTO1000
947 IFA$="N"THEN950
948 GOTO945
950 GOSUB9990:PRINT@480,"LEAVE ";:ON(W(2)-6)GOSUB5000,5010,5020,5030,5040,5050,5060:PRINT"?";
955 A$=INKEY$:IFA$=""THEN955
960 IFA$="Y"THENA=2:GOTO1020
970 IFA$="N"THEN390
990 GOTO960
1000 G=A(PX,PY):A(PX,PY)=W(1):W(1)=G:G=0
1010 GOTO1030
1020 G=A(PX,PY):A(PX,PY)=W(2):W(2)=G:G=0
1030 GOTO390
1040 IFW(1)<>20THEN1060
1045 W(1)=A(PX,PY):A(PX,PY)=0
1050 GOTO390
1060 W(2)=A(PX,PY):A(PX,PY)=0
1070 GOTO390
1080 ONA(PX,PY)-1GOSUB5070,5080,5090,5100,5110
1115 IFW(1)=20ANDW(2)=20THENGOSUB9990:PRINT@480,"NO WEAPONS!";:GOSUB9995:GOTO1200
1120 IFW(1)=20THEN1150
1125 PRINT@480,"ATTACK WITH ";:ONW(1)-6GOSUB 5000,5010,5020,5030,5040,5050,5060:PRINT"?";
1130 I$=INKEY$:IFI$=""THEN1130
1140 IFI$="Y"THENA=1:GOTO1350
1145 IFI$="N"THEN1150
1146 GOTO1130
1150 IFW(2)=20THEN1200
1155 GOSUB9990:PRINT@480,"ATTACK WITH ";:ONW(2)-6GOSUB 5000,5010,5020,5030,5040,5050,5060:PRINT"?";
1160 I$=INKEY$:IFI$=""THEN1160
1170 IFI$="Y"THENA=2:GOTO1350
1180 IFI$="N"THEN1200
1190 GOTO1160
1200 RN=RND(6)
1230 DE=0
1240 IFA(PX,PY)=2ANDRN<4THENDE=1
1245 IFA(PX,PY)<>2ANDRN<2THENDE=1
1250 IFDE=0THEN1270
1260 CLS:FORI=1TO16:PRINT"TOO SLOW-YOU'RE DEAD.":NEXT:GOSUB9995:GOTO8000
1270 PX=LX:PY=LY
1280 PRINT@480,"YOU RUN BACK THE WAY YOU CAME. ";:GOSUB9995
1300 ONDGOTO1310,1315,1320,1325
1310 D=3:GOTO720
1315 D=4:GOTO720
1320 D=1:GOTO720
1325 D=2:GOTO720
1350 IFA=1THENAW=W(1)
1370 IFA=2THENAW=W(2)
1390 RL=RND(20)+F(A(PX,PY)-1,AW-6)
1400 IFRL<5THEN1620
1410 IFRL>4ANDRL<9THEN1600
1420 IFRL>9ANDRL<13THEN1540
1430 IFRL>12ANDRL<17THEN1500
1440 CLS
1450 FORI=1TO16:PRINT@480,"YOU DIED FIGHTING...":NEXT
1480 GOSUB9995
1490 GOTO8000
1500 IFW(1)=20ORW(2)=20THEN1540
1505 GOSUB9990:PRINT@480,"YOU LOST BOTH WEAPONS-RUN!";
1510 W(1)=20:W(2)=20:GOSUB9995:GOTO1270
1540 PRINT@480,"YOU LOST YOUR ATTACK WEAPON!!!";:GOSUB9995
1550 IFW(1)=W(2)THEN1570
1560 IFAW=W(1)THENW(1)=20
1570 IFAW=W(2)THENW(2)=20
1590 GOSUB9990:GOTO1080
1600 GOSUB9990:PRINT@480,"THE BATTLE'S A DRAW.";
1605 GOSUB9995
1610 GOSUB9990:GOTO1080
1620 GOSUB9990:PRINT@480,"SUCCESS-YOU'VE KILLED IT!";
1640 IFA(PX,PY)=2ORA(PX,PY)=3THEN KP=KP+5
1650 IFA(PX,PY)=4THENKP=KP+2
1660 IFA(PX,PY)=5THENKP=KP+4
1670 IFA(PX,PY)=6THENKP=KP+3
1675 A(PX,PY)=0:GOSUB9995:GOTO390
3000 CLS3:GOSUB9990:POKE16895,96:FORI=1TO30
3005 C1=RND(11):C2=RND(6):R=32+RND(384):PRINT@R,LEFT$(C$,C1);:PRINT@R+32,MID$(C$,C2,5);:PRINT@487,"YOU ESCAPED ALIVE!";
3050 NEXT:GOSUB9995:GOTO8000
4000 R=RND(8)
4025 TX=PX:TY=PY
4030 ONRGOSUB4500,4550,4600,4650,4700,4750,4800,4850
4040 RETURN
4500 IFA(TX,TY)=-1THENRETURN
4510 IFA(TX-1,TY)<>1THENTX=TX-1:GOTO4500
4520 IFA(TX,TY+1)<>1THENTY=TY+1:GOTO4500
4525 T1=RND(2)
4530 IFT1=1THEN4540
4535 TX=TX-1:A(TX,TY)=0:GOTO4510
4540 TY=TY+1:A(TX,TY)=0:GOTO4510
4550 IFA(TX,TY)=-1THENRETURN
4560 IFA(TX-1,TY)<>1THENTX=TX-1:GOTO4550
4570 IFA(TX,TY-1)<>1THENTY=TY-1:GOTO4550
4575 T1=RND(2)
4580 IFT1=1THEN4590
4585 TX=TX-1:A(TX,TY)=0:GOTO4560
4590 TY=TY-1:A(TX,TY)=0:GOTO4560
4600 IFA(TX,TY)=-1THENRETURN
4610 IFA(TX,TY+1)<>1THENTY=TY+1:GOTO4600
4620 IFA(TX-1,TY)<>1THENTX=TX-1:GOTO4600
4625 T1=RND(2)
4630 IFT1=1THEN4640
4635 TY=TY+1:A(TX,TY)=0:GOTO4610
4640 TX=TX-1:A(TX,TY)=0:GOTO4610
4650 IFA(TX,TY)=-1THENRETURN
4660 IFA(TX,TY+1)<>1THENTY=TY+1:GOTO4650
4670 IFA(TX+1,TY)<>1THENTX=TX+1:GOTO4650
4675 T1=RND(2)
4680 IFT1=1THEN4690
4685 TY=TY+1:A(TX,TY)=0:GOTO4660
4690 TX=TX+1:A(TX,TY)=0:GOTO4660
4700 IFA(TX,TY)=-1THENRETURN
4710 IFA(TX+1,TY)<>1THENTX=TX+1:GOTO4700
4720 IFA(TX,TY+1)<>1THENTY=TY+1:GOTO4700
4725 T1=RND(2)
4730 IFT1=1THEN4740
4735 TX=TX+1:A(TX,TY)=0:GOTO4710
4740 TY=TY+1:A(TX,TY)=0:GOTO4710
4750 IFA(TX,TY)=-1THENRETURN
4760 IFA(TX+1,TY)<>1THENTX=TX+1:GOTO4750
4770 IFA(TX,TY-1)<>1THENTY=TY-1:GOTO4750
4775 T1=RND(2)
4780 IFT1=1THEN4790
4785 TX=TX+1:A(TX,TY)=0:GOTO4760
4790 TY=TY-1:A(TX,TY)=0:GOTO4760
4800 IFA(TX,TY)=-1THENRETURN
4810 IFA(TX,TY-1)<>1THENTY=TY-1:GOTO4800
4820 IFA(TX+1,TY)<>1THENTX=TX+1:GOTO4800
4825 T1=RND(2)
4830 IFT1=1THEN4840
4835 TY=TY-1:A(TX,TY)=0:GOTO4810
4840 TX=TX+1:A(TX,TY)=0:GOTO4810
4850 IFA(TX,TY)=-1THENRETURN
4860 IFA(TX,TY-1)<>1THENTY=TY-1:GOTO4850
4870 IFA(TX-1,TY)<>1THENTX=TX-1:GOTO4850
4875 T1=RND(2)
4880 IFT1=1THEN4890
4885 TY=TY-1:A(TX,TY)=0:GOTO4860
4890 TX=TX-1:A(TX,TY)=0:GOTO4860
5000 PRINT"A KNIFE";:RETURN
5010 PRINT"A MAGIC STAFF";:RETURN
5020 PRINT"A BROAD SWORD";:RETURN
5030 PRINT"A DIAMOND OF LIFE";:RETURN
5040 PRINT"FIRE OF THE DEPTHS";:RETURN
5050 PRINT"A GREAT AXE";:RETURN
5060 PRINT"A LASER SWORD";:RETURN
5070 MX=12:MY=3:M=1:GOSUB6000:RETURN
5080 MX=9:MY=3:M=5:GOSUB6000:RETURN
5090 MX=12:MY=3:M=4:GOSUB6000:RETURN
5100 MX=12:MY=3:M=2:GOSUB6000:RETURN
5110 MX=12:MY=3:M=3:GOSUB6000:RETURN
6000 PRINT@32*MY+MX,A$(M);:MY=MY+1:PRINT@32*MY+MX,B$(M);:MY=MY+1:PRINT@32*MY+MX,C$(M);:MY=MY+1
6010 PRINT@32*MY+MX,D$(M);:MY=MY+1:PRINT@32*MY+MX,E$(M);:MY=MY+1:PRINT@32*MY+MX,F$(M);:MY=MY+1
6020 PRINT@32*MY+MX,G$(M);:MY=MY+1:PRINT@32*MY+MX,H$(M);:MY=MY+1:PRINT@32*MY+MX,I$(M);:MY=MY+1
6030 PRINT@32*MY+MX,J$(M);:RETURN
8000 CLS0:FORX=0TO21:FORY=0TO21:IFA(X,Y)<>1THENSET(2*X,Y,1):SET(2*X+1,Y,1)
8001 NEXT:NEXT
8005 PRINT@384,"KILL POINTS:";KP;:IFKP>HSTHENHS=KP
8006 PRINT@24,"HIGH:";:PRINT@56,HS;
8010 PRINT@448,"TRY IT AGAIN (Y OR N)?";
8015 A$=INKEY$:SET(2*PX,PY,1):SET(2*PX+1,PY,1):FORI=1TO50:NEXT:RESET(2*PX,PY):RESET(2*PX+1,PY)
8020 IFA$=""THEN8015
8025 IFA$="Y"THEN11
8030 IFA$="N"THENEND
8040 GOTO8015
8500 IFC1=0ANDC2=0ANDC3=0THENGOSUB9000:RETURN
8510 IFC1=0ANDC2=1ANDC3=0THENGOSUB9100:RETURN
8520 IFC1=1ANDC2=1ANDC3=0THENGOSUB9200:RETURN
8530 IFC1=1ANDC2=1ANDC3=1THENGOSUB9300:RETURN
8540 IFC1=0ANDC2=1ANDC3=1THENGOSUB9400:RETURN
8550 IFC1=1ANDC2=0ANDC3=0THENGOSUB9500:RETURN
8560 IFC1=0ANDC2=0ANDC3=1THENGOSUB9600:RETURN
8570 IFC1=1ANDC2=0ANDC3=1THENGOSUB9700:RETURN
8580 STOP
8700 MX=12:MY=9:M=6:GOSUB8800:RETURN
8710 MX=12:MY=10:M=7:GOSUB8800:RETURN
8720 MX=12:MY=9:M=8:GOSUB8800:RETURN
8730 MX=16:MY=9:M=9:GOSUB8800:RETURN
8740 MX=16:MY=9:M=10:GOSUB8800:RETURN
8750 MX=12:MY=9:M=11:GOSUB8800:RETURN
8760 MX=12:MY=9:M=12:GOSUB8800:RETURN
8800 PRINT@32*MY+MX,A$(M);:MY=MY+1:PRINT@32*MY+MX,B$(M);:MY=MY+1:PRINT@32*MY+MX,C$(M);:RETURN
9000 PRINT"–‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹–";
9001 PRINT"–––‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹–––";
9002 PRINT"–––––‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹–––––";
9003 PRINT"–––––––‹‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹‹–––––––";
9004 PRINT"––––––––––––‹‹‹‹‹‹‹‹––––––––––––";
9005 PRINT"––––––––––––––––––––––––––––––––";
9006 PRINT"––––––––––––––––––––––––––––––––";
9007 PRINT"––––––––––––––––––––––––––––––––";
9008 PRINT"––––––––––––––––––––––––––––––––";
9009 PRINT"––––––––––––––––––––––––––––––––";
9010 PRINT"––––––––––––––––––––––––––––––––";
9011 PRINT"––––––––––––””””””””––––––––––––";
9012 PRINT"–––––––””ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ””–––––––";
9013 PRINT"–––––”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”–––––";
9014 PRINT"–––”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”–––";
9015 PRINT"–”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”";:RETURN
9100 PRINT"–‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹–";
9101 PRINT"–––‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹–––";
9102 PRINT"–––––‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹–––––";
9103 PRINT"–––––––‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹–––––––";
9104 PRINT"––––––––ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ––––––––";
9105 PRINT"––––––––ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ––––––––";
9106 PRINT"––––––––ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ––––––––";
9107 PRINT"––––––––ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ––––––––";
9108 PRINT"––––––––ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ––––––––";
9109 PRINT"––––––––ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ––––––––";
9110 PRINT"––––––––ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ––––––––";
9111 PRINT"––––––––ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ––––––––";
9112 PRINT"–––––––””””””””””””””””””–––––––";
9113 PRINT"–––––”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”–––––";
9114 PRINT"–––”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”–––";
9115 PRINT"–”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”";:RETURN
9200 PRINT"”‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹–";
9201 PRINT"ﬂﬂ”‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹–––";
9202 PRINT"ﬂﬂﬂﬂ”‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹–––––";
9203 PRINT"ﬂﬂﬂﬂﬂﬂ”‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹–––––––";
9204 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ––––––––";
9205 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ––––––––";
9206 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ––––––––";
9207 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ––––––––";
9208 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ––––––––";
9209 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ––––––––";
9210 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ––––––––";
9211 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ––––––––";
9212 PRINT"ﬂﬂﬂﬂﬂﬂ‹””””””””””””””””””–––––––";
9213 PRINT"ﬂﬂﬂﬂ‹”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”–––––";
9214 PRINT"ﬂﬂ‹”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”–––";
9215 PRINT"‹”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”";:RETURN
9300 PRINT"”‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹”";
9301 PRINT"ﬂﬂ”‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹”ﬂﬂ";
9302 PRINT"ﬂﬂﬂﬂ”‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹”ﬂﬂﬂﬂ";
9303 PRINT"ﬂﬂﬂﬂﬂﬂ”‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹”ﬂﬂﬂﬂﬂﬂ";
9304 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂ";
9305 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂ";
9306 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂ";
9307 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂ";
9308 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂ";
9309 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂ";
9310 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂ";
9311 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂ";
9312 PRINT"ﬂﬂﬂﬂﬂﬂ‹””””””””””””””””””‹ﬂﬂﬂﬂﬂﬂ";
9313 PRINT"ﬂﬂﬂﬂ‹”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”‹ﬂﬂﬂﬂ";
9314 PRINT"ﬂﬂ‹”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”‹ﬂﬂ";
9315 PRINT"‹”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”";:RETURN
9400 PRINT"–‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹”";
9401 PRINT"–––‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹”ﬂﬂ";
9402 PRINT"–––––‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹”ﬂﬂﬂﬂ";
9403 PRINT"–––––––‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹”ﬂﬂﬂﬂﬂﬂ";
9404 PRINT"––––––––ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂ";
9405 PRINT"––––––––ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂ";
9406 PRINT"––––––––ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂ";
9407 PRINT"––––––––ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂ";
9408 PRINT"––––––––ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂ";
9409 PRINT"––––––––ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂ";
9410 PRINT"––––––––ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂ";
9411 PRINT"––––––––ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ–ﬂﬂﬂﬂﬂﬂﬂ";
9412 PRINT"–––––––””””””””””””””””””‹ﬂﬂﬂﬂﬂﬂ";
9413 PRINT"–––––”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”‹ﬂﬂﬂﬂ";
9414 PRINT"–––”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”‹ﬂﬂ";
9415 PRINT"–”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”";:RETURN
9500 PRINT"”‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹–";
9501 PRINT"ﬂﬂ”‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹–––";
9502 PRINT"ﬂﬂﬂﬂ”‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹–––––";
9503 PRINT"ﬂﬂﬂﬂﬂﬂ”‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹–––––––";
9504 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–––––––––––––––––––––––––";
9505 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–––––––––––––––––––––––––";
9506 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–––––––––––––––––––––––––";
9507 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–––––––––––––––––––––––––";
9508 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–––––––––––––––––––––––––";
9509 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–––––––––––––––––––––––––";
9510 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–––––––––––––––––––––––––";
9511 PRINT"ﬂﬂﬂﬂﬂﬂﬂ–––––––––––––––––––––––––";
9512 PRINT"ﬂﬂﬂﬂﬂﬂ‹””””””””””””””””””–––––––";
9513 PRINT"ﬂﬂﬂﬂ‹”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”–––––";
9514 PRINT"ﬂﬂ‹”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”–––";
9515 PRINT"‹”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”";:RETURN
9600 PRINT"–‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹”";
9601 PRINT"–––‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹”ﬂﬂ";
9602 PRINT"–––––‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹”ﬂﬂﬂﬂ";
9603 PRINT"–––––––‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹”ﬂﬂﬂﬂﬂﬂ";
9604 PRINT"–––––––––––––––––––––––––ﬂﬂﬂﬂﬂﬂﬂ";
9605 PRINT"–––––––––––––––––––––––––ﬂﬂﬂﬂﬂﬂﬂ";
9606 PRINT"–––––––––––––––––––––––––ﬂﬂﬂﬂﬂﬂﬂ";
9607 PRINT"–––––––––––––––––––––––––ﬂﬂﬂﬂﬂﬂﬂ";
9608 PRINT"–––––––––––––––––––––––––ﬂﬂﬂﬂﬂﬂﬂ";
9609 PRINT"–––––––––––––––––––––––––ﬂﬂﬂﬂﬂﬂﬂ";
9610 PRINT"–––––––––––––––––––––––––ﬂﬂﬂﬂﬂﬂﬂ";
9611 PRINT"–––––––––––––––––––––––––ﬂﬂﬂﬂﬂﬂﬂ";
9612 PRINT"–––––––””””””””””””””””””‹ﬂﬂﬂﬂﬂﬂ";
9613 PRINT"–––––”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”‹ﬂﬂﬂﬂ";
9614 PRINT"–––”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”‹ﬂﬂ";
9615 PRINT"–”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”";:RETURN
9700 PRINT"”‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹”";
9701 PRINT"ﬂﬂ”‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹”ﬂﬂ";
9702 PRINT"ﬂﬂﬂﬂ”‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹”ﬂﬂﬂﬂ";
9703 PRINT"ﬂﬂﬂﬂﬂﬂ”‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹”ﬂﬂﬂﬂﬂﬂ";
9704 PRINT"ﬂﬂﬂﬂﬂﬂﬂ––––––––––––––––––ﬂﬂﬂﬂﬂﬂﬂ";
9705 PRINT"ﬂﬂﬂﬂﬂﬂﬂ––––––––––––––––––ﬂﬂﬂﬂﬂﬂﬂ";
9706 PRINT"ﬂﬂﬂﬂﬂﬂﬂ––––––––––––––––––ﬂﬂﬂﬂﬂﬂﬂ";
9707 PRINT"ﬂﬂﬂﬂﬂﬂﬂ––––––––––––––––––ﬂﬂﬂﬂﬂﬂﬂ";
9708 PRINT"ﬂﬂﬂﬂﬂﬂﬂ––––––––––––––––––ﬂﬂﬂﬂﬂﬂﬂ";
9709 PRINT"ﬂﬂﬂﬂﬂﬂﬂ––––––––––––––––––ﬂﬂﬂﬂﬂﬂﬂ";
9710 PRINT"ﬂﬂﬂﬂﬂﬂﬂ––––––––––––––––––ﬂﬂﬂﬂﬂﬂﬂ";
9711 PRINT"ﬂﬂﬂﬂﬂﬂﬂ––––––––––––––––––ﬂﬂﬂﬂﬂﬂﬂ";
9712 PRINT"ﬂﬂﬂﬂﬂﬂ‹””””””””””””””””””‹ﬂﬂﬂﬂﬂﬂ";
9713 PRINT"ﬂﬂﬂﬂ‹”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”‹ﬂﬂﬂﬂ";
9714 PRINT"ﬂﬂ‹”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”‹ﬂﬂ";
9715 PRINT"‹”ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ”";:RETURN
9900 A$(1)="∞∞øøøø∞∞∞"
9901 B$(1)="øøøøøøøø∞"
9902 C$(1)="∞∞œ«Àœ∞∞œ"
9903 D$(1)="∞øøøøøøøø"
9904 E$(1)="∞øøøøø∞∞œ"
9905 F$(1)="∞øøøøø∞∞œ"
9906 G$(1)="∞øøøøø∞∞œ"
9907 H$(1)="∞∞øøøø∞∞œ"
9908 I$(1)="∞∞øøøø∞∞œ"
9909 J$(1)="∞∞øøøø∞∞œ"
9910 A$(2)="∞∞∞œœœ∞∞∞"
9911 B$(2)="∞∞œ∞œ∞œ∞∞"
9912 C$(2)="∞∞œœœœœ∞∞"
9913 D$(2)="∞∞∞œ∞œ∞∞∞"
9914 E$(2)="∞œ∞∞∞∞∞œ∞"
9915 F$(2)="∞œ∞œœœ∞œ∞"
9916 G$(2)="œ∞∞∞œ∞∞∞œ"
9917 H$(2)="œœ∞œœœ∞œœ"
9918 I$(2)="∞∞∞œ∞œ∞∞∞"
9919 J$(2)="∞∞∞œ∞œ∞∞∞"
9920 A$(3)="∞ˇˇˇˇˇ∞"
9921 B$(3)="ˇˇ∞∞∞ˇˇ"
9922 C$(3)="∞ˇˇ∞ˇˇ∞"
9923 D$(3)="∞ˇˇˇˇˇ∞"
9924 E$(3)="ˇˇˇˇˇˇˇ"
9925 F$(3)="ˇˇˇˇˇˇˇ"
9926 G$(3)="ˇˇˇˇˇˇˇ"
9927 H$(3)="ˇˇˇˇˇˇˇ"
9928 I$(3)="∞ˇˇˇˇˇ∞"
9929 J$(3)="∞ˇˇ∞ˇˇ∞"
9930 A$(4)="ü∞     ∞"
9931 B$(4)="ü∞ ∞ ∞ ∞"
9932 C$(4)="ü∞     ∞"
9933 D$(4)="ü∞ ∞∞∞ ∞"
9934 E$(4)="ü∞ ∞    "
9935 F$(4)="   ∞ ∞∞ "
9936 G$(4)="   ∞ ∞∞ "
9937 H$(4)="∞∞ ∞ ∞∞ "
9938 I$(4)="∞∞ ∞    "
9939 J$(4)="∞∞  ∞  ∞"
9940 A$(5)="∞∞Ô∞∞∞∞∞∞∞∞∞∞∞Ô∞∞"
9941 B$(5)="∞Ô∞Ô∞∞ÔÔÔÔÔ∞∞Ô∞Ô∞"
9942 C$(5)="∞∞∞ÔÔÔÔÔÔÔÔÔÔÔ∞∞∞"
9943 D$(5)="∞ÔÔÔÔÔÔÔÔÔÔÔÔÔÔÔ∞"
9944 E$(5)="Ô∞∞ÔÔÔÔœÔœÔÔÔÔ∞∞Ô"
9945 F$(5)="Ô∞Ô∞Ô∞ÔÔÔÔÔ∞Ô∞Ô∞Ô"
9946 G$(5)="Ô∞Ô∞Ô∞Ô∞∞∞Ô∞Ô∞Ô∞Ô"
9947 H$(5)="∞∞Ô∞Ô∞∞Ô∞Ô∞∞Ô∞Ô∞∞"
9948 I$(5)="∞∞Ô∞Ô∞∞∞∞∞∞∞Ô∞Ô∞∞"
9949 J$(5)="∞∞∞∞Ô∞∞∞∞∞∞∞Ô∞∞∞∞"
9960 A$(10)="πˇ∂"
9961 B$(10)="ˇˇˇ"
9962 C$(10)="∂ˇπ"
9963 A$(6)="êüêêê"
9964 B$(6)="ˇüüüò"
9965 C$(6)="êüêêê"
9967 A$(8)="êüêêêêêêêê"
9968 B$(8)="ˇüüüüüüüüò"
9969 C$(8)="êüêêêêêêêê"
9970 A$(11)="îüûêêêêêê"
9971 B$(11)="üüˇˇˇˇˇˇˇ"
9972 C$(11)="ëüõêêêêêê"
9973 A$(12)="†ùêêêêêêê"
9974 B$(12)="úùÃÃÃÃÃÃÃ"
9975 C$(12)="êúêêêêêêê"
9976 A$(9)="«œ¬"
9977 B$(9)="Õœ»"
9978 C$(9)="¿»¿"
9979 A$(7)="–––––––––––"
9980 B$(7)="‹‹‹‹‹‹‹‹‹‹Ï"
9981 C$(7)="":C$="ØØœœœœœœœØØ":RETURN
9990 PRINT@480,"";:FORT=1TO31:PRINT" ";:NEXT:RETURN
9995 FORT=1TO2000:NEXT:RETURN
