1 GOSUB999:CLEAR3500:DIMT$(6),G(32,32),R(6,4),D(2,2),TX(3),TY(3),TV(3),DV(1,3),GF(6,3),HT(6),HS(6),X,Y,G,H,T,V,A,B,C,D,ML,OO
2 DIMI$,A$,B$,C$,S$,Z,O,W,E,F,I,S,TN,L,M,N,P,Q,U,MC,DM,SC,LV,R,DT,DL,T4,VC,C(4),T9,LL,HL,J,K,TT,B1,N6,F3,T5,T8:GOTO600
3 RETURN
4 D=D+O:IFD=FTHEND=Z
5 GOTO7
6 D=D-O:IFD=-OTHEND=E
7 V=O+(D*L):PRINT@Z,MID$(H$(O),V,L)MID$(H$(W),V,L)MID$(H$(E),V,L)MID$(H$(F),V,L)MID$(H$(I),V,L);:RETURN
8 G(H,G)=G(H,G)+C(G(H,G)):RETURN
9 ONABS(G(H+J,G+K)=S)GOTO10:RETURN
10 G(H+J,G+K)=G(H,G):G(H,G)=S:RETURN
20 IFG(X+DV(Z,D),Y+DV(O,D))<>STHENRETURN
25 H=L:G=L:IFX=EORX=T9ORY=EORY=T9THENPRINT@416,"YOU ESCAPED!";:SOUNDOO,O:SOUND200,1:SOUND150,1:G=999:ML=VC:RETURN
30 G(X,Y)=S:X=X+DV(Z,D):Y=Y+DV(O,D):G(X,Y)=I:RETURN
50 POKEVC,T4:DM=DM-RND(DL):PRINT@LL,DM;:SOUNDO,O:IFDM<OTHENPRINT@416,"YOU'RE DEAD.";:SOUND1,5:H=L:G=L:ML=VC
55 RETURN
60 PRINT@R,MID$(T$(O),R(G(X-E,Y+E),D)*F,F)MID$(T$(O),R(G(X-E,Y+W),D)*F,F)MID$(T$(O),R(G(X-E,Y+W),D)*F,F);
62 PRINTMID$(T$(O),R(G(X-E,Y),D)*F,F)MID$(T$(O),R(G(X-E,Y-O),D)*F,F)MID$(T$(O),R(G(X-E,Y-W),D)*F,F)MID$(T$(O),R(G(X-E,Y-E),D)*F,F)
64 M=R(G(X-W,Y+W),D)*S:N=R(G(X-W,Y+O),D)*S:P=R(G(X-W,Y),D)*S:Q=R(G(X-W,Y-O),D)*S:U=R(G(X-W,Y-W),D)*S
65 PRINTMID$(T$(W),M,S)MID$(T$(W),N,S)MID$(T$(W),P,S)MID$(T$(W),Q,S)MID$(T$(W),U,S)
66 PRINTMID$(T$(E),M,S)MID$(T$(E),N,S)MID$(T$(E),P,S)MID$(T$(E),Q,S)MID$(T$(E),U,S)
67 M=R(G(X-O,Y+O),D)*TN:N=R(G(X-O,Y),D)*TN:P=R(G(X-O,Y-O),D)*TN:PRINTMID$(T$(F),M,TN)MID$(T$(F),N,TN)MID$(T$(F),P,TN)
68 PRINTMID$(T$(I),M,TN)MID$(T$(I),N,TN)MID$(T$(I),P,TN):PRINTMID$(T$(S),M,TN)MID$(T$(S),N,TN)MID$(T$(S),P,TN):RETURN
70 PRINT@R,MID$(T$(O),R(G(X-E,Y-E),D)*F,F)MID$(T$(O),R(G(X-W,Y-E),D)*F,F)MID$(T$(O),R(G(X-O,Y-E),D)*F,F);
72 PRINTMID$(T$(O),R(G(X,Y-E),D)*F,F)MID$(T$(O),R(G(X+O,Y-E),D)*F,F)MID$(T$(O),R(G(X+W,Y-E),D)*F,F)MID$(T$(O),R(G(X+E,Y-E),D)*F,F)
74 M=R(G(X-W,Y-W),D)*S:N=R(G(X-O,Y-W),D)*S:P=R(G(X,Y-W),D)*S:Q=R(G(X+O,Y-W),D)*S:U=R(G(X+W,Y-W),D)*S
75 PRINTMID$(T$(W),M,S)MID$(T$(W),N,S)MID$(T$(W),P,S)MID$(T$(W),Q,S)MID$(T$(W),U,S)
76 PRINTMID$(T$(E),M,S)MID$(T$(E),N,S)MID$(T$(E),P,S)MID$(T$(E),Q,S)MID$(T$(E),U,S)
77 M=R(G(X-O,Y-O),D)*TN:N=R(G(X,Y-O),D)*TN:P=R(G(X+O,Y-O),D)*TN:PRINTMID$(T$(F),M,TN)MID$(T$(F),N,TN)MID$(T$(F),P,TN)
79 PRINTMID$(T$(I),M,TN)MID$(T$(I),N,TN)MID$(T$(I),P,TN):PRINTMID$(T$(S),M,TN)MID$(T$(S),N,TN)MID$(T$(S),P,TN):RETURN
80 PRINT@R,MID$(T$(O),R(G(X+E,Y-E),D)*F,F)MID$(T$(O),R(G(X+E,Y-W),D)*F,F)MID$(T$(O),R(G(X+E,Y-O),D)*F,F);
82 PRINTMID$(T$(O),R(G(X+E,Y),D)*F,F)MID$(T$(O),R(G(X+E,Y+O),D)*F,F)MID$(T$(O),R(G(X+E,Y+W),D)*F,F)MID$(T$(O),R(G(X+E,Y+E),D)*F,F)
84 M=R(G(X+W,Y-W),D)*S:N=R(G(X+W,Y-O),D)*S:P=R(G(X+W,Y),D)*S:Q=R(G(X+W,Y+O),D)*S:U=R(G(X+W,Y+W),D)*S
85 PRINTMID$(T$(W),M,S)MID$(T$(W),N,S)MID$(T$(W),P,S)MID$(T$(W),Q,S)MID$(T$(W),U,S)
86 PRINTMID$(T$(E),M,S)MID$(T$(E),N,S)MID$(T$(E),P,S)MID$(T$(E),Q,S)MID$(T$(E),U,S)
87 M=R(G(X+O,Y-O),D)*TN:N=R(G(X+O,Y),D)*TN:P=R(G(X+O,Y+O),D)*TN:PRINTMID$(T$(F),M,TN)MID$(T$(F),N,TN)MID$(T$(F),P,TN)
89 PRINTMID$(T$(I),M,TN)MID$(T$(I),N,TN)MID$(T$(I),P,TN):PRINTMID$(T$(S),M,TN)MID$(T$(S),N,TN)MID$(T$(S),P,TN):RETURN
90 PRINT@R,MID$(T$(O),R(G(X+E,Y+E),D)*F,F)MID$(T$(O),R(G(X+W,Y+E),D)*F,F)MID$(T$(O),R(G(X+O,Y+E),D)*F,F);
91 PRINTMID$(T$(O),R(G(X,Y+E),D)*F,F)MID$(T$(O),R(G(X-O,Y+E),D)*F,F)MID$(T$(O),R(G(X-W,Y+E),D)*F,F)MID$(T$(O),R(G(X-E,Y+E),D)*F,F)
93 M=R(G(X+W,Y+W),D)*S:N=R(G(X+O,Y+W),D)*S:P=R(G(X,Y+W),D)*S:Q=R(G(X-O,Y+W),D)*S:U=R(G(X-W,Y+W),D)*S
94 PRINTMID$(T$(W),M,S)MID$(T$(W),N,S)MID$(T$(W),P,S)MID$(T$(W),Q,S)MID$(T$(W),U,S)
95 PRINTMID$(T$(E),M,S)MID$(T$(E),N,S)MID$(T$(E),P,S)MID$(T$(E),Q,S)MID$(T$(E),U,S)
96 M=R(G(X+O,Y+O),D)*TN:N=R(G(X,Y+O),D)*TN:P=R(G(X-O,Y+O),D)*TN:PRINTMID$(T$(F),M,TN)MID$(T$(F),N,TN)MID$(T$(F),P,TN)
98 PRINTMID$(T$(I),M,TN)MID$(T$(I),N,TN)MID$(T$(I),P,TN):PRINTMID$(T$(S),M,TN)MID$(T$(S),N,TN)MID$(T$(S),P,TN):RETURN
100 FORML=OTOVC:FORH=X-ETOX+E:FORG=Y-ETOY+E:J=SGN(X-H):K=SGN(Y-G):ONR(G(H,G),D(J+O,K+O))GOSUB8,9,8,8
130 IFR(G(X,Y-O),Z)=WORR(G(X,Y+O),W)=WORR(G(X-O,Y),E)=WORR(G(X+O,Y),O)=WTHENGOSUB50
150 ONABS(ASC(INKEY$+C$)-T4)GOSUB6,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,3,3,3,20,3,3,3,3,3,3,3,3,250
170 OND+OGOSUB70,80,90,60:NEXT:NEXT:NEXT
190 PRINT@448,"PRESS c KEY";:IFSC>HS(DL/2)THENHS(DL/2)=SC
191 PRINT@437,"LEVEL";DL/2;:PRINT@469,"HIGH=";HS(DL/2)
192 I$=INKEY$:IFI$<>"C"THEN192
193 IFG>999THEN625
194 GOTO622
250 FORB=B1TOTTSTEP-L:A=PEEK(MC+B):PRINT@B,S$;
255 IFA<>N6ANDA<>F3THENGOSUB280
260 PRINT@B,B$;:NEXT:RETURN
280 SOUNDOO,O:C=B:IFC<T8THENA=X+GF(O,D):B=Y+GF(W,D):DT=W:GOTO295
285 IFB<T5THENA=X+GF(E,D):B=Y+GF(F,D):DT=O:GOTO295
290 A=X+GF(I,D):B=Y+GF(S,D):DT=Z
295 IFG(A,B)=IORG(A,B)=STHENG(A,B)=S:B=TT:RETURN
297 IFRND(HT(R(G(A,B),D))+DT)=OTHENG(A,B)=I:SC=SC+O:PRINT@HL,SC;:B=TT:RETURN
298 SOUND200,O:B=TT:RETURN
300 GOSUB999:LV=LV-1:IFLV<6THENLV=6
305 FORA=ZTOL:FORB=ZTOL:G(A,B)=S:NEXT:NEXT
310 FORA=3TO29:FORB=3TO29:ONRND(LV)GOTO315,315,315,315:G(A,B)=RND(W)+F:NEXT:NEXT:GOTO330
315 G(A,B)=RND(F):NEXT:NEXT
330 A=0:B=0:D=0:X=16:Y=16:G(X,Y)=5:T=0:DM=100
340 RETURN
400 PRINT@416,"";
405 PRINT"               ";CHR$(128)
410 PRINT"              ";CHR$(138);CHR$(128);CHR$(133)
420 PRINT"              ";CHR$(128);CHR$(128);CHR$(128);
430 RETURN
500 TX(1)=4:TX(2)=6:TX(3)=10:TY(1)=1:TY(2)=2:TY(3)=3:TV(1)=0:TV(2)=1:TV(3)=3:B$=" "
501 T$(1)="FAR":T$(2)="NEAR ":T$(3)="NEAR ":T$(4)="NEAREST 4":T$(5)="NEAREST 5":T$(6)="NEAREST 6"
505 FORT=1TO3:FORC=1TO6:CLS:PRINT@256,"KURSK--THE GREATEST TANK BATTLE IN HISTORY--CAN YOU ESCAPE THE  CHAOS COMRADE?!";
510 READI$:PRINT@44,I$;:FORY=1TOTY(T)*2
520 READI$:FORX=1TOTX(T)*2:A$=MID$(I$,X,1)
530 IFA$="#"THENSET(X-1,Y-1,1):GOTO540
531 A=VAL(A$):IFA>0ANDA<9THENSET(X-1,Y-1,A):GOTO540
535 RESET(X-1,Y-1)
540 NEXT:NEXT
550 FORY=1TOTY(T):FORX=1TOTX(T):T$(TV(T)+Y)=T$(TV(T)+Y)+CHR$(PEEK(16383+X+((Y-1)*32))):NEXT:NEXT
570 NEXT:NEXT
590 RETURN
600 GOSUB800:GOSUB500:GOSUB900
622 GOSUB700
625 GOSUB300:CLS:GOSUB7:GOSUB400:GOTO100
700 LV=13:SC=0:CLS:PRINT@256,"LEVEL? (1-6)";
710 I$=INKEY$:DL=RND(6):IFI$=""THEN710
720 DL=VAL(I$):IFDL<1ORDL>6THEN710
730 DL=DL*2:RETURN
800 GOSUB999:FORT=1TO4:FORY=1TO5:READI$
805 FORX=1TO32:A$=MID$(I$,X,1)
810 IFA$="#"THENH$(Y)=H$(Y)+CHR$(175):GOTO840
820 IFA$="@"THENH$(Y)=H$(Y)+CHR$(126):GOTO840
825 IFA$="O"THENH$(Y)=H$(Y)+CHR$(207):GOTO840
830 IFA$="2"THENH$(Y)=H$(Y)+CHR$(159):GOTO840
840 NEXT:NEXT:NEXT:RETURN
900 FORY=0TO2:FORX=0TO2:READ D(X,Y):NEXT:NEXT
920 FORY=0TO3:FORX=1TO6:READ R(X,Y):NEXT:NEXT
930 FORY=0TO3:FORX=0TO1:READ DV(X,Y):NEXT:NEXT
935 FORY=0TO3:FORX=1TO6:READ GF(X,Y):NEXT:NEXT
940 Z=0:O=1:W=2:E=3:F=4:I=5:S=6:TN=10:L=32:T4=64:T9=29:LL=480:HL=506:TT=160:B1=399:N6=96:F3=143:T5=250:T8=208:OO=100
950 HT(1)=3:HT(2)=5:HT(3)=3:HT(4)=2:C(1)=1:C(2)=1:C(3)=1:C(4)=-3
980 S$=CHR$(255):C$="B":R=161:MC=16384:VC=49151
990 RETURN 
999 CLS:PRINT@256,"PLEASE WAIT...":RETURN
1000 DATA"#############OOOO########OOO####"
1002 DATA"############OOOOOO##############"
1003 DATA"#####@@@##################@@@@@#"
1004 DATA"####@@@@@#####@#########@@@@@@@@"
1005 DATA"###@@@@@@@@@@@@@######@@@@@@@@@@"
1011 DATA"###################OOOOO########"
1012 DATA"####################OOO#########"
1013 DATA"######@#########################"
1014 DATA"#####@@@########@@@@@###########"
1015 DATA"@@##@@@@@######@@@@@@@##########"
1021 DATA"################################"
1022 DATA"###OO###########################"
1023 DATA"########OOO#######@@############"
1024 DATA"##############@##@@@@##########@"
1025 DATA"#############@@@@@@@@@########@@"
1031 DATA"################################"
1032 DATA"##############@@@@@@#####222####"
1033 DATA"#######@@##@@@@@@@@@@####222####"
1034 DATA"######@@@@@@@@@@@@@@@@@#########"
1035 DATA"@####@@@@@@@@@@@@@@@@@@@########"
2000 DATA"DISTANT TANKS"
2001 DATA"##OOO###"
2002 DATA"###OOO##"
2003 DATA"DISTANT TANKS"
2010 DATA"##O4O###"
2011 DATA"#OOOOO##"
2012 DATA"DISTANT TANKS"
2020 DATA"###OOO##"
2021 DATA"##OOO###"
2022 DATA"DISTANT TANKS"
2030 DATA"##OOO###"
2031 DATA"#OOOOO##"
2032 DATA"DISTANT TANKS"
2040 DATA"##88O###"
2041 DATA"#O888O##"
2049 DATA""
2050 DATA"########"
2051 DATA"########"
3000 DATA"TANK MOVING LEFT"
3001 DATA"############"
3002 DATA"#OOOOOOO####"
3003 DATA"####OOOO####"
3004 DATA"##OOOOOOOOO#"
3010 DATA"TANK FACE ON"
3011 DATA"############"
3012 DATA"###OOOOO####"
3013 DATA"###OOOOO####"
3014 DATA"##OO#O#OO###"
3020 DATA"TANK MOVING RIGHT"
3021 DATA"############"
3022 DATA"####OOOOOOO#"
3023 DATA"####OOOO####"
3024 DATA"#OOOOOOOOO##"
3030 DATA"REAR OF TANK"
3031 DATA"############"
3032 DATA"###OOOOO####"
3033 DATA"###OOOOO####"
3034 DATA"##OO###OO###"
3035 DATA"BURNING TANK"
3041 DATA"############"
3042 DATA"###O8OOO####"
3043 DATA"##8O8OO8####"
3044 DATA"##OO88#8O###"
3049 DATA"MOVE USING a,s & w"
3051 DATA"############"
3052 DATA"############"
3053 DATA"############"
3054 DATA"############"
4000 DATA"TANK CLOSE UP"
4001 DATA"####################"
4002 DATA"#######OOOOOOO######"
4003 DATA"#OOOOOOOOOOOOO######"
4004 DATA"#######OOOOOOO######"
4005 DATA"###OOOOOOOOOOOOOOOO#"
4006 DATA"####OOOOOOOOOOOOOO##"
4010 DATA"TANK FIRING AT YOU"
4011 DATA"####################"
4012 DATA"######OOOOOOO#######"
4013 DATA"######OOO4OOO#######"
4014 DATA"######OOOOOOO#######"
4015 DATA"####OOOOOOOOOOO#####"
4016 DATA"####OO#######OO#####"
4020 DATA"SIDES ARE VULNERABLE"
4021 DATA"####################"
4022 DATA"######OOOOOOO#######"
4023 DATA"######OOOOOOOOOOOOO#"
4024 DATA"######OOOOOOO#######"
4025 DATA"#OOOOOOOOOOOOOOOO###"
4026 DATA"##OOOOOOOOOOOOOO####"
4030 DATA"SO IS THE REAR"
4031 DATA"####################"
4032 DATA"######OOOOOOO#######"
4033 DATA"######OOOOOOO#######"
4034 DATA"######OOOOOOO#######"
4035 DATA"####OOOOOOOOOOO#####"
4036 DATA"####OO#######OO#####"
4037 DATA"SHOOT BURNING TANKS"
4041 DATA"####O8##############"
4042 DATA"####8O8OOOOOO#######"
4043 DATA"######OO888OO4######"
4044 DATA"####88OOOOOOO#######"
4045 DATA"####OOOOOOO8OOO#####"
4046 DATA"####OO####8O#OO#####"
4049 DATA"TO CLEAR THE WAY"
4051 DATA"####################
4052 DATA"####################
4053 DATA"####################
4054 DATA"####################
4055 DATA"####################
4056 DATA"####################
5100 DATA 2,2,2
5101 DATA 1,0,3
5102 DATA 0,0,0
5200 DATA 1,2,3,4,5,6
5201 DATA 2,3,4,1,5,6
5202 DATA 3,4,1,2,5,6
5203 DATA 4,1,2,3,5,6
5300 DATA 0,-1
5310 DATA 1,0
5320 DATA 0,1
5330 DATA -1,0
6000 DATA 0,-3,0,-2,0,-1
6010 DATA 3,0,2,0,1,0
6020 DATA 0,3,0,2,0,1
6030 DATA -3,0,-2,0,-1,0