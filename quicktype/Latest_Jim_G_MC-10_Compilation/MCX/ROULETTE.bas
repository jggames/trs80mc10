0 DIM B(37),C(37),J(28),K(28),T(37),U(37),V(37),W(37),O(37),R(36),P(11):CLS:MC=16384:GOTO75
10 FORZZ=1TOT:NEXT:RETURN
11 DATA16807,113,16807,113,16774,114,16775,112,16741,113,16742,116,16709,115,16710,113,16676,121,16676,121,16643,114
13 DATA16644,114,16611,113,16612,120,16579,114,16580,121,16548,119,16548,119,16516,114,16517,120,16486,113
22 DATA16487,114,16455,115,16456,117,16425,115,16425,115,16394,114,16395,118,16398,112,16398,112
31 DATA16433,115,16434,114,16467,113,16468,117,16501,113,16502,121,16534,116,16534,116,16567,114
40 DATA16568,113,16600,114,16600,114,16631,114,16632,117,16663,113,16664,119,16695,115,16696,116
49 DATA16726,118,16726,118,16757,114,16758,119,16789,113,16790,115,16820,115,16821,118,16851,113
58 DATA16852,113,16849,115,16881,112,16848,120,16848,120,16847,114,16879,115,16846,113,16878,112
67 DATA16845,117,16845,117,16844,114,16876,116,16843,113,16875,118,16840,115,16841,115
75 POKE386,54:X=RND(-(PEEK(9)*256+PEEK(10))):FORX=1TO37:READT(X),U(X),V(X),W(X):NEXT
80 FORX=1TO37:B(X)=0:NEXT
82 DATA 1,2,1,2,1,2,1,2,1,2,2,1,2,1,2,1,2,1,1,2
83 DATA 1,2,1,2,1,2,1,2,2,1,2,1,2,1,2,1,3
84 FORX=1TO37:READC(X):NEXT X
90 PRINT:PRINT::PRINT:PRINTTAB(4)"      .-=**'''**=-."
100 PRINTTAB(4)"   .***'         '***."
110 PRINTTAB(4)" /***/    MC-10    "CHR$(92)"***"CHR$(92)
120 PRINTTAB(4)"(***(    ROULETTE   )***)"
130 PRINTTAB(4)" "CHR$(92)"***"CHR$(92)"    JIM G    /***/"
140 PRINTTAB(4)"   '***.         .***'"
150 PRINTTAB(4)"      '-=*:...:*=-'"
160 DATA 1,20,14,31,9,22,18,29,7,28,12,35,3,26,37,32,15,19
170 DATA 4,21,2,25,17,34,6,27,13,36,11,30,8,23,10,5,24,16,33
180 FOR X=1 TO 37:READ O(X):NEXT
190 PRINT@448,"";
200 INPUT "DO YOU NEED THE RULES";Y$
220 IFY$="N"THEN1000
230 CLS
240 PRINT"WELCOME TO 'MC-ROULETTE'":PRINT
250 PRINT"YOU HAVE JUST PURCHASED $350"
260 PRINT"WORTH OF CHIPS ON YOUR CHARGE"
270 PRINT"CARD FOR THE ROULETTE TABLE."
271 PRINT"4% SALES TAX FOR THE CHIPS IS"
272 PRINT"$14.00 FOR A TOTAL CHARGE OF"
290 PRINT"$364.00 + COATROOM CHARGES"
291 PRINT"WERE $4.00 + .16 TAX AND"
300 PRINT"PROTECTED PARKING WAS $2.00"
310 PRINT"YOU'RE EFFECTIVELY OUT $20.16"
320 GOSUB770:CLS
340 PRINT"*** THE WHEEL IS EUROPEAN ***"
350 PRINT"THERE ARE 37 NUMBERS TO BET ON."
360 PRINT"ONE NUMBER IS GREEN ( 0 ), 18"
361 PRINT"ARE RED, AND 18 ARE BLACK."
370 PRINT"THE WHEEL IS SPUN IN ONE WAY"
380 PRINT"AND THE BALL IS THROWN INTO"
390 PRINT"IT IN THE OPPOSITE DIRECTION."
410 PRINT"BEFORE THE SPIN, YOU WILL""
420 PRINT"PLACE YOUR BET ON THE TABLE."
430 GOSUB770:CLS
450 GOSUB800
460 GOSUB770:CLS
480 PRINT"*SINGLE NUMBERS PAY 35 TO 1*"
490 PRINT"RED/BLACK, HI/LOW, ODD/EVEN"
491 PRINT"ALL PAY EVEN MONEY."
500 PRINT"BETTING ON:"
510 PRINT"ANY 2 NUMBERS = 17 TO 1"
520 PRINT"ANY 3 NUMBERS = 11 TO 1"
530 PRINT"ANY 4 NUMBERS =  8 TO 1"
540 PRINT"ANY 5 NUMBERS =  8 TO 1"
550 PRINT"ANY 6 NUMBERS =  5 TO 1"
560 PRINT"ANY DOZEN     =  2 TO 1"
570 PRINT"ANY COLUMN    =  2 TO 1"
580 GOSUB770:CLS
590 PRINT"WHEN THE BALL STOPS ON THE '0'"
630 PRINT"ANY *EVEN MONEY* YOU'VE BET IS"
640 PRINT"NEITHER WON NOR LOST, BUT IS"
641 PRINT"PLACED 'EN PRISON' UNTIL A NON-"
650 PRINT"ZERO NUMBER APPEARS. IF THE"
660 PRINT"BALL LANDS ON AN EVEN NUMBER"
661 PRINT"DURING THE NEXT SPIN, YOU WIN!"
670 GOSUB770:CLS
680 PRINT"TO SIMPLIFY THE GAME, BETTING"
690 PRINT"ON TWO NUMBERS CAN BE ON *ANY*"
700 PRINT"TWO NUMBERS ON THE BOARD."
701 PRINT"REGULAR 'ROULETTE' REQUIRES"
710 PRINT"PLACING YOUR CHIPS ON THE LINE"
711 PRINT"BETWEEN TWO NUMBERS TO MAKE THIS";
720 PRINT"KIND OF BET. THE SAME WILL HOLD"
730 PRINT"FOR BETS ON 3 NUMBERS, 4, 5, AND";
731 PRINT"6 NUMBER BETS."
740 PRINT"EXIT THE GAME WITH A NEGATIVE"
750 PRINT"NUMBER BET. YOU MAY 'PASS' A"
751 PRINT"TURN BY A BET OF '0' DOLLARS."
760 PRINT"WE ARE NOW READY TO BEGIN..."
765 GOSUB770:GOTO1000
770 PRINT"================================";
780 INPUT"HIT <ENTER> TO SEE MORE";Y$:RETURN
800 CLS:PRINT"*** ROULETTE TABLE ***"
810 PRINT" �1���2���3��"
811 PRINT" �4���5���6��  1ST   1-18" 
812 PRINT" �7���8���9�� DOZEN  EVEN"
813 PRINT" �10��11��12�              LOW"
814 PRINT" �13��14��15�"
815 PRINT" �16��17��18�  2ND    RED"     
816 PRINT" �19��20��21� DOZEN  BLACK "
817 PRINT" �22��23��24�"
818 PRINT" �25��26��27�              HIGH"
819 PRINT" �28��29��30�  3RD    ODD"
920 PRINT" �31��32��33� DOZEN  19-36"
921 PRINT" �34��35��36�"
950 RETURN
960 REM
970 REM
980 REM
990 REM
1000 REM * S T A R T *
1005 REM B = THE BET YOU INPUT
1010 REM B( ) = NO. BET ON  : IF = 0 THEN NO BET PAYOFF
1020 REM        ............: IF > 0 THEN IT'S = PAYOFF ODDS
1030 REM ...C( ) = COLOUR OF THE NUMBER
1035 REM ..........1 = RED    2 = BLACK   3 = GREEN (ZERO)
1040 REM ...J( ),K( ) = BALL (#) CURSOR POSITIONS ON WHEEL
1045 REM ...M = YOUR MONEY SUPPLY.   $350.00 AT START
1050 REM ...N = INPUT FOR CHOOSING NUMBERS TO BET ON
1055 REM .......N1, N2 = NUMBER RANGE YOU'VE PICK TO BET ON
1060 REM ...O = WHICH BETTING OPTION YOU TOOK
1070 REM ...O( ) = ORDER OF NUMBERS ON THE WHEEL
1080 REM ...P( ) = PAYOFF ON EACH OPTION (1 TO 12 OPTIONS)
1090 REM ...R( ) = ORDER OF COLUMN NUMBERS FOR OPTION # 11
1095 REM ...S = STARTING POINT FOR BALL ON THE WHEEL
1100 REM ...T( )-W( ) =  CURSOR POSITIONS ON THE WHEEL
1110 REM ................FOR THE NUMBERED COMPARTMENTS
1120 REM ...Z, Z1, ZZ = SCRATCH #'S
1260 M=350
1270 DATA 23,26,30,33,35,36,37,38,37,36,35,33,30,26,23,19,15
1275 DATA 12,10,9,8,7,8,9,10,12,15,19
1280 DATA 2,2,3,4,5,6,7,8,9,10,11,12,13,14,14,14,13,12,11,10
1285 DATA 9,8,7,6,5,4,3,2
1290 FOR X=1 TO 28:READ K(X):NEXT
1295 FOR X=1 TO 28:READ J(X):NEXT
1300 DATA 35,17,11,8,8,5,1,1,1,2,2
1310 FOR X=1 TO 11:READ P(X):NEXT
1400 DATA 1,4,7,10,13,16,19,22,25,28,31,34
1410 DATA 2,5,8,11,14,17,20,23,26,29,32,35
1420 DATA 3,6,9,12,15,18,21,24,27,30,33,36
1430 FOR X=1 TO 36:READ R(X):NEXT
1900 CLS       :REM INTIAL WHEEL DISPLAY
1910 GOSUB 6000:REM DISPLAY WHEEL
2000 GOSUB 6150:REM MSG: PLACE YOUR BETS
2010 T=2500:GOSUB10:CLS
2020 PRINT"     BET OPTIONS"
2030 PRINT" 0...PASS BETTING"        
2040 PRINT" 1...SINGLE NO. (35-1)"
2050 PRINT" 2...ANY 2 NO'S (17-1)"
2060 PRINT" 3...ANY 3 NO'S (11-1)"
2070 PRINT" 4...ANY 4 NO'S (8-1)"
2071 PRINT" 5...ANY 5 NO'S (8-1)"
2072 PRINT" 6...ANY 6 NO'S (5-1)"
2073 PRINT" 7...RED/BLACK  (1-1)"
2074 PRINT" 8...ODD/EVEN   (1-1)"
2075 PRINT" 9...HIGH/LOW   (1-1)"
2076 PRINT" 10..ANY DOZEN  (2-1)"
2077 PRINT" 11..ANY COLUMN (2-1)"
2085 PRINT" 12..LEAVE THE TABLE"
2090 GOSUB 6100
2100 FOR Z=1 TO 37:B(Z)=0:NEXT
2110 B=0
2120 PRINT@448,"";:INPUT"YOUR BET OPTION (0-12)";O$
2125 IF O$="" THEN O=0:GOTO2130
2126 O=ASC(LEFT$(O$,1))-48
2130 IF LEN(O$)>1 THEN O=(O*10)+(ASC(RIGHT$(O$,1))-48)
2140 IF O=12 THEN9000
2145 IF O>=0 AND O<12 THEN 2200
2150 PRINT@448,"";
2160 PRINT"********* INPUT ERROR ********";
2180 T=3000:GOSUB10
2190 GOTO2000
2200 CLS:IF O=0 THEN  GOSUB 6100:GOTO 3500
2210 IF O>1 THEN2300
2220 PRINT "OPTION 1":PRINT
2230 PRINT "SINGLE NUMBER PAYING 35 TO 1"
2240 INPUT"BET ON WHICH NUMBER";N
2250 IF N=0 THEN N=37:GOTO2260
2251 N=INT(N)
2260 IF N<0 THENGOSUB6400:GOSUB800:GOTO2240
2270 IF N>37 THENGOSUB6400:GOSUB800:GOTO2240
2280 B(N)=35
2300 IF O>6 THEN2400
2310 IF O<2 THEN2400
2311 CLS
2320 PRINT"OPTION";O:PRINT
2330 PRINT"ANY";O;"NUMBERS PAYING";P(O);"TO 1"
2340 FOR Z=1 TO O
2350 PRINT"BET ON WHICH NUMBER";
2355 INPUT N:N=INT(N):IF N=0 THEN N=37
2360 IF N<0 THEN PRINT "### WRONG ###...TRY AGAIN":GOTO 2350
2365 IF N>37 THEN PRINT "### WRONG ###...TRY AGAIN":GOTO 2350
2370 IF B(N)>0 THEN SOUND1,1:PRINT "YOU ALREADY BET ON";N:GOTO 2350
2380 B(N)=P(O)
2390 NEXT
2400 IF O=7 THEN2410
2401 GOTO2500
2410 PRINT"OPTION 7":PRINT
2420 PRINT"RED/BLACK PAYING 1 TO 1"
2430 PRINT" 1...RED"
2440 PRINT" 2...BLACK"
2450 INPUT"PICK RED OR BLACK (1 OR 2)";N
2460 N=INT(N)
2465 IF N>2 OR N<1 THENGOSUB6900:GOTO2450
2470 FOR Z=1 TO 36
2480 IF N=C(Z) THEN B(Z)=P(O)
2490 NEXT
2500 IF O=8 THEN2510
2501 GOTO2600
2510 PRINT"OPTION 8":PRINT
2520 PRINT"ODD/EVEN PAYING 1 TO 1"
2530 PRINT" 1...EVEN"
2540 PRINT" 2...ODD"
2550 INPUT"PICK ODD OR EVEN (1 OR 2)";N
2560 N=INT(N)
2565 IF N>2 OR N<1 THENGOSUB6900:GOTO2550
2566 IFN=2THEN2592
2570 FOR Z=1 TO 36
2580 IF Z/2=INT(Z/2) THEN B(Z)=P(O)
2590 NEXT:GOTO2600
2592 FOR Z=1 TO 36
2593 IF Z/2<>INT(Z/2) THEN B(Z)=P(O)
2594 NEXT
2600 IF O=9 THEN2610
2601 GOTO2700
2610 PRINT"OPTION 9":PRINT
2620 PRINT"HIGH/LOW PAYING 1 TO 1"
2630 PRINT" 1...LOW   (NUMBERS  1-18)"
2640 PRINT" 2...HIGH  (NUMBERS 19-36)"
2650 INPUT"PICK HIGH OR LOW (1 OR 2)";N
2660 N=INT(N)
2665 IF N>2 OR N<1 THENGOSUB6900:GOTO2650
2670 IF N=1 THEN N1=1:N2=18:GOTO2680
2671 N1=19:N2=36
2680 FOR Z=N1 TO N2:B(Z)=P(O):NEXT
2700 IF O=10 THEN2710
2701 GOTO2800
2710 PRINT"OPTION 10":PRINT
2720 PRINT"ANY DOZEN PAYING 2 TO 1"
2730 PRINT"1...1ST DOZEN (NUMBERS  1-12)"
2740 PRINT"2...2ND DOZEN (NUMBERS 13-24)"
2750 PRINT"3...3RD DOZEN (NUMBERS 25-36)"
2760 INPUT"PICK DOZEN (1, 2, OR 3)";N
2765 N=INT(N):N1=25:N2=36
2770 IF N<1 OR N>3 THENGOSUB6900:GOTO2760
2780 IF N=1 THEN N1=1:N2=12
2785 IF N=2 THEN N1=13:N2=24
2790 FOR X=N1 TO N2:B(X)=P(O):NEXT
2800 IF O=11 THEN2810
2801 GOTO 3000
2810 PRINT"OPTION 11":PRINT
2820 PRINT"ANY COLUMN PAYING 2 TO 1"
2825 T=2500:GOSUB10:GOSUB800
2830 PRINT"  1   2   3"
2860 INPUT"PICK COLUMN (1, 2, OR 3)";N
2865 N=INT(N):N1=25:N2=36
2870 IF N<1 OR N>3 THENGOSUB6900:GOTO2830
2880 IF N=1 THEN N1=1:N2=12
2885 IF N=2 THEN N1=13:N2=24
2890 FOR X=N1 TO N2:B(R(X))=P(O):NEXT X
3000 CLS
3020 GOSUB 6100
3030 IF O=0 THEN3500
3040 IF B>M THENGOSUB6200:GOSUB6100:REM === NOT ENOUGH MSG ===
3060 PRINT@224,"";:INPUT"HOW MUCH FOR YOUR BET";B:B=INT(B)
3070 IF B<0 THEN9000
3080 IF B=0 THENCLS:GOSUB6100:GOTO3500
3090 IF B>M THEN3000
3095 M=M-B:GOSUB6100:REM === DISPLAY $ LEFT ===
3200 IFB>99999THENPRINT@12*32+26,"A LOT":GOTO3205
3201 PRINT@12*32+26,"$";MID$(STR$(B),2);
3205 PRINT@13*32+25,"BET ON"
3210 IF O>6 THEN 3300
3220 ZZ=0:FOR X=1 TO 37
3230 IF B(X)=0 THEN3290
3240 IF C(X)=1 THENPRINT@14*32+25,"�";X;"�":IFO>1THENZZ=ZZ+1:PRINT@(4+ZZ)*32+28,X;
3250 IF C(X)=2 THENPRINT@14*32+25,"�";X;"�":IFO>1THENZZ=ZZ+1:PRINT@(4+ZZ)*32+28,X;
3260 IF C(X)=3 THENPRINT@14*32+25,"ZERO ";:IFO>1THENZZ=ZZ+1:PRINT@(4+ZZ)*32+28,0;
3290 NEXT
3300 IF O=7 THENIF N=1 THENPRINT@14*32+25,"RED";
3301 IF O=7 THENIF N<>1THENPRINT@14*32+25,"BLACK";
3310 IF O=8 THENIF N=1 THENPRINT@14*32+25,"EVEN";
3311 IF O=8 THENIF N<>1THENPRINT@14*32+25,"ODD ";
3320 IF O=9 THENIF N=1 THENPRINT@14*32+25,"LOW ";
3321 IF O=9 THENIF N<>1 THEN PRINT@14*32+25,"HIGH";
3330 IF O=10 THENPRINT@14*32+25,"DOZ#";STR$(N);
3340 IF O=11 THENPRINT@14*32+25,"COL#";STR$(N);
3350 T=2500:GOSUB10
3370 GOSUB6100
3500 FORZZ=5TO11:PRINT@32*ZZ,"                            ";:NEXT
3510 PRINT@224,"*** NO MORE BETS ***";
3515 T=2500:GOSUB10
3520 X=RND(28):REM === WHEEL STARTING POINT ===
3530 S=RND(37):REM === BALL STARTING POINT ===
3550 REM === NUMBERED WHEEL LAYOUT ===
3560 GOSUB6000
3700 GOSUB6040:REM === LAYOUT WHEEL SPOKES ===
3710 T=1000:GOSUB10:T=1
3740 GOSUB6500:GOSUB6700:REM === SPIN SPOKES ===
4000 X=S
4100 X=X+1:IFX>37THENX=1
4150 POKET(X),U(X):POKEV(X),W(X):GOSUB6430
4160 IFRND(0)<((.97)-(T*.09))THENGOSUB10:GOTO4200
4170 T=T+1:GOSUB6500
4190 IFT>10THEN4500
4200 SOUND100,1:POKET(X),U(X)-64:POKEV(X),W(X)-64:GOSUB6040
4280 GOTO4100
4500 PRINT@0*32+23,"WINNER"
4510 IF O(X)<37 THEN PRINT@1*32+25,O(X)
4520 IF C(O(X))=1 THEN PRINT@2*32+25,"RED":GOTO 4700
4530 IF C(O(X))=2 THEN PRINT@2*32+25,"BLACK":GOTO 4700
4540 IF C(O(X))=3 THEN PRINT@2*32+25,"GREEN":PRINT@1*32+25,"ZERO "
4600 IF O=8 THEN4610
4601 GOTO4700
4610 IF N=2 THEN4700
4620 PRINT@0*32,"MUST";
4630 PRINT@1*32,"SPIN";
4640 PRINT@2*32,"AGAIN";
4641 PRINT@14*32,"EVEN";
4642 PRINT@15*32,"BET";
4650 T=2500:GOSUB10
4660 PRINT@0*32,"     ";
4670 PRINT@1*32,"     ";
4680 PRINT@2*32,"     ";
4690 GOSUB6660:CLS:GOTO3500
4700 IF B(O(X))>0 THENGOSUB6600:REM === YOU WON !!! ===
4710 T=2500:GOSUB10
4720 IF M<=0 THEN5000:T=2500:GOSUB10:GOTO 9000
4790 GOTO2000
5000 PRINT@0*32+23,"  YOU'RE"
5010 PRINT@1*32+25,"OUT OF"
5011 PRINT@2*32+25,"MONEY"
5020 T=2500:GOSUB10
5090 GOTO9000
6000 PRINT@0*32,"����������26� 0 �������";
6002 PRINT@1*32,"���������3���   �32����";
6003 PRINT@2*32,"�������35����������15����";
6004 PRINT@3*32,"������12�������������19��";
6005 PRINT@4*32,"����28����������������4���";
6006 PRINT@5*32,"����7������������������21��";
6007 PRINT@6*32,"� �29�������������������2��";
6008 PRINT@7*32,"� �18������������������25��";
6009 PRINT@8*32,"� �22������������������17��";
6010 PRINT@9*32,"����9������������������34��";
6011 PRINT@10*32,"�����31���������������6����";
6012 PRINT@11*32,"�����14��������������27���";
6013 PRINT@12*32,"������20�������������13���";
6014 PRINT@13*32,"�������1������������36���";
6015 PRINT@14*32,"��������33�1251283�11���";
6016 PRINT@15*32,"�����������64�03�0�����";
6020 FORX=1TO37:POKET(X),U(X)-64:POKEV(X),W(X)-64:NEXT
6040 PRINT@7*32+11,"===@===";
6050 PRINT@6*32+11,"   I   ";
6060 PRINT@5*32+11,"   I   ";
6070 PRINT@8*32+11,"   I   ";
6080 PRINT@9*32+11,"   I   ";
6090 RETURN
6100 REM ============== MONEY DISPLAY =============
6110 PRINT@0*32+23," $";MID$(STR$(INT(M)),2)
6120 PRINT@1*32+25,"MONEY"
6130 PRINT@2*32+25,"====="
6131 PRINT@3*32+25,"     "
6140 RETURN
6150 PRINT@0*32+23,"  PLEASE"
6160 PRINT@1*32+25,"PLACE"
6161 PRINT@2*32+25,"YOUR"
6162 PRINT@3*32+25,"BETS"
6190 RETURN
6200 PRINT@0*32+23,"  NOT"
6210 PRINT@1*32+25,"ENOUGH
6211 PRINT@2*32+25,"MONEY":PRINT@3*32+25,"     ":T=2500:GOSUB10
6220 RETURN
6400 PRINT@448,"*** TRY AGAIN ***";:T=2000:GOSUB10
6410 PRINT@448,"                 ";
6420 RETURN
6430 PRINT@7*32+11,"   @   ";
6440 PRINT@5*32+12,CHR$(92)"   /";
6450 PRINT@6*32+12," "CHR$(92)" /";
6460 PRINT@8*32+12," / "CHR$(92);
6470 PRINT@9*32+12,"/   "CHR$(92);:RETURN
6500 FOR Z1=1 TO 11-T
6520 GOSUB6430
6585 GOSUB6700:REM === SLOWDOWN OF SPIN DISPLAY ===
6586 GOSUB6040
6590 NEXT
6595 RETURN
6600 PRINT@0*32,"YOU";:PRINT@1*32,"WIN!";
6610 PRINT@15*32,"$";MID$(STR$(INT(B*B(O(X)))),2);
6620 M=M+B+(B*B(O(X))):T=2500:GOSUB10
6640 GOSUB6100:REM === DISPLAY $ WON ===
6650 T=2500:GOSUB10
6660 PRINT@0*32,"       ";
6670 PRINT@1*32,"     ";
6671 PRINT@15*32,"      ";     
6680 T=2500:GOSUB10
6690 RETURN
6700 FOR ZZ=1 TO T*10
6770 NEXT ZZ
6790 RETURN
6900 CLS:GOSUB800:RETURN
9000 CLS
9010 PRINT"*** END OF GAME ***"
9020 IF INT(M)=370 THENPRINT "YOU BROKE EVEN":GOTO9030
9021 GOTO9100
9030 PRINT"YOU LEAVE WITH $";INT(M);
9090 GOTO9500
9100 IF M>370 THEN9110
9101 GOTO9200
9110 PRINT"*** OH WOW !!!! ***"
9120 PRINT"YOU'RE A WINNER !!!"
9130 PRINT"YOU LEAVE WITH $";INT(M);
9190 GOTO9500
9200 IF M<350 THEN9210
9201 GOTO9300
9210 PRINT"*** BETTER LUCK NEXT TIME ***"
9230 PRINT"YOU LEAVE WITH $";INT(M)
9290 GOTO9500
9300 IF M<350 THEN9500
9310 IF M>370 THEN9500
9320 PRINT"*  YOU DID O.K.  *"
9330 PRINT"YOU LEAVE WITH $";INT(M)
9500 PRINT:PRINT:POKE386,15
9510 END
