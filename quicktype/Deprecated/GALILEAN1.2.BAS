10   '**********************************************                            
20   '*          SATELLITES OF JUPITER             *                            
30   '*                Version 1.2                 *                            
40   '*                  2.6.1991                  *                            
50   '**********************************************                            
60   :                                                                          
70   DIM Z$(4),B$(4),Y$(4),M$(2),DA$(2),LT$(5)                                  
80   DIM TZ$(2),ND$(1),IN$(1)                                                   
90   :                                                                          
100  CLS: PRINT: PRINT: PRINT: PRINT                                            
110  PRINT "        AN ASTRONOMY PROGRAM"                                       
120  PRINT "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"                              
130  PRINT "³        GALILEAN SATELLITES        ³"                              
140  PRINT "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"                              
150  PRINT :PRINT                                                               
160  PRINT "     By Eric Burgess F.R.A.S."                                      
170  PRINT "          Version Apr.82"                                           
180  PRINT "      All rights reserved by"                                       
190  PRINT "      S & T Software Service"                                       
200  PRINT "   Edited by Earl W. Phillips, Jr"                                  
210  PRINT "             19.09.89."                                             
220  PRINT "  Reedited for Microsoft GWBasic by"                                
230  PRINT "           Veikko M„kel„"                                           
240  PRINT "             02.06.91."                                             
250  PRINT: PRINT                                                               
260  FOR K=10000 TO 1 STEP-1: NEXT                                              
270  :                                                                          
280  CLS: PRINT: PRINT: PRINT: PRINT                                            
290  PRINT "This  program  shows  the  Galilean"                                    
300  PRINT "satellites  positioned  relative  to"                                     
310  PRINT "Jupiter at their approximate relative"                                    
320  PRINT "positions"                                                 
330  PRINT:PRINT                                                                
340  PRINT "You can chose to have them shown with"                              
350  PRINT "north at the top, or with south at the"                             
360  PRINT "top as seen  in a telescope,  and you"                                
370  PRINT "can select up to five displays of their"                            
380  PRINT "configurations at up to 24 hours apart"                             
390  PRINT:PRINT:PRINT                                                          
400  INPUT "Do you want south at top (Y/N)? ";A$                                
410  IF A$="Y" OR A$="y" THEN FL=1: GOTO 450                                    
420  IF A$<>"N" AND A$<>"n" THEN PRINT "Invalid response": PRINT: GOTO 400      
430  FL=0                                                                       
440  :                                                                          
450  DEF FN RAD(X)=(X)*3.14159/180                                              
460  CLS:PRINT:PRINT:PRINT                                                      
470  'Enter date                                                                
480  :                                                                          
490  :                                                                          
500  LY=0                                                                       
510  PRINT "Enter the date:"                                                    
520  PRINT:PRINT                                                                
530  INPUT "Year                  ";Y$:Y=VAL(Y$)                                
540  IF Y=0 THEN PRINT "Invalid response": PRINT: GOTO 530                      
550  IF Y/4-INT(Y/4)=0 AND Y/100-INT(Y/100)<>0 THEN LY=1                        
560  INPUT "Month                 ";M$                                          
570  M=VAL(M$)                                                                  
580  IF M=0 OR M>12 THEN PRINT "Invalid response": PRINT: GOTO 560              
590  INPUT "Day                   ";D$:DA=VAL(D$)                               
600  IF DA=0 OR DA>31 THEN PRINT "Invalid response": PRINT: GOTO 590            
610  IF LY=1 AND M=2 AND DA<30 THEN GOTO 650                                    
620  IF LY=0 AND M=2 AND DA<29 THEN GOTO 650                                    
630  IF M<>2 THEN GOTO 650                                                      
640  PRINT "Invalid response": PRINT: GOTO 590                                  
650  INPUT "Time zone             ";TZ$:TZ=VAL(TZ$)                             
660  IF TZ<-12 OR TZ>12 THEN PRINT "Invalid response": PRINT: GOTO 650          
670  INPUT "Local time (dec.hrs.) ";LT$                                         
680  LT=VAL(LT$)                                                                
690  IF LT<0 OR LT>24 THEN PRINT "Invalid response": PRINT: GOTO 670            
700  PRINT                                                                      
710  INPUT "How many displays (1 to 5)?     ";ND$: ND=VAL(ND$)                  
720  IF ND<1 OR ND>5 THEN PRINT "Invalid response": PRINT: GOTO 710             
730  INPUT "What is interval (up to 24 hr)? ";IN                                
740  IF IN<0 OR IN>24 THEN PRINT "Invalid response": PRINT: GOTO 730            
750  CLS: PRINT: PRINT: PRINT                                                   
760  PRINT "Program running....please wait"                                     
770  L=1                                                                        
780  YP=Y: MP=M: DP=DA                                                            
790  IF L>1 GOTO 820                                                            
800  UT=LT+TZ                                                                   
810  :                                                                          
820  'Correct for day month and yr ends                                         
830  :                                                                          
840  IF UT>24 THEN UT=UT-24: DA=DA+1                                             
850  IF (LY=1 AND M=2 AND DA=30) THEN M=3: DA=1: GOTO 900                       
860  IF (LY=0 AND M=2 AND DA=29) THEN M=3: DA=1: GOTO 900                       
870  IF DA<31 GOTO 900                                                          
880  IF (M=4 OR M=6 OR M=9 OR M=11) THEN M=M+1: DA=1: GOTO 900                  
890  IF DA>31 THEN M=M+1: DA=1                                                  
900  IF M=13 THEN M=1: Y=Y+1                                                    
910  IF FL=1 THEN 930                                                           
920  YP=Y: MP=M: DP=DA                                                          
930  T=UT/24                                                                    
940  YC=Y: MC=M: DC=DA+T                                                        
950  IF MC>2 THEN 980                                                           
960  YC=Y-1                                                                     
970  MC=M+12                                                                    
980  TD=INT(365.2422*YC)+INT((MC+1)*30.6001)+DC                                 
990  :                                                                          
1000 YZ=INT(YC/100)
1010 :
1020 'Calc days since 1900 epoch
1030 :
1040 I=TD-YZ+2+INT(YZ/4)-694025.5
1050 :
1060 'Deg/day*numbr days + postn at epoch
1070 :
1080 A=I*203.40586#+84.55061
1090 ZZ=A: GOSUB 2550
1100 A=ZZ
1110 B=I*101.2916323#+41.50155
1120 ZZ=B:GOSUB 2550
1130 B=ZZ
1140 C=I*50.22571780750001#+109.9594416067791#
1150 ZZ=C: GOSUB 2550
1160 C=ZZ
1170 D=I*21.48798021#+176.3586094824219#
1180 ZZ=D: GOSUB 2550
1190 D=ZZ
1200 :
1210 'Orbital motion in period
1220 'Earth and Jupiter
1230 :
1240 P1=I*.9856003+358.476
1250 ZZ=P1: GOSUB 2550
1260 P1=ZZ
1270 I2=I*8.308528E-02+225.3279
1280 ZZ=I2: GOSUB 2550:I2=ZZ
1290 P2=I*.9025179+221.647
1300 ZZ=P2: GOSUB 2550
1310 P2=ZZ
1320 P2=P2+(SIN(FN RAD(2*P1))/50)+(SIN(FN RAD(P1))/.5210001)
1330 P3=(SIN(FN RAD(2*I2))*.1673)+(SIN(FN RAD(I2))*5.5372)
1340 P2=P2-P3
1350 P1=SQR(28.07-(COS(FN RAD(P2))*10.40599))
1360 J=(SIN(FN RAD(P2))/P1)
1370 I3=57.2958*(ATN((SIN(FN RAD(J)))/SQR(1-(SIN(FN RAD(J))) ^ 2)))
1380 I3=I3*57.2958
1390 P1=P1/173
1400 :
1410 'Calc radial distance from Jupiter
1420 :
1430 S1=5.904897*SIN(FN RAD(A+I3-P3-(P1*203.405863#)))
1440 S2=9.397001*SIN(FN RAD(B+I3-P3-(P1*101.2916323#)))
1450 S3=14.9885*SIN(FN RAD(C+I3-P3-(P1*50.2257278075#)))
1460 S4=26.364*SIN(FN RAD(D+I3-P3-(P1*21.48798021#)))
1470 IF FL<>1 THEN GOTO 1560
1480 IF S1<0 THEN S1=0+ABS(S1): GOTO 1500
1490 IF S1>0 THEN S1=0-ABS(S1)
1500 IF S2<0 THEN S2=0+ABS(S2): GOTO 1520
1510 IF S2>0 THEN S2=0-ABS(S2)
1520 IF S3<0 THEN S3=0+ABS(S3): GOTO 1540
1530 IF S3>0 THEN S3=0-ABS(S3)
1540 IF S4<0 THEN S4=0+ABS(S4): GOTO 1560
1550 IF S4>0 THEN S4=0-ABS(S4)
1560 IF L>1 THEN GOTO 1780
1570 CLS: PRINT: PRINT: PRINT
1580 PRINT "Distance in terms of Jupiter radii"
1590 PRINT "which is 71,100 km or 44,180 mi"
1600 PRINT
1610 PRINT "For date ";YP;" ";MP;" ";DP;" at ";LT;" hrs time zone ";TZ
1620 PRINT "For date ";Y;" ";M;" ";DA;" at ";UT;" hrs UT"
1630 EM=M
1640 PRINT:PRINT
1650 PRINT " Io (I)..............";S1
1660 PRINT " Europa (E)..........";S2
1670 PRINT " Ganymede (G)........";S3
1680 PRINT " Callisto (C)........";S4
1690 PRINT:PRINT
1700 PRINT "minus is to the left of Jupiter"
1710 PRINT "     plus is to the right"
1720 PRINT
1730 IF FL=1 THEN PRINT "       with S at the top ": GOTO 1750
1740 PRINT "       with N at the top"
1750 PRINT: PRINT
1760 INPUT "For graphic display press RETURN";A$
1770 CLS
1780 GOSUB 2350
1790 :
1800 'Regenerate LMT
1810 :
1820 LT=UT-TZ
1830 IF LT>0 THEN GOTO 1910
1840 DP=DA-1: LT=LT+24: IF DP>0 THEN 1910
1850 IF DP<1 THEN MP=EM-1
1860 IF (LY=1 AND MP=2)THEN DP=29: GOTO 1910
1870 IF (LY=0 AND MP=2)THEN DP=28: GOTO 1910
1880 IF (MP=4 OR MP=6 OR MP=9 OR MP=11) THEN DP=30: GOTO 1910
1890 DP=31
1900 PRINT
1910 IF MP=0 THEN MP=12: YP=Y-1
1920 IF L>1 THEN GOTO 1980
1930 IF FL=1 THEN PRINT "                  S": GOTO 1950
1940 PRINT "                  N"
1950 PRINT "    Jupiter...J   ³   Io.......I"
1960 PRINT "    Europa....E   ³   Ganymede.G"
1970 PRINT "    Callisto..C   ³"
1980 PRINT "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
1990 PRINT YP;" ";MP" ";DP;" at ";LT;" hr zone ";TZ
2000 PRINT "........... UT ";UT;" hrs ";EM;" ";DA
2010 PRINT
2020 M1=20+INT(.7*VAL(B$(0)))
2030 PRINT TAB(M1);RIGHT$(B$(0),1);
2040 M2=20+INT(.7*VAL(B$(1)))
2050 PRINT TAB(M2);RIGHT$(B$(1),1);
2060 M3=20+INT(.7*VAL(B$(2)))
2070 PRINT TAB(M3);RIGHT$(B$(2),1);
2080 M4=20+INT(.7*VAL(B$(3)))
2090 PRINT TAB(M4);RIGHT$(B$(3),1);
2100 M5=20+INT(.7*VAL(B$(4)))
2110 PRINT TAB(M5);RIGHT$(B$(4),1)
2120 IF L=ND THEN GOTO 2260
2130 :
2140 'Increment for interval
2150 'and adjust month ends
2160 :
2170 UT=UT+IN
2180 IF UT>24 THEN UT=UT-24: DA=DA+1
2190 IF(LY=1 AND M=2 AND DA=30)THEN M=3:DA=1: GOTO 2240
2200 IF(LY=0 AND M=2 AND DA=29)THEN M=3:DA=1: GOTO 2240
2210 IF DA<31 GOTO 2240
2220 IF(M=4 OR M=6 OR M=9 OR M=11) THEN M=M+1: DA=1: GOTO 2240
2230 IF DA>31 THEN M=M+1: DA=1
2240 IF M=13 THEN M=1: Y=Y+1
2250 L=L+1: GOTO 780
2260 PRINT: PRINT
2270 INPUT "Do you want another date (Y/N)? ";A$
2280 IF A$="N" OR A$="n" THEN GOTO 2320
2290 IF A$<>"Y" AND A$<>"y" THEN PRINT "Invalid response": PRINT: GOTO 2270
2300 CLS
2310 FL=0: GOTO 400
2320 CLS
2330 END
2340 :
2350 'Sub to display satellites
2360 :
2370 Z$(0)=STR$(S1)+"I": Z$(1)=STR$(S2)+"E"
2380 Z$(2)=STR$(S3)+"G": Z$(3)=STR$(S4)+"C"
2390 Z$(4)=STR$(0)+"J"
2400 FOR I=0 TO 4
2410   B$(I)="****"
2420 NEXT I
2430 K=0
2440 FOR I=0 TO 4
2450   IF Z$(I)="****" GOTO 2530
2460   FOR J=1 TO 4
2470     IF Z$(J)="****" GOTO 2490
2480     IF VAL(Z$(J))<VAL(Z$(I)) THEN I=J:GOTO 2490
2490   NEXT J
2500   B$(K)=Z$(I): Z$(I)="****"
2510   K=K+1
2520   I=-1
2530 NEXT I
2540 RETURN
2550 :
2560 ZZ=(ZZ/360-INT(ZZ/360))*360
2570 IF ZZ<0 THEN ZZ=ZZ+360
2580 RETURN
