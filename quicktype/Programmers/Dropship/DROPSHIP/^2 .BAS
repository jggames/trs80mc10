5 CLEAR
6 DIMG$(15)
10 GOTO360
15 GOSUB 1000
20 FORLA=1TO11
25 PLAY"T255O1"
30 FORI=1TO100
40 PRINT@480,LEFT$(G$(LA),X);
50 PRINTLEFT$(B$,Y);
60 PRINTRIGHT$(G$(LA),32-X-Y);
65 PRINT@0,L$;
70 IF PEEK(16384+C)<>128 OR PEEK(16385+C)<>128 THEN GOSUB720
80 PRINT@C,C$(O+2);
85 PLAY"T50G"
90 O=-O
100 Q=PEEK(2)ANDPEEK(17023)
110 IFQ=65 THEN C=C-1 ELSE IFQ=83THEN C=C+1
120 IF C<1THEN C=1 ELSE IFC>29 THEN C=29
140 R=RND(10)
150 IF R=1 THEN D=1 ELSE IF R=2THEND=-1
160 X=X+D
170 IF X>18 THEN X=18:D=0ELSE IF X<3THENX=3:D=0
190 IF R=3THEN W=-1 ELSE IF R=4THEN W=1
200 Y=Y+W*2:X=X-W
210 IF Y>13 THEN Y=13:W=0 ELSE IF Y<YYTHEN Y=YY:W=0
230 IF R>T THEN GOSUB320
240 NEXTI
250 FORS=1TO3:SOUNDLL*20,1:NEXTS
255 A=1
256 T=9
260 NEXTLA
265 GOTO 9000
270 YY=YY-1
280 A=1
290 GOTO 20
300 REM
320 AL=RND(2)
340 IF A>0THENPRINT@X+447+RND(Y),AL$(AL); ELSE PRINT@447+RND(31),AL$(AL);
350 RETURN
360 REM
362 LL=5
366 L$=MID$(STR$(LL),2)
370 C=14
380 A=0
385 T=5
390 X=10
400 Y=10
410 REM
420 F=4
430 L=1
440 YY=8
450 O=1
460 CLS0
470 C$(1)="\c7\cb"
480 C$(3)="\c6\c9"
490 G$(6)="\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6\f6"
500 G$(2)="\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96\96"
510 G$(4)="\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9\b9"
520 G$(5)="\a8\a2\a8\a2\a8\a2\a8\a2\a8\a2\a8\a2\a8\a2\a8\a2\a8\a2\a8\a2\a8\a2\a8\a2\a8\a2\a8\a2\a8\a2\a8\a2"
530 G$(1)="\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80"
540 G$(7)="oooooooooooooooooooooooooooooooo"
550 G$(3)="\8f\9f\af\bf\cf\df\ef\ff\8f\9f\af\bf\cf\df\ef\ff\8f\9f\af\bf\cf\df\ef\ff\8f\9f\af\bf\cf\df\ef\ff"
560 G$(8)="\bf\b9\bf\b6\bf\b9\bf\b6\bf\b9\bf\b6\bf\b9\bf\b6\bf\b9\bf\b6\bf\b9\bf\b6\bf\b9\bf\b6\bf\b9\bf\b6"
570 G$(9)="\8a\9a\aa\ba\ca\da\ea\fa\8a\9a\aa\ba\ca\da\ea\fa\8a\9a\aa\ba\ca\da\ea\fa\8a\9a\aa\ba\ca\da\ea\fa"
580 G$(11)="\88\92\a8\b2\c8\d2\e8\f2\88\92\a8\b2\c8\d2\e8\f2\88\92\a8\b2\c8\d2\e8\f2\88\92\a8\b2\c8\d2\e8\f2"
590 G$(10)="\99\96\90\a9\a6\a0\b9\b6\c0\d9\d6\d0\f9\f6\f0\99\96\90\a9\a6\a0\b9\b6\b0\d9\d6\d0\f9\f6\f0\99\96"
600 B$="\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80"
610 E$(1)="\b0\f1\f2\b0"
620 F$(1)="\b0\f4\f8\b0"
630 E$(2)="\b0\b9\b6\b0"
640 F$(2)="\b0\b6\b9\b0"
650 E$(3)="\b0\b8\b4\90"
660 F$(3)="\90\b2\b1\90"
670 E$(4)="\c6\b4\b0\c9"
680 F$(4)="\b2\c1\c2\b1"
690 E$(5)="\b8\b2\b1\b4"
700 F$(5)="\b2\b8\b4\b1"
705 AL$(1)="\89\86":AL$(2)="\e9\e6"
710 GOTO15
720 SOUND40,1:SOUND1,1
725 FORI=1TO2
730 FOREE=1TO5
750 PRINT@C-1,E$(EE);
760 PRINT@C+31,F$(EE);
770 PLAY"O1T50AG"
780 NEXTEE
785 NEXTI
787 LL=LL-1:IF LL<1 THEN 5000
788 L$=MID$(STR$(LL),2)
790 PRINT@C-1,"\80\80\80\80";
800 PRINT@C+31,"\80\80\80\80";
810 PRINT@C,C$;
830 RETURN
1000 LOADM"16":FORI=0TO6
1010 RESET(52-I,28):RESET(51+I,28)
1020 PLAY"T50O1AGAGAG"
1030 NEXTI
1040 FORII=1TO4:FORI=1TO4
1050 PRINT@480,"\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80\80";
1060 PLAY"T50O"+MID$(STR$(II),2)
1065 PLAY"T50AGAG"
1070 NEXTI,II
1090 RETURN
5000 FORI=1TO40
5002 CLSRND(8)
5004 PLAY"O4T50G"
5006 NEXTI
5008 LOADM"DROPTITLE"
5010 PRINT@428,"game\90over\90";
5080 I$=INKEY$
5085 IF I$=CHR$(13) THEN 5090
5086 FORDL=1TO300:NEXTDL:PRINT@428,"\90\90\90\90\90\90\90\90\90";
5087 FORDL=1TO300:NEXTDL
5088 GOTO5010
5090 RUN"DROPSHIP"
9000 REM LAND IT
9010 PRINT@480,"\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89\89";
9020 FORI=CTO511STEP32
9030 PRINT@C,"\c6\c9";
9035 XC=C
9040 Q=PEEK(2)AND PEEK(17023)
9050 IF Q=65THENC=C-1 ELSEIFQ=83THEN C=C+1
9060 C=C+32
9061 PLAY"T60O1AGA"
9065 P1=PEEK(16383+C):P2=PEEK(16384+C)
9067 PRINT@XC,"\c0\c0";
9070 IF P1<>128 OR P2<>128 THEN 9200
9100 NEXTI
9110 GOTO9110
9200 IF P1=137 OR P2 =137THEN9500
9210 GOTO5000
9500 PRINT@C-32,"\c6\c9";:PLAY"T255O4;1;2;3;4;5;6;7;8;9;10;11"
9510 FORDL=1TO400:NEXTDL
9515 PRINT@C-96,"\c6\c9";:PRINT@C-64,"\97\9f\96";:PRINT@C-32,"\9d\9f\99";
9520 PLAY"T255O3AGAGAGAO4AGAGAGAGO5AGAGAGAG"
9530 FORCD=10TO1STEP-1
9535 SOUND200,1
9540 FORCX=10TO0STEP-1
9550 PRINT@C,MID$(STR$(CD),2,2);":";MID$(STR$(CX),2,2);"\89";
9555 PLAY"T255O2GF"
9560 NEXTCX,CD
9570 FORI=1TO100
9580 CLSRND(8)
9590 PLAY"T255O1AG"
9595 NEXTI
10000 FORI=1TO20
10010 LOADM MID$(STR$(I),2,2)
10015 FORII=1TO16
10020 PRINT@236,"you\80win";
10040 NEXTII,I
10090 GOTO 10000
