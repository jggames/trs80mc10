' MATTEL CLASSIC FOOTBALL v0.2                         
' bomberpunk entertainment 2006

' use the [arrow keys] to move up, down, left and right.
' press [P] to punt on the 4th down when behind the 50-yardline, or run it.
' press [K] to kick on the 4th down when beyond the 50-yardline, or run it.
' hit the [spacebar] to start the game or begin the next play.
' press [-] to toggle sound on/off.
' press [+] to open/close gamespeed menu. use arrow keys to adjust speed.

' ORIGINAL: both teams are the unchanged red LEDs. no backwards movement.
' NEW MODE: player 1 is RED, player two is BLUE. you can travel backwards.
'           backing into your endzone awards 3 points to the other team.
'           the start-of-play formation has also changed.

' press [shift] + [f5] to begin
'                                       created & programmed june 29, 2006.
MAXdeelay = 3000
' after four miserable failures in the past, i finally do it right...
' (scroll down to the bottom of the program for info)

SCREEN 7: RANDOMIZE TIMER: CLS : SLEEP 1: SND$ = "Y"

COLOR 10: LOCATE 12, 12: PRINT "bomberpunk presents..."
SLEEP 4: CLS : SLEEP 1: COLOR 2: GOSUB PRINT.FIELD
SLEEP 2: COLOR 15: LOCATE 12, 13: PRINT "CLASSIC FOOTBALL!"
DO: LOOP UNTIL INKEY$ = " "
LOCATE 12, 13: PRINT " [S]TART  [H]ELP "
COLOR 12: LOCATE 12, 15: PRINT "S": COLOR 11: LOCATE 12, 24: PRINT "H"
DO: a$ = INKEY$
IF UCASE$(a$) = "S" THEN GOSUB GAME.SELECT
IF UCASE$(a$) = "H" THEN GOSUB HELP.SCREEN
LOOP UNTIL a$ = CHR$(27): CLS : END

GAME.SELECT:
CLS : COLOR 2: GOSUB PRINT.FIELD: COLOR 15
LOCATE 12, 13: PRINT "[O]RIGINAL  [N]EW"
COLOR 12: LOCATE 12, 14: PRINT "O": COLOR 11: LOCATE 12, 26: PRINT "N"
DO: a$ = INKEY$
IF UCASE$(a$) = "O" THEN GAME = 1: a = 12: b = 13: x1 = 12: y1 = 19: x2 = 11: y2 = 19: x3 = 13: y3 = 19: x4 = 12: y4 = 23: x5 = 12: y5 = 29: GOSUB SOUND.MENU
IF UCASE$(a$) = "N" THEN GAME = 2: a = 12: b = 15: x1 = 12: y1 = 19: x2 = 11: y2 = 21: x3 = 13: y3 = 21: x4 = 12: y4 = 23: x5 = 12: y5 = 27: GOSUB SOUND.MENU
LOOP UNTIL a$ = CHR$(27): CLS : RUN

SOUND.MENU:
CLS : COLOR 2: GOSUB PRINT.FIELD: COLOR 15
LOCATE 12, 13: PRINT "[S]OUND   [M]UTED"
COLOR 12: LOCATE 12, 14: PRINT "S": COLOR 11: LOCATE 12, 24: PRINT "M"
DO: a$ = INKEY$
IF UCASE$(a$) = "S" THEN SND$ = "Y": GOSUB KICKOFF
IF UCASE$(a$) = "M" THEN SND$ = "N": GOSUB KICKOFF
LOOP UNTIL a$ = CHR$(27): CLS : RUN


TOGGLE.SOUND:
IF SND$ = "Y" THEN SND$ = "N": RETURN
IF SND$ = "N" THEN SND$ = "Y": RETURN


HELP.SCREEN:
CLS : COLOR 15: LOCATE 1, 10: PRINT "MATTEL CLASSIC FOOTBALL": PRINT : COLOR 7
PRINT
PRINT " ORIGINAL plays just like the 1970s LED "
PRINT " handheld game. NEW allows team colors, "
PRINT " backwards movement, an alternate line- "
PRINT " -up formation, and safety scoring."
PRINT
PRINT " use [ARROW KEYS] to move. [P] to punt  "
PRINT " and [K] to kick (when prompted). press "
PRINT " the [-] key to toggle sound effects on "
PRINT " or off. use [+] to open/close the Game "
PRINT " Speed menu prior to any play. finally, "
PRINT " hit [SPACEBAR] to start the next play. "
PRINT : PRINT : COLOR 15
PRINT "         p r e s e n t e d   b y        ": COLOR 2
PRINT "      bomberpunk entertainment 2006     ": COLOR 7
PRINT
PRINT " correspondence -> bomberpunk@yahoo.com ": COLOR 15
LOCATE 23, 6: PRINT "press [SPACEBAR] to continue..."
IF a$ = CHR$(27) THEN CLS : RUN
DO: LOOP UNTIL INKEY$ = " ": CLS : COLOR 2: GOSUB PRINT.FIELD:
COLOR 15: LOCATE 12, 13: PRINT " [S]TART  [H]ELP "
COLOR 12: LOCATE 12, 15: PRINT "S": COLOR 11: LOCATE 12, 24: PRINT "H"
RETURN


KICKOFF:
DOWN = 1: DOWN$ = "1ST": YTG = 10: SIDE$ = "<": BALLon = 20
HALF = 1: MIN = 4: SEC = 0: DEFENSE = 1: P1SCORE = 0: P2SCORE = 0:
PAUZE = 1: GOSUB PRINT.FRAME

TM$ = TIME$: DO: a$ = INKEY$: COLOR 7
GOSUB PRINT.TIME
IF SIDE$ = "<" AND BALLon <> 50 THEN LOCATE 20, 18: PRINT " <"; BALLon; "  "
IF SIDE$ = ">" AND BALLon <> 50 THEN LOCATE 20, 18: PRINT "  "; BALLon; "> "
IF BALLon = 50 THEN LOCATE 20, 18: PRINT " <"; BALLon; "> "
IF GAME = 1 THEN LOCATE 8, 12: PRINT P1SCORE: LOCATE 8, 28: PRINT P2SCORE
IF GAME = 2 THEN COLOR 4: LOCATE 8, 12: PRINT P1SCORE: COLOR 1: LOCATE 8, 28: PRINT P2SCORE
IF GAME = 2 AND DEFENSE = 1 THEN LOCATE a, b: COLOR 12: PRINT "-"
IF GAME = 2 AND DEFENSE = 1 THEN LOCATE x1, y1: COLOR 1: PRINT "-"
IF GAME = 2 AND DEFENSE = 1 THEN LOCATE x2, y2: COLOR 1: PRINT "-"
IF GAME = 2 AND DEFENSE = 1 THEN LOCATE x3, y3: COLOR 1: PRINT "-"
IF GAME = 2 AND DEFENSE = 1 THEN LOCATE x4, y4: COLOR 1: PRINT "-"
IF GAME = 2 AND DEFENSE = 1 THEN LOCATE x5, y5: COLOR 1: PRINT "-"
 IF GAME = 2 AND DEFENSE = 2 THEN LOCATE a, b: COLOR 9: PRINT "-"
 IF GAME = 2 AND DEFENSE = 2 THEN LOCATE x1, y1: COLOR 4: PRINT "-"
 IF GAME = 2 AND DEFENSE = 2 THEN LOCATE x2, y2: COLOR 4: PRINT "-"
 IF GAME = 2 AND DEFENSE = 2 THEN LOCATE x3, y3: COLOR 4: PRINT "-"
 IF GAME = 2 AND DEFENSE = 2 THEN LOCATE x4, y4: COLOR 4: PRINT "-"
 IF GAME = 2 AND DEFENSE = 2 THEN LOCATE x5, y5: COLOR 4: PRINT "-"
IF GAME = 1 THEN LOCATE a, b: COLOR 12: PRINT "-"
IF GAME = 1 THEN LOCATE x1, y1: COLOR 4: PRINT "-"
IF GAME = 1 THEN LOCATE x2, y2: COLOR 4: PRINT "-"
IF GAME = 1 THEN LOCATE x3, y3: COLOR 4: PRINT "-"
IF GAME = 1 THEN LOCATE x4, y4: COLOR 4: PRINT "-"
IF GAME = 1 THEN LOCATE x5, y5: COLOR 4: PRINT "-"
IF SIDE$ = ">" AND BALLon = 0 AND DEFENSE = 1 THEN P1SCORE = P1SCORE + 7: GOSUB TOUCHDOWN: DEFENSE = 2: GOSUB RESET.POSITIONS.2: DOWN = 1: DOWN$ = "1ST": YTG = 10: SIDE$ = ">": BALLon = 20
IF SIDE$ = "<" AND BALLon = 0 AND DEFENSE = 1 THEN P2SCORE = P2SCORE + 3: GOSUB BEEEP: DEFENSE = 2: GOSUB RESET.POSITIONS.2: DOWN = 1: DOWN$ = "1ST": YTG = 10: SIDE$ = ">": BALLon = 35
IF SIDE$ = ">" AND BALLon = 0 AND DEFENSE = 2 THEN P1SCORE = P1SCORE + 3: GOSUB BEEEP: DEFENSE = 1: GOSUB RESET.POSITIONS: DOWN = 1: DOWN$ = "1ST": YTG = 10: SIDE$ = "<": BALLon = 35
IF SIDE$ = "<" AND BALLon = 0 AND DEFENSE = 2 THEN P2SCORE = P2SCORE + 7: GOSUB TOUCHDOWN: DEFENSE = 1: GOSUB RESET.POSITIONS: DOWN = 1: DOWN$ = "1ST": YTG = 10: SIDE$ = "<": BALLon = 20
IF GAME = 1 AND DEFENSE = 2 AND a$ = CHR$(0) + CHR$(75) THEN PAUZE = 0: LOCATE a, b: PRINT " ": b = b - 2: GOSUB MOVE.L: IF b = 11 THEN b = 29
IF GAME = 1 AND DEFENSE = 1 AND a$ = CHR$(0) + CHR$(77) THEN PAUZE = 0: LOCATE a, b: PRINT " ": b = b + 2: GOSUB MOVE.R: IF b = 31 THEN b = 13
IF GAME = 1 AND a$ = CHR$(0) + CHR$(72) THEN PAUZE = 0: LOCATE a, b: PRINT " ": a = a - 1: IF a = 10 THEN a = 11
IF GAME = 1 AND a$ = CHR$(0) + CHR$(80) THEN PAUZE = 0: LOCATE a, b: PRINT " ": a = a + 1: IF a = 14 THEN a = 13
IF GAME = 2 AND a$ = CHR$(0) + CHR$(75) THEN PAUZE = 0: LOCATE a, b: PRINT " ": b = b - 2: GOSUB MOVE.L: IF b = 11 THEN b = 29
 IF GAME = 2 AND a$ = CHR$(0) + CHR$(77) THEN PAUZE = 0: LOCATE a, b: PRINT " ": b = b + 2: GOSUB MOVE.R: IF b = 31 THEN b = 13
 IF GAME = 2 AND a$ = CHR$(0) + CHR$(72) THEN PAUZE = 0: LOCATE a, b: PRINT " ": a = a - 1: IF a = 10 THEN a = 11
 IF GAME = 2 AND a$ = CHR$(0) + CHR$(80) THEN PAUZE = 0: LOCATE a, b: PRINT " ": a = a + 1: IF a = 14 THEN a = 13
IF PAUZE = 1 AND DOWN = 4 AND DEFENSE = 1 AND SIDE$ = ">" THEN COLOR 12: LOCATE 4, 20: PRINT "[K]"
IF PAUZE = 1 AND DOWN = 4 AND DEFENSE = 1 AND SIDE$ = "<" THEN COLOR 12: LOCATE 4, 20: PRINT "[P]"
IF PAUZE = 1 AND DOWN = 4 AND DEFENSE = 2 AND SIDE$ = "<" THEN COLOR 11: LOCATE 4, 20: PRINT "[K]"
IF PAUZE = 1 AND DOWN = 4 AND DEFENSE = 2 AND SIDE$ = ">" THEN COLOR 11: LOCATE 4, 20: PRINT "[P]"
IF PAUZE = 0 AND DOWN = 4 THEN LOCATE 4, 20: PRINT "   "
IF PAUZE = 1 AND DOWN = 4 AND DEFENSE = 1 AND SIDE$ = ">" AND UCASE$(a$) = "K" THEN GOSUB KICK.IT
IF PAUZE = 1 AND DOWN = 4 AND DEFENSE = 1 AND SIDE$ = "<" AND UCASE$(a$) = "P" THEN GOSUB PUNT.IT
IF PAUZE = 1 AND DOWN = 4 AND DEFENSE = 2 AND SIDE$ = "<" AND UCASE$(a$) = "K" THEN GOSUB KICK.IT
IF PAUZE = 1 AND DOWN = 4 AND DEFENSE = 2 AND SIDE$ = ">" AND UCASE$(a$) = "P" THEN GOSUB PUNT.IT
IF PAUZE = 1 AND MIN = -1 THEN GOSUB GAME.END
IF PAUZE = 0 AND MIN = -1 THEN COLOR 7: LOCATE 8, 18: PRINT " 0  00"
IF PAUZE = 0 THEN IF TM$ <> TIME$ THEN SEC = SEC - 1: GOSUB TICKTOCK: TM$ = TIME$: IF SEC = -1 THEN SEC = 59: MIN = MIN - 1
IF PAUZE = 0 THEN GOSUB MOVE.AI: GOSUB COLLISION.CHK
IF a$ = "-" THEN GOSUB TOGGLE.SOUND
IF a$ = "+" THEN GOSUB SPEED.ADJUST: COLOR 2: GOSUB PRINT.FIELD
LOOP UNTIL a$ = CHR$(27): CLS : RUN


TICKTOCK:
IF SND$ = "Y" THEN SOUND 75, 1
RETURN

TOUCHDOWN:
IF SND$ = "Y" THEN PLAY "MB L14 <<DFA> L10D L14 C L8D>"
RETURN

BEEEP:
IF SND$ = "Y" THEN PLAY "MB L1 <<<C>>>"
RETURN

TACKLE:
IF SND$ = "Y" THEN PLAY "MB L33 <CCCC>"
RETURN

TACKLE2:
IF SND$ = "Y" THEN PLAY "MB L33 CCCCC"
RETURN

ITSGOOD:
IF SND$ = "Y" THEN PLAY "MB L12 <AEDB L6 A>"
RETURN

FIRST.DOWN:
IF SND$ = "Y" THEN PLAY "MB L12 <A L6 B>"
RETURN


SPEED.ADJUST:
CLS : COLOR 2: GOSUB PRINT.FIELD
x0 = 12: y0 = 21: DO: a$ = INKEY$
ox = x0: oy = y0: n = INT(RND * MAXdeelay)
IF n = 0 THEN LOCATE x0, y0: PRINT " ": x0 = x0 - 1: IF x0 = 10 THEN x0 = 11
IF n = 1 THEN LOCATE x0, y0: PRINT " ": x0 = x0 + 1: IF x0 = 14 THEN x0 = 13
IF n = 2 THEN LOCATE x0, y0: PRINT " ": y0 = y0 - 2: IF y0 = 11 THEN y0 = 13
IF n = 3 THEN LOCATE x0, y0: PRINT " ": y0 = y0 + 2: IF y0 = 31 THEN y0 = 29
COLOR 4: LOCATE x0, y0: PRINT "-"
IF a$ = CHR$(0) + CHR$(72) THEN MAXdeelay = MAXdeelay + 100
IF a$ = CHR$(0) + CHR$(80) THEN MAXdeelay = MAXdeelay - 100: IF MAXdeelay < 10 THEN MAXdeelay = 10
IF a$ = CHR$(0) + CHR$(77) THEN MAXdeelay = MAXdeelay + 10
IF a$ = CHR$(0) + CHR$(75) THEN MAXdeelay = MAXdeelay - 10: IF MAXdeelay < 10 THEN MAXdeelay = 10
COLOR 15: LOCATE 8, 13: PRINT "GAME SPEED: "; MAXdeelay; " "
COLOR 7: LOCATE 16, 11: PRINT "[ARROW KEYS] TO ALTER"
COLOR 8: LOCATE 18, 11: PRINT "[SPACEBAR] IS DEFAULT"
IF a$ = " " THEN MAXdeelay = 3000
LOOP UNTIL a$ = "+": CLS : RETURN


PRINT.FIELD:
LOCATE 10, 12: PRINT CHR$(218); CHR$(196); CHR$(194); CHR$(196); CHR$(194); CHR$(196); CHR$(194); CHR$(196); CHR$(194); CHR$(196); CHR$(194); CHR$(196); CHR$(194); CHR$(196); CHR$(194); CHR$(196); CHR$(194); CHR$(196); CHR$(191)
LOCATE 11, 12: PRINT CHR$(179); "                 "; CHR$(179)
LOCATE 12, 12: PRINT CHR$(179); "                 "; CHR$(179)
LOCATE 13, 12: PRINT CHR$(179); "                 "; CHR$(179)
LOCATE 14, 12: PRINT CHR$(192); CHR$(196); CHR$(193); CHR$(196); CHR$(193); CHR$(196); CHR$(193); CHR$(196); CHR$(193); CHR$(196); CHR$(193); CHR$(196); CHR$(193); CHR$(196); CHR$(193); CHR$(196); CHR$(193); CHR$(196); CHR$(217)
RETURN

MOVE.L:
IF SIDE$ = "<" AND BALLon = 51 THEN SIDE$ = ">": BALLon = 49
IF SIDE$ = "<" AND DEFENSE = 1 THEN BALLon = BALLon - 1: YTG = YTG + 1
IF SIDE$ = ">" AND DEFENSE = 1 THEN BALLon = BALLon + 1: YTG = YTG + 1
IF SIDE$ = "<" AND DEFENSE = 2 THEN BALLon = BALLon - 1: YTG = YTG - 1: IF YTG < 0 THEN YTG = 0
IF SIDE$ = ">" AND DEFENSE = 2 THEN BALLon = BALLon + 1: YTG = YTG - 1: IF YTG < 0 THEN YTG = 0
IF SIDE$ = ">" AND BALLon = 51 THEN SIDE$ = "<": BALLon = 49
RETURN

MOVE.R:
IF SIDE$ = ">" AND BALLon = 51 THEN SIDE$ = "<": BALLon = 49
IF SIDE$ = "<" AND DEFENSE = 2 THEN BALLon = BALLon + 1: YTG = YTG + 1
IF SIDE$ = ">" AND DEFENSE = 2 THEN BALLon = BALLon - 1: YTG = YTG + 1
IF SIDE$ = "<" AND DEFENSE = 1 THEN BALLon = BALLon + 1: YTG = YTG - 1: IF YTG < 0 THEN YTG = 0
IF SIDE$ = ">" AND DEFENSE = 1 THEN BALLon = BALLon - 1: YTG = YTG - 1: IF YTG < 0 THEN YTG = 0
IF SIDE$ = "<" AND BALLon = 51 THEN SIDE$ = ">": BALLon = 49
RETURN

RESET.POSITIONS:
IF MIN = -1 THEN RETURN
IF K = 1 THEN GOSUB KKK: RETURN
DO:
D = MAXdeelay * 5: DO: D = D - 1: LOOP UNTIL D = 0
IF GAME = 1 THEN COLOR 12: LOCATE a, b: PRINT "-"
IF GAME = 2 THEN COLOR 12: LOCATE a, b: PRINT "-"
D = MAXdeelay * 5: DO: D = D - 1: LOOP UNTIL D = 0
IF GAME = 1 THEN COLOR 4: LOCATE a, b: PRINT "-"
IF GAME = 2 THEN COLOR 1: LOCATE a, b: PRINT "-"
LOOP UNTIL INKEY$ = " "
KKK:
IF GAME = 1 THEN a = 12: b = 13: x1 = 12: y1 = 19: x2 = 11: y2 = 19: x3 = 13: y3 = 19: x4 = 12: y4 = 23: x5 = 12: y5 = 29
IF GAME = 2 THEN a = 12: b = 15: x1 = 12: y1 = 19: x2 = 11: y2 = 21: x3 = 13: y3 = 21: x4 = 12: y4 = 23: x5 = 12: y5 = 27
K = 0: GOSUB PRINT.FRAME: PAUZE = 1: RETURN
RETURN

RESET.POSITIONS.2:
IF K = 1 THEN GOSUB KK: RETURN
DO:
D = MAXdeelay * 5: DO: D = D - 1: LOOP UNTIL D = 0
IF GAME = 1 THEN COLOR 12: LOCATE a, b: PRINT "-"
IF GAME = 2 THEN COLOR 9: LOCATE a, b: PRINT "-"
D = MAXdeelay * 5: DO: D = D - 1: LOOP UNTIL D = 0
IF GAME = 1 THEN COLOR 4: LOCATE a, b: PRINT "-"
IF GAME = 2 THEN COLOR 4: LOCATE a, b: PRINT "-"
LOOP UNTIL INKEY$ = " "
KK:
IF GAME = 1 THEN a = 12: b = 29: x1 = 12: y1 = 23: x2 = 11: y2 = 23: x3 = 13: y3 = 23: x4 = 12: y4 = 19: x5 = 12: y5 = 13
IF GAME = 2 THEN a = 12: b = 27: x1 = 12: y1 = 23: x2 = 11: y2 = 21: x3 = 13: y3 = 21: x4 = 12: y4 = 19: x5 = 12: y5 = 15
K = 0: GOSUB PRINT.FRAME: PAUZE = 1: RETURN

PRINT.FRAME:
COLOR 7: GOSUB PRINT.TIME: GOSUB PRINT.DOWN
IF GAME = 1 THEN LOCATE 8, 12: PRINT P1SCORE: LOCATE 8, 28: PRINT P2SCORE
IF SIDE$ = "<" AND BALLon <> 50 THEN LOCATE 20, 18: PRINT " <"; BALLon; "  "
IF SIDE$ = ">" AND BALLon <> 50 THEN LOCATE 20, 18: PRINT "  "; BALLon; "> "
IF BALLon = 50 THEN LOCATE 20, 18: PRINT " <"; BALLon; "> "
COLOR 8
IF HALF = 1 THEN LOCATE 3, 12: PRINT "     1ST  HALF     "
IF HALF = 2 THEN LOCATE 3, 12: PRINT "     2ND  HALF     "
COLOR 2: GOSUB PRINT.FIELD
IF GAME = 2 THEN COLOR 4: LOCATE 8, 12: PRINT P1SCORE: COLOR 1: LOCATE 8, 28: PRINT P2SCORE
RETURN

PRINT.TIME:
IF MIN = -1 THEN RETURN
COLOR 7: LOCATE 8, 18: PRINT MIN
IF SEC > 9 THEN LOCATE 8, 21: PRINT SEC
IF SEC = 9 THEN LOCATE 8, 21: PRINT " 09"
IF SEC = 8 THEN LOCATE 8, 21: PRINT " 08"
IF SEC = 7 THEN LOCATE 8, 21: PRINT " 07"
IF SEC = 6 THEN LOCATE 8, 21: PRINT " 06"
IF SEC = 5 THEN LOCATE 8, 21: PRINT " 05"
IF SEC = 4 THEN LOCATE 8, 21: PRINT " 04"
IF SEC = 3 THEN LOCATE 8, 21: PRINT " 03"
IF SEC = 2 THEN LOCATE 8, 21: PRINT " 02"
IF SEC = 1 THEN LOCATE 8, 21: PRINT " 01"
IF SEC = 0 THEN LOCATE 8, 21: PRINT " 00"
RETURN

PRINT.DOWN:
IF DOWN = 1 THEN DOWN$ = "1ST"
IF DOWN = 2 THEN DOWN$ = "2ND"
IF DOWN = 3 THEN DOWN$ = "3RD"
IF DOWN = 4 THEN DOWN$ = "4TH"
COLOR 7: LOCATE 16, 17: PRINT DOWN$; "  &"; YTG
RETURN

KICK.IT:
K = 1: LOCATE 4, 20: PRINT "   ": n = INT(RND * 47) + 2
IF DEFENSE = 1 AND BALLon - n <= 0 THEN P1SCORE = P1SCORE + 3: GOSUB ITSGOOD: DEFENSE = 2: GOSUB RESET.POSITIONS.2: DOWN = 1: DOWN$ = "1ST": YTG = 10: SIDE$ = ">": BALLon = 20: RETURN
IF DEFENSE = 2 AND BALLon - n <= 0 THEN P2SCORE = P2SCORE + 3: GOSUB ITSGOOD: DEFENSE = 1: GOSUB RESET.POSITIONS: DOWN = 1: DOWN$ = "1ST": YTG = 10: SIDE$ = "<": BALLon = 20: RETURN
IF DEFENSE = 1 AND BALLon - n > 0 THEN GOSUB TACKLE: DEFENSE = 2: GOSUB RESET.POSITIONS.2: DOWN = 1: DOWN$ = "1ST": YTG = 10: SIDE$ = ">": BALLon = 20: RETURN
IF DEFENSE = 2 AND BALLon - n > 0 THEN GOSUB TACKLE: DEFENSE = 1: GOSUB RESET.POSITIONS: DOWN = 1: DOWN$ = "1ST": YTG = 10: SIDE$ = "<": BALLon = 20: RETURN
RETURN

PUNT.IT:
K = 1: LOCATE 4, 20: PRINT "   "
IF DEFENSE = 1 THEN DEFENSE = 2: SIDE$ = ">": BALLon = INT(RND * 47) + 2: DOWN = 1: YTG = 10: GOSUB TACKLE2: GOSUB RESET.POSITIONS.2: RETURN
IF DEFENSE = 2 THEN DEFENSE = 1: SIDE$ = "<": BALLon = INT(RND * 47) + 2: DOWN = 1: YTG = 10: GOSUB TACKLE2: GOSUB RESET.POSITIONS: RETURN
RETURN

MOVE.AI:
GOSUB MOVE.DRONE1: GOSUB MOVE.DRONE2: GOSUB MOVE.DRONE3
GOSUB MOVE.DRONE4: GOSUB MOVE.DRONE5
RETURN

MOVE.DRONE1:
ox = x1: oy = y1: n = INT(RND * MAXdeelay)
IF n = 0 THEN LOCATE x1, y1: PRINT " ": IF x1 > a THEN x1 = x1 - 1: IF x1 = 10 THEN x1 = 11
IF n = 1 THEN LOCATE x1, y1: PRINT " ": IF x1 < a THEN x1 = x1 + 1: IF x1 = 14 THEN x1 = 13
IF n = 2 THEN LOCATE x1, y1: PRINT " ": IF y1 > b THEN y1 = y1 - 2: IF y1 = 11 THEN y1 = 13
IF n = 3 THEN LOCATE x1, y1: PRINT " ": IF y1 < b THEN y1 = y1 + 2: IF y1 = 31 THEN y1 = 29
IF x1 = x2 AND y1 = y2 THEN x1 = ox: y1 = oy
IF x1 = x3 AND y1 = y3 THEN x1 = ox: y1 = oy
IF x1 = x4 AND y1 = y4 THEN x1 = ox: y1 = oy
IF x1 = x5 AND y1 = y5 THEN x1 = ox: y1 = oy
RETURN

MOVE.DRONE2:
ox = x2: oy = y2: n = INT(RND * MAXdeelay)
IF n = 0 THEN LOCATE x2, y2: PRINT " ": IF x1 > a THEN x2 = x2 - 1: IF x2 = 10 THEN x2 = 11
IF n = 1 THEN LOCATE x2, y2: PRINT " ": IF x2 < a THEN x2 = x2 + 1: IF x2 = 14 THEN x2 = 13
IF n = 2 THEN LOCATE x2, y2: PRINT " ": IF y2 > b THEN y2 = y2 - 2: IF y2 = 11 THEN y2 = 13
IF n = 3 THEN LOCATE x2, y2: PRINT " ": IF y2 < b THEN y2 = y2 + 2: IF y2 = 31 THEN y2 = 29
IF x2 = x1 AND y2 = y1 THEN x2 = ox: y2 = oy
IF x2 = x3 AND y2 = y3 THEN x2 = ox: y2 = oy
IF x2 = x4 AND y2 = y4 THEN x2 = ox: y2 = oy
IF x2 = x5 AND y2 = y5 THEN x2 = ox: y2 = oy
RETURN

MOVE.DRONE3:
ox = x3: oy = y3: n = INT(RND * MAXdeelay)
IF n = 0 THEN LOCATE x3, y3: PRINT " ": IF x3 > a THEN x3 = x3 - 1: IF x3 = 10 THEN x3 = 11
IF n = 1 THEN LOCATE x3, y3: PRINT " ": IF x3 < a THEN x3 = x3 + 1: IF x3 = 14 THEN x3 = 13
IF n = 2 THEN LOCATE x3, y3: PRINT " ": IF y3 > b THEN y3 = y3 - 2: IF y3 = 11 THEN y3 = 13
IF n = 3 THEN LOCATE x3, y3: PRINT " ": IF y3 < b THEN y3 = y3 + 2: IF y3 = 31 THEN y3 = 29
IF x3 = x1 AND y3 = y1 THEN x3 = ox: y3 = oy
IF x3 = x2 AND y3 = y2 THEN x3 = ox: y3 = oy
IF x3 = x4 AND y3 = y4 THEN x3 = ox: y3 = oy
IF x3 = x5 AND y3 = y5 THEN x3 = ox: y3 = oy
RETURN

MOVE.DRONE4:
ox = x4: oy = y4: n = INT(RND * MAXdeelay)
IF n = 0 THEN LOCATE x4, y4: PRINT " ": IF x4 > a THEN x4 = x4 - 1: IF x4 = 10 THEN x4 = 11
IF n = 1 THEN LOCATE x4, y4: PRINT " ": IF x4 < a THEN x4 = x4 + 1: IF x4 = 14 THEN x4 = 13
IF n = 2 THEN LOCATE x4, y4: PRINT " ": IF y4 > b THEN y4 = y4 - 2: IF y4 = 11 THEN y4 = 13
IF n = 3 THEN LOCATE x4, y4: PRINT " ": IF y4 < b THEN y4 = y4 + 2: IF y4 = 31 THEN y4 = 29
IF x4 = x1 AND y4 = y1 THEN x4 = ox: y4 = oy
IF x4 = x2 AND y4 = y2 THEN x4 = ox: y4 = oy
IF x4 = x3 AND y4 = y3 THEN x4 = ox: y4 = oy
IF x4 = x5 AND y4 = y5 THEN x4 = ox: y4 = oy
RETURN

MOVE.DRONE5:
ox = x5: oy = y5: n = INT(RND * MAXdeelay)
IF n = 0 THEN LOCATE x5, y5: PRINT " ": x5 = x5 - 1: IF x5 = 10 THEN x5 = 11
IF n = 1 THEN LOCATE x5, y5: PRINT " ": x5 = x5 + 1: IF x5 = 14 THEN x5 = 13
IF n = 2 THEN LOCATE x5, y5: PRINT " ": y5 = y5 - 2: IF y5 = 11 THEN y5 = 13
IF n = 3 THEN LOCATE x5, y5: PRINT " ": y5 = y5 + 2: IF y5 = 31 THEN y5 = 29
IF x5 = x1 AND y5 = y1 THEN x5 = ox: y5 = oy
IF x5 = x2 AND y5 = y2 THEN x5 = ox: y5 = oy
IF x5 = x3 AND y5 = y3 THEN x5 = ox: y5 = oy
IF x5 = x4 AND y5 = y4 THEN x5 = ox: y5 = oy
RETURN

COLLISION.CHK:
NEWPLAY = 0
IF a = x1 AND b = y1 THEN DOWN = DOWN + 1: NEWPLAY = 1: GOSUB TACKLE2: IF YTG = 0 THEN DOWN = 1: YTG = 10: GOSUB FIRST.DOWN
IF a = x2 AND b = y2 THEN DOWN = DOWN + 1: NEWPLAY = 1: GOSUB TACKLE2: IF YTG = 0 THEN DOWN = 1: YTG = 10: GOSUB FIRST.DOWN
IF a = x3 AND b = y3 THEN DOWN = DOWN + 1: NEWPLAY = 1: GOSUB TACKLE2: IF YTG = 0 THEN DOWN = 1: YTG = 10: GOSUB FIRST.DOWN
IF a = x4 AND b = y4 THEN DOWN = DOWN + 1: NEWPLAY = 1: GOSUB TACKLE2: IF YTG = 0 THEN DOWN = 1: YTG = 10: GOSUB FIRST.DOWN
IF a = x5 AND b = y5 THEN DOWN = DOWN + 1: NEWPLAY = 1: GOSUB TACKLE2: IF YTG = 0 THEN DOWN = 1: YTG = 10: GOSUB FIRST.DOWN
IF NEWPLAY = 1 AND DOWN < 5 AND DEFENSE = 1 THEN GOSUB RESET.POSITIONS: RETURN
IF NEWPLAY = 1 AND DOWN < 5 AND DEFENSE = 2 THEN GOSUB RESET.POSITIONS.2: RETURN
IF NEWPLAY = 1 AND DOWN = 5 AND DEFENSE = 1 THEN DEFENSE = 2: DOWN = 1: YTG = 10: GOSUB RESET.POSITIONS.2: RETURN
IF NEWPLAY = 1 AND DOWN = 5 AND DEFENSE = 2 THEN DEFENSE = 1: DOWN = 1: YTG = 10: GOSUB RESET.POSITIONS: RETURN
RETURN

HALFTIME:
K = 1: COLOR 2: GOSUB PRINT.FIELD
DO: c = c + 1: IF c = 16 THEN c = 0:
COLOR c: LOCATE 12, 13: PRINT " H A L F T I M E "
COLOR 7: LOCATE 17, 13: PRINT "(go grab a beer!)"
LOOP UNTIL INKEY$ = " ": CLS : RETURN

GAME.END:
IF HALF = 1 THEN HALF = 2: CLS : GOSUB HALFTIME: DEFENSE = 2: MIN = 4: SEC = 0: SIDE$ = ">": BALLon = 20: YTG = 10: DOWN = 1: GOSUB RESET.POSITIONS.2: RETURN
IF SND$ = "Y" THEN PLAY "MB L33 CCCC P22 CCCC"
COLOR 2: GOSUB PRINT.FIELD: COLOR 7: LOCATE 8, 18: PRINT " 0  00"
IF GAME = 2 THEN COLOR 4: LOCATE 8, 12: PRINT P1SCORE: COLOR 1: LOCATE 8, 28: PRINT P2SCORE
SLEEP 2: COLOR 15
LOCATE 12, 13: PRINT "THAT'S IT, FOLKS!"
DO: LOOP UNTIL INKEY$ = " ": CLS : RUN


' A U T H O R ' S    N O T E :

' december 19, 2000.
' my first attempt at cloning the legendary 1970s handheld LED football game
' by Mattel. it looked too fancy and i tried changing too much, and ended up
' with a visually satisfying display and major glitches. although somewhat
' playable, it wasn't enjoyable.

' september 03, 2002.
' i was determined to make a football game, and (since the original was such
' a damn flop) i decided to try my hand at cloning the Atari 2600 cartridge,
' Atari Football, instead. once i layed out the gamefield, stats, and players,
' i realized i had lost interest in doing any more with it (which happens to
' about 90% of my programs). running up and down (bird's eye view) is pretty
' much all you can do. wee.

' september 12, 2002.
' sticking to the Mattel formula, this mockup is even better-looking than my
' original attempt, this program wasn't playable in the least. the demo
' screen allowed you to watch the timer count down at an all-too-fast pace,
' that's about it.

' december 12, 2002.
' an eyesore of a demo screen depicting what would have been a text version.
' as if being in qbasic wasn't going to make it suck enough. text football?
' come on, dude...

' june 29, 2006.
' i don't even know what sparked the idea for me to give qbasic football
' another go, but here i am wrapping things up. or maybe should i reword that
' to say `here i am about to beat someone's ass'?

SUB revisions


' changes in version 0.2

' * help screen added.
' * gamespeed menu added. press [+] to open/close menu. arrow keys to adjust.
' * sound toggle ability has been implemented. press [-] to switch on/off.
' * when failing a field goal attempt, the original release placed the ball
'   on the 35-yardline instead of the 20. this is now fixed.


END SUB

