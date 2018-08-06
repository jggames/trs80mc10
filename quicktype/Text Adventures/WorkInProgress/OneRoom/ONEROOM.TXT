  5 @%=2
 10 *FX15
 15 CLS:PRINT'"Data will be printed on screen."''"Also save data to disc? (Y/<N>): ";:K$=GET$:IFK$="Y"ORK$="y"PRINTK$:K%=1ELSEPRINT"N":K%=0

 20 DIM RM$(7),OB$(56),EX$(50),OB%(57),D$(6),F%(30)
 25 REM DIM VB$(21),D%(8,6),F$(19) *** Not used in actual prog!!!

 30 PRINT'"-- START --"':IF K% L%=OPENOUT("DAT")

 35 REM *** DIRECTIONS ***
 40 FOR X=1TO6:READ D$(X):PRINTD$(X):
 45 IF K% PRINT#L%,D$(X)
 50 NEXTX

 55 REM *** ROOM DESCRIPTIONS & EXITS *** D(X,Y) not used in actual prog!!!
 60 X=0:PRINT
 65 X=X+1:READ I$
 70 IF I$="END" THEN 100 ELSE RM$(X)=I$
 75 PRINTRM$(X);" ";:IF K% PRINT#L%,RM$(X)
 80 REM *** PRINT;X;": ";:FOR Y=1TO6:READ D%(X,Y):PRINT;D%(X,Y);" ";
 85 REM *** IF K% PRINT#L%,D%(X,Y)
 87 REM *** NEXT Y
 88 FOR Y=1TO6:READ D%:N.
 90 PRINT:GOTO65

 95 REM *** OBJECTS ***
100 X=0:PRINT
105 X=X+1:READ I$
110 IF I$="END"THEN NO=X-1:GOTO130 ELSE OB$(X)=I$:PRINTX;" ";OB$(X);", ";:READ I$,OB%(X):PRINTI$;", ";OB%(X);:OB$=OB$+I$
115 IF K% PRINT#L%,OB$(X),I$,OB%(X)
120 IF X>6 THEN READ EX$(X-6):PRINT", ";EX$(X-6);:IF K% PRINT#L%,EX$(X-6)
125 PRINT:GOTO 105
130 PRINT'OB$':IF K% PRINT#L%,OB$

135 REM *** VERBS *** VB$() not used in actual prog!!!
140 X=0
145 X=X+1:READ I$
150 IF I$="END" THEN 165 ELSE VB$=VB$+LEFT$(I$,3):REM *** VB$(X)=I$
155 PRINTX;" ";I$:REM *** IF K% PRINT#L%,I$
160 GOTO145
165 PRINTVB$':IF K% PRINT#L%,VB$

170 REM *** FLAG DESCRIPTIONS *** Not used in actual prog!!!
175 REM X=0
180 REM X=X+1:READ F$(X):PRINTF$(X):IF F$(X)="END" THEN 185 ELSE GOTO180

185 PRINT'"--END--"'
190 IF K% CLOSE#L%
195 END

282 '*******DIRECTIONS******
283 DATA NORTH,SOUTH,EAST,WEST,UP,DOWN
284 '*******  ROOMS  *******
285 DATA In The Middle Of A Room,0,0,0,0,0,0
286 DATA Facing The North Wall,0,0,0,0,0,0
287 DATA Facing The South Wall,0,0,0,0,0,0
288 DATA Facing The East Wall,0,0,0,0,0,0
289 DATA Facing The West Wall,0,0,0,0,0,0
290 DATA Looking At The Ceiling,0,0,0,0,0,0
291 DATA Looking At The Floor,0,0,0,0,0,0
292 DATA END
293 '****** OBJECTS *****
294 DATANORTH,NOR,0,SOUTH,SOU,0,EAST,EAS,0,WEST,WES,0,UP ,UP ,0,DOWN,DOW,0
295 DATA A CHAIR,CHA,2,The chair looks rather fragile.
296 DATA A PIECE OF ROPE,ROP,7,It's just a regular rope.
297 DATA A BLINDFOLD,BLI,7,It's just a piece of cloth.
298 DATA A NAIL,NAI,0,The nail is quite sharp.
299 DATA A DESK,DES,2,It's the type with a rollover top and   has a large drawer on the side.
300 DATA A DRAWER,DRA,0,The drawer is locked and can't be       opened.
301 DATA A RADIO,RAD,2,It's a portable radio.
302 DATA A BATTERY,BAT,0,It's a 12 volt battery.
303 DATA AN ELECTRIC OUTLET,OUT,0,It's a 120 volt outlet.
304 DATA A DOOR,DOO,3,It's locked from the outside.
305 DATA A SWITCH ON THE WALL,SWI,3,It's a light switch.
306 DATA A PICTURE,PIC,3,It's a picture of a boat in a nice      wooden frame.
307 DATA BROKEN GLASS,GLA,0,The broken glass is very sharp.
308 DATA A ROUND BOX,BOX,0,The box is empty.
309 DATA A TOOLBOX,TOO,4,It's made of metal.
310 DATA A CROWBAR,CRO,0,Just a regular crowbar.
311 DATA A SCREWDRIVER,SCR,0,It's the regular kind.
312 DATA A PAIR OF PLIERS,PLI,0,It's the long-nose type.
313 DATA A HAMMER,HAM,0,Nothing special about it.
314 DATA A WINDOW,WIN,5,The panes have been painted.
315 DATA ANTIQUE FURNITURE,FUR,5,It's a bookcase.
316 DATA A BOOK,BOO,0,It's a book on CB radios.
317 DATA A CB RIG,RIG,0,There is a microphone already attached  to it.
318 DATA A SMALL RUG,RUG,7,It's an oriental rug.
319 DATA A LOOSE BOARD,BOA,0,It seems to give a little.
320 DATA A COUCH,COU,4,There are some pillows on it.
321 DATA PILLOW,PIL,0,It feels rather heavy.
322 DATA A COAT RACK,RAC,5,It's made of metal.
323 DATA A COAT ON THE RACK,COA,5,It's a sports coat.
324 DATA A HANGER ON THE RACK,HAN,0,Just a regular wire hanger.
325 DATA AN ELECTRIC CORD,COR,0,One end is bare and the other end has a plug on it.
326 DATA A MICROPHONE,MIC,0,It is attached to the CB set and has a  button on it.
327 DATA A HOLE ON THE WALL,HOL,0,Looks like it was made by a large rat.
328 DATA A VAULT ON THE WALL,VAU,0,It has a combination lock on it.
329 DATA WALL,WAL,0,Nothing special about it.
330 DATA A BIG BIRD CAGE,CAG,4,It has a white dove in it.
331 DATA A WHITE DOVE,DOV,0,It's a special type dove.
332 DATA A PIECE OF PAPER,PAP,0,The characters '4R8L12R' are written on it.
333 DATA A SET OF KEYS,KEY,0,I see several small keys.
334 DATA A RED BUTTON,BUT,0,Just a regular button.
335 DATA A FLOWER POT,POT,3,Sunflowers are growing in it.
336 DATA SUNFLOWERS,SUN,0,They are kind of dry.
337 DATA SUNFLOWER SEEDS,SEE,0,Nothing special about them.
338 DATA A WOODBURNING STOVE,STO,4,It's a Franklin stove.
339 DATA A MAGNIFYING LENS,LEN,0,It's a Sherlock Holmes Official Fan Clublens.
340 DATA PIECES OF WOOD,WOO,0,Nothing special.
341 DATA PIECES OF CARDBOARD,CAR,0,Nothing special.
342 DATA A BIRD FLYING AROUND,BIR,0,It's the dove I saw before.
343 DATA WIRE,WIR,0,It's holding the door closed.
344 DATA CAN OPENER,OPE,0,It's the heavy-duty type.
345 DATA END
346 '****** VERBS ******
347 DATA GET,DROP,OPEN,CLOSE,EXAMINE,PUSH,BREAK,ENTER,READ,TURN,RUN,SHAKE
348 DATA UNTIE,FEEL,RUB,CUT,REMOVE,FACE,GO ,CONNECT,PUT
349 DATA END

373 ' *** FLAGS USED ***
374 DATA RADIO OFF OR ON, BLINDFOLD ON OR OFF, HANDS TIED OR UNTIED, WINDOW OK OR BROKEN
375 DATA BIRD CAGE CLOSED OR OPEN,DESK LOCKED OR UNLOCKED,BIRD IN ROOM OR NOT IN
376 DATA STOVE OFF OR ON,CB OFF OR ON,SWITCH OFF OR ON,ANTENNA OFF OR ON,TOOL BOX LOCKED OR UNLOCKED
377 DATA DOVE DID NOT LEAVE ROOM,CB RUNNING ON BATTERIES,CB RUNNING ON ELECTRICITY,ANTENNA OFF OR ON
378 DATA HOLE NOT PLUGGED OR PLUGGED,CORD NOT CONNECTED OR CONNECTED
379 DATA END
