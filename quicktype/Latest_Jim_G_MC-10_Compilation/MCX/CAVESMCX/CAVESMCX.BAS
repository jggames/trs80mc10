0 CLS:PRINT"PLEASE WAIT...":DIMC(26,26),A(5,4),B(5,4):Y=RND(-(PEEK(9)*256+PEEK(10))):GOTO40
1 RETURN
2 FORY=1TOMO-1:READM$,MD,T,DA,MA,MT:FORX=0TO13:READI$:NEXT:NEXT:RETURN
3 SOUND1,2:RETURN
4 PRINT@480,"                               ";:RETURN
6 PRINT@480+(32-LEN(I$))/2,LEFT$(I$,31);:RETURN
8 GOSUB6
9 FORY=1TO1000:NEXT:GOSUB4:RETURN
10 PRINT@164,"\ac\a4";:PRINT@292,"\b3\b1";:PRINT@324,"\b9";:RETURN
12 FORY=15TO431STEP32:PRINT@Y:NEXT:RETURN
13 PRINT@164,"\ad";:FORY=6TO9:PRINT@32*Y+4,"\9a";:NEXT:RETURN
14 FORY=4TO10:PRINT@32*Y+11,"\a5\af\af";:NEXT
15 PRINT@44,"\de\a1";:PRINT@75,"\de\a1\af";:PRINT@107,"\d0\ac\ac";:PRINT@364,"\b1\b3";:PRINT@396,"\f2\bd";:PRINT@429,"\f2";:RETURN
16 FORY=4TO10:PRINT@32*Y+11,"\d5\df\df";:NEXT
17 PRINT@44,"\df\d9";:PRINT@75,"\df\d9\df";:PRINT@107,"\d9\df\df";:PRINT@364,"\dd\df";:PRINT@396,"\f2\dd";:PRINT@429,"\f2";:RETURN
18 FORY=4TO10:PRINT@32*Y+1,"\af\af\aa";:NEXT
19 PRINT@33,"\a2\dd";:PRINT@65,"\af\a2\dd";:PRINT@97,"\ac\ac\a0";:PRINT@353,"\b3\b2\f1";:PRINT@385,"\be\f1";:PRINT@417,"\f1";:RETURN
20 FORY=4TO10:PRINT@32*Y+1,"\df\df\da";:NEXT
21 PRINT@33,"\d6\df";:PRINT@65,"\df\d6\df";:PRINT@97,"\df\df\d6";:PRINT@353,"\df\de\f1";:PRINT@385,"\de\f1";:PRINT@417,"\f1";:RETURN
22 PRINT@132,"\df\dc\dc\dc\dc\dc\df";:PRINT@164,"\da\97\9f\9f\9f\9b\d5";:PRINT@196,"\da\93\93\93\93\93\d5";:PRINT@228,"\da\9f\9f\9f\9e\9d\d5";:PRINT@260,"\da\9f\9f\9f\9b\9f\d5";
23 PRINT@292,"\da\9c\9c\9c\9c\9c\d5";:PRINT@324,"\da\9f\9f\9f\9f\9f\d5";:RETURN
24 PRINT@169,"\a8\ac";:PRINT@297,"\b2\b3";:PRINT@330,"\b6";:RETURN
26 PRINT@33,"\d6\df\df";:PRINT@65,"\dd\d6\df";:PRINT@97,"\92\dd\d6";:PRINT@129,"\9f\92\da";::PRINT@161,"\96\9a\da";:PRINT@193,"\9f\92\da";:PRINT@225,"\9f\9a\da";
27 PRINT@257,"\9a\92\da";:PRINT@289,"\9f\9a\da";:PRINT@321,"\9e\92\da";:PRINT@353,"\97\9a\f1";:PRINT@385,"\9e\f1";:PRINT@417,"\f1";:RETURN
28 PRINT@170,"\ae";:FORY=6TO9:PRINT@32*Y+10,"\95";:NEXT:RETURN
30 PRINT@43,"\df\df\d9";:PRINT@75,"\df\d9\de";:PRINT@107,"\d9\de\91";:PRINT@139,"\d5\91\9f";::PRINT@171,"\d5\95\99";:PRINT@203,"\d5\91\9f";:PRINT@235,"\d5\95\9f";
31 PRINT@267,"\d5\95\9b";:PRINT@299,"\d5\95\9f";:PRINT@331,"\d5\91\9d";:PRINT@364,"\95\9b";:PRINT@396,"\f2\9d";:PRINT@429,"\f2";:RETURN
32 FORY=6TO8:PRINT@32*Y+6,"\af\af\af";:NEXT:RETURN
34 PRINT@132,"\a6\af\af\af\af\af\a9";:PRINT@164,"\af\a0\a0\a0\a0\a0\af";:PRINT@196,"\af\a0\a1\a3\a2\a0\af";:PRINT@228,"\af\a0\a3\a3\a3\a0\af";:PRINT@260,"\af\a1\a3\a3\a3\a2\af";
35 PRINT@292,"\aa\a3\a3\a3\a3\a3\a5";:PRINT@324,"\a3\a3\a3\a3\a3\a3\a3";:RETURN
36 PRINT@198,"\ae\ac\ad";:FORT=7TO8:PRINT@32*T+6,"\aa\9f\a5";:NEXT:RETURN
38 GOSUB39:PRINT@292,"\a6\aa\a0\a0\a0\a5\a9";:PRINT@324,"\af\a2\a0\a0\a0\a1\af";:RETURN
39 PRINT@132,"\a6\af\af\af\af\af\a9";:PRINT@164,"\af\a6\ac\ac\ac\a9\af";:FORY=196TO260STEP32:PRINT@Y,"\af\aa\a0\a0\a0\a5\af";:NEXT:RETURN
40 MO=17:GOSUB2:FORX=1TO4:FORY=0TO5:READA(Y,X),B(Y,X):NEXT:NEXT:CLS:PRINT@198,"LOAD LEVEL 1 DATA...":LOAD*C,"LVL1DATA"
44 HP=C(0,1):FH=C(0,2):ST=C(0,3):IN=C(0,4):WI=C(0,5):DE=C(0,6):CO=C(0,7):CH=C(0,8):GP=C(0,9):EX=C(0,10):WE=C(0,11)
46 WP=C(0,12):AR=C(0,13):AP=C(0,14):SH=C(0,15):LV=C(0,16):GOSUB246:N$="":FORT=17TO24:IFC(0,T)>0THENN$=N$+CHR$(C(0,T))
48 NEXT:GOSUB456:AA=2:BB=25:FF=4:A=3:B=25:F=4:TV=2
50 GOSUB132:GOSUB112:PRINT@463,"\83\83\83\83\83\83\83\83\83\83\83\83\83\83\83\83\83";:I$="FOOL! EVIL AWAITS YOU...":GOSUB8
52 GOSUB70:IFC(A,B)=5THENGOSUB482:GOSUB132:GOSUB70
54 I$=INKEY$:IFI$=""THEN54
56 IFI$="C"THENGOSUB310:GOSUB116
58 IFI$="W"THENONFGOSUB138,142,146,150:IFRND(41+INT(WI/2))=1THENGOSUB70:GOSUB156
60 IFI$="S"ORI$="D"THENF=F+1:IFF>4THENF=1
62 IFI$="A"THENF=F-1:IFF<1THENF=4
64 IFI$=" "THENGOSUB112:GOTO54
66 IFI$="M"THENGOSUB126
68 GOTO52
70 PRINT@7,MID$("nesw",F,1);:IFC(A,B)=3THENGOSUB428
72 IFC(A,B)=4THENGOSUB440:GOTO70
74 ONC(A+A(0,F),B+B(0,F))+1GOSUB20,18,26,18,18,18
80 ONC(A+A(1,F),B+B(1,F))+1GOSUB16,14,30,14,14,14
86 T=C(A+A(2,F),B+B(2,F)):IFT=0THENFORY=4TO10:PRINT@32*Y+4,"\df\df\df\df\df\df\df";:NEXT:RETURN
88 ONTGOTO94,22,34,38
94 GOSUB39:PRINT@292,"\ae\b1\b3\b3\b3\b2\ad";:PRINT@324,"\b1\bf\bf\bf\bf\bf\b2";
98 ONC(A+A(3,F),B+B(3,F))GOSUB10,13,10,10,10
102 ONC(A+A(4,F),B+B(4,F))GOSUB24,28,24,24,24
106 ONC(A+A(5,F),B+B(5,F))+1GOSUB32,1,36:RETURN
112 TV=TV+1:ONTVGOTO116,124:TV=1
116 GOSUB12:PRINT@(15+((17-LEN(N$))/2)),N$;:PRINT@80,"STR"ST;:PRINT@89,"INT"IN;:PRINT@112,"WIS"WI;:PRINT@121,"DEX"DE;
118 PRINT@144,"CON"CO;:PRINT@153,"CHR"CH;:PRINT@207,"LEVEL:"LV;TAB(26)"AC"AC;:PRINT@239,"EXP:"EX
120 PRINT@303,"HIT POINTS:"HP:PRINT@335,"GOLD:"GP
122 PRINT@435,S1;S2;S3;:RETURN
124 GOSUB12:PRINT@19,"inventory";:Y=47:GOSUB276:Y=79:GOSUB292:Y=111:GOSUB304:Y=Y+32:RETURN
126 FORY=15TO431STEP32:PRINT@Y,"\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80";:NEXT:PRINT@19,"level\80map";
128 FORX=1TO25:FORY=0TO25:IFC(X,Y)<>0THENSET(X+32,Y+2,2)
130 NEXT:NEXT:SET(A+32,B+2,3):RETURN
132 PRINT@0,"\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80";:PRINT@32,"\80\d6\df\df\df\df\df\df\df\df\df\df\df\d9\80";:PRINT@64,"\80\df\d6\df\df\df\df\df\df\df\df\df\d9\df\80";:PRINT@96,"\80\df\df\d6\dc\dc\dc\dc\dc\dc\dc\d9\df\df\80";
134 FORX=128TO320STEP32:PRINT@X,"\d0\df\df\da\df\df\df\df\df\df\df\d5\df\df\d0";:NEXT:PRINT@352,"\d0\df\de\f1\f3\f3\f3\f3\f3\f3\f3\f2\dd\df\80";
136 PRINT@384,"\80\de\f1\ff\ff\ff\ff\ff\ff\ff\ff\ff\f2\dd\80";:PRINT@416,"\80\f1\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\f2\80";:PRINT@448,"\83\83\83\83\83\83\83\83\83\83\83\83\83\83\83";:GOSUB4:RETURN
138 IFC(A,B-1)=0OR(C(0,25)=AANDC(0,26)=B-1)THEN3
140 B=B-1:GOTO154
142 IFC(A+1,B)=0OR(C(0,25)=A+1ANDC(0,26)=B)THEN3
144 A=A+1:GOTO154
146 IFC(A,B+1)=0OR(C(0,25)=AANDC(0,26)=B+1)THEN3
148 B=B+1:GOTO154
150 IFC(A-1,B)=0OR(C(0,25)=A-1ANDC(0,26)=B)THEN3
152 A=A-1
154 PLAY"T255O1C1":RETURN
156 GOSUB116:I$="YOU ENCOUNTER A MONSTER!":GOSUB8
158 MO=RND(16):IFMO=16THENIFRND(8)=1THEN162
160 IFMO>C(0,0)*4THEN158
162 RESTORE:IFMO>1THENGOSUB2
164 READM$,MD,T,DA,MA,MT:FORX=0TO13:READI$:PRINT@X*32,I$;:NEXT
168 MH=RND(T):IFMH<MDTHEN168
170 I$="A "+M$+"!":GOSUB8:IFRND(6)=1THENGOSUB214
174 IFMH<1THEN246
176 I$="<F>IGHT, <C>AST SPELL OR <R>UN":GOSUB6
178 I$=INKEY$:IFI$=""THEN178
180 IFMH<1THENRETURN
182 IFI$="F"THEN192
184 IFI$="C"THENGOSUB310:GOSUB116:IFMH>0THENGOSUB214:GOTO174
186 IFI$="R"THEN232
188 IFMH<1THEN246
190 GOTO178
192 GOSUB9:IFLV<4THENCA=19-MA
196 IFLV>3ANDLV<7THENCA=17-MA
198 IFLV>6ANDLV<10THENCA=14-MA
200 IFLV>9ANDLV<13THENCA=12-MA
202 IFLV>12THENCA=10-MA
204 IFCA>20THENCA=20
206 IFCA<2THENCA=2
208 IFRND(20)<CA-DBTHENI$="YOU MISS!":GOSUB8:GOTO212
210 DT=RND(PD)+SB:I$="YOU HIT FOR"+STR$(DT)+" POINTS!":GOSUB8:GOSUB222:IFMH<1THENRETURN
212 GOSUB214:GOTO174
214 IFRND(20)>=19-AC-MDTHEN218
216 I$="IT MISSES!":GOSUB8:RETURN
218 I$="YOU'RE HIT!":GOSUB8:HP=HP-RND(DA):GOSUB120:IFHP<1THEN466
220 RETURN
222 MH=MH-DT:IFMH<1THEN226
224 RETURN
226 I$="YOU DEFEAT THE "+M$+"!":GOSUB8
228 MG=RND(MT):EX=EX+10*MD+MG:GP=GP+MG:GOSUB132:GOSUB246:GOSUB116:RETURN
232 IFRND(10)>8THENGOSUB9:I$="YOU CANNOT ESCAPE!":GOSUB8:GOTO212
234 GOSUB9:I$="YOU RUN AWAY!":GOSUB8
236 IFC(A+1,B)<>0THENA=A+1:GOTO244
238 IFC(A-1,B)<>0THENA=A-1:GOTO244
240 IFC(A,B+1)<>0THENB=B+1:GOTO244
242 IFC(A,B-1)<>0THENB=B-1
244 GOSUB116:GOSUB132:GOSUB70
246 AC=9-AR*2-SH:IFDE=3THENAC=AC+3:DB=-3
250 IFDE=4ORDE=5THENAC=AC+2:DB=-2
252 IFDE>5ANDDE<9THENAC=AC+1:DB=-1
254 IFDE>12ANDDE<16THENAC=AC-1:DB=1
256 IFDE=16ORDE=17THENAC=AC-2:DB=2
258 IFDE=18THENAC=AC-3:DB=3
260 PD=WE+2:IFST=3THENSB=-3
262 IFST=4ORST=5THENSB=-2
264 IFST>5ANDST<9THENSB=-1
266 IFST>12ANDST<16THENSB=1
268 IFST=16ORST=17THENSB=2
270 IFST=18THENSB=3
272 DB=DB+WP:SB=SB+WP:AC=AC-AP:IFHP>FHTHENHP=FH
274 RETURN
276 W=WE:WB=WP:GOSUB278:PRINT@Y,I$;:RETURN
278 I$="BARE HANDS":IFW=1THENI$="DAGGER"
280 IFW=2THENI$="WOODEN CLUB"
282 IFW=3THENI$="HAND AXE"
284 IFW=4THENI$="MACE"
286 IFW=5THENI$="SWORD"
288 IFWBTHENI$=I$+STR$(WB)+"+"
290 RETURN
292 P=AR:PB=AP:GOSUB294:PRINT@Y,I$;:RETURN
294 I$="ROBES":IFP=1THENI$="LEATHER ARMOUR"
296 IFP=2THENI$="CHAINMAIL"
298 IFP=3THENI$="PLATEMAIL"
300 IFPBTHENI$=I$+STR$(PB)+"+"
302 RETURN
304 IFSH=0THENRETURN
306 I$="SHIELD":IFSH>1THENI$=I$+STR$(SH-1)+"+"
308 PRINT@Y,I$:RETURN
310 SL=1:GOSUB12:PRINT@18,"spell book";:GOSUB4
312 ONSLGOSUB330,336,340:PRINT@303,"<#> TO CAST SPELL";:PRINT@335,"<0> TO ABORT";:PRINT@367,"<L> NEXT LEVEL";:GOSUB122
316 I$=INKEY$:IFI$=""THEN316
318 IFI$="0"THENGOSUB9:RETURN
320 IFI$="L"THENSL=SL+1:IFSL>3THENSL=1
322 IFI$="L"THEN312
324 IFI$>"0"ANDI$<"6"THEN344
326 GOTO316
328 FORY=47TO431STEP32:PRINT@Y:NEXT:RETURN
330 GOSUB328:PRINT@83,"LEVEL 1";:PRINT@111,"<1>MAGIC MISSILE";:PRINT@143,"<2>SHIELD";:PRINT@175,"<3>SLEEP";
334 PRINT@207,"<4>CURE LIGHT";:PRINT@239,"<5>TURN UNDEAD";:RETURN
336 GOSUB328:PRINT@83,"LEVEL 2";:PRINT@111,"<1>KNOCK";:PRINT@143,"<2>WEB";
338 PRINT@175,"<3>BLESS";:PRINT@207,"<4>LESSER HOLD";:RETURN
340 GOSUB328:PRINT@83,"LEVEL 3";:PRINT@111,"<1>FIRE BALL";
342 PRINT@143,"<2>LIGHTNING BOLT";:PRINT@175,"<3>STRIKING";:PRINT@207,"<4>LOCATE EXIT";:RETURN
344 IFSL=1ANDS1<>0THENONVAL(I$)GOSUB352,358,362,372,378:S1=S1-1:RETURN
346 IFSL=2ANDS2<>0THENONVAL(I$)GOSUB388,390,396,400:S2=S2-1:RETURN
348 IFSL=3ANDS3<>0THENONVAL(I$)GOSUB408,416,424,427:S3=S3-1:RETURN
350 GOSUB9:I$="YOU CANNOT CAST!":GOSUB8:RETURN
352 IFMH<1THEN1
354 GOSUB542:DT=(RND(6)+1)*(1+INT(LV/5)):GOSUB9:I$="THE MISSILE SLAMS THE CREATURE!":GOSUB8
356 I$="THE "+M$+" TAKES"+STR$(DT)+" DAMAGE!":GOSUB8:GOSUB222:RETURN
358 IFMH>0THENAC=AC-2:GOSUB9:I$="YOUR ARMOUR GLOWS BRIEFLY...":GOSUB8
360 RETURN
362 IFMH<1THEN1
364 GOSUB542:IFMD-1>LVTHEN386
366 GOSUB9:I$="THE MONSTER SLEEPS...":GOSUB6:DT=RND(PD+1)*5+SB:GOSUB9:I$="YOU SWING A MIGHTY BLOW...":GOSUB8:GOSUB222:RETURN
372 HP=HP+RND(9)+1:IFHP>FHTHENHP=FH
374 GOSUB9:I$="YOU FEEL BETTER...":GOSUB8:RETURN
377 GOSUB9:I$="NO EFFECT...":GOSUB8:RETURN
378 IFMH<1THEN1
380 GOSUB542:IFMO<>1ANDMO<>11ANDMO<>12ANDMO<>14THEN386
382 IFMD-1>LVTHEN377
384 IFRND(20)>3+MD-LVTHENGOSUB9:I$="THE UNDEAD DISINTEGRATES!":GOSUB8:MH=0:GOSUB132:RETURN
386 GOSUB9:I$="THE "+M$+" LAUGHS...":GOSUB8:RETURN
387 C(0,25)=0:C(0,26)=0:RETURN
388 IF(RND(18)>IN)THEN377
389 GOSUB9:I$="YOU HEAR A CLICK!":GOSUB8:GOTO387
390 GOSUB542:IFRND(100)>80THENGOSUB9:I$="THE "+M$+" DODGES THE WEB!":GOSUB8:RETURN
392 GOSUB9:I$="THE "+M$+" IS CAUGHT!":GOSUB8:I$="YOU ESCAPE THE "+M$+"!"
394 GOSUB8:MH=0:GOSUB132:RETURN
396 IFMH<1THEN1
398 HP=HP+RND(4):DB=DB+1:SB=SB+1:GOSUB9:I$="YOU ARE BLESSED BY THE GODS...":GOSUB8:RETURN
400 IFMH<1THEN1
402 GOSUB542:IFMD>2THENGOSUB9:I$="THE SPELL HAS NO EFFECT!":GOSUB8:RETURN
404 GOSUB9:I$="THE "+M$+" IS HELD!":GOSUB8:MH=0:GOSUB228
408 IFMH<1THEN1
410 GOSUB542:DT=0:FORX=1TOL(16):DT=DT+RND(6):NEXT:GOSUB9:I$="THE FIRE BALL EXPLODES!":GOSUB6
412 GOSUB9:I$="THE "+M$+" TAKES"+STR$(DT)+" DAMAGE!":GOSUB8:GOSUB222:RETURN
416 IFMH<1THEN1
418 GOSUB542:DT=0:FORX=1TOLV:DT=DT+RND(6):NEXT:GOSUB9:I$="YOUR HANDS SPEW LIGHTNING!":GOSUB8
420 I$="IT FRIES FOR"+STR$(DT)+" DAMAGE!":GOSUB8:GOSUB222:RETURN
424 IFMH<1THEN1
426 SB=SB+10:GOSUB9:I$="YOUR WEAPON GLOWS BRIGHTLY!":GOSUB8:RETURN
427 GOSUB542:A=AA:B=BB:F=FF:GOTO236
428 I$="TAKE THE STAIRS up? (Y/N)":GOSUB6
430 I$=INKEY$:IFI$=""THEN430
432 IFI$="N"THEN236
434 IFI$<>"Y"THEN430
436 IFC(0,0)<>1THENC(0,0)=C(0,0)-1:GOTO449
438 GOSUB452:GOSUB4:I$="SAVE LEVEL 1 DATA...":GOSUB6:SAVE*C,"LVL1DATA":CLS:RUN"INNMCX"
440 I$="TAKE THE STAIRS down? (Y/N)":GOSUB6
442 I$=INKEY$:IFI$=""THEN442
444 IFI$="N"THEN236
446 IFI$<>"Y"THEN442
448 C(0,0)=C(0,0)+1
449 GOSUB450:GOTO236
450 GOSUB4:M$="LVL"+RIGHT$(STR$(C(0,0)),1)+"DATA":I$="LOAD LEVEL"+STR$(C(0,0))+" DATA...":GOSUB6:LOAD*C,M$
452 C(0,1)=HP:C(0,2)=FH:C(0,3)=ST:C(0,4)=IN:C(0,5)=WI:C(0,6)=DE:C(0,7)=CO:C(0,8)=CH:C(0,9)=GP:C(0,10)=EX
454 C(0,11)=WE:C(0,12)=WP:C(0,13)=AR:C(0,14)=AP:C(0,15)=SH:C(0,16)=LV:AA=A:BB=B:FF=F:RETURN
456 X=750:S1=IN/9:S2=IN/9/2:S3=IN/9/3:FORY=1TO12:IFX=12000THENX=12500
458 IFX>99999THENX=X+100000:GOTO462
460 X=X+X
462 S1=S1+.33:S2=S2+.33:S3=S3+.33:IFEX<XTHENLV=Y:Y=12
464 NEXT:S1=INT(S1):S2=INT(S2):S3=INT(S3):RETURN
466 GOSUB9:CLS0:PRINT"\ae\ac\af\ac\ad\80\80\80\80\80\80\c7\cf\cf\cf\cf\cf\cf\cf\cf\cf\c2\80\80\80\80\80\af\ac\ac\ac\ad\80\80\af\d0\d0\d0\80\80\80\c1\cf\c6\cf\ce\cf\cf\cf\cf\cf\cf\cf\cf\cb\80\80\80\80\af\a3\a3\80\80\80\80\af\d0\d0\80\80\80\c1\cf\cf\cf\c6\c7";
470 PRINT"\cf\cf\cf\cf\cf\cf\cf\c6\c9\cb\80\80\80\af\80\80\80\a1\80\80\ac\a8\d0\80\80\80\cf\cf\cf\cf\ca\cf\cf\cf\cf\cf\cf\cf\cf\c9\cb\cf\ca\80\80\ac\ac\ac\ac\ac\a0\a0\a0\a0\a0\80\80\c1\cf\cf\cf\cf\cf\c6\cf\cf\cf\cf\cf\cf\cf\cf\cf\cf\cb\80\c0\80\80\80\80\80\af\a8\a0\a0\af\a8\80\c5\cf\cf\cf\cf\cf\cf\cf\cf\cf\cf\cf\cf\cf\cf\cf\cf\cf\ca";
472 PRINT"\80\af\a3\80\a4\af\af\a3\a3\a3\af\80\80\c5\cf\c8\90\90\90\c4\cf\cf\cf\cf\cf\c8\c0\c0\a0\c4\cf\ca\80\af\80\af\80\af\af\80\80\80\af\80\80\c5\cf\90\95\bb\9a\90\cf\cf\cf\cf\cf\c0\95\bb\9a\a0\cf\ca\80\af\80\ac\a3\af\ac\a8\80\80\ac\a8\80\cf\cf\c2\90\90\90\c1\cf\cf\cf\cf\cf\c2\c0\c0\a0\c1\cf\cf\80\ac\a8\80\80\ac";
474 PRINT"\80\80\80\80\80\80\80\cd\cf\cf\cf\cf\cf\cf\cf\c8\c0\c4\cf\cf\cf\cf\cf\cf\cf\ce\80\80\80\80\80\80\af\ac\ac\ac\ad\80\80\80\80\c4\cf\cf\cf\cf\cf\c0\c3\c0\cf\cf\cf\cf\cf\c8\80\80\a4\af\ac\ac\ac\a3\af\a3\a3\80\80\80\80\80\80\80\cf\cd\cf\cf\cf\cf\cf\cf\cf\cf\cf\cf\cd\80\80\80\80\af\80\80\80\af\af\80\80\80\a1\80\80\80\80\80";
476 PRINT"\cf\c7\c5\c5\c5\c5\c5\c5\c5\c5\c5\c5\c7\80\80\80\80\af\80\80\80\af\ac\ac\ac\ac\ac\80\80\80\80\80\c4\cf\ca\ca\ca\ca\ca\ca\ca\ca\ca\cf\c8\80\80\80\a4\ac\ac\ac\ac\80\80\80\80\80\80\80\80\80\80\80\80\c4\cf\cf\cf\cf\cf\cf\cf\cf\cf\c8\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\c4\cf\cf\cf\cf\cf\cf\cf\c8";
478 ON-(INKEY$="")GOTO478:CLS:END
482 PRINT@292,"\80\93\91\93\92\93\80";:I$="\94\98\9c\9c\9c\94\98":PRINT@324,I$;:PRINT@356,"\95\9a\9f\91\9f\95\9a";:PRINT@388,I$;
484 I$="YOU FIND A CHEST!":GOSUB8:I$="WILL YOU OPEN IT? (Y/N)":GOSUB6
486 I$=INKEY$:IFI$=""THEN486
488 IFI$="N"THENC(A,B)=1:RETURN
490 IFI$<>"Y"THEN486
494 GOSUB9:RC=RND(10):IFRC=1THENI$="IT'S EMPTY...":GOSUB8:C(A,B)=1:RETURN
495 IFRC=2THENIFC(0,25)THENI$="A KEY!":GOSUB8:C(A,B)=1:GOTO387
496 IFRCRC<>3THEN502
498 GOSUB542:CD=INT(RND(5*(C(0,0)*.5))):I$="THE CHEST EXPLODES!":GOSUB8
500 I$="YOU TAKE"+STR$(CD)+" POINTS DAMAGE!":GOSUB8:HP=HP-CD:IFHP<1THEN466
502 IFRC=4THEN508
504 CG=RND((RC+10+C(0,0))*10):I$="YOU FIND"+STR$(CG)+" GOLD!":GOSUB8:C(A,B)=1:GP=GP+CG:EX=EX+CG:GOSUB116:RETURN
508 IFRND(2)=1THEN526
510 WB=0:IFRND(100)>40THEN514
512 WB=RND(2+(INT(C(0,0)/4)))
514 W=RND(5):GOSUB278
516 GOSUB9:I$="YOU FIND A "+I$+"!":GOSUB8:I$="DO YOU EQUIP THE WEAPON? (Y/N)":GOSUB6
518 I$=INKEY$:IFI$=""THEN518
520 IFI$="N"THENGOSUB132:C(A,B)=1:RETURN
522 IFI$<>"Y"THEN518
524 WE=W:WP=WB:GOSUB132:C(A,B)=1:GOSUB246:RETURN
526 PB=0:IFRND(100)>40THEN530
528 PB=RND(2+(INT(C(0,0)/5)))
530 P=RND(3):GOSUB294
532 GOSUB9:I$="YOU FIND "+I$+"!":GOSUB8:I$="DO YOU EQUIP THE ARMOUR? (Y/N)":GOSUB6
534 I$=INKEY$:IFI$=""THEN534
536 IFI$="N"THENGOSUB132:C(A,B)=1:RETURN
538 IFI$<>"Y"THEN534
540 AR=P:AP=PB:GOSUB132:C(A,B)=1:GOSUB246:RETURN
542 I$="":FORY=0TO5:FORX=0TO6:I$=I$+CHR$(PEEK(16384+X+132+Y*32)):NEXT:NEXT
544 PRINT@134,"\e1\e3\e3\e2";:PRINT@164,"\e1\e3\e7\9f\9f\ea";:PRINT@196,"\e5\9f\9f\9f\9f\eb\e2";:PRINT@228,"\e4\ed\9f\9f\9f\9f\ea";:PRINT@261,"\e4\ed\9f\ee\ec\e8";:PRINT@294,"\e4\ec\e8";
546 GOSUB3:T=1:FORY=0TO5:PRINT@Y*32+132,MID$(I$,T,7);:T=T+7:NEXT:RETURN
548 DATAGIANT SPIDER,3,18,12,5,5,\80\80\80\80\80\80\d5\80\80\80\80\80\80\80\80,\80\f5\80\80\80\80\d5\80\80\80\80\fa\80\80\80,\f5\f5\80\80\f7\ff\ff\ff\fb\80\80\fa\fa\80\80,\f5\f5\80\f7\ff\bf\bf\bf\ff\fb\80\fa\fa\80\80,\f5\f5\80\ff\ff\ff\bf\ff\ff\ff\80\fa\fa\80\80
552 DATA\f5\f4\f3\ff\ff\bf\bf\bf\ff\ff\f3\f8\fa\80\80,\f4\f3\f3\ff\ff\ff\ff\ff\ff\ff\f3\f3\f8\80\80,\80\80\f3\ff\ff\ff\ff\ff\ff\ff\f3\80\80\80\80,\f1\fc\80\f3\fe\fd\ff\fe\fd\f3\80\fc\f2\80\80,\fa\f1\fc\80\f0\ff\ff\ff\80\80\fc\f2\f5\80\80
554 DATA\fa\f5\80\80\f0\fb\ff\f7\80\80\80\fa\f5\80\80,\fa\f5\80\80\80\cb\80\c7\80\80\80\fa\f5\80\80,\fa\f5\80\80\80\80\80\80\80\80\80\fa\f5\80\80,\80\80\f8\80\80\80\80\80\80\80\f4\80\80\80\80,PIXIE,1,5,4,3,10
558 DATA\80\80\80\80\80\83\83\83\83\80\80\80\80\80\80,\df\db\80\80\87\8e\8d\8f\8f\8f\82\80\80\80\80,\db\dd\db\80\8e\80\80\fb\8f\8f\8f\f0\80\80\80,\df\db\dd\db\f3\f0\80\fd\ff\ff\fd\f0\80\80\80,\dd\df\db\dd\ff\80\80\80\ff\ff\ff\f8\80\80\80
560 DATA\80\dc\df\db\fd\ff\ff\9f\af\af\9f\9f\ff\f2\80,\80\80\d6\df\df\91\9f\9e\af\af\ab\9f\f5\fa\f0,\d7\df\de\d3\d3\95\9f\af\af\af\af\9e\f5\fa\80,\df\de\d7\df\d8\80\8f\8a\8d\8f\80\80\80\80\80,\d4\dc\dc\d8\80\87\8f\80\80\8f\8b\80\80\80\80
562 DATA\80\80\80\80\f7\8f\88\80\80\84\8f\8a\80\80\80,\80\80\80\80\ff\ff\80\80\80\f0\ff\ff\f3\80\80,\80\80\80\80\f4\f8\80\80\80\80\80\80\80\80\80,\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80,SKELETON,1,8,6,7,10
566 DATA\f0\f0\f3\f0\f0\d3\b3\b3\b3\d0\d0\f0\80\80\80,\ff\cf\ff\df\df\dc\dc\dc\bc\bf\bf\b3\80\80\80,\c7\ce\fc\c1\c7\cf\cf\cf\cb\c2\80\80\80\80\80,\cf\80\80\cf\cf\b3\cf\b3\cf\cf\80\80\80\80\80,\cf\80\80\cf\cf\ce\ce\cf\cf\cf\80\80\80\80\80
568 DATA\cf\80\80\c4\cf\cf\cf\cf\cf\c8\80\80\80\80\80,\cf\80\80\80\cb\c9\c9\c9\cd\c0\80\80\80\80\80,\cf\80\80\80\cd\cf\cf\cf\ce\c0\80\80\80\80\80,\cd\cb\c3\c3\c3\c3\cf\c3\c3\c3\c3\c3\80\80\80,\80\c1\c3\c3\c3\c3\cf\c3\df\df\df\df\df\df\80
570 DATA\80\cc\c1\c3\c3\c3\cf\c3\df\ef\ef\ef\ef\df\80,\80\80\cc\c1\c3\c3\cf\c3\df\ef\ef\ef\ef\df\ca,\80\80\80\cc\80\80\cf\80\df\df\ef\ef\df\df\80,\80\80\80\c3\cf\cf\cf\cf\d4\df\df\df\df\d8\80,GREEN SLIME,2,12,4,9,10
574 DATA\80\80\80\83\83\83\83\83\83\83\83\83\83\83\80,\80\80\80\8d\8f\8f\86\8f\8f\8f\86\8f\86\8f\80,\80\80\80\85\80\8d\80\8f\80\85\80\8d\8f\8f\80,\80\80\80\85\80\81\80\8e\80\86\80\80\8f\89\80,\80\80\80\81\80\81\80\80\80\82\80\80\8d\8f\80
576 DATA\80\80\80\80\80\80\80\80\80\80\80\80\80\8f\80,\80\80\80\81\80\80\80\80\80\80\80\80\80\8f\80,\80\b1\b3\c3\c3\c2\80\80\80\82\80\80\80\8b\80,\80\bf\cc\cf\cc\cf\80\80\80\80\80\80\80\8f\80,\80\bf\cf\cc\cf\cf\80\80\80\82\c9\80\b9\8f\80
578 DATA\80\b2\ce\ce\ce\87\80\c6\80\82\80\c9\87\8f\80,\b1\ba\c9\cb\ca\8f\c6\83\c6\83\80\87\8f\8b\80,\87\8f\89\89\89\c6\8f\b6\8c\8c\b9\8f\89\8f\80,\c7\b6\89\8f\8f\8f\89\8f\8f\8f\86\8f\8f\8f\80,TROGLODYTE,2,16,12,5,12
582 DATA\80\80\80\80\80\80\80\80\c3\cf\80\c3\cf\cf\80,\80\80\80\81\8f\8f\8f\cf\cf\cf\89\8f\8f\8f\80,\80\81\8f\8f\8f\8f\8a\85\8f\8f\8f\8f\8f\8f\80,\80\9f\9d\8f\8f\8f\80\8f\8f\9f\9d\9f\8f\8f\80,\80\9f\93\9f\8f\8a\85\8f\9f\9f\93\9f\8f\8f\80
584 DATA\80\8c\8c\8f\8f\80\8f\8f\8f\8f\8f\8f\85\8f\80,\80\83\8e\8c\8c\8c\8c\8c\8c\8d\8f\8f\8a\8f\80,\80\8e\81\8f\8f\8f\8f\8f\8f\82\8f\8f\8f\85\80,\80\8d\8f\b6\c6\c6\c6\c6\b6\8f\80\8f\8f\8e\80,\80\80\8c\8f\8f\8f\8f\8f\8f\88\80\80\8c\80\80
586 DATA\80\80\83\83\83\80\80\80\83\83\8f\8f\8c\8f\80,\80\8e\87\89\8f\8d\8f\8f\8f\8f\8f\89\8f\8f\80,\8f\8e\ce\8c\ce\8f\8e\87\86\8c\8c\8c\8c\80\80,\ce\80\b2\80\b2\ce\80\ce\80\80\80\80\80\80\80,KOBOLD,1,5,6,7,15
590 DATA\f7\ff\ff\fb\80\80\f1\ff\f6\fb\c0\80\80\80\80,\ff\f8\f3\f6\ff\ff\ff\ff\ff\f6\ff\ff\ff\fc\fb,\ff\f0\ff\ff\ff\ff\ff\ff\ff\fa\ff\ff\ff\fb\f7,\ff\fb\f4\ff\91\93\93\f4\ff\fa\ff\fa\93\93\fd,\80\fc\ff\ff\f2\9c\9b\98\ff\f6\ff\fa\9b\98\80
592 DATA\80\f5\ff\ff\ff\fb\f3\f7\f6\ff\f6\fe\fb\80\80,\80\f5\ff\ff\c8\fc\ff\ff\ff\f2\c0\f1\ff\fa\80,\80\f4\f7\ff\f2\c2\c8\fd\ff\fe\f7\ff\ff\f8\80,\80\fb\fd\ff\ff\fb\c2\80\b8\c8\c8\b8\c8\80\80,\80\ff\fb\fd\ff\ff\ff\f2\cb\b1\c1\ca\c0\80\80
594 DATA\f7\ff\ff\fb\fc\ff\ff\ff\ff\ff\ff\fe\f0\c0\80,\f6\ff\ff\ff\fb\f3\f3\f3\f3\f3\f0\f0\f0\80\80,\ff\f6\ff\ff\ff\ff\ff\ff\ff\f9\ff\ff\ff\fb\80,\ff\ff\ff\ff\ff\ff\ff\ff\f9\ff\ff\ff\ff\ff\80,DWARF,3,18,6,4,25
598 DATA\80\80\80\80\80\d1\d7\dd\df\d2\80\80\80\80\80,\80\d0\d0\d0\d7\d9\d9\d5\df\df\db\d0\d0\d0\80,\cb\d0\d0\d7\d9\d9\d9\d5\df\df\df\db\d0\d0\c7,\cf\cb\d0\db\d9\d9\d9\d5\df\df\df\df\d0\c7\cf,\cd\cf\cf\d4\dc\dc\dc\d5\dc\dc\dc\d8\cf\cf\ce
600 DATA\80\d3\d2\ff\c1\a2\fa\df\f5\c1\a2\ff\d1\d3\80,\d0\df\da\ff\ff\ff\fa\dc\f5\ff\ff\ff\d5\df\80,\d0\df\da\ff\ff\fe\f7\ff\fb\fd\ff\ff\d5\df\80,\d0\df\df\d2\ff\97\9c\9c\9c\9b\ff\d1\df\df\80,\80\91\9f\9f\9f\90\93\93\93\90\9f\9f\9f\92\80
602 DATA\80\9f\9f\9f\9f\9f\9f\9f\9f\9f\9f\9f\9d\9f\80,\f3\94\9f\9f\9e\97\9f\9f\9f\9f\9f\9f\9b\98\f3,\ff\df\94\9f\95\9f\9f\9f\9f\9f\96\9f\9e\d5\ff,\ff\df\df\d3\94\9f\9f\9f\9f\9f\98\d3\d3\df\ff,CAECILIA,6,48,12,6,50
606 DATA\80\80\80\c1\80\80\80\80\80\80\80\c2\80\80\80,\80\f0\f0\cf\f0\f0\f0\f0\f0\f0\f0\cf\f0\f0\80,\80\f0\c7\cf\f0\f0\f0\f0\f0\f0\f0\cf\cb\f0\80,\80\f7\ff\ff\ff\ff\f3\f3\f3\ff\ff\ff\ff\fb\80,\f5\ff\fe\b3\b3\fd\fb\f3\f7\fe\b3\b3\fd\ff\fa
608 DATA\f5\ff\b5\bf\bf\ba\ff\f3\ff\b5\bf\bf\ba\ff\fa,\f5\ff\fb\bc\bc\f7\ff\f3\ff\fb\bc\bc\f7\ff\fa,\80\fd\ff\ff\ff\ff\fe\fc\fd\ff\ff\ff\ff\fe\80,\80\f0\fc\f3\f3\fc\fc\ff\fc\fc\f3\f3\fc\f0\80,\80\f2\fd\ff\ff\ff\ff\f3\ff\ff\ff\ff\fe\f0\80
610 DATA\f5\ff\93\f4\c4\ca\fc\fc\fc\c5\c8\f8\f0\f0\80,\f5\ff\9f\9f\c1\c1\f0\b3\f0\c2\c2\f0\f0\f0\80,\f5\ff\9f\9f\f4\ff\fb\bf\f7\ff\f8\b0\f0\f0\80,\f5\ff\9f\9f\9f\93\b6\b0\b9\f0\b0\b0\b0\b0\80,WIZARD,3,12,24,9,50
614 DATA\80\80\80\80\80\e1\ef\ef\e9\e9\e0\80\80\80\80,\80\e0\e0\e0\e1\ef\ef\ef\e9\e9\e9\e0\e0\e0\80,\80\e0\e0\e1\ef\ef\ef\ef\e9\e9\e9\e9\e0\e0\80,\80\e0\e7\ef\ef\ef\ef\ef\e9\e9\e9\e9\e9\e2\80,\e7\ef\ec\ec\ec\ef\ef\ef\e9\e9\ec\ec\ec\ef\eb
616 DATA\80\c7\f5\81\81\e4\ec\ec\ec\e8\81\81\fa\cb\80,\80\cf\f5\ff\ff\ff\ff\ff\f6\ff\ff\ff\fa\cf\80,\80\cf\cb\fd\ff\ff\fe\ff\f9\ff\ff\fe\c7\ce\80,\80\c4\cf\cb\fc\c7\cc\cc\cc\cb\fc\c7\cf\c0\80,\80\c0\cf\cf\cf\cf\c7\cf\cb\cf\cf\cf\cf\c0\80
618 DATA\e5\eb\cd\c6\cf\c6\cf\cf\cf\cf\c6\c6\ce\e7\ea,\e5\ef\ea\cf\c6\cf\cf\cf\cf\c6\c6\ce\e7\ef\ea,\e5\ef\eb\cd\cf\cf\cf\cf\c6\c6\ce\c8\ef\ef\ea,\e5\ef\ef\eb\cd\c6\cf\cf\c6\ce\e3\ef\ef\ef\ea,TROLL,6,48,24,4,50
622 DATA\80\80\80\80\80\80\80\f1\f9\f9\f9\f9\f9\f9\f9,\80\80\80\80\80\80\80\f9\ff\ff\ff\ff\f9\f9\f9,\80\80\80\80\83\8a\8a\8f\8f\8f\8f\ff\ff\f9\f9,\80\80\80\80\84\8f\8b\8c\8c\8f\8f\8f\ff\f9\f9,\80\80\80\80\80\84\8f\b4\80\85\8f\8f\ff\ff\f9
624 DATA\80\80\80\83\83\8f\8f\8f\8f\8f\8f\8f\8f\ff\f9,\83\8f\8f\8f\8f\8f\8f\8d\8f\8f\8f\8f\8f\ff\f9,\80\80\80\80\80\83\83\8f\8f\8f\89\89\89\ff\f9,\80\80\80\80\85\85\85\85\8c\89\8f\8f\8f\89\f9,\80\80\80\80\80\c8\c8\80\80\8f\8f\8f\88\8f\8a
626 DATA\80\80\80\80\80\c2\c2\c2\80\8f\8f\88\87\8f\8a,\80\80\80\80\87\8f\8f\8b\87\8f\8f\85\8f\8f\8a,\80\80\80\87\89\8f\89\89\8f\8f\80\87\8f\8f\8a,\80\80\80\84\8c\8c\8c\8c\8c\80\85\8f\8f\8f\8a,VAMPIRE,9,63,40,2,50
630 DATA\80\80\f1\f3\f3\f3\f3\f3\f3\f3\f3\f3\f0\80\80,\80\f1\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\f2\80,\80\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\fa\80,\f5\ff\9c\9c\9c\9f\ff\ff\ff\9f\9c\9c\9c\ff\80,\f5\9b\9f\9f\9f\93\9f\ff\9f\93\9f\9f\9f\97\fa
632 DATA\f5\9f\99\93\93\92\9d\9f\9e\91\93\93\96\9f\fa,\9f\9b\9f\d4\d8\9f\90\9f\90\9f\d4\d8\9f\97\9f,\9f\95\9f\9f\9f\93\97\9f\9b\93\9f\9f\9f\9a\9f,\80\9f\96\9f\9f\9f\96\9f\99\9f\9f\9f\99\9f\80,\95\9f\9f\9f\ff\ff\ff\90\ff\ff\ff\9f\9f\9f\9a
634 DATA\94\9f\9f\ff\9f\c6\cc\cc\cc\c9\9f\ff\9f\9f\98,\80\f4\ff\ff\9f\b3\c3\c3\c3\b3\9f\ff\ff\f8\80,\80\ef\f4\ff\ff\9f\9f\9f\9f\9f\ff\ff\f8\ef\80,\80\ef\ef\f4\ff\ff\fc\fc\fc\ff\ff\f8\ef\ef\80,WRAITH,4,32,36,3,60
638 DATA\80\80\e3\ef\ef\ef\e3\ef\ef\ef\eb\e3\80\80\80,\80\e7\ef\ef\ef\ef\ef\ef\ef\ef\ef\ef\eb\80\80,\e6\ef\80\ec\ec\e4\ef\ef\e8\ec\ec\80\ef\e9\80,\ef\e8\80\b0\b1\80\e4\e8\80\b2\b0\80\e4\ef\80,\ef\80\80\80\b0\b8\80\80\b4\80\80\80\e1\ef\80
640 DATA\e2\ef\e2\80\80\80\80\80\80\80\80\e1\ef\e1\80,\ef\e2\ef\e2\80\c0\c0\c0\c0\80\e1\ef\e1\ef\80,\ef\ef\e2\ef\e2\80\80\80\80\e1\ef\e1\ef\ef\80,\ef\ef\ef\e2\ef\ef\ef\ef\ef\ef\e1\ef\ef\ef\80,\ef\e6\ef\ef\e3\c4\cd\ef\c8\e3\ef\ef\e9\ef\80
642 DATA\ef\ef\c3\c3\eb\c0\c5\ca\ef\ed\c3\ef\ef\ea\80,\e5\ef\c3\c3\cc\ef\cd\ce\cc\ef\c3\c3\ef\e9\80,\e6\ef\ef\c3\ef\cc\ef\ce\cc\cc\c3\ef\e9\ef\80,\ef\e6\ef\ef\ef\cc\ef\ce\cc\ef\ef\ef\e9\ef\80,EVIL KNIGHT,6,48,12,3,60
646 DATA\bf\be\80\80\80\bf\bf\bf\bf\b2\80\80\80\80\80,\be\d1\d9\d9\d9\df\df\d5\df\df\df\df\d2\80\80,\d1\d9\d9\d9\df\df\df\d5\df\df\df\df\df\d2\80,\d9\d0\d8\df\df\df\df\d5\df\df\df\dc\d0\df\80,\d9\dd\d3\90\dc\df\df\d5\df\dc\90\d3\df\df\80
648 DATA\d9\d9\d9\df\d3\d3\d0\d0\d3\d3\df\df\df\de\80,\b2\d9\d9\d9\df\df\df\d5\df\df\df\df\df\80\80,\ba\d9\d9\d9\df\df\df\d5\df\df\df\df\de\80\80,\bf\b2\d9\d9\df\df\df\d5\df\df\df\de\80\80\80,\bf\be\80\d4\df\df\df\d5\df\df\d8\80\80\80\80
650 DATA\be\d1\d8\cf\d4\dc\dc\d4\dc\d8\cf\d1\d9\80\80,\d1\d9\d8\cc\cf\cf\cf\cf\cf\cf\cc\d1\d9\d9\80,\d1\d9\d9\d9\d1\d1\d1\d1\d1\d1\d1\d9\d9\d9\d0,\eb\d9\d9\d9\d9\d9\d9\d9\d9\d9\d9\d9\d8\e7\80,LESSER DEMON,9,75,40,6,99
654 DATA\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80,\80\c5\c2\b0\b0\b3\b3\b3\b8\b3\b0\b0\c1\ca\80,\80\c0\cd\bf\bf\b6\bf\bf\bf\b9\bf\bf\ce\b0\80,\b1\b0\b5\bb\bc\bc\bf\bf\bf\bc\bc\b7\ba\b0\b2,\b5\bb\b1\b9\9f\9d\93\b3\93\9e\9f\b6\b2\b7\ba
656 DATA\b0\bf\bb\bf\9d\9f\98\bf\94\9f\9e\bf\b7\bf\80,\80\bd\bf\bf\bf\bf\bb\b0\b7\bf\bf\bf\bf\be\80,\80\d0\b4\bf\bf\b8\bd\bc\b4\b4\bf\bf\b8\d0\80,\80\d9\d0\bd\bf\b2\b1\b1\bb\b5\bf\be\d0\d9\80,\80\c9\d9\d0\d0\bf\bf\bf\bf\bf\b0\b3\c9\c9\80
658 DATA\80\d9\b3\c9\d9\b3\b6\bf\bf\be\b7\bf\bf\d9\80,\80\bf\bf\bf\bf\b9\bf\b3\b6\bd\b3\bc\bf\bf\80,\80\d9\b6\d9\b6\b6\bf\c9\d9\bf\d9\c9\bf\d9\80,\80\c9\d9\c9\d9\d9\b6\d9\b6\c9\d9\b6\d9\c9\80,RED DRAGON,10,90,50,4,99
662 DATA\b3\b3\bc\bc\bd\bf\bf\bf\b2\cb\b4\bf\bf\bf\bb,\bf\bf\bf\bf\bb\bd\bf\bf\bf\b2\cb\b4\bf\bf\bf,\b3\b3\b3\b3\bc\bb\b6\bc\bf\bf\b2\cb\b5\bc\b3,\b3\b3\bc\bf\bf\bc\83\c2\b3\b2\b2\b2\b3\bf\c1,\bf\bf\bf\b3\b6\85\8a\cf\c2\bc\b8\bc\bc\81\cd
664 DATA\bc\b3\b3\b3\b3\bb\88\cc\b7\bf\b6\b6\bf\b3\b3,\bc\bf\bf\b9\bf\bf\bf\bf\bf\bf\bc\b4\b4\bc\bd,\80\bd\bf\bf\b8\d3\c4\bd\bf\b9\bc\bf\b5\be\b9,\80\b0\bf\bb\c2\df\df\c4\b4\bf\bf\bf\b6\bf\bf,\80\b0\b4\bf\bb\c2\df\df\c4\b4\bf\bf\ba\bf\b8
666 DATA\80\80\b5\bf\bf\b2\c2\dc\df\da\ce\c4\c4\c5\d5,\80\80\b7\bd\bf\bf\b2\cb\d4\db\d3\df\df\d3\d7,\80\b4\b8\80\bc\bf\bf\bf\bf\d5\df\af\af\df\af,\80\80\80\80\80\b0\bd\bf\b8\d7\af\af\af\af\af,GUIDE GUY,1,2,1,9,2
670 DATA\c5\cc\c2\c6\c9\c5\c2\ca\c8\cd\c8\80\80\80\80,\c5\c3\c8\c9\c6\c5\c4\ca\c0\c5\80\80\80\80\80,\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80,\81\8e\80\80\83\83\83\83\83\83\80\80\8d\82\80,\8f\80\81\8f\8f\8f\8f\8f\8f\8f\8f\82\80\8f\80
672 DATA\8f\80\8f\8f\8f\8f\8f\8f\8f\8f\8f\8f\80\8f\80,\84\8c\8f\8f\8d\8f\8f\8f\8f\8e\8f\8f\8c\88\80,\80\80\8f\8f\80\c8\c8\c8\c8\c8\8f\8f\80\80\80,\80\80\8d\b1\bf\b9\ba\8f\8f\8f\8f\88\80\80\80,\80\80\80\b4\bb\be\84\8c\8c\8c\80\80\80\80\80
674 DATA\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80,\ce\c9\c1\cc\c2\cb\c5\c5\c1\cc\80\ca\ca\80\80,\ce\c8\c5\cc\ca\ca\cd\c5\c4\c3\80\c2\c2\80\80,\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80
676 DATA-1,,1,,,-1,-1,-1,1,-1,,-2,,-1,,1,1,,1,-1,1,1,2,,1,,-1,,,1,1,1,-1,1,,2,,1,,-1,-1,,-1,1,-1,-1,-2,0
