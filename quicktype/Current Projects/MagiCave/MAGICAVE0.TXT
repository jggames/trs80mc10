 0010   REM @ COPYRIGHT 1977 JOHN B. TRENHOLME
 0015   PRECISION 9
 0020   PRINT 'CS',@(15),"*** THIS IS THE MAGIC CAVES GAME ***",'LF'
 0030   PRINT "  While wandering through a deep ",
 0040   PRINT "forest, you come upon an old"
 0050   PRINT "man, who tells you of a nearby ",
 0060   PRINT "series of caverns with fabulous"
 0070   PRINT "treasures, but also fearsome dangers.",
 0080   PRINT "  ""Many have entered to get"
 0090   PRINT "rich,"" he says, ""but few have returned.""",
 0100   PRINT "  You decide to go in.  He"
 0110   PRINT "tells you as you set off, ",
 0120   PRINT """They say that magic works down there."""
 0130   PRINT 'LF',"  I will act as eyes, hands and ",
 0140   PRINT "feet for you.  Just tell me"
 0150   PRINT "what to do, and I will obey.",
 0160   PRINT "  However, I am not very smart, so"
 0170   PRINT "only tell me one or two words at ",
 0180   PRINT "a time; I really only read the"
 0190   PRINT "first letter of each word.  The ",
 0200   PRINT "action words I know are:"
 0210   PRINT "Drop (thing)",@(16),"Help",
 0220   PRINT @(32),"Move (way)",@(48),"Use (thing)"
 0230   PRINT "Get (thing)",@(16),"Inventory",
 0240   PRINT @(32),"Quit",@(45),"(e)Xamine caves"
 0250   PRINT "  For example, to move downward, ",
 0260   PRINT "say Move Down or M D (not MD)."
 0270   PRINT "You can acquire or give up things ",
 0280   PRINT "with get and drop.  You use a"
 0290   PRINT "thing to defend yourself.  Don't ",
 0300   PRINT "G, M, OR U dangerous critters."
 0310   PRINT 'LF',"  Start Number (Different numbers ",
 0320   INPUT "give different games): ",J; LET J=ABS(J)
 0330   IF J>1 THEN LET J=1/J
 0340   IF J=0 OR J=1 THEN LET J=1/7
 0350   RANDOMIZE J
 0360   INPUT "  Level of difficulty (0=Easy, 100=hard): ",D
 0370   IF D<0 OR D>100 THEN GOTO 0360
 0380   LET D=.008*D+.1
 0390   PRINT 'LF',"Excuse me... ",
 0400   DEF FNA(T)=INT(T*RND(0))
 0410   LET X0=5,Y0=5,Z0=5
 0420   LET C0=35+FNA(Z0)
 0430   LET T0=8,D0=8
 0440   LET S=0,M=0
 0470   LET X1=X0-1,Y1=Y0-1,Z1=Z0-1
 0480   LET C1=C0-1
 0490   LET T1=T0-1,D1=D0-1
 0500   DIM C[X1,Y1,Z1]
 0510   DIM A[C1]
 0520   DIM D[D1],E[D1],R[D1],R$[D1]
 0530   DIM T[T1],F[T1],T$[T1]
 0540   FOR J=0 TO T1; READ DATA T$[J]; NEXT J
 0550   DATA "C","E","J","N","O","P","V","Z"
 0560   FOR J=0 TO D1; READ DATA R$[J]; NEXT J
 0570   DATA "A","B","F","K","R","S","T","W"
 0580   FOR J=0 TO T1; LET F[J]=0; NEXT J
 0600   FOR X=0 TO X1; FOR Y=0 TO Y1; FOR Z=0 TO Z1
 0610   LET C[X,Y,Z]=FNA(3)-3; NEXT Z; NEXT Y; NEXT X
 0620   LET A[0]=1,A[1]=3; FOR J=2 TO C1-1; LET A[J]=J+2,K=FNA(J)+1
 0630   IF K<J THEN LET T=A[J]; LET A[J]=A[K]; LET A[K]=T
 0640   NEXT J; LET A[C1]=2,X=FNA(X0),Y=FNA(Y0),X4=X,Y4=Y
 0645   PRINT "while i do... ",
 0650   LET Z=Z1,Z2=-1,N=0,K=INT(C0/Z0)-1; IF K=0 THEN LET K=1
 0660   LET C[X,Y,Z]=A[N]; LET N=N+1; IF N>C1 THEN GOTO 0770
 0670   FOR J=1 TO K
 0680   LET X2=FNA(2),Y2=1-X2,T=2*FNA(2)-1
 0690   LET X2=T*X2,Y2=T*Y2,X=X+X2,Y=Y+Y2
 0700   IF X<0 OR X>X1 OR Y<0 OR Y>Y1 THEN LET X=X-X2,Y=Y-Y2; GOTO 0680
 0710   IF C[X,Y,Z]>0 THEN GOTO 0680
 0720   LET C[X,Y,Z]=A[N]; LET N=N+1; IF N>C1 THEN GOTO 0770
 0730   NEXT J; LET Z=Z+Z2; IF Z<0 THEN LET Z=0,Z2=1,K=1
 0740   IF Z2<0 THEN GOTO 0660
 0750   LET X=FNA(X0),Y=FNA(Y0); IF C[X,Y,Z]<0 THEN GOTO 0750
 0760   GOTO 0670
 0770   FOR J=0 TO T1; LET T[J]=FNA(C0-2)+3; NEXT J
 0773   PRINT "a little digging!"
 0776   PRINT "Start at X=",X4," Y=",Y4," Z= 4",'LF'
 0780   FOR J=0 TO D1; LET R[J]=A[FNA(.7*C1)+1]; NEXT J
 0790   LET C2=INT(.07*C0)+1,C3=C1-1-FNA(C2)
 0800   FOR J=0 TO D1; LET D[J]=A[C3],C3=C3-C2; NEXT J
 0810   LET E[0]=0; FOR J=1 TO D1; LET E[J]=J,K=FNA(J+1)
 0820   LET T=E[J],E[J]=E[K],E[K]=T; NEXT J
 0830   LET M$=""; FOR J=1 TO 3+FNA(5); LET M$=M$+CHR(65+FNA(26)); NEXT 
     :  J
 0840   LET N$=""; FOR J=1 TO 3+FNA(5); LET N$=N$+CHR(65+FNA(26)); NEXT 
     :  J
 0850   LET X5=FNA(X0),Y5=FNA(Y0),Z6=FNA(Z1)
 0860   LET M1=C[X5,Y5,Z5]; IF M1<0 THEN GOTO 0850
 0870   LET X6=FNA(X0),Y6=FNA(Y0),Z6=FNA(Z1)
 0880   LET M2=C[X6,Y6,Z6]; IF M2<0 THEN GOTO 0870
 0890   LET H=-1,X8=1,X=X4,Y=Y4,Z=Z1,C=1,L=1
 1000   IF ABS(L)=C OR C=1 THEN GOTO 1010
 1002   PRINT "### It is pitch dark.  If you go on, ",
 1004   PRINT "you may fall into a pit!"; GOTO 1330
 1010   PRINT "*** ",; IF C<>2 THEN PRINT "You are in cave",C
 1020   GOSUB 9100
 1030   FOR J=0 TO T1; IF T[J]<>C THEN GOTO 1130
 1040   ON J GOTO 1050,1060,1070,1080,1090,1100,1110,1120
 1050   PRINT "A jewel-studded Crown is on the ground."; GOTO 1130
 1060   PRINT "An Emerald the size of an egg is here."; GOTO 1130
 1070   PRINT "Precious Jewelry is scattered about."; GOTO 1130
 1080   PRINT "A Nugget of pure gold lies nearby."; GOTO 1130
 1090   PRINT "A shimmering Opal reflects the light."; GOTO 1130
 1100   PRINT "A fabulous Pearl is off to one side."; GOTO 1130
 1110   PRINT "In one corner is a valuable chinese Vase."; GOTO 1130
 1120   PRINT "A gigantic Zircon glitters by your feet."
 1130   NEXT J
 1140   FOR J=0 TO D1; IF R[J]<>C THEN GOTO 1250
 1150   ON J GOTO 1160,1170,1180,1190,1200,1210,1220,1230
 1160   PRINT "The rough-hewn bronze Axe of a dwarf",; GOTO 1240
 1170   PRINT "A happy, singing little yellow bird",; GOTO 1240
 1180   PRINT "A piece of hard, grey Flint",; GOTO 1240
 1190   PRINT "A curved Knife with a carved handle",; GOTO 1240
 1200   PRINT "An old iron Ring with peculiar markings",; GOTO 1240
 1210   PRINT "An ancient rusty Sword with no scabbard",; GOTO 1240
 1220   PRINT "A very small, frigtened cave Toad",; GOTO 1240
 1230   PRINT "A long blue magician's Wand with a star at the end",
 1240   PRINT " is here."
 1250   NEXT J; IF M1<>C THEN GOTO 1270
 1260   PRINT "'Magic word ",M$,"' is carved on the wall here."
 1270   IF M2<>C THEN GOTO 1290
 1280   PRINT "'",N$,"' is scrawled in the dust on the floor."
 1290   IF L=C THEN PRINT "A flickering oil Lamp burns dimly."
 1300   IF X8=1 THEN LET X8=0; GOTO 1330
 1310   LET H=-1; FOR J=0 TO D1; IF D[J]=C THEN LET H=J
 1320   NEXT J; IF H>-1 THEN GOTO 1600
 1330   LET S9=S; FOR J=0 TO T1; IF T[J]=1 THEN LET S9=S9+100
 1340   NEXT J; IF S9=2800 THEN GOTO 7020
 1350   LET M=M+1; PRINT "Move",M," - Score ",S9," - Your command? ",
 1360   LET A$="",B$=""; INPUT Q$; LET A$=Q$(1,1),T=2
 1370   IF LEN(Q$(T))=0 THEN GOTO 1401 ELSE LET B$=Q$(T,1); IF B$="" THE
     :  N GOTO 1401
 1380   LET T=T+1; IF B$<>" " THEN GOTO 1370
 1390   IF LEN(Q$(T))=0 THEN GOTO 1401 ELSE LET B$=Q$(T,1); IF B$="" THE
     :  N GOTO 1401
 1400   LET T=T+1; IF B$=" " THEN GOTO 1390
 1401   IF Q$<>M$ OR C<>M1 THEN GOTO 1405
 1403   LET C9=1,X3=X4,Y3=Y4,Z3=Z1; GOTO 6210
 1405   IF Q$=M$ AND C=1 THEN LET C9=M1,X3=X5,Y3=Y5,Z3=Z5; GOTO 6210
 1407   IF Q$=N$ AND C=M2 THEN GOTO 1403
 1409   IF Q$=N$ AND C=1 THEN LET C9=M2,X3=X6,Y3=Y6,Z3=Z6; GOTO 6210
 1410   IF A$="D" THEN GOTO 2000
 1420   IF A$="G" THEN GOTO 3000
 1430   IF A$="H" THEN GOTO 4000
 1440   IF A$="I" THEN GOTO 5000
 1450   IF A$="M" THEN GOTO 6000
 1460   IF A$="Q" THEN GOTO 7000
 1470   IF A$="U" THEN GOTO 8000
 1480   IF A$="X" THEN LET X8=1; GOTO 1000
 1490   IF A$="Z" THEN GOTO 20000
 1500   PRINT "I am too stupid to understand your command."
 1510   PRINT "Please say Drop, Get, Help, Inventory, Move,"
 1520   PRINT "Quit, Use or Xamine (sic) so I will comprehend."
 1530   GOTO 1350
 1600   ON H GOTO 1610,1630,1650,1670,1690,1710,1730,1750
 1610   PRINT "A giant bat with poison fangs swoops toward you!"
 1620   LET D$="bat"; GOTO 1770
 1630   PRINT "A ferocious cave bear tries to crush you!"
 1640   LET D$="bear"; GOTO 1770
 1650   PRINT "A huge green dragon breathes fire toward you!"
 1660   LET D$="dragon"; GOTO 1770
 1670   PRINT "A threatening dwarf chops at you with his axe!"
 1680   LET D$="dwarf"; GOTO 1770
 1690   PRINT "The ogre who lives in these caves hurls a boulder!"
 1700   LET D$="ogre"; GOTO 1770
 1710   PRINT "A bearded pirate swings his cutlass at your head!"
 1720   LET D$="pirate"; GOTO 1770
 1730   PRINT "A big black snake tries to wrap you in its coils!"
 1740   LET D$="snake"; GOTO 1770
 1750   PRINT "A monstrous spider spins a sticky web toward you!"
 1760   LET D$="spider"
 1770   FOR J=0 TO 3000; NEXT J; IF RND(0)>.1*D THEN GOTO 1790
 1780   PRINT "AAARRRRRGGGHHHHHHH!!!!  The ",D$," got you!"; GOTO 6170
 1790   IF RND(0)>.5 THEN GOTO 1330
 1800   PRINT "That was close!  The ",D$," almost got you!"; GOTO 1330
 2000   IF B$="" THEN PRINT "Drop what object?"; GOTO 1350
 2010   LET T=1; GOSUB 2500; IF K=0 THEN GOTO 1350
 2020   LET T=-1; FOR J=0 TO T1; IF B$=T$[J] THEN LET T=J
 2030   NEXT J; IF T<0 THEN GOTO 2060
 2040   IF T[T]=-C THEN LET T[T]=C; PRINT "Ok"; GOTO 1330
 2050   PRINT "You're not carrying it."; GOTO 1350
 2060   LET T=-1; FOR J=0 TO D1; IF B$=R$[J] THEN LET T=J
 2070   NEXT J; IF T<0 THEN GOTO 2100
 2080   IF R[T]=-C THEN LET R[T]=C; PRINT "Ok"; GOTO 1350
 2090   GOTO 2050
 2100   IF L=-C THEN LET L=C; PRINT "Ok"; GOTO 1350
 2110   GOTO 2050
 2500   LET K=1; IF T=0 THEN GOTO 2540
 2510   FOR J=0 TO T1; IF B$=T$[J] THEN EXITTO 2630
 2530   NEXT J; IF B$="L" THEN GOTO 2630
 2540   FOR J=0 TO D1; IF B$=R$[J] THEN EXITTO 2630
 2550   NEXT J
 2560   LET K=0; IF T=0 THEN GOTO 2600
 2570   PRINT "I don't understand.  The things I can handle are:"
 2580   PRINT "Crown Emerald Jewelry Lamp Nugget"
 2590   PRINT "Opal Pearl Vase Zircon"; GOTO 2610
 2600   PRINT "What?  You can use these to defend yourself:"
 2610   PRINT "Axe Bird Flint Knife"
 2620   PRINT "Ring Sword Toad Wand"
 2630   RETURN 
 3000   IF B$="" THEN PRINT "Get what object?"; GOTO 1350
 3010   LET T=1; GOSUB 2500; IF K=0 THEN GOTO 1350
 3020   LET T=0; FOR J=0 TO T1; IF T[J]<0 THEN LET T=T+1
 3030   NEXT J; FOR J=0 TO D1; IF R[J]<0 THEN LET T=T+1
 3040   NEXT J; IF L<0 THEN LET T=T+1
 3050   IF T<8 THEN GOTO 3080
 3060   PRINT "You're carrying too much!  Drop something ",
 3070   PRINT "first."; GOTO 1350
 3080   LET T=-1; FOR J=0 TO T1; IF B$=T$[J] THEN LET T=J
 3090   NEXT J; IF T<0 THEN GOTO 3140
 3100   IF T[T]=C THEN LET T[T]=-C; PRINT "Ok"; GOTO 1330
 3110   IF T[T]<>-C THEN GOTO 3130
 3120   PRINT "You're already carrying it."; GOTO 1350
 3130   PRINT "I can't find that anywhere in this cave."; GOTO 1350
 3140   LET T=-1; FOR J=0 TO D1; IF B$=R$[J] THEN LET T=J
 3150   NEXT J; IF T<0 THEN GOTO 3190
 3160   IF R[T]=C THEN LET R[T]=-C; PRINT "Ok"; GOTO 1350
 3170   IF R[T]<>-C THEN GOTO 3130
 3180   GOTO 3120
 3190   IF L=C THEN LET L=-C; PRINT "Ok"; GOTO 1350
 3200   IF L<>-C THEN GOTO 3130
 3210   GOTO 3120
 4000   PRINT "A tall wizard with piercing eyes appears in a puff"
 4010   PRINT "of green smoke.  Hey says, ""I can whisk you out of"
 4020   PRINT "here, but it will cost you 100 points."""
 4030   INPUT "Do you want to go? ",Q$; IF Q$(1,1)<>"Y" THEN GOTO 1310
 4040   GOTO 6202
 5000   LET T=0; FOR J=0 TO T1; IF T[J]<0 THEN LET T=T+1
 5010   NEXT J; FOR J=0 TO D1; IF R[J]<0 THEN LET T=T+1
 5020   NEXT J; IF L<0 THEN LET T=T+1
 5030   IF T>0 THEN GOTO 5050
 5040   PRINT "You're not carrying anything."; GOTO 1350
 5050   PRINT "You are now carrying:"
 5060   IF T[0]<0 THEN PRINT "  Crown"
 5070   IF T[1]<0 THEN PRINT "  Emerald"
 5080   IF T[2]<0 THEN PRINT "  Jewelry"
 5090   IF T[3]<0 THEN PRINT "  Nugget"
 5100   IF T[4]<0 THEN PRINT "  Opal"
 5110   IF T[5]<0 THEN PRINT "  Pearl"
 5120   IF T[6]<0 THEN PRINT "  Vase"
 5130   IF T[7]<0 THEN PRINT "  Zircon"
 5140   IF R[0]<0 THEN PRINT "  Axe"
 5150   IF R[1]<0 THEN PRINT "  Bird"
 5160   IF R[2]<0 THEN PRINT "  Flint"
 5170   IF R[3]<0 THEN PRINT "  Knife"
 5180   IF R[4]<0 THEN PRINT "  Ring"
 5190   IF R[5]<0 THEN PRINT "  Sword"
 5200   IF R[6]<0 THEN PRINT "  Toad"
 5210   IF R[7]<0 THEN PRINT "  Wand"
 5220   IF L<0 THEN PRINT "  Lamp"
 5230   GOTO 1350
 6000   LET X2=0,Y2=0,Z2=0; IF B$="E" THEN LET X2=1; GOTO 6080
 6010   IF B$="W" THEN LET X2=-1; GOTO 6080
 6020   IF B$="N" THEN LET Y2=1; GOTO 6080
 6030   IF B$="S" THEN LET Y2=-1; GOTO 6080
 6040   IF B$="U" THEN LET Z2=1; GOTO 6080
 6050   IF B$="D" THEN LET Z2=-1; GOTO 6080
 6060   PRINT "I can move you East, West, North, South, ",
 6070   PRINT "Up, and Down."; GOTO 1350
 6080   IF C=1 AND Z2=1 THEN PRINT "This isn't a forest game."; GOTO 135
     :  0
 6090   LET X3=X+X2,Y3=Y+Y2,Z3=Z+Z2,C9=-3+FNA(3)
 6100   IF X3<0 OR X3>X1 OR Y3<0 OR Y3>Y1 OR Z3<0 OR Z3>Z1 THEN GOTO 612
     :  0
 6110   LET C9=C[X3,Y3,Z3]; IF C9>0 THEN GOTO 6210
 6120   PRINT "In that direction there is ",; IF C9<-1 THEN GOTO 6140
 6130   PRINT "a passage too narrow to follow."; GOTO 1310
 6140   IF C9=-2 THEN PRINT "only solid rock."; GOTO 1310
 6150   IF ABS(L)=C THEN PRINT "a deep, dangerous pit."; GOTO 1310
 6155   PRINT "... YIIIEEEEEEE!!!"
 6160   PRINT "You stumbled into a pit in the dark!"
 6170   PRINT 'LF',"Unfortunately, you are now dead."
 6180   LET C9=1,S=S-300; PRINT "As a result, your score is ",S,".",'LF'
 6190   PRINT "I can reincarnate you, but it will cost 100 points."
 6200   INPUT "Shall I do it? ",Q$; IF Q$(1,1)<>"Y" THEN GOTO 7020
 6202   LET S=S-100; FOR J=0 TO T1; LET T[J]=ABS(T[J]); NEXT J
 6204   FOR J=0 TO D1; LET R[J]=ABS(R[J]); NEXT J
 6210   FOR J=0 TO T1; IF T[J]<0 THEN LET T[J]=-C9
 6220   NEXT J; FOR J=0 TO D1; IF R[J]<0 THEN LET R[J]=-C9
 6230   NEXT J; IF L<0 THEN LET L=-C9
 6240   LET T=0; FOR J=0 TO D1; IF D[J]=C9 THEN LET T=1
 6250   NEXT J; IF RND(0)>D OR C9=1 OR C9=2 OR T=1 THEN GOTO 6280
 6260   FOR J=0 TO D1; IF D[J]=C THEN LET D[J]=C9
 6270   NEXT J
 6280   LET C=C9; FOR J=0 TO T1; IF T[J]=C AND F[J]=0 AND L=-C THEN LET 
     :  F[J]=1; LET S=S+50
 6290   NEXT J; LET X=X3,Y=Y3,Z=Z3; GOTO 1000
 7000   INPUT "Do you really want to quit? ",Q$
 7010   IF Q$(1,1)<>"Y" THEN GOTO 1000
 7020   PRINT 'LF',"Your adventures in the caves are over."
 7030   PRINT "Your final score is",S9,"... at difficulty level ",
 7035   PRINT STR((D-.1)/.008),".",'LF'
 7040   IF S9<0 THEN PRINT "Better luck next time!"; GOTO 7100
 7050   IF S9<1000 THEN PRINT "You need more practice."; GOTO 7100
 7060   IF S9<2000 THEN PRINT "You did pretty well!"; GOTO 7100
 7070   IF S9<2500 THEN PRINT "You're really very good!!"; GOTO 7100
 7080   IF S9<2800 THEN PRINT "You did a fantastic job!!!"; GOTO 7100
 7090   PRINT "That's the highest possible score!!!!"
 7100   PRINT 'LF',"Thanks for playing the game."; END 
 8000   LET T=0; GOSUB 2500; IF K=0 THEN GOTO 1350
 8010   IF R[J]=-C THEN GOTO 8040
 8020   IF R[J]=C THEN GOTO 2050
 8030   GOTO 3130
 8040   IF H<0 THEN PRINT "There's no danger here."; GOTO 1350
 8050   ON J GOTO 8060,8070,8080,8090,8100,8110,8120,8130
 8060   PRINT "You swing the bronze axe at",; GOTO 8140
 8070   PRINT "The little bird darts forward and pecks",; GOTO 8140
 8080   PRINT "The flint hits a rock; sparks fly onto",; GOTO 8140
 8090   PRINT "You thrust your knife toward",; GOTO 8140
 8100   PRINT "Blue light springs from the ring onto",; GOTO 8140
 8110   PRINT "You swing your sword straight at",; GOTO 8140
 8120   PRINT "The toad's long tongue darts out to hit",; GOTO 8140
 8130   PRINT "Red smoke flows from the wand and surrounds",; GOTO 8140
 8140   PRINT " the ",D$,"!"; FOR T=0 TO 3000; NEXT T
 8150   LET T=RND(0); IF E[J]=H THEN LET T=1
 8160   IF T<D THEN GOTO 8190
 8170   PRINT 'LF',"Congratulations!  You killed the ",D$,"!",'LF'
 8180   LET D[H]=0,H=-1,S=S+200; GOTO 1330
 8190   PRINT "There is no effect on the ",D$,"!!!"
 8200   IF RND(0)>.1*D THEN GOTO 1310
 8210   PRINT "Oh, no!!!  The ",D$," has destroyed the ",
 8220   LET R[J]=0; ON J GOTO 8230,8240,8250,8260,8270,8280,8290,8300
 8230   PRINT "axe!"; GOTO 1310
 8240   PRINT "bird!"; GOTO 1310
 8250   PRINT "flint!"; GOTO 1310
 8260   PRINT "knife!"; GOTO 1310
 8270   PRINT "ring!"; GOTO 1310
 8280   PRINT "sword!"; GOTO 1310
 8290   PRINT "toad!"; GOTO 1310
 8300   PRINT "wand!"; GOTO 1310
 9100   ON C GOTO 9102,9200,9210,9220,9230,9240,9250,9260,9270,9280,9290
     :  ,9102
 9102   ON C-10 GOTO 9104,9300,9310,9320,9330,9340,9350,9360,9370,9380,9
     :  104
 9104   ON C-19 GOTO 9106,9400,9410,9420,9430,9440,9450,9106
 9106   ON C-26 GOTO 9108,9460,9470,9480,9490,9500,9510,9520
 9108   ON C-33 GOTO 9140,9530,5940,9550,9560,9570,9140
 9140   PRINT "This is a high, echoing champer."; RETURN 
 9200   PRINT "This is the entrance pit.  Above is daylight, but"
 9202   PRINT "in all other directions it is dark."; RETURN 
 9210   PRINT "You are lost in a maze of twisting tunnels."; RETURN 
 9220   PRINT "Swaying tendrils of white mist obscure the"
 9222   PRINT "view in all directions."; RETURN 
 9230   PRINT "A splashing stream cascades over a waterfall"
 9232   PRINT "on the side of the room."; RETURN 
 9240   PRINT "Bouslers fill the cave on all sides."; RETURN 
 9250   PRINT "A rumbling volcano pours forth lava, filling the"
 9252   PRINT "area with heat and smoke."; RETURN 
 9260   PRINT "The path is on the edge of a deep chasm."; RETURN 
 9270   PRINT "The walls are studded with fossil shells."; RETURN 
 9280   PRINT "A cold, icy wind is howling through."; RETURN 
 9290   PRINT "Gnawed bones are scattered about.  This is"
 9292   PRINT "the home of a cave ogre."; RETURN 
 9300   PRINT "White sand covers most of the floor."; RETURN 
 9310   PRINT "Bubbling mud pots fill the air with the"
 9312   PRINT "pungent smell of sulfur."; RETURN 
 9320   PRINT "Moss covers the floor and walls."; RETURN 
 9330   PRINT "Glistening ice covers one wall,"
 9332   PRINT "and chills the air."; RETURN 
 9340   PRINT "This is almost too narrow to get through."; RETURN 
 9350   PRINT "You must crawl under a low roof over cobbled ",
 9352   PRINT "stones."; RETURN 
 9360   PRINT "The walls are majestic pillars of orange ",
 9362   PRINT "stone."; RETURN 
 9370   PRINT "A vast cavern extends into the gloom."; RETURN 
 9380   PRINT "Sharp fragments of stone lie all about."; RETURN 
 9390   PRINT "This is a long hall made by lava."; RETURN 
 9400   PRINT "You have to squeeze through narrow cracks"
 9402   PRINT "in the solid rock."; RETURN 
 9410   PRINT "there is a deep fissure in the center."; RETURN 
 9420   PRINT "Lacy curtains of stalactites hang down"
 9422   PRINT "from the ceiling on all sides."; RETURN 
 9430   PRINT "A rockfall has filled most of the area."; RETURN 
 9440   PRINT "A quiet pond of clear water is on the side."; RETURN 
 9450   PRINT "There are crude furnishings made of old ship's"
 9452   PRINT "timbers.  This is the den of a pirate."; RETURN 
 9460   PRINT "Holes of all sizes cover the walls."; RETURN 
 9470   PRINT "Slippery mud makes the footing treacherous."; RETURN 
 9480   PRINT "A small stream meanders along the side."; RETURN 
 9490   PRINT "This is a low, sloping hallway."; RETURN 
 9500   PRINT "Peculiar footprints disturb the dust."; RETURN 
 9510   PRINT "There are rustling and squeaking noises from"
 9512   PRINT "the darkness above you."; RETURN 
 9520   PRINT "Everything is covered by a thick dust layer."; RETURN 
 9530   PRINT "A hug spider web is strung overhead."; RETURN 
 9540   PRINT "Dwarves have been digging for treasure."; RETURN 
 9550   PRINT "Flashing sheets of pure alabaster form the"
 9552   PRINT "walls, and white gravel crunches underfoot."; RETURN 
 9560   PRINT "Several columns join to form a dome."; RETURN 
 9570   PRINT "There are scorched marks on all the walls."
 9572   PRINT "This appears to be the home of a dragon."; RETURN 
20000   INPUT "Z? ",Z7; IF Z7<0 OR Z7>Z1 THEN GOTO 1000
20010   FOR Y7=Y1 TO 0 STEP -1; FOR X7=0 TO X1; LET T=10+6*X7
20020   PRINT @(T),C[X7,Y7,Z7],; NEXT X7; PRINT ; NEXT Y7; GOTO 20000
