'                               SQUARE FORCE
'   Try to take down the enemy squares - while staying alive.  An exciting
'arcade-style game by Patrick Petri.
'Aug. 7-14,  1997
'
DECLARE SUB Intro ()
DECLARE SUB Shop (sco, Yspeed, AB, Pspeed, sab, life, lev)
DIM SHARED BadShip        '1=on, 0=dead
DIM SHARED BSX            'coordinates
DIM SHARED BSY
DIM SHARED BSdX           'motion vectors
DIM SHARED BSdY
DIM SHARED BScap          'capabilities  Odd=fire  Square=not e.  Small=random
                          '              Even=no"  Not " =erratic Large=chase
DIM SHARED Laser          '1=on, 0=dead
DIM SHARED LX             'coordinates
DIM SHARED LY
DIM SHARED LdX            'motion vectors
DIM SHARED LdY
DIM pic&(50)
RANDOMIZE TIMER

bkg = 1      'color settings
bad = 4      'set to anything, but must be destinct!!!
las = 10
you = 15
phs = 14

ON KEY(1) GOSUB Pause
ON KEY(2) GOSUB menu
ON KEY(4) GOSUB die
KEY 1, "Pause"
KEY 2, "Help"
KEY 4, "Quit"
KEY(1) ON
KEY(2) ON
KEY(4) ON

sco = 10000
lev = 0
life = 5
Yspeed = 5
Pspeed = 2
AB = 0
LD = 0
Cdk = 0
PK = 0
ps = 0
Intro
SCREEN 9
init:     'new level
CLS
IF lev > 0 THEN CALL Shop(sco, Yspeed, AB, Pspeed, sab, life, lev)
FOR L = 0 TO 10
  BadShip(L) = 1
  BSX(L) = L * 28 + 161
  BSY(L) = 16
  BSdX(L) = 0
  BSdY(L) = 4
  Laser(L) = 0
NEXT L
YourX = 469
YourY = 323
YourdX = 0
YourdY = -Yspeed
Phaser = 0
count = 11
IF sab > 0 THEN
  BadShip(CINT(2 + RND)) = 0
  BadShip(CINT(5 + RND)) = 0
  BadShip(CINT(8 + RND)) = 0
  sab = 0
  count = 8
END IF

newlevel:
lev = lev + 1
FOR L = 0 TO 10
 SELECT CASE lev
   CASE 1:  BSdY(L) = 4: BScap(L) = 0      'easy
   CASE 2:  BSdY(L) = 5: BScap(L) = 1      'erratic
   CASE 3:  BSdY(L) = 3: BScap(L) = 4      'pursue
   CASE 4:  BSdY(L) = 7: BScap(L) = 0      'fast
   CASE 5:  BSdY(L) = 4: BScap(L) = 6      'ep
   CASE 6:  BSdY(L) = 5: BScap(L) = 1      'fire
   CASE 7:  BSdY(L) = 5: BScap(L) = 3      'ef
   CASE 8:  BSdY(L) = 7: BScap(L) = 3      'ef (fast)
   CASE 9:  BSdY(L) = 4: BScap(L) = 9      'pf
   CASE 10:  BSdY(L) = 3: BScap(L) = 5     'epf (slooow)
   CASE 11:  BSdY(L) = 7: BScap(L) = 1     'f (fast)
   CASE 12:  BSdY(L) = 7: BScap(L) = 6     'ep (fast)
   CASE 13:  BSdY(L) = 8: BScap(L) = 4     'p (fast+)
   CASE 14:  BSdY(L) = 5: BScap(L) = 5     'epf              'try variable cap's
   CASE 15:  BSdY(L) = 6: BScap(L) = 0     'breather
   CASE 16:  BSdY(L) = 7: BScap(L) = 5     'efp (fast)
   CASE ELSE:  BSdY(L) = INT(3 + RND * (lev / 5)): BScap(L) = INT(RND * 10)'all different
 END SELECT

NEXT L
CLS
               'draws field
LINE (145, 0)-(494, 350), bkg, BF
LINE (161, 16)-(478, 333), 0, BF

FOR L = 171 TO 455 STEP 28
 FOR M = 26 TO 320 STEP 28
  LINE (L, M)-(L + 17, M + 17), bkg, BF
 NEXT M
NEXT L
LOCATE 2, 1
PRINT "SQUARE FORCE"
PRINT " Ver. 3.20"
LOCATE 7, 1
PRINT "Level"
LOCATE 8, 1
PRINT lev
LOCATE 7, 65
PRINT "Lives"
LOCATE 8, 65
PRINT life
LOCATE 12, 1
PRINT "Status"
PRINT " Idle"
LOCATE 18, 66
IF BScap(1) / 2 <> INT(BScap(1) / 2) OR BScap(2) / 2 <> INT(BScap(2) / 2) OR BScap(3) / 2 <> INT(BScap(3) / 2) THEN PRINT "Green" ELSE PRINT "Off"
LOCATE 2, 65
PRINT "Score"
LOCATE 3, 65
PRINT sco
LOCATE 12, 65
PRINT "Ships"
LOCATE 13, 65
PRINT count
LOCATE 22, 65
PRINT "Phaser"
LOCATE 23, 66
PRINT "Ready"
LOCATE 17, 1
PRINT "F2 Help"
LOCATE 17, 65
PRINT "LASER Alarm"
LINE (YourX, YourY)-(YourX + 9, YourY + 9), you, BF   'Draw block
FOR L = 0 TO 10
IF BadShip(L) = 1 THEN LINE (BSX(L), BSY(L))-(BSX(L) + 9, BSY(L) + 9), bad, BF
NEXT L
SLEEP

repeat:
looptime# = TIMER
LOCATE 3, 65
PRINT sco
LOCATE 23, 66
IF Phaser = 0 THEN PRINT "Ready" ELSE PRINT "Fired"
FOR L = 0 TO 10
IF BadShip(L) = 1 THEN
  LINE (BSX(L), BSY(L))-(BSX(L) + 9, BSY(L) + 9), 0, BF
  IF 2 * (ABS(BSY(L) - 28 * CINT((BSY(L) + 12) / 28) + 12) + ABS(BSX(L) - 28 * CINT((BSX(L) + 7) / 28) + 7)) < BSdY(L) + BSdX(L) THEN 'if in a junction
    IF SQR(BScap(L)) = INT(SQR(BScap(L))) THEN turn# = .167 ELSE turn# = .333
    IF RND < turn# THEN
      BSX(L) = 28 * CINT((BSX(L) + 7) / 28) - 7
      BSY(L) = 28 * CINT((BSY(L) + 12) / 28) - 12
      T = BSdX(L)
      SELECT CASE RND
        CASE IS < .3333: BSdX(L) = -BSdX(L): BSdY(L) = -BSdY(L)
        CASE IS > .6667: BSdX(L) = BSdY(L): BSdY(L) = T
        CASE ELSE: BSdX(L) = -BSdY(L): BSdY(L) = -T
      END SELECT  'direction selection
    END IF    'turning decision
   
    IF BScap(L) > 3 AND RND < .5 THEN
       BSX(L) = 28 * CINT((BSX(L) + 7) / 28) - 7
       BSY(L) = 28 * CINT((BSY(L) + 12) / 28) - 12
       a = YourX - BSX(L)
       B = YourY - BSY(L)
       IF ABS(a) > ABS(B) THEN
          BSdX(L) = SGN(a) * ABS(BSdX(L) + BSdY(L))
          BSdY(L) = 0
       ELSE
          BSdY(L) = SGN(B) * ABS(BSdX(L) + BSdY(L))
          BSdX(L) = 0
       END IF  'put on tail
    END IF 'chase
  END IF      'in a junction
  IF BScap(L) / 2 > INT(BScap(L) / 2) AND RND < .1 THEN
    a = YourX - BSX(L)
    B = YourY - BSY(L)
    IF (a = 0 AND SGN(BSdY(L)) = SGN(B)) OR (B = 0 AND SGN(BSdX(L)) = SGN(a)) THEN
      IF Laser(L) = 0 THEN      'initiate beam
        LdX(L) = BSdX(L) * 2
        LdY(L) = BSdY(L) * 2
        LX(L) = BSX(L) + 6 + SGN(LdX(L)) * 6
        LY(L) = BSY(L) + 6 + SGN(LdY(L)) * 6
        Laser(L) = 1
        LOCATE 18, 65
        PRINT " RED   "
      END IF 'laser was ready
    END IF   'laser fire
  END IF   'Probability was right

  BSX(L) = BSX(L) + BSdX(L)
  BSY(L) = BSY(L) + BSdY(L)

  IF BSY(L) < 16 THEN     'field confinement
    BSY(L) = 16                       'top
    IF RND < .25 THEN
      BSdX(L) = BSdY(L) * SGN(RND - .5)
      BSdY(L) = 0
    ELSE BSdY(L) = ABS(BSdX(L) + BSdY(L)): BSdX(L) = 0
    END IF
  END IF
  IF BSY(L) > 324 THEN
    BSY(L) = 324                      'bottom
    IF RND < .3 THEN
      BSdX(L) = BSdY(L) * SGN(RND - .5)
      BSdY(L) = 0
    ELSE BSdY(L) = -ABS(BSdX(L) + BSdY(L)): BSdX(L) = 0
    END IF
  END IF
  IF BSX(L) < 161 THEN
    BSX(L) = 161                      'left
    IF RND < .25 THEN
      BSdY(L) = BSdX(L) * SGN(RND - .5)
      BSdX(L) = 0
    ELSE BSdX(L) = ABS(BSdX(L) + BSdY(L)): BSdY(L) = 0
    END IF
  END IF
  IF BSX(L) > 469 THEN
    BSX(L) = 469                      'right
    IF RND < .3 THEN
      BSdY(L) = BSdX(L) * SGN(RND - .5)
      BSdX(L) = 0
    ELSE BSdX(L) = -ABS(BSdX(L) + BSdY(L)): BSdY(L) = 0
    END IF
  END IF
  c = 0       'enemy collision check
  IF POINT(BSX(L), BSY(L)) = you OR POINT(BSX(L) + 9, BSY(L)) = you OR POINT(BSX(L), BSY(L) + 9) = you OR POINT(BSX(L) + 9, BSY(L) + 9) = you THEN c = 1
  LINE (BSX(L), BSY(L))-(BSX(L) + 9, BSY(L) + 9), bad, BF
  IF c = 1 THEN GOSUB detect      'ship collided
END IF        'ship is alive
'move laser and kill YOU if applicable
IF Laser(L) > 0 THEN
  LOCATE 18, 65
  PRINT " RED   "
  LX(L) = LX(L) + LdX(L)                                      'las
  LY(L) = LY(L) + LdY(L)
  ant = POINT(LX(L) - 1, LY(L) - 1)
  IF ant = 0 THEN ant = POINT(LX(L) + LdX(L) - 1, LY(L) + LdY(L) - 1)
  IF ant = 0 THEN ant = POINT(LX(L) + LdX(L) - 1, LY(L) + LdY(L) - 1)
  IF ant <> 0 THEN
    Laser(L) = 0: LOCATE 18, 65: PRINT "Green  "
    IF ant = you THEN
      life = life - 1
      LD = LD + 1
      LOCATE 8, 65
      PRINT life
      LOCATE 13, 2
      IF life = 1 THEN PRINT "Near Dead    " ELSE PRINT "Hit       "
      SLEEP  'aknowledge hit
      IF life = 0 THEN GOTO gameover
    END IF 'hit you
  END IF   'hit something
  LINE (LX(L), LY(L))-(LX(L) - LdX(L), LY(L) - LdY(L)), 0
  IF Laser(L) > 0 THEN LINE (LX(L), LY(L))-(LX(L) + LdX(L), LY(L) + LdY(L)), las
END IF     'laser active
NEXT L

OK$ = key$
key$ = UCASE$(INKEY$)                    'Get input
IF key$ = "" THEN key$ = OK$
LINE (YourX, YourY)-(YourX + 9, YourY + 9), 0, BF   'erase your  ship
IF key$ <> "" THEN
 VirX = 28 * CINT((YourX + 7) / 28) - 7
 VirY = 28 * CINT((YourY + 12) / 28) - 12
 IF key$ = CHR$(0) + "K" THEN
    IF ABS(YourY - VirY) <= Yspeed / 2 THEN  'if in a horiz. channel
      YourY = VirY
      YourdX = -Yspeed
      YourdY = 0
      LOCATE 13, 2
      PRINT "Left     "
    END IF  'eligible to turn
  END IF  'left input

  IF key$ = CHR$(0) + "M" THEN
    IF ABS(YourY - VirY) <= Yspeed / 2 THEN 'if in a horiz. channel
      YourY = VirY
      YourdX = Yspeed
      YourdY = 0
      LOCATE 13, 2
      PRINT "Right    "
      key$ = ""
    END IF  'eligible to turn
  END IF  'right input
 
  IF key$ = CHR$(0) + "H" THEN
    IF ABS(YourX - VirX) <= Yspeed / 2 THEN 'if in a vert. channel
      YourX = VirX
      YourdX = 0
      YourdY = -Yspeed
      LOCATE 13, 2
      PRINT "Up       "
      key$ = ""
    END IF  'eligible to turn
  END IF  'up input

  IF key$ = CHR$(0) + "P" THEN
    IF ABS(YourX - VirX) <= Yspeed / 2 THEN 'if in a vert. channel
      YourX = VirX
      YourdX = 0
      YourdY = Yspeed
      LOCATE 13, 2
      PRINT "Down      "
      key$ = ""
    END IF  'eligible to turn
  END IF  'right input
  
  IF key$ = " " THEN
    IF Phaser = 0 THEN      'initiate shot
      PdX = YourdX * Pspeed
      PdY = YourdY * Pspeed
      PX = YourX + 4 + SGN(PdX) * 6
      PY = YourY + 4 + SGN(PdY) * 6
      Phaser = 1
      ps = ps + 1
      LOCATE 13, 2
      PRINT "Shooting "
      key$ = ""
    END IF
  END IF   'shot
             
  IF key$ = "B" AND POINT(540, 248) = 15 THEN
    IF AB = 1 THEN      'shoot afterburner
      sco = sco - 100
      ABX = YourX + 5 - SGN(YourdX) * 6
      ABY = YourY + 5 - SGN(YourdY) * 6
      LINE (ABX, ABY)-(ABX - SGN(YourdX) * 2 * ABS(BSdX(1) + BSdY(1)), ABY - SGN(YourdY) * 2 * ABS(BSdX(1) + BSdY(1))), bkg
      LOCATE 13, 2
      PRINT "AB shot     "
      key$ = ""
    END IF
  END IF   'shot

END IF 'response

YourX = YourX + YourdX
YourY = YourY + YourdY
IF YourY < 16 THEN YourY = 16     'field confinement
IF YourY > 324 THEN YourY = 324
IF YourX < 161 THEN YourX = 161
IF YourX > 469 THEN YourX = 469
c = 0                             'collision check
IF POINT(YourX, YourY) = bad OR POINT(YourX + 9, YourY) = bad OR POINT(YourX, YourY + 9) = bad OR POINT(YourX + 9, YourY + 9) = bad THEN c = 1
LINE (YourX, YourY)-(YourX + 9, YourY + 9), you, BF   'Draw block
IF c = 1 THEN GOSUB detect  'who was hit

'move phaser and remove damaged targets
IF Phaser > 0 THEN
  PX = PX + PdX                                      'phs
  PY = PY + PdY
  ant = 0
  FOR Stp = 0 TO 1 STEP .25
    IF ant = 0 THEN ant = POINT(PX + PdX * Stp + 1, PY + PdY * Stp + 1): TX = PX + PdX * Stp: TY = PY + PdY * Stp
  NEXT Stp
  IF ant <> 0 THEN
    Phaser = 0: LOCATE 13, 2: PRINT "Wall     "
    IF ant = bad THEN
      near = 100
      hit = 0
      FOR L = 0 TO 10
        IF BadShip(L) = 0 THEN GOTO rubberstamp
        Dist = SQR((TX - BSX(L)) ^ 2 + (TY - BSY(L)) ^ 2)
        IF Dist < near THEN near = Dist: M = L: hit = 1
rubberstamp:
      NEXT L
      PK = PK + 1
      GOSUB destroy       'kills ship #M
      LOCATE 13, 2
      IF hit = 0 THEN PRINT "Weak hit   " ELSE PRINT "Got one  "
    END IF 'hit bad ship
  END IF   'hit
LINE (PX, PY)-(PX - PdX, PY - PdY), 0
IF Phaser > 0 THEN LINE (PX, PY)-(PX + PdX, PY + PdY), phs
END IF     'phaser active
IF count = 0 THEN
  sco = sco + INT((PK + Cdk) / (Cdk + LD + 1) * 20)
  count = 11
  GOTO init
END IF

WHILE TIMER < looptime# + .12   'needs adjustment b/c varying no. of ships
WEND
GOTO repeat

detect:
LOCATE 5, 1
FOR M = 0 TO 10    'detect ships
  IF BadShip(M) = 0 THEN GOTO stamp
  Dist = SQR((YourX - BSX(M)) ^ 2 + (YourY - BSY(M)) ^ 2)
  IF Dist < 15 THEN
  GOSUB destroy       'kills ship #M
  END IF  'identified
stamp:
NEXT M
life = life - 1
Cdk = Cdk + 1
LOCATE 8, 65
PRINT life
LOCATE 13, 2
IF life = 1 THEN PRINT "Near Dead    " ELSE PRINT "Collision    "
SLEEP  'aknowledge collision
IF life = 0 THEN GOTO gameover
RETURN

destroy:
  COLOR , 11
  BadShip(M) = 0
  count = count - 1
  LOCATE 13, 65
  PRINT count
  LOCATE 13, 2
  IF count = 1 THEN PRINT "One left  "
  sco = sco + 70 + BScap(M) * 10 + 7 * ABS(BSdX(M) + BSdY(M))
  COLOR , 0
  LINE (BSX(M), BSY(M))-(BSX(M) + 9, BSY(M) + 9), 0, BF
  hit = 1
  COLOR , 15
  BSX(M) = 0
  BSY(M) = 0
  COLOR , 0
RETURN

menu:
ON KEY(2) GOSUB blank
LOCATE 17, 1
PRINT "Press ... to"
PRINT "F1       Pause "
PRINT "F2       Clear "
PRINT "F4       Exit  "
PRINT "Arrows   Navigate"
PRINT "Space    Shoot "
PRINT "Any key  Continue"
SLEEP
RETURN

blank:
LINE (0, 210)-(140, 345), 0, BF
LOCATE 17, 1
PRINT "F2 Help"
ON KEY(2) GOSUB menu
RETURN

Pause:
LOCATE 13, 1
PRINT " Game Paused"
SLEEP
LOCATE 13, 1
PRINT "            "
RETURN

die:
LOCATE 13, 2
PRINT "Good Bye  "
END

gameover:
CLS
SCREEN 9
LOCATE 6, 1
PRINT "Analyzing playing style for constructive criticism ..."
COLOR 1
LOCATE 1, 1
PRINT "Game Over"
FOR X = 0 TO 70
  FOR Y = 0 TO 9
    IF POINT(X, Y + 2) = 1 THEN LINE (X * 9, Y * 4 + 15)-(X * 9 + 8, Y * 4 + 18), 14, BF
  NEXT Y
NEXT X
COLOR 15
LOCATE 1, 1
PRINT "           "
FOR X = 0 TO 638
  GET (X, 15)-(X, 55), pic&
  LINE (X, 15)-(X, 55), 0
  PUT (X, 15 + 10 * SIN(X / 14)), pic&
NEXT X
KR = CINT((PK + Cdk) / (Cdk + LD))
Acc = PK / (ps + .01) * 100
LOCATE 9, 1   ''''''''''
IF Acc < 60 AND Cdk / (Cdk + LD) > .15 THEN
 Which# = RND
   IF Which# < .333 THEN
     PRINT "*Your Phaser is a potent weapon - handle it with caution.  It does not fire when"
     PRINT " a target is extremely close so that your ship is not damaged by stray"
     PRINT " projectiles.  Even a regular shot threatens the square's integrity, and you may"
     PRINT " see a streak through its middle.  Phasing at an adjacent wall can blow a small"
     PRINT " hole through it, but you won't get fined."
     PRINT
   END IF
   IF Which# > .667 THEN
     PRINT "*Enemy ships are robust, but they can't take a frontal Phaser collision. "
     PRINT " However, since most power is concentrated in the Phaser beam's tip, it may be"
     PRINT " able to withstand a partial side impact.  To kill, aim right on the nose."
     PRINT
   END IF
   IF Which# >= .333 AND Which# <= .667 THEN
     PRINT "*Your phaser is your only friend - don't shoot it without reason.  Those long"
     PRINT " shots across the field leave you a sitting duck.  Fire from close range, or get"
     PRINT " more phaser upgrades, so you won't be quakin' quite as long."
     PRINT
   END IF
 SLEEP
END IF

IF LD / (LD + Cdk) > .3 AND KR < 7 AND AB = 1 THEN
 IF RND < .5 THEN
   PRINT "*Remember, the afterburner can only protect you from anterior shots, so remain"
   PRINT " cautious of enemy LASERs.  Do not provoke fire by steering a collision course,"
   PRINT " especially not in close range."
   PRINT
 ELSE
   PRINT "*Although usage of the afterburner costs 100 points, don't let that discourage"
   PRINT " you from using it often.  Go ahead and leave a trail behind you when followed,"
   PRINT " since it may be too late to react when the shot actually comes.  Just beware:"
   PRINT " turn-and-shoot maneuvers will not be possible because the AB's diffusive"
   PRINT " properties also act on your artillery.  Note:  the afterburner is disabled"
   PRINT " when the LASER alarm is off for your benefit."
   PRINT
 END IF
 SLEEP
END IF

IF LD / (LD + Cdk) > .5 AND KR < 8 AND AB = 0 THEN
  IF lev < 8 AND RND < .5 THEN
    PRINT "*Buy yourself afterburners.  If you can't get far enough to afford one, buy"
    PRINT " lottery tickets!  A 10,000 point prize will cover one, and a grand prize will"
    PRINT " leave you set for life.  Of course you will draw Oh, so many duds, but"
    PRINT " remember:  lottery payback is a whopping 130%!  An unsubsidized ticket should"
    PRINT " cost over 300 galaxy points.  Just stay away from Roulette."
    PRINT
    SLEEP
  END IF
  IF PK + Cdk > 100 AND RND < .3 THEN
    PRINT "*Are you hording points for retirement?  Well, get this - there will be no"
    PRINT " retirement if you don't buy an afterburner.  Every time you use it, it saves"
    PRINT " you a life - worth 2,000 points.  Unless a high score or a Ghandi-style victory"
    PRINT " is your intention, lay some green on the side and make the purchase."
    PRINT
    SLEEP
  END IF
END IF
IF Cdk > 3 AND RND < .5 THEN
  PRINT "*I, the omniscient game juror, have witnessed a multitude of foolhardy"
  PRINT " maneuvers.  For example, you try to chase down ships that are chasing you-"
  PRINT " and colliding.  Let the bad guys seek you out, then shoot them unprepared."
  PRINT
  SLEEP
END IF
IF sco > 8000 AND RND < .5 THEN
  PRINT "*If you think you're too good for the Square Fair, you can bypass while the"
  PRINT " banner is developing by pressing 'x' or 'X' immediately.  I'm getting tired"
  PRINT " of storekeeper's breath myself."
  PRINT
  SLEEP
END IF
IF lev < 5 AND RND < .5 THEN
  PRINT "*Tired of the opening melody?  There are several remedies.  First, you can learn"
  PRINT " QBASIC and remove the line.  Or, you can buy some good old-fashioned ear plugs."
  PRINT " Better yet, get your head in the game and try to SURVIVE."
  PRINT
  SLEEP
END IF
IF lev > 10 AND RND < .7 THEN
  PRINT "*It seems you are a true champion - congratulations on your perseverance.  You"
  PRINT " seem firmly in control of the game.  For a little handicap, try getting this"
  PRINT " far after giving up nine lives in level one.  Or work on your shots - try to"
  PRINT " win without wasting any.  "
  PRINT
  SLEEP
END IF
IF sco > 25000 AND RND < .7 THEN
  PRINT "My felicitations, as the French might say!  You are in firm control of the game"
  PRINT "and managed to achieve a formidable score.  My apology for lack of  an official"
  PRINT "high score;  please track that yourself.  You had;"; sco; "freaking points."
END IF
IF KR < 6 AND RND < .4 THEN
  PRINT "*Since you look like a greenhorn to me, it may be helpful to explain the"
  PRINT " basics.  Ships have varying speeds and capabilities.  Options are LASER"
  PRINT " firing capablity, erratic movement (to reduce the risk of hits), and a special"
  PRINT " pursue algorithm that lets ships home in on you - but only in such a way that"
  PRINT " you will run into their line of fire.  All ships in the same (low) level have"
  PRINT " identical capabilities."
  PRINT
  SLEEP
END IF
IF KR > 9 AND RND < .5 THEN
  PRINT "*Looky here, we have another John Wayne / Leatherstocking.  Mr. sureshot seems"
  PRINT " to be givin' 'em hell on the field.  You certainly know how to avoid death,"
  PRINT " while living on the brink of destruction.  Not everyone can kill"; KR; "every"
  PRINT " time they die."


END IF
IF RND < .5 AND lev < 12 AND AB = 1 AND LD > 2 THEN
  PRINT "*It appears you gave your all to buy an afterburner, then failed to use it"
  PRINT " efffectively.  The AB does not make you invincible to LASER, it simply extends"
  PRINT " your allowed reaction time.  Lateral shots will still be deadly if you don't"
  PRINT " turn around and dodge them.  Keep practicing!  You're making progress."
  PRINT
  SLEEP
END IF
IF LD + Cdk > 10 AND RND < .5 THEN
  PRINT "*Graciously, the creator of this program put no limit on the number of extra"
  PRINT " lives you may purchase.  Nonetheless, abuse of this priviledge is unsportsman-"
  PRINT " like.  Other unfair conduct includes modification of this code to facilitate"
  PRINT " game play or F4-ing out of a game to avoid criticism.  It's your choice, it's"
  PRINT " your afterlife."
  PRINT
  SLEEP
END IF
IF Acc > 70 AND RND < .7 THEN
  PRINT "*I'm impressed, you have good aim.  It seems that every shot is taken with"
  PRINT " great care and from close range.  The risk asociated with being in close"
  PRINT " range do not seem to get to you.  Anyone can keep buying lives and get far,"
  PRINT " but exceedingly few have the nerve to earn an accuracy of"; Acc; "percent!"
  PRINT
  SLEEP
END IF
IF Acc < 55 AND RND < .7 THEN
  PRINT "*Aiming seems to be a problem here.  Back to basics: the phaser shoots the"
  PRINT " way you are facing and moves at constant speed.  Try to release your beam"
  PRINT " at such a time that it will hit the enemy.  (Hint:  that would be the dark"
  PRINT " Squares that start at the top of your screen.)"
  SLEEP
END IF
IF CSRLIN < 20 AND RND < .5 THEN
  PRINT "*Behind the Scenes: The Making of Square Fair Graphic Text Effects"
  PRINT "   Surely you're impressed by the opening screen.  In it, SQUARE is enlarged to"
  PRINT " fill the top in random colors, then distorted left and down.  FAIR was a"
  PRINT " complex picture involving many proportional calculations.  GAME OVER is "
  PRINT " stretched across the top, then undulated by shifting pixel columns according to"
  PRINT " values of the Sine function.  Feel free to examine the code for inspiration!"
  PRINT
  SLEEP
END IF
 IF CSRLIN < 16 THEN
  PRINT "*You are such a well-rounded average pilot that no criticism applies directly to"
  PRINT " you.  If you have improvement suggestions or any negative comments, put your-"
  PRINT " self on our mailing list at www.forum.devilworshippers.prv.  Please send praise"
  PRINT " and adoration to Patrjck@Hotmail.com or PAP@MIT.edu,"
  PRINT " whichever one works.  Thank you, thank you, thank you very much. (E. Presley)"
  PRINT
  SLEEP
END IF
END

SUB Intro
DIM pic&(5000)
CLS
SCREEN 7
ti# = TIMER
LOCATE 23, 1
COLOR 15
PRINT "SQUARE"
PLAY "MBMLO3L16BG+FDO2BG+FDO1BG+FD+.L8C+.P4MLl2C+DD+"
FOR X = 0 TO 47
 FOR Y = 0 TO 6
  LINE (6 * X + 10, 6 * Y + 1)-(6 * X + 14, 6 * Y + 5), POINT(0 + X, 176 + Y) * RND, BF
 NEXT Y
NEXT X
LOCATE 23, 1
PRINT "      "
WHILE TIMER - ti# < 1.5
WEND
FOR Y = 0 TO 41            'distorts top to right
 GET (1, Y)-(290, Y), pic&
 LINE (1, Y)-(290, Y), 0
 PUT ((41 - Y) / 2, Y), pic&
NEXT Y
FOR X = 0 TO 310 STEP 3         'distorts right to bottom
 GET (X, X / 3)-(310, X / 3 + 41), pic&
 LINE (X, X / 3)-(310, X / 3 + 1), 0, BF
 PUT (X, X / 3 + 1), pic&, PSET
NEXT X
COLOR 6
FOR Y = 85 TO 103                  'Vertical bars
 LINE (10, Y)-(310, 185)
 LINE (10, Y + 45)-(310, 189)
 LINE (10, Y + 90)-(310, 193)
SOUND 1700 - 16 * Y, .5
NEXT Y
LINE (10, 103)-(30, 193), , BF
LINE (31, 160)-(66, 193), 0, BF
LINE (67, 130)-(83, 193), 0, BF
LINE (84, 100)-(100, 193), 0, BF    'F
LINE (101, 122)-(116, 193), , BF
LINE (117, 142)-(144, 180), 0, BF
LINE (145, 140)-(157, 193), , BF
LINE (158, 120)-(174, 193), 0, BF   'O
LINE (175, 149)-(186, 193), , BF
LINE (187, 180)-(216, 193), 0, BF
LINE (209, 156)-(216, 170), , BF
FOR X = 0 TO 15
 LINE (176 + X, 170)-(210 + X, 193)
NEXT X
LINE (217, 150)-(230, 193), 0, BF   'R
LINE (231, 163)-(238, 193), , BF
LINE (239, 172)-(259, 184), 0, BF
LINE (259, 160)-(270, 193), 0, BF   'C
LINE (271, 174)-(275, 193), , BF
LINE (293, 178)-(310, 193), 0, BF   'E
WHILE TIMER - ti# < 5
WEND
END SUB

SUB Shop (sco, Yspeed, AB, Pspeed, sab, life, lev)
KEY(1) OFF
KEY(2) OFF
DIM pic&(9000)
SCREEN 8
CLS
COLOR 15
LOCATE 5, 1
PRINT "  Congratulations, you successfully cleared level"; lev; "of enemy ships."
LOCATE 7, 1
GOSUB hello
COLOR 1
LOCATE 4, 1
PRINT "Welcome to Square Fair!"
COLOR 15
FOR X = 0 TO 180
 FOR Y = 0 TO 7
   LINE (X * 3 + 45, Y * 3)-(X * 3 + 47, Y * 3 + 2), POINT(X, Y + 24) * 15, BF
 NEXT Y
IF UCASE$(INKEY$) = "X" THEN GOTO done
NEXT X
LOCATE 4, 1
PRINT "                       "
GET (45, 0)-(587, 23), pic&
PUT (46, 1), pic&

There:
key$ = UCASE$(INKEY$)
LOCATE 7, 1
IF key$ <> "" THEN GOSUB pick
LOCATE 7, 1
IF frame > 0 THEN GOSUB hello
GOTO There

pick:
SELECT CASE UCASE$(key$)
CASE "1": frame = 1: LINE (0, 45)-(630, 190), 0, BF: GOSUB penny
CASE "2": frame = 2: LINE (0, 45)-(630, 190), 0, BF: GOSUB sab
CASE "3": frame = 3: LINE (0, 45)-(630, 190), 0, BF: GOSUB roulette
CASE "4": frame = 4: LINE (0, 45)-(630, 190), 0, BF: GOSUB lottery
CASE "5": frame = 5: LINE (0, 45)-(630, 190), 0, BF: GOSUB level
CASE "6": frame = 6: LINE (0, 45)-(630, 190), 0, BF: GOSUB Phaser
CASE "7": frame = 7: LINE (0, 45)-(630, 190), 0, BF: GOSUB life
CASE "8": frame = 8: LINE (0, 45)-(630, 190), 0, BF: GOSUB speed
CASE "9": frame = 9: LINE (0, 45)-(630, 190), 0, BF: GOSUB Burner
CASE "X": GOTO done
END SELECT
RETURN

hello:
frame = 0
COLOR 15
LINE (0, 45)-(630, 190), 0, BF
PRINT "You have"; sco; "points."
PRINT
PRINT "If you are interested in any of the"
PRINT "following bargains, press the "
PRINT "corresponding key."
PRINT
PRINT "1 - Penny dish         "
PRINT "2 - Sabbotage          "
PRINT "3 - Galaxy Roulette    "
PRINT "4 - Lottery ticket     "
PRINT "5 - Level Skip         "
PRINT "6 - Phaser Upgrade     "
PRINT "7 - Extra Life         "
PRINT "8 - Speed Booster      "
PRINT "9 - Afterburners       "
PRINT
PRINT "X - Go on to level"; lev + 1; "   "
GOSUB shift
GOSUB keeper
RETURN

keeper:
PRINT "Shopkeeper"
LINE (110, 63)-(201, 93), 7, BF
LINE (143, 85)-(168, 88), 8, B
LINE (135, 73)-(145, 77), 1, BF
LINE (165, 73)-(175, 77), 1, BF
LINE (100, 67)-(109, 77), 6, BF
LINE (104, 54)-(105, 66), 8, BF
LINE (202, 67)-(211, 77), 6, BF
LINE (206, 54)-(207, 66), 8, BF
LINE (140, 94)-(166, 120), 8, BF
LINE (55, 115)-(270, 128), 8, BF
LINE (87, 108)-(224, 160), 6, BF
CIRCLE (50, 158), 18, 8: CIRCLE (50, 158), 17, 8
CIRCLE (260, 158), 18, 8: CIRCLE (260, 158), 17, 8
LINE (48, 163)-(52, 167), 0, BF
LINE (258, 163)-(262, 167), 0, BF
LINE (35, 108)-(65, 150), 7, BF
LINE (245, 108)-(274, 150), 7, BF
RETURN

penny:
PRINT "You have"; sco; "points."
PRINT
PRINT "Penny Dish"
PRINT
PRINT "  You spot several shiny points"
PRINT "in the shopkeeper's penny dish."
PRINT "  If you feel a kleptomaniacal"
PRINT "urge, you may be able to grab a"
PRINT "few points while the keeper is "
PRINT "not looking."
PRINT "  There appears to be absolutely"
PRINT "no risk involved."
PRINT "COST: 0 points."
PRINT
GOSUB shift
GOSUB dish
LOCATE 21, 42
INPUT "Y / N"; choice$
LOCATE 23, 40
IF UCASE$(choice$) = "Y" THEN
gain% = RND * 7
sco = sco + gain%
PRINT "You snached"; gain%; "points."
SLEEP
END IF
RETURN

dish:
PRINT "Penny Dish"
DRAW "M105,79ta0C13R96TA-45R33TA0D48ta45L33TA0L96TA-45L33ta0u48ta45r33"
DRAW "BM92,72ta0C13R120TA-45R33TA0D62ta45L33TA0L120TA-45L33ta0u62ta45r33ta0"
FOR R = 0 TO 15
CIRCLE (125, 100), R
NEXT R
CIRCLE (125, 100), 16, 7
LOCATE 13, 4
PRINT "1"
GET (24, 96)-(29, 102), pic&
LOCATE 13, 4
PRINT " "
PUT (123, 97), pic&
GET (109, 92)-(141, 108), pic&
PUT (180, 125), pic&
PUT (100, 112), pic&
PUT (120, 115), pic&, OR
CIRCLE (136, 123), 16, 7
PUT (170, 80), pic&
RETURN

sab:
PRINT "You have"; sco; "points."
PRINT
PRINT "Sabbotage"
PRINT
PRINT "  A Dvindluk is offering to sabbotage"
PRINT "some of the enemy's ships for you. He"
PRINT "claims he can render at least three"
PRINT "unoperational for a small fee."
PRINT "  If you accept the offer, you might"
PRINT "profit by getting a high level bonus"
PRINT "with less risk."
PRINT ""
PRINT "Cost: 500 points (Cash, he insists)."
PRINT
GOSUB shift
GOSUB wrench
LOCATE 21, 42
INPUT "Y / N"; choice$
LOCATE 23, 42
IF UCASE$(choice$) = "Y" THEN
 IF sco < 500 THEN
  PRINT "Your purse has scruples about this."
 ELSE
   IF sab = 0 THEN
    sab = 3: sco = sco - 500: PRINT "'It is done', he promises."
   ELSE : PRINT "You already hired him, moron!"
   END IF
 END IF
 SLEEP
END IF
RETURN

wrench:
PRINT "Sabbotage"
LINE (100, 77)-(250, 80), 9, BF'sd shaft
LINE (64, 69)-(120, 89), 7, BF   'SD handle
LINE (70, 72)-(114, 74), 2, BF
LINE (70, 78)-(114, 80), 2, BF
LINE (70, 84)-(114, 86), 2, BF
FOR X = 0 TO 60
  LINE (60, 79)-(64, 69 + X / 3), 7
  LINE (124, 79)-(120, 69 + X / 3), 7
  LINE (250, 77 + X / 20)-(269, 79), 9
NEXT X
LINE (171, 128)-(285, 142), 9, BF   'H handle
LINE (110, 120)-(170, 155), 11, BF 'hammer wedge
LINE (135, 100)-(110, 120), 8
LINE (135, 100)-(170, 120), 8
PAINT (135, 105), 11, 8
FOR R = 1 TO 1000
  PSET (RND * 114 + 169, RND * 14 + 128), 3
NEXT R
RETURN

roulette:
COLOR 15
PRINT "You have"; sco; "points."
PRINT
PRINT "Galaxy Roulette"
PRINT
PRINT "  Though the odds are slightly against"
PRINT "you, Galaxy Roulette is a good way to"
PRINT "earn those few extra points you might"
PRINT "need to make another purchase."
PRINT "  Payback is around 96 percent."
PRINT
PRINT "Cost:  100 points."
GOSUB shift
GOSUB table
LOCATE 19, 42
INPUT "Y / N"; choice$
LOCATE 20, 40
IF UCASE$(choice$) = "Y" THEN
 IF sco < 100 THEN
  PRINT "Sorry, you're already broke."
 ELSE
  PRINT "You choose 'Red Giant' Red."
  sco = sco - 100
  SLEEP 1
  LOCATE 21, 40
  SELECT CASE RND
  CASE IS < .48: PRINT "Ball hits 'Red Giant' Red!": sco = sco + 200
  CASE IS > .52: PRINT "Ball hits 'Black Hole' Black."
  CASE ELSE: PRINT "Ball rolls off the table.  Sorry!"
  END SELECT
 END IF
SLEEP
END IF
RETURN

table:
PRINT "Galaxy Roulette"
FOR R = 0 TO 8
 CIRCLE (155, 108), R + 7, 5
 CIRCLE (155, 108), R / 2 + 95, 4
NEXT R
CIRCLE (155, 108), 7, 3
PAINT (155, 108), 14, 3
CIRCLE (155, 108), 16, 2
CIRCLE (155, 108), 94, 2
PAINT (100, 108), 2, 2
pi = 3.141592654#
FOR R = 16 TO 94 STEP 2
 FOR Angle# = 0 TO 23 * pi / 12 STEP pi / 12
 CIRCLE (155, 108), R, 12, Angle#, Angle# + pi / 24
 NEXT Angle#
NEXT R
RETURN

lottery:
PRINT "You have"; sco; "points."
PRINT
PRINT "Lottery Ticket"
PRINT
PRINT "  If you are 21 or older, you may"
PRINT "purchase a lottery ticket.  Since"
PRINT "The lottery is subsidized by planet"
PRINT "Gamblibia, it can afford to pay one"
PRINT "Grand every tenth time, ten every"
PRINT "hundredth time, and a grand prize of"
PRINT "50,000 points for every fivehundredth"
PRINT "ticket. "
PRINT "Cost:  170 points"
PRINT
GOSUB shift
GOSUB ticket
LOCATE 21, 42
INPUT "Y / N"; choice$
LOCATE 23, 40
IF UCASE$(choice$) = "Y" THEN
 IF sco < 170 THEN
  PRINT "Sorry, you can't afford it."
 ELSE
  sco = sco - 170
  SLEEP 1
  lot = RND
  PRINT INT(lot * 10000)
  SELECT CASE lot
   CASE IS <= .1: gain% = 1170: PRINT "You picked up 1000 pts."
   CASE IS >= .99: gain% = 10170: PRINT "You won 10,000 pts.!"
   CASE .198 TO .2: gain% = 50170: PRINT "YOU WON 50,000 pts.!!!"
   CASE ELSE: gain% = 0: PRINT "You drew a dud."
  END SELECT
  sco = sco + gain%
 END IF
SLEEP
END IF
RETURN

ticket:
PRINT "Lottery Ticket"
COLOR 11
LOCATE 13, 9
PRINT "Official ticket of the"
LOCATE 14, 11
PRINT "Gamblibian lottery."
LOCATE 15, 16
PRINT "~*~*~*~"
LOCATE 16, 11
PRINT "Void under age 21."
GET (50, 88)-(260, 135), pic&
LINE (50, 88)-(260, 135), 6, BF
PUT (52, 88), pic&, OR
LINE (50, 88)-(260, 135), 8, B
CIRCLE (51, 93), 3, 0
CIRCLE (51, 93), 2, 0
CIRCLE (51, 93), 1, 0
CIRCLE (51, 93), 4, 8
LINE (47, 90)-(49, 95), 0, BF
GET (50, 90)-(55, 95), pic&
PUT (50, 99), pic&, PSET
PUT (50, 108), pic&, PSET
PUT (50, 117), pic&, PSET
PUT (50, 126), pic&, PSET
CIRCLE (259, 93), 3, 0
CIRCLE (259, 93), 2, 0
CIRCLE (259, 93), 1, 0
CIRCLE (259, 93), 4, 8
LINE (261, 90)-(263, 95), 0, BF
GET (255, 90)-(260, 95), pic&
PUT (255, 99), pic&, PSET
PUT (255, 108), pic&, PSET
PUT (255, 117), pic&, PSET
PUT (255, 126), pic&, PSET
COLOR 15
RETURN

level:
PRINT "You have"; sco; "points."
PRINT
PRINT "Skip a Level"
PRINT
PRINT "  You casually chat with the game"
PRINT "overseer.  As you regard his shabby"
PRINT "outfit, you get a hunch that he might"
PRINT "be corruptible.  If you could bribe"
PRINT "him, maybe you can advance to the next"
PRINT "level."
PRINT "  'What good is that?', you ask your-"
PRINT "self.  But then you remember how badly"
PRINT "you wanted to beat level"; lev + 2; "."
PRINT "Cost:  150 points."
GOSUB shift
GOSUB arrow
LOCATE 21, 42
INPUT "Y / N"; choice$
LOCATE 23, 42
IF UCASE$(choice$) = "Y" THEN
 IF sco < 150 THEN
  PRINT "Sorry, he has more money than you do."
 ELSE
 sco = sco - 150
 lev = lev + 1
 PRINT "He takes the money."
 END IF
 SLEEP
END IF
RETURN

arrow:
PRINT "Skip a Level"
LINE (40, 94)-(220, 122), 1, B
LINE (40, 94)-(40, 122), 0
LINE (40, 94)-(100, 108), 1
LINE (40, 122)-(100, 108), 1
LINE (280, 108)-(220, 80), 1
LINE (280, 108)-(220, 136), 1
LINE (220, 80)-(219, 136), 1, B
LINE (220, 95)-(219, 121), 0, B
PAINT (210, 110), 9, 1
RETURN

Phaser:
PRINT "You have"; sco; "points."
PRINT
PRINT "Upgrade Phaser"
PRINT
PRINT "  In a corner of Square Fair, you see"
PRINT "a carton marked 'light accelerator,"
PRINT "on sale'.  Upon closer examination,"
PRINT "you recognize that one of these devi-"
PRINT "ces can improve your phaser-to-speed"
PRINT "ratio.  It is even possible to link "
PRINT "another accelerator for even better"
PRINT "performance."
PRINT "Cost: only 1500 points!"
PRINT
GOSUB shift
GOSUB gun
LOCATE 21, 42
INPUT "Y / N"; choice$
LOCATE 23, 42
IF UCASE$(choice$) = "Y" THEN
 IF sco < 1500 THEN
  PRINT "Sorry, you don't even have that."
 ELSE
  IF Pspeed < 3 THEN
    sco = sco - 1500
    Pspeed = Pspeed + .5
    PRINT "Driver succesfully installed."
  ELSE
    PRINT "No more than two devices at once!"
  END IF
 END IF
 SLEEP
END IF
RETURN

gun:
PRINT "Phaser Upgrade"
LINE (64, 79)-(211, 141), 3, BF
FOR X = 64 TO 203 STEP 6
  FOR Y = 79 TO 138 STEP 6
     LINE (X, Y)-(X + 8, Y + 8), 7, B
  NEXT Y
NEXT X
LINE (160, 95)-(250, 100), 5, BF
LINE (160, 118)-(250, 123), 5, BF
LINE (106, 90)-(170, 105), 1, BF
LINE (106, 128)-(170, 113), 1, BF
FOR Y = 93 TO 102
  LINE (251, Y)-(280, 98), 11
  LINE (251, Y + 23)-(280, 121), 11
NEXT Y
RETURN

life:
PRINT "You have"; sco; "points."
PRINT
PRINT "Extra Life"
PRINT                                       '
PRINT "  You ask the shopkeeper if he hap-"
PRINT "pens to have any spare lives lying"
PRINT "around anywhere.  'We have every-"
PRINT "thing here', he reports.  In that"
PRINT "moment, you see it too:  A beautiful"
PRINT "fresh life, right there on the shelf."
PRINT "  The merchandise is flawless; the "
PRINT "only problem is the price tag."
PRINT ""
PRINT "Cost: 2,000 points"
GOSUB shift
GOSUB heart
LOCATE 21, 42
INPUT "Y / N"; choice$
LOCATE 23, 42
IF UCASE$(choice$) = "Y" THEN
 IF sco < 2000 THEN
  PRINT "You don't have that much money."
 ELSE
  sco = sco - 2000
  life = life + 1
  PRINT "You gladly take it."
 END IF
 SLEEP
END IF
RETURN

heart:
PRINT "Extra Life"
CIRCLE (110, 100), 45, 13
CIRCLE (201, 100), 45, 13
LINE (78, 100)-(235, 123), 0, BF
LINE (78, 114)-(155, 155), 13
LINE (236, 113)-(155, 155), 13
PAINT (155, 108), 4, 13
RETURN

speed:
PRINT "You have"; sco; "points."
PRINT
PRINT "Speed Booster"
PRINT
PRINT "  If you have a need for speed, this"
PRINT "one's for you, indeed!  The increase"
PRINT "may not be noticeable, but multiple"
PRINT "boosters will allow you to outpace"
PRINT "any foe.  As a free bonus gift, your"
PRINT "phaser also gets some grease.  Accept"
PRINT "this once-in-a-lifetime offer and"
PRINT "become a speed demon.  But if you feel"
PRINT "animosity toward velocity, don't."
PRINT "Cost: 4000 points."
GOSUB shift
GOSUB engine
LOCATE 21, 42
INPUT "Y / N"; choice$
LOCATE 23, 42
IF UCASE$(choice$) = "Y" THEN
 IF sco < 4000 THEN
  PRINT "Sorry, out of stock."
 ELSE
  IF Yspeed < 10 THEN
   Yspeed = Yspeed + 1
   sco = sco - 4000
   PRINT "Ready to Roll, Rodger!"
  ELSE
   PRINT "Those speeds are no longer safe!"
  END IF
 END IF
 SLEEP
END IF
RETURN

engine:
PRINT "Speed Booster"
LINE (110, 82)-(240, 141), 8, BF  'back side
LINE (135, 76)-(265, 135), 3, BF 'front side
LINE (110, 82)-(134, 77), 8     'slant edge
LINE (134, 77)-(134, 82), 8
PAINT (120, 81), 8
LINE (110, 141)-(140, 136), 1
LINE (240, 141)-(264, 136), 1
LINE (110, 141)-(240, 141), 1
LINE (136, 136)-(263, 136), 1
PAINT (146, 139), 1
FOR R = 5 TO 50 STEP 2.5
  CIRCLE (115 - R * 1.2, 108), SQR(R) * 5, 3 + 3 * (INT(R / 15) - R / 15), , , 1.4
NEXT R
DRAW "TA0BM145, 81C1"
FOR X = 0 TO 5
 DRAW "D49E8U33H8BR20"
NEXT X
FOR X = 0 TO 100 STEP 20
PAINT (146 + X, 83), 0, 1
NEXT X
RETURN

Burner:
PRINT "You have"; sco; "points."
PRINT
PRINT "Afterburners"
PRINT
PRINT "  The fair's hottest item is smiling"
PRINT "at you!  A sure LASER defense for"
PRINT "shots from behind, the afterburners"
PRINT "leave behind a strak that diffuses"
PRINT "light.  And best of all - it takes"
PRINT "no time to reload, just 100 points."
PRINT "Just Press 'B' to get enemy LASERs"
PRINT "off your tail."
PRINT "Cost: 10,000 points."
GOSUB shift
GOSUB ball
LOCATE 21, 42
INPUT "Y / N"; choice$
LOCATE 23, 42
IF UCASE$(choice$) = "Y" THEN
 IF sco < 10000 THEN
  PRINT "Sorry, it's out of YOUR reach."
 ELSE
  IF AB = 1 THEN
   PRINT "Do you want to make a donation???"
  ELSE
   AB = 1: PRINT "Afterburners installed & functional!"
   sco = sco - 10000
  END IF
 END IF
 SLEEP
END IF
RETURN

ball:
PRINT "Afterburners"
LINE (36, 108)-(274, 108), 4
LINE (155, 55)-(156, 161), 4, B
LINE (70, 72)-(240, 144), 4
LINE (70, 144)-(240, 72), 4
FOR R = 0 TO 100
CIRCLE (155, 108), 101 - R, R / 4
NEXT R
RETURN

shift:
GET (0, 48)-(300, 190), pic&
PUT (320, 48), pic&
LINE (0, 45)-(310, 190), 0, BF
LINE (10, 45)-(300, 172), 14, BF
LINE (18, 49)-(292, 168), 0, BF
LOCATE 23, 14
RETURN

done:
KEY(1) ON
KEY(2) ON
COLOR 15
SCREEN 9
END SUB

