1 CLEAR1000:CLS:SN=1:REM SN=0 TO TURN OF SOUND
5 PRINTTAB(9);"*** TYCOON ***"
6 PRINT
7 INPUT"DATE (DD/MM/YY)";D1$
8 IFLEN(D1$)<>8THEN7
9 DIM H(20),C(20),P(3,3,10)
10 GOSUB10130
15 T=0
16 S=0
17 G8=0
18 G1=0
19 K1=0
20 Y=(RND(0)+1)*50
21 M=RND(0)
22 Z1=(M+.5)*4
23 Z2=(M+.25)*15
24 K2=0
30 H=INT(Y/5+1)
40 FOR I=1 TO H
45 H(I)=1
50 NEXT I
55 B=INT(Y/30+1)
65 FOR I=1 TO B
70 B(I)=1
75 NEXT I
80 A=INT(Y/50+1.2)
85 FOR I=1 TO A
90 A(I)=1
95 NEXT I
100 C=INT(Y/5+1)
110 FOR I=1 TO C
115 C(I)=1
120 NEXT I
125 D=INT(Y/20+1)
130 FOR I=1 TO D
135 D(I)=1
140 NEXT I
165 L=INT(Y/10+1)
170 FOR I=1 TO L
175 L(I)=1
180 NEXT I
185 G=Y*50000
186 G3=G
190 PRINT
195 PRINT "*** GET READY FOR BUSINESS! ***";
196 GOTO 5000
200 PRINT
205 PRINT "IN THIS CITY THERE ARE:"
215 PRINT RIGHT$(STR$(H),2);" LUXURY HOMES"
220 PRINT RIGHT$(STR$(C),2);" INVESTMENT PROPERTIES"
225 PRINT RIGHT$(STR$(L),2);" STORES & RETAIL OUTLETS"
230 PRINT RIGHT$(STR$(D),2);" HOTELS"
235 PRINT RIGHT$(STR$(B),2);" MAJOR COMPANIES"
240 PRINT RIGHT$(STR$(A),2);" RAILWAY FACILITIES"
250 PRINT
253 GOSUB10130:GOSUB 10000
255 IF R$<>"A" THEN 270
265 RETURN
270 PRINT "NET WORTH $";INT(G*100)/100
275 PRINT
300 T=T+1
302 IF T>24 THEN 3000
304 IF G8=0 THEN 330
306 S=S+1
307 IF S=24 THEN 2900
308 IF S>47 THEN 3100
330 PRINT
331 PRINT "WHAT DO YOU WANT TO DO";
332 INPUT R$
333 PRINT
334 IF R$="B" THEN 400
335 IF R$="S" THEN 355
336 IF R$="V" THEN 370
337 IF R$="L" THEN 9250
338 IF R$="A" THEN 380
339 IF R$="H" THEN 390
340 IF R$="Q" THEN 9010
341 PRINT "POSSIBLE ACTIONS:"
342 PRINT "B - BUY"
343 PRINT "S - SELL"
344 PRINT "V - VISIT BANK"
345 PRINT "L - LIST COMPARTIVE STANDINGS"
346 PRINT "A - WHAT'S AVAILABLE?"
347 PRINT "H - YOUR HOLDINGS?"
348 PRINT "Q - QUIT GAME"
349 GOTO 331
355 GOSUB 1500
360 GOSUB 1150
365 GOTO 300
370 GOSUB 1600
375 GOTO 300
380 GOSUB 200
385 GOTO 300
390 GOSUB 1500
395 GOTO 300
400 Y=RND(0)*7
401 V1=0
402 K2=K2+1
403 V2=0
404 IF Y>6 THEN 2300
405 IF Y>=5 THEN 465
410 IF Y>=4 THEN 480
420 IF Y>=3 THEN 500
430 IF Y>=2 THEN 520
440 IF Y>=1 THEN 540
450 Y=INT(RND(0)*H+1)
455 IF H(Y)=3 THEN 400
460 GOTO 570
465 Y=INT(RND(0)*C+1)
470 IF C(Y)=3 THEN 400
475 GOTO 590
480 Y=INT(RND(0)*B+1)
485 IF B(Y)=3 THEN 400
490 GOTO 610
500 Y=INT(RND(0)*L+1)
505 IF L(Y)=3 THEN 400
510 GOTO 630
520 Y=INT(RND(0)*A+1)
525 IF A(Y)=3 THEN 400
530 GOTO 650
540 Y=INT(RND(0)*D+1)
545 IF D(Y)=3 THEN 400
550 H$="HOTEL"
555 D(Y)=2
560 W=(RND(0)+.5)*1E+06
565 GOTO 670
570 H$="LUXURY HOME"
575 H(Y)=2
580 W=(RND(0)*.5)*400000
585 GOTO 670
590 H$="PROPERTY"
595 C(Y)=2
600 W=(RND(0)+.1)*800000
605 GOTO 670
610 H$="SHARES IN COMPANY"
615 B(Y)=2
620 W=(RND(0)+.01)*1E+06
625 GOTO 670
630 L(Y)=2
635 H$="STORE"
640 W=(RND(0)*.25)*1E+06
645 GOTO 670
650 H$="RAILWAY FACILITY"
655 A(Y)=2
660 W=(RND(0)+.5)*2E+06
670 PRINT H$;" #";Y:PRINT"CAN BOUGHT FOR $";INT(W*100)/100
675 PRINT "DO YOU WANT BUY";
680 INPUT K$
685 IF LEFT$(K$,1)<>"Y" THEN 1020
686 K1=0
690 GOSUB 4000
700 PRINT "PAY CASH (C) OR CHEQUE (H)";
705 INPUT K$
710 IF K$="C" THEN 725
715 IF K$="H" THEN 2000
720 GOTO 700
725 IF G<W THEN 800
730 G=G-W
733 GOSUB 4000
735 GOTO 1100
800 PRINT
805 PRINT "IT COSTS MORE THAN $";STR$(INT(G*100)/100);"!"
810 PRINT
815 IF G1>W THEN 880
820 PRINT "YOUR BANK ACCOUNT CAN'T COPE!"
825 IF G+G1>W THEN 840
830 GOTO 9000
840 PRINT "THEY'LL TAKE CASH AND A CHEQUE!"
850 G=G-W
855 G1=G1+G
860 G=0
865 GOTO 733
880 PRINT "YOU MUST USE A CHEQUE!"
885 PRINT
890 GOTO 700
895 PRINT
900 IF H(Y)=2 THEN 950
905 IF C(Y)=2 THEN 980
910 IF L(Y)=2 THEN 990
915 IF D(Y)=2 THEN 940
920 IF B(Y)=2 THEN 970
925 IF A(Y)=2 THEN 960
940 D(Y)=1
945 GOTO 300
950 H(Y)=1
955 GOTO 300
960 A(Y)=1
965 GOTO 300
970 B(Y)=1
975 GOTO 300
980 C(Y)=1
985 GOTO 300
990 L(Y)=1
995 GOTO 300
1000 PRINT
1005 PRINT "*** ENJOY YOUR PURCHASE!! ***"
1010 GOTO 300
1020 IF K2<1 THEN 900
1025 K1=K1+1
1030 IF K1<3 THEN 900
1032 IF K1>3 THEN 9010
1035 PRINT
1040 PRINT "IF THE NEXT PURCHASE IS REJECTED":PRINT"THEN THE GAME IS OVER!"
1045 GOTO 300
1100 IF H(Y)=2 THEN 1110
1101 IF C(Y)=2 THEN 1112
1102 IF L(Y)=2 THEN 1114
1103 IF D(Y)=2 THEN 1116
1104 IF B(Y)=2 THEN 1118
1105 IF A(Y)=2 THEN 1120
1106 G8=0
1107 S=0
1108 GOTO 300
1109 IF A(Y)=2 THEN 1120
1110 H(Y)=3
1111 GOTO 1000
1112 C(Y)=3
1113 GOTO 1000
1114 L(Y)=3
1115 GOTO 1000
1116 D(Y)=3
1117 GOTO 1000
1118 B(Y)=3
1119 GOTO 1000
1120 A(Y)=3
1121 GOTO 1000
1150 M=RND(0)
1155 IF M>.85 THEN 2500
1160 K1=0
1165 K2=0
1170 V2=V2+1
1180 PRINT "WHAT WILL YOU BE SELLING?"
1205 PRINT "L - LUXURY HOME      S - STORE"
1215 PRINT "P - PROPERTY         H - HOTEL"
1225 PRINT "C - COMPANY SHARES   R - RAIL"
1235 PRINT "N - NOTHING"
1241 INPUT "SELECTION";K$
1245 IF K$="N" THEN 300
1247 X=RND(0)
1250 PRINT "NUMBER",
1255 INPUT I
1260 IF K$="L" THEN 1300
1265 IF K$="P" THEN 1310
1270 IF K$="S" THEN 1320
1275 IF K$="H" THEN 1330
1280 IF K$="C" THEN 1340
1285 IF K$="R" THEN 1350
1290 GOTO 1180
1300 IF H(I)<2 THEN 1420
1302 Z$="LUXURY HOME #"
1304 W=(X+.5)*400000
1306 GOTO 1360
1310 IF C(I)<2 THEN 1420
1312 Z$="PROPERTY #"
1314 W=(X+.1)*800000
1316 GOTO 1360
1320 IF L(I)<2 THEN 1420
1322 Z$="STORE #"
1324 W=(X+.25)*1E+06
1326 GOTO 1360
1330 IF D(I)<2 THEN 1420
1332 Z$="HOTEL #"
1334 W=(X+.5)*1E+06
1336 GOTO 1360
1340 IF B(I)<2 THEN 1420
1342 Z$="SHARES IN COMPANY #"
1344 W=(X+.1)*1.5E+06
1346 GOTO 1360
1350 IF A(I)<2 THEN 1420
1352 Z$="RAILWAY FACILITY #"
1354 W=(X+.5)*1.5E+06
1360 PRINT "FOR ";Z$;I
1361 PRINT "YOU MIGHT GET $";INT(W*100)/100
1365 PRINT "DO YOU WANT TO SELL";
1370 INPUT E$
1375 IF LEFT$(E$,1)<>"Y" THEN 1550
1376 V1=0
1377 GOTO 2200
1380 G=G+W
1385 PRINT
1390 PRINT "NET WORTH IS":PRINT"$";INT(G*100)/100
1395 PRINT
1400 GOTO 1800
1420 PRINT "YOU DON'T OWN IT!"
1425 PRINT
1430 GOTO 1180
1500 PRINT "YOU OWN:"
1501 PRINT "HOME #: ";
1502 FOR I=1 TO H
1503 IF H(I)<3 THEN 1505
1504 PRINT STR$(I);
1505 NEXT I
1508 PRINT
1509 PRINT "PROPERTY #:";
1510 FOR I=1 TO C
1511 IF C(I)<3 THEN 1513
1512 PRINT STR$(I);
1513 NEXT I
1514 PRINT
1515 PRINT "STORE #:";
1516 FOR I=1 TO L
1517 IF L(I)<3 THEN 1520
1518 PRINT STR$(I);
1520 NEXT I
1521 PRINT
1522 PRINT "HOTEL #:";
1523 FOR I=1 TO D
1524 IF D(I)<3 THEN 1526
1525 PRINT STR$(I);
1526 NEXT I
1527 PRINT
1528 PRINT "SHARES IN COMPANY #:";
1529 FOR I=1 TO B
1530 IF B(I)<3 THEN 1532
1531 PRINT STR$(I);
1532 NEXT I
1533 PRINT
1534 PRINT "RAILWAY FACILITY #:";
1535 FOR I=1 TO A
1536 IF A(I)<3 THEN 1538
1537 PRINT STR$(I);
1538 NEXT I
1539 PRINT
1540 IF R$="S" THEN 1545
1542 GOSUB 4000
1545 RETURN
1550 IF V2<1 THEN 1542
1555 V1=V1+1
1560 IF V1<2 THEN 1542
1565 IF V1>2 THEN 1585
1570 PRINT
1575 PRINT "IF YOU REJECT THE NEXT SALE,":PRINT"IT WILL BE EXPROPRIATED!"
1580 GOTO 1542
1585 PRINT
1590 PRINT "** IT HAS BEEN EXPROPRIATED! **"
1592 PRINT
1595 GOTO 1800
1600 K1=0
1601 K2=0
1602 V1=0
1603 V2=0
1604 PRINT
1605 PRINT "MAKE A DEPOSIT";
1610 INPUT K$
1615 IF LEFT$(K$,1)="N" THEN 1700
1620 IF LEFT$(K$,1)="Y" THEN 1630
1625 RETURN
1630 H$="DEPOSIT"
1632 Q=1
1635 PRINT
1640 PRINT "HOW MUCH FOR THE ";H$;"?"
1645 INPUT G5
1650 IF Q>1 THEN 1680
1655 IF G<G5 THEN 1690
1660 G=G-G5
1665 G1=G1+G5
1670 GOSUB 4000
1675 RETURN
1680 IF G5>G1 THEN 1696
1682 G5=-G5
1685 GOTO 1660
1690 PRINT
1692 PRINT "YOU ONLY HAVE $";STR$(INT(G*100)/100);"!"
1695 RETURN
1696 PRINT
1697 PRINT "YOU ONLY HAVE $";STR$(INT(G1*100)/100);"!"
1698 RETURN
1700 H$="WITHDRAWL"
1705 PRINT "OR A ";H$;
1710 Q=2
1715 INPUT K$
1720 IF LEFT$(K$,1)="Y" THEN 1635
1721 IF G8=0 THEN 1725
1722 RETURN
1725 PRINT
1730 PRINT "DO YOU WANT A LOAN";
1735 INPUT P$
1740 IF LEFT$(P$,1)<>"Y" THEN 1698
1745 PRINT "AMOUNT OF INTEREST";STR$(INT(Z2*10)/10);"%":
1746 PRINT "FOR A PERIOD OF 2 YEARS."
1750 PRINT "HOW MUCH DO YOU WANT";
1755 INPUT G8
1760 IF G8>2E+07 THEN 1790
1765 G1=G1+G8
1770 GOSUB 4010
1775 RETURN
1790 PRINT "YOUR CREDIT RATING IS TOO LOW."
1791 PRINT "WE CAN'T GIVE YOU THAT MUCH!"
1795 GOTO 1750
1800 IF K$="L" THEN 1840
1805 IF K$="P" THEN 1860
1810 IF K$="S" THEN 1880
1815 IF K$="H" THEN 1900
1820 IF K$="C" THEN 1920
1825 A(I)=1
1830 RETURN
1840 H(I)=1
1850 RETURN
1860 C(I)=1
1870 RETURN
1880 L(I)=1
1890 RETURN
1900 D(I)=1
1910 RETURN
1920 B(I)=1
1930 RETURN
2000 Q=3
2005 IF G1>W THEN 2050
2010 IF G<W THEN 820
2015 PRINT "YOUR BANK ACCOUNT IS AT ITS":PRINT"LIMIT.  YOU MUST PAY CASH."
2020 GOTO 700
2050 G5=-W
2052 GOSUB 1665
2055 GOTO 1100
2200 IF X<.5 THEN 1380
2205 Y=RND(0)+.5
2210 IF Y>1 THEN 1380
2215 PRINT "NO PURCHASER FOR THAT PRICE."
2220 RETURN
2300 PRINT
2301 PRINT "SOMEHOW YOU END UP AT A CASINO!"
2302 PRINT
2305 PRINT "HOPE YOU HAVE ENOUGH MONEY."
2306 IF SN=1 THEN FORZZ=1TO55:FORZ3=1TOZZ:NEXT:SOUND100,1:NEXT:SOUND150,1:SOUND200,1
2310 Y=RND(0)+.1
2315 IF Y>.5 THEN 2350
2320 PRINT
2325 Y=Y*500000
2330 G=G+Y
2335 PRINT "YOU WON $";STR$(INT(Y*100)/100);"!"
2336 PRINT "COME BACK AGAIN SOON!"
2337 IF R$="S" THEN 2220
2340 GOTO 300
2350 Y=Y*350000
2355 IF G<Y THEN 2400
2360 G=G-Y
2365 PRINT "YOU LOST $";STR$(INT(Y*100)/100);"!"
2370 PRINT "BETTER LUCK NEXT TIME!"
2375 GOTO 300
2400 PRINT
2405 PRINT "YOU LOST $";INT(Y*100)/100:PRINT"BUT DON'T HAVE THE CASH TO PAY!"
2410 IF G1<Y THEN 9000
2415 PRINT
2420 PRINT "YOU MUST MAKE A WITHDRAWAL FROM":PRINT"YOUR BANK ACCOUNT!"
2425 PRINT
2430 G1=G1-Y
2435 GOTO 300
2500 IF M>.88 THEN 2300
2505 PRINT
2510 PRINT "YOUR UNCLE IN AMERICA HAS DIED."
2515 O=(RND(0)-.2)*3E+06
2520 PRINT
2525 IF O>0 THEN 2600
2530 PRINT "HE HAS LEFT YOU WITH":PRINT"LIABILITIES OF $";STR$(INT(O*100)/100);"!"
2535 PRINT
2540 Y=1
2545 W=-O
2550 GOTO 700
2600 PRINT "YOU INHERITED $";STR$(INT(O*100)/100);"!"
2605 PRINT
2610 G=G+O
2615 GOSUB 4000
2620 RETURN
2900 PRINT
2905 G8=G8+(G8*Z2)/100
2910 PRINT "YOUR BANK LOAN IS DUE!"
2915 PRINT "YOU OWE $";INT(G8*100)/100
2920 PRINT
2925 GOTO 3120
3000 PRINT
3005 PRINT "THIS YEAR'S INTEREST OF":PRINT"$";INT(((G1*Z1)/100)*100)/100
3006 PRINT "WILL BE CREDITED TO YOUR":PRINT"BANK ACCOUNT."
3010 PRINT
3015 G1=G1+(G1*Z1)/100
3020 T=0
3025 GOSUB 4010
3030 GOTO 300
3050 G8=G8+(G8*(Z2*.85))/100
3055 GOTO 3102
3100 IF S<49 THEN 3050
3102 IF S>52 THEN 3200
3103 G8=G8+(G8*(Z2/52))/100
3105 PRINT
3110 PRINT "YOUR LOAN WILL BE CALLED AT":PRINT"THE END OF THE NEXT PERIOD!"
3115 PRINT "YOU CURRENTLY OWE $";INT(G8*100)/100
3117 PRINT
3120 PRINT "DO YOU WISH TO REPAY NOW";
3125 INPUT P$
3130 IF LEFT$(P$,1)="Y" THEN 3180
3135 GOTO 330
3180 W=G8
3190 Y=1
3195 GOTO 700
3200 IF S>53 THEN 3300
3205 PRINT
3210 PRINT "LAST LOAN PAYMENT REMINDER!"
3215 PRINT
3220 GOTO 3115
3300 PRINT
3305 PRINT "LOAN NOT REPAID!"
3310 PRINT
3315 GOTO 9000
4000 PRINT
4005 PRINT "NET CASH WORTH $";INT(G*100)/100
4010 PRINT "YOUR BANK BALANCE $";INT(G1*100)/100
4015 IF G8>0 THEN 4050
4020 PRINT
4025 RETURN
4050 IF G8=W THEN 4020
4055 PRINT "YOU HAVE AN UNCLEARED CREDIT OF $";INT(G8*100)/100
4060 GOTO 4020
5000 PRINT:PRINT:INPUT"LOAD HIGH SCORES";I$
5001 IF LEFT$(I$,1)="Y" THEN PRINT"PLAY TAPE NOW":LOAD*P,"MONODAT"
5045 PRINT
5050 PRINT "PLEASE ENTER YOUR INITIALS";
5055 INPUT A$
5060 IF LEN(A$)=0 THEN 5050
5065 F1$=RIGHT$("   "+A$,3)
5070 GOTO 200
8000 REM *** END ***
8005 P1=0:A$="":GOSUB9072:G4=INT(G3/1000)/1000:FOR I=1 TO 10
8010 IF Z>P(1,1,I) THEN P1=I:GOSUB 8100:I=10:GOTO8020
8020 NEXT
8030 IF P1=0 THEN 9500
8035 IF P1>3 THEN 8050
8040 PRINT
8045 PRINT "*** CONGRATULATIONS! ***"
8050 PRINT "YOUR POSITION IS: ";P1
8070 INPUT"SAVE HIGH SCORES";I$
8080 IF LEFT$(I$,1)="Y" THEN INPUT"READY TAPE AND HIT ENTER";I$:SAVE*P,"MONODAT"
8090 GOTO9500
8100 GOSUB8200
8110 P(1,1,I)=INT(Z*100)/100
8115 P(1,2,I)=G4
8120 P(0,1,I)=ASC(MID$(F1$,1,1))
8125 P(0,2,I)=ASC(MID$(F1$,2,1))
8130 P(0,3,I)=ASC(MID$(F1$,3,1))
8135 P(2,1,I)=ASC(MID$(D1$,1,1)):P(3,1,I)=ASC(MID$(D1$,2,1))
8140 P(2,2,I)=ASC(MID$(D1$,4,1)):P(3,2,I)=ASC(MID$(D1$,5,1))
8145 P(2,3,I)=ASC(MID$(D1$,7,1)):P(3,3,I)=ASC(MID$(D1$,8,1))
8150 RETURN
8200 IF I=10 THEN RETURN
8210 FOR J=10 TO I+1 STEP -1:FOR W1=0 TO 3:FOR W2=1 TO 3
8220 P(W1,W2,J)=P(W1,W2,J-1):NEXT:NEXT:NEXT:RETURN
9000 PRINT
9005 PRINT "*** YOU ARE INSOLVENT! ***"
9010 PRINT
9015 PRINT "*** THIS GAME IS OVER! ***"
9020 PRINT
9022 GOTO 8000
9025 REM LIST HIGH SCORES
9030 FOR I=1 TO 10
9035 PRINT RIGHT$("  "+STR$(I),2);".";
9040 PRINT P(1,1,I);CHR$(P(0,1,I));CHR$(P(0,2,I));CHR$(P(0,3,I));P(1,2,I);
9050 PRINTCHR$(P(2,1,I));CHR$(P(3,1,I));"/";CHR$(P(2,2,I));CHR$(P(3,2,I));"/";CHR$(P(2,3,I));CHR$(P(3,3,I))
9065 NEXT I
9070 PRINT
9072 Z=0
9075 FOR I=1 TO H
9080 IF H(I)<3 THEN 9090
9085 Z=Z+400000
9090 NEXT I
9095 FOR I=1 TO C
9100 IF C(I)<3 THEN 9110
9105 Z=Z+480000
9110 NEXT I
9115 FOR I=1 TO L
9120 IF L(I)<3 THEN 9130
9125 Z=Z+750000
9130 NEXT I
9135 FOR I=1 TO D
9140 IF D(I)<3 THEN 9150
9145 Z=Z+500000
9150 NEXT I
9155 FOR I=1 TO B
9160 IF B(I)<3 THEN 9170
9165 Z=Z+500000
9170 NEXT I
9175 FOR I=1 TO A
9180 IF A(I)<3 THEN 9190
9185 Z=Z+2E+06
9190 NEXT I
9200 Z=Z+G+G1-G8
9205 Z=(Z/G3)*1000
9210 PRINT "CURRENT SHARE VALUE:";INT(Z*100)/100
9215 RETURN
9250 GOSUB 9025
9255 GOTO 300
9500 PRINT
9505 PRINT "PLAY AGAIN (Y/N)";
9510 INPUT Y$
9515 IF LEFT$(Y$,1)="Y" THEN 15
9520 PRINT
9525 PRINT "*** BUSINESS -xxxxx- CLOSED ***"
9530 PRINT
9540 END
10000 PRINT "--------------------------------";
10010 PRINT "HOME LAND STORE HOTEL COMP RAIL ";
10020 PRINT "--------------------------------";
10030 FOR H1=1 TO H
10040 IF H(H1)<3 THEN PRINT RIGHT$("   "+STR$(H1)+"   ",5);:GOTO 10042
10041 PRINT "     ";
10042 IF C(H1)<3 THEN PRINT RIGHT$("   "+STR$(H1)+"   ",5);:GOTO 10044
10043 PRINT "     ";
10044 IF H1>L GOTO 10085
10045 IF L(H1)<3 THEN PRINT RIGHT$("    "+STR$(H1)+"   ",6);:GOTO 10050
10046 PRINT "      ";
10050 IF H1>D GOTO 10090
10051 IF D(H1)<3 THEN PRINT RIGHT$("    "+STR$(H1)+"   ",6);:GOTO 10053
10052 PRINT "      ";
10053 IF H1>B GOTO 10093
10054 IF B(H1)<3 THEN PRINT RIGHT$("    "+STR$(H1)+"   ",6);:GOTO 10060
10055 PRINT "      ";
10060 IF H1>A GOTO 10095
10061 IF A(H1)<3 THEN PRINT RIGHT$("  "+STR$(H1)+"   ",4);:GOTO 10068
10062 PRINT "    ";
10068 GOTO 10098
10085 PRINT "      ";
10090 PRINT "      ";
10093 PRINT "      ";
10095 PRINT "    ";
10098 IFH1=12THENGOSUB10130
10099 NEXT H1:PRINT
10120 RETURN
10130 PRINT"PRESS ANY KEY TO CONTINUE";
10140 IFINKEY$=""THENR=RND(1000):GOTO10140
10150 FORZZ=1TO25:PRINTCHR$(8);:NEXT:RETURN