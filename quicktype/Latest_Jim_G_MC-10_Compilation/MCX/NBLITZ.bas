0 CLS0:PRINT@106,"NIGHT BLITZ";:CLEAR328:DIMA(8),B(8),K(128):GOTO100
1 SET(X,Y,C):SET(X,Y+1,C):SET(X+1,Y+1,C):SET(X+2,Y+1,C):SET(X+2,Y,C):SET(X+2,Y+2,C):SET(X+3,Y+1,C):RETURN
2 SET(X,Y+2,C):SET(X+1,Y+2,C):SET(X+1,Y+3,C):SET(X+1,Y,C):SET(X+2,Y+1,C):SET(X+3,Y,C):SET(X+3,Y+2,C):RETURN
3 SET(X+2,Y,C):SET(X+1,Y+1,C):SET(X+2,Y+1,C):SET(X+3,Y+1,C):SET(X+2,Y+2,C):SET(X+1,Y+3,C):SET(X+2,Y+3,C):RETURN
4 SET(X,Y,C):SET(X+2,Y,C):SET(X+1,Y+1,C):SET(X,Y+2,C):SET(X+2,Y+2,C):SET(X+3,Y+2,C):SET(X+2,Y+3,C):RETURN
5 SET(X,Y+1,C):SET(X+1,Y,C):SET(X+1,Y+1,C):SET(X+1,Y+2,C):SET(X+2,Y+1,C):SET(X+3,Y,C):SET(X+3,Y+1,C):RETURN
6 SET(X+2,Y,C):SET(X,Y+1,C):SET(X+2,Y+1,C):SET(X+3,Y+1,C):SET(X+1,Y+2,C):SET(X,Y+3,C):SET(X+2,Y+3,C):RETURN
7 SET(X+2,Y,C):SET(X+3,Y,C):SET(X+2,Y+1,C):SET(X+1,Y+2,C):SET(X+2,Y+2,C):SET(X+3,Y+2,C):SET(X+2,Y+3,C):RETURN
8 SET(X+1,Y,C):SET(X,Y+1,C):SET(X+1,Y+1,C):SET(X+3,Y+1,C):SET(X+2,Y+2,C):SET(X+1,Y+3,C):SET(X+3,Y+3,C):RETURN
9 NEXT:RETURN
10 J=RND(21):R=R+1:ONRND(2)GOTO11:I=59:V=-2:K=5:RETURN
11 I=1:V=2:K=1:RETURN
12 D=D+1:IFD=9THEND=1
13 RETURN
14 D=D-1:IFD=0THEND=8
15 RETURN
20 A=A+A(D):B=B+B(D):IFA>60THENA=4
21 IFA<0THENA=60
23 IFB<0THENB=0
24 I=I+V:IFI>60ORI<0THENGOSUB10
27 PRINT@0,B$B$B$C$;:X=I:Y=J:C=4:ONKGOSUB1,2,3,4,5,6,7,8:X=A:Y=B:C=1:IFPOINT(A,B)ORPOINT(A+3,B+2)THEN115
28 ONDGOSUB1,2,3,4,5,6,7,8:ONK(PEEK(383)ANDPEEK(2))GOSUB12,14,35:GOTO20
35 X=A+1:Y=B+1:FORT=1TO4:X=X+A(D)*2:Y=Y+B(D)*2:IFX<0ORX>63ORY<0THEN52
36 ONPOINT(X,Y)GOTO9,9,9,50,9,52:SET(X,Y,4):SOUND200,1:GOTO9
50 SET(X,Y,2):H=H+1:PRINT@480,H"VICTORIES";:FORZ=1TO2500:NEXT
51 PRINT@480,;:FORZ=1TO15:PRINTCHR$(223);:NEXT:GOSUB10
52 T=4:GOTO9
100 FORX=1TO8:READA(X),B(X):NEXT:FORY=1TO128:B$=B$+CHR$(128):NEXT:FORA=1TO95:READB:C$=C$+CHR$(B+128):NEXT:X=32:Y=16:D=1:R=1
105 K(65)=1:K(90)=2:K(32)=3:PRINT@198,"USE a AND z TO STEER";
115 V=INT(H*100/R)*H:IFV>HSTHENHS=V
120 PRINT@480,"SCORE"V" HIGH"HS" HIT c";:FORC=1TO8:ONDGOSUB1,2,3,4,5,6,7,8:NEXT:K=RND(0):IFINKEY$<>"C"THEN120
125 CLS6:A=32:B=16:D=1:R=0:GOSUB10:H=0:GOTO20
130 DATA1,,1,-1,,-1,-1,-1,-1,,-1,1,,1,1,1,,,,,,87,91,80,,80,80,87,82,,,,,,81,,,,,,,0
150 DATA81,82,,,80,83,,,,,,93,94,80,80,81,95,95,95,91,,,83,82,93,88,,,,82,,82,85,94,92,92,92,95,95,83,95,83,95
160 DATA87,91,83,83,95,95,95,95,95,91,83,95,91,87,83,87,95,83,95,95,91,87,91,83,83,83