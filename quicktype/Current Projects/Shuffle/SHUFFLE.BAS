10 DIM cell(4, 4) AS INTEGER
20 REM initialization
RANDOMIZE TIMER
x = 1
y = 1
movenum& = 0

CLS
PRINT "---SHUFFLE PUZZLE---"
INPUT "Shuffle how many times (easy=100, hard=800)"; shuf
IF shuf < 1 OR shuf > 32000 THEN
  PRINT "Invalid input"
  END
END IF
PRINT "Please wait..."

' set up the board methodically
x = 1
y = 1
count = 1
WHILE y <= 4
  WHILE x <= 4
    cell(x, y) = count
    x = x + 1
    count = count + 1
  WEND
  x = 1
  y = y + 1
WEND
cell(4, 4) = 0

' shuffle the board
FOR scratch = 0 TO shuf
 x = INT(RND * 4) + 1
 y = INT(RND * 4) + 1
 IF y > 1 THEN
  IF cell(x, y - 1) = 0 THEN
   cell(x, y - 1) = cell(x, y)
   cell(x, y) = 0
  END IF
 END IF
 IF y < 4 THEN
  IF cell(x, y + 1) = 0 THEN
   cell(x, y + 1) = cell(x, y)
   cell(x, y) = 0
  END IF
 END IF
 IF x > 1 THEN
  IF cell(x - 1, y) = 0 THEN
   cell(x - 1, y) = cell(x, y)
   cell(x, y) = 0
  END IF
 END IF
 IF x < 4 THEN
  IF cell(x + 1, y) = 0 THEN
   cell(x + 1, y) = cell(x, y)
   cell(x, y) = 0
  END IF
 END IF
NEXT scratch

main:
CLS
GOSUB display:
GOSUB finish:
' main input
INPUT "Enter number to move (<Q>uit): ", move$
move$ = UCASE$(move$)
IF move$ = "Q" THEN END
move = VAL(move$)
FOR scratch1 = 1 TO 4
  FOR scratch2 = 1 TO 4
    IF cell(scratch1, scratch2) = 0 THEN
      zerox = scratch1
      zeroy = scratch2
    END IF
    IF cell(scratch1, scratch2) = move THEN
      movex = scratch1
      movey = scratch2
    END IF
  NEXT scratch2
NEXT scratch1
IF zerox = (movex + 1) AND zeroy = movey THEN GOSUB movepiece:
IF zerox = (movex - 1) AND zeroy = movey THEN GOSUB movepiece:
IF zeroy = (movey + 1) AND zerox = movex THEN GOSUB movepiece:
IF zeroy = (movey - 1) AND zerox = movex THEN GOSUB movepiece:
GOTO main:

' move piece
movepiece:
movenum& = movenum& + 1
cell(zerox, zeroy) = move
cell(movex, movey) = zero
RETURN

' display the board
display:
PRINT "---SHUFFLE PUZZLE---"
PRINT "Goal: to have the numbers in order (left-right, top-bottom)."
PRINT "Move#"; movenum&
PRINT
FOR scratch1 = 1 TO 4
  FOR scratch2 = 1 TO 4
    IF cell(scratch2, scratch1) = 0 THEN
      PRINT "   ";
     ELSE
      PRINT cell(scratch2, scratch1);
    END IF
    IF cell(scratch2, scratch1) < 10 THEN PRINT " ";
  NEXT scratch2
  PRINT
NEXT scratch1
PRINT
RETURN

finish:
x = 1
y = 1
count = 1
WHILE y <= 4
   WHILE x <= 4
     IF cell(x, y) <> count AND count < 16 THEN RETURN
     x = x + 1
     count = count + 1
    WEND
    x = 1
    y = y + 1
WEND
PRINT "The puzzle is solved! Press any key to quit..."
SLEEP
END
RETURN

