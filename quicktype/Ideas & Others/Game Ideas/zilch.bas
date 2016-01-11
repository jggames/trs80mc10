1 REM ZILCH (C) COPYRIGHT 1980 BY MORRIE WILSON
2 REM ****** ZILCH       BY MORRIE WILSON
3 REM
4 REM  A DICE GAME FOR 1 TO 9 PLAYERS,
5 REM   AND THE COMPUTER CAN BE A PLAYER TOO.
6 REM
7 REM
8 REM  THIS IS A FREE PROGRAM.  NO COMMERCIAL USE ALLOWED.
9 REM  FOR INFO: MORRIE WILSON / 2527 56TH SW /SEATTLE WASH / 98116
10 REM  IF YOU HAVE MICROSOFT 5.+ BASIC, REMOVE "REM" FROM LINE 35
11 REM  TO ALLOW IT TO GENERATE RANDOM NUMBERS. THIS PROGRAM IS
12 REM  COMPATIBLE WITH MICROSOFT BASIC 4.51 AND 5.03
13 REM  IF CODING LOOKS STRANGE & REDUNDANT, IT IS BECAUSE I'M TRYING
14 REM  TO REMAIN COMPATIBLE WITH BOTH BASICS.
15 REM
16 REM  IF IT RUNS, BUT THE DICE VALUES ARE STRANGE, THEN ITS
17 REM  PROBABLY THAT YOUR BASIC HANDLES RANDOM NUMBER GENERATION
18 REM  DIFFERENTLY.  CHECK OUT THE RND(X) STUFF IN LINE 74
19 W6=250
20 A1$="ABCDEF"
21 A=ASC("A")
22 PRINT TAB(30);"ZILCH"
23 A$="N":INPUT "DO YOU WANT INSTRUCTIONS ";A$
24 IF LEFT$(A$,1)="Y" THEN GOSUB 149
25 INPUT "NUMBER OF PLAYERS";N1
26 N1=INT(N1):IF N1<1 THEN PRINT "WHAT....YOU CAN'T DO THAT":GOTO 25
27 IF N1>9 THEN PRINT "TOO MANY PLAYERS FOR THIS GAME":GOTO 25
28 FOR II=1 TO N1:PRINT "THE NAME PLEASE....OF PLAYER #";II;"  "
29 INPUT N9$(II):FOR I9=1 TO LEN(N9$(II)):R9=R9+ASC(MID$(N9$(II),I9,1)):NEXT I9
30 NEXT II
31 R9=R9*3.14161:IF R9>65000 THEN R9=R9/5.67:GOTO 31
32 R9=INT(R9)
33 FOR I=1 TO 200:NEXT I
34 PRINT:PRINT
35 REM RANDOMIZE R9
36 W7$="Y":W4=0:INPUT "CAN I PLAY TOO ";W7$
37 IF LEFT$(W7$,1)<>"Y" THEN 40
38 N1=N1+1:N9$(N1)="<WALTER>"
39 W4=N1
40 S8=0
41 FOR N=1 TO N1 : S1(N)=0 : NEXT N
42 FOR N=1 TO N1
43 IF N=S8 THEN 137
44 S=0:D=6:S9=0
45 PRINT:PRINT:PRINT:PRINT "IT'S ";N9$(N);"'S TURN"
46 PRINT:PRINT
47 IF S8<>0 THEN PRINT "************************ LAST TURN******"
48 FOR K9=1 TO N1:PRINT N9$(K9);" HAS ";S1(K9):NEXT K9
49 PRINT N9$(N)".    YOUR GAME TOTAL SO FAR IS ";S1(N)
50 PRINT "CURRENT TURN SCORE IS ";S
51 S2=S1(N)+S
52 IF S2<500 THEN S2=0
53 PRINT "IF YOU STOP NOW YOUR TOTAL WILL BE ";S2
54 W$="DICE":IF D=1 THEN W$="DIE"
55 PRINT "YOU HAVE";D;" ";W$;" LEFT.  DO YOU WISH TO ROLL  ";
56 A$="Y":IF W4<>N THEN INPUT A$:GOTO 67
57 PRINT "?";:FOR W5=1 TO W6:NEXT W5:A$="Y"
58 IF D<=2 THEN A$="N"
59 IF S2=0 THEN A$="Y"
60 IF S>999 AND D<=4 THEN A$="N"
61 W9=S2
62 IF S8=0 THEN 66
63 FOR W5=1 TO N1:IF W9<S1(W5) THEN W9=S1(W5)
64 NEXT W5
65 IF S2<W9 THEN A$="Y"
66 PRINT A$:FOR W5=1 TO W6:NEXT W5
67 PRINT:PRINT
68 IF LEN(A$)=0 THEN 70
69 IF LEFT$(A$,1)="N" THEN 129
70 FOR D9=1 TO D
71 REM D1(D9)=INT(RND(R9)*6+1) IS SUPPOSED TO PUT A RANDOM
72 REM VALUE BETWEEN 1 AND 6 INTO D1(D9).  YOU MAY HAVE
73 REM FIDDLE WITH IT IF IT DOES NOT WORK FOR YOUR BASIC
74 D1(D9)=INT(RND(R9)*6+1):PRINT CHR$(A+D9-1);"=";D1(D9);"    ";
75 NEXT D9:PRINT
76 PRINT
77 GOTO 79
78 PRINT "WHAT!!!???.....RETYPE LINE"
79 A$=LEFT$(A1$,D):IF W4<>N THEN INPUT "WHICH DIE DO YOU WISH TO KEEP";A$:GOTO 83
80 PRINT "WHICH DIE DO YOU WISH TO KEEP? ";
81 FOR W5=1 TO W6*2:NEXT W5:A$=LEFT$(A1$,D)
82 PRINT A$
83 PRINT:PRINT:IF A$="?" THEN GOSUB 204: GOTO 79
84 IF LEN(A$)=0 THEN A$=LEFT$(A1$,D):GOTO 89
85 L=LEN(A$):IF L<2 THEN 89 
86 FOR I=1 TO L-1:FOR II=I+1 TO L
87 IF MID$(A$,I,1)=MID$(A$,II,1) THEN 78
88 NEXT II:NEXT I
89 L=LEN(A$):IF L>D THEN 78
90 FOR D9=1 TO L:D8=ASC(MID$(A$,D9,1))-A+1
91 IF D8<1 OR D8>D THEN 78
92 H9(D9)=D1(D8)
93 NEXT D9
94 IF L=1 THEN 100
95 FOR I=1 TO L-1
96 FOR J=1 TO L-I
97 IF H9(J)<H9(J+1) THEN 99
98 T=H9(J):H9(J)=H9(J+1):H9(J+1)=T
99 NEXT J:NEXT I
100 IF L<>6 THEN 107
101 FOR I=1 TO 6
102 IF H9(I)<>I THEN 107
103 NEXT I
104 S=S+1000
105 D=0
106 GOTO 121
107 C=1
108 IF C>L THEN 121
109 IF C+2>L THEN 117
110 FOR C9=C TO C+1
111 IF H9(C9)<>H9(C9+1) THEN 117
112 NEXT C9
113 S=H9(C)*100+S
114 IF H9(C)=1 THEN S=S+900
115 C=C+3:D=D-3
116 GOTO 108
117 IF H9(C)=5 THEN S=S+50:D=D-1
118 IF H9(C)=1 THEN S=S+100:D=D-1
119 C=C+1
120 GOTO 108
121 IF S=S9 THEN 126
122 S9=S
123 IF D<>0 THEN 49
124 PRINT "ALL DIE SCORED, YOU GET 6 MORE DIE TO CONTINUE"
125 D=6:GOTO 50
126 S=0
127 PRINT   "    *** ZILCH ***"
128 FOR W5=1 TO 300 : NEXT W5
129 REM
130 IF S1(N)<>0 THEN 132
131 IF S<500 THEN 133
132 S1(N)=S1(N)+S
133 IF S8<>0 THEN 135
134 IF S1(N)>4999 THEN S8=N
135 NEXT N
136 GOTO 42
137 PRINT:PRINT:PRINT
138 Q=0
139 FOR I=1 TO N1
140 PRINT N9$(I);" HAS A SCORE OF ";S1(I)
141 IF S1(I)>Q THEN Q1=I:Q=S1(I)
142 NEXT I
143 PRINT:PRINT N9$(Q1);" HAS WON THIS GAME"
144 GOTO 145
145 A$="Y":INPUT "WOULD YOU LIKE TO PLAY AGAIN";A$
146 IF LEN(A$)=0 THEN A$="Y"
147 IF LEFT$(A$,1)="Y" THEN 25
148 END
149 PRINT:PRINT:PRINT:PRINT
150 PRINT "                  ZILCH"
151 PRINT "                               BY MORRIE WILSON"
152 PRINT
153 PRINT
154 PRINT
155 PRINT "THIS IS THE GAME OF ZILCH.  IT IS A DICE GAME FOR 1 TO 9 PLAYERS."
156 PRINT "THE OBJECT OF THE GAME IS TO ROLL DIE, AND GAIN THE MOST POINTS"
157 PRINT "DURING THE COURSE OF THE GAME.  IN ORDER TO WIN, A COMBINATION OF"
158 PRINT "BOTH LUCK AND STRATEGY IS NECESSARY.  WHAT YOU ROLL IS LUCK, BUT"
159 PRINT "WHAT YOU DO WITH YOUR ROLL IS STRATEGY.  NOW FOR THE DETAILS"
160 PRINT 
161 PRINT "PRESS RETURN TO CONTINUE";:INPUT A$
162 FOR I=1 TO 25:PRINT:NEXT I
163 PRINT
164 PRINT "THE PLAY ROTATES AMONGST THE PLAYERS, WITH EACH PLAYER"
165 PRINT "COMPLETING A SERIES OF ROLLS WHICH COMPRISE HIS TURN."
166 PRINT 
167 PRINT "A TURN CONSISTS OF STARTING OUT WITH SIX DIE.  ALL OF THEM ARE"
168 PRINT "ROLLED.  THE DIE ARE THEN EXAMINED, AND SOME OF THE DIE THAT"
169 PRINT "HAVE POINTS ARE PULLED FROM THE PLAY, WITH THE POINTS REPRESENTED"
170 PRINT "BEING ADDED TO A PLAYER'S TURN TOTAL.  THE PLAYER THEN ROLLS"
171 PRINT "THE REMAINING DIE.  THE PLAYER CONTINUES TO ROLL AND PULL DIE"
172 PRINT "UNTIL IT IS FELT THAT TO CONTINUE TO DO SO WILL RESULT IN A ZILCH."
173 PRINT "IF A PLAYER ROLLS THE DIE AND FINDS THAT NONE OF DIE HAVE POINTS"
174 PRINT "SHOWING, THEN THE PLAYER HAS ZILCHED, AND LOSES ALL POINTS THAT"
175 PRINT "HE HAS ACCUMULATED DURING THE CURRENT TURN.  NOTE THAT POINTS"
176 PRINT "FROM PREVIOUS TURNS ARE NOT AFFECTED.  CONFUSING, ISN'T IT?"
177 PRINT "WELL PLAY A FEW TIMES AND THEN IT WILL BECOME OBVIOUS."
179 PRINT 
180 PRINT "PRESS RETURN TO CONTINUE";:INPUT A$
181 FOR I=1 TO 25:PRINT:NEXT I
182 PRINT "A PLAYER MUST GET AT LEAST 500 POINTS IN ONE TURN"
183 PRINT "TO GET INTO THE GAME.  AFTER THE INITIAL 500 POINTS IS"
184 PRINT "OBTAINED, THERE IS NO MINIMUM NUMBER OF POINTS NECESSARY TO
185 PRINT "ACCUMULATE MORE POINTS.
186 PRINT
187 PRINT "IF A PLAYER SCORES ON ALL SIX OF THE ORIGINAL DIE, SIX MORE"
188 PRINT "DIE ARE GIVEN TO OBTAIN ADDITIONAL POINTS (BUT WATCH OUT"
189 PRINT "FOR ZILCHING)."
190 PRINT
191 PRINT "WHENEVER A PLAYER GET 5000 OR MORE POINTS, ALL THE OTHER PLAYERS"
192 PRINT "GET ONE MORE TURN TO TRY TO BEAT THE HIGHEST SCORE.  THE PLAYER"
193 PRINT "WITH THE HIGHEST SCORE WINS."
194 PRINT
195 PRINT "THE COMPUTER CAN ALSO ACT AS ONE OF THE PLAYERS, IF YOU LET HIM."
196 PRINT "<WALTER>, THE COMPUTER WILL ASK IF HE CAN PLAY LATER."
197 PRINT:PRINT:PRINT "PRESS RETURN TO CONTINUE";:INPUT A$
198 FOR I=1 TO 25:PRINT:NEXT I
199 GOSUB 204
200 PRINT "DURING THE PLAY OF THE GAME, A QUESTION MARK WILL GET YOU A "
201 PRINT "LISTING OF HOW THE DIE SCORE AGAIN."
202 PRINT:PRINT:PRINT:PRINT:PRINT
203 RETURN
204 PRINT "SCORING"
205 PRINT
206 PRINT "5         - 50  POINTS           1         - 100 POINTS"
207 PRINT "2 : 2 : 2 - 200 POINTS           3 : 3 : 3 - 300 POINTS"
208 PRINT "4 : 4 : 4 - 400 POINTS           5 : 5 : 5 - 500 POINTS"
209 PRINT "6 : 6 : 6 - 600 POINTS           1 : 1 : 1 - 1000 POINTS"
210 PRINT
211 PRINT "1 : 2 : 3 : 4 : 5 : 6 - (IN 1 ROLL, IN ANY ORDER) 1000 POINTS"
212 PRINT:PRINT "A RETURN WILL ALWAYS GIVE YOU THE MAXIMUM POINTS POSSIBLE"
213 PRINT:PRINT:PRINT:RETURN
