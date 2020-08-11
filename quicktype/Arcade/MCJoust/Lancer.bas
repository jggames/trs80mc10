'LancerEX v. 1.2- press F5 to start
swc = 0
o$ = "0"
s1$ = "N"
s2$ = "N"
s3$ = "N"
wp = 0
w = 0
wp2 = 0
RANDOMIZE TIMER
menu:
sws = 0
tc = 0
cdg = 0
ecdg = 0
CLS
PRINT "Lancer EX v1.2", , , "Wins: "; w
PRINT "What would you like to do?", , , "Losses: "; l
PRINT "1. Story Mode"
PRINT "2. Battle"
PRINT "3. Tutorial"
PRINT "4. Enter Codes"
PRINT "5. Character Managment"
PRINT "6. Edit Stat Points"
PRINT "7. Quit"
PRINT
INPUT "Select Choice: ", o$
IF o$ = "7" THEN END
IF o$ = "6" THEN GOTO addpoints
IF o$ = "1" THEN GOTO story
IF o$ = "4" THEN GOTO codes
IF o$ = "5" THEN GOTO charmanage
IF o$ = "2" THEN GOTO charselect
IF o$ = "3" THEN GOTO tutorialselect
charselect:
CLS
PRINT "1. Lancer"
PRINT "2. Kyru"
IF cc < 1 THEN PRINT "3. Locked"
IF cc > 0 THEN PRINT "3. Dingo"
IF s1$ = "N" THEN PRINT "4. Make new character"
IF s1$ = "Y" THEN PRINT "4. "; c1$
IF s2$ = "N" THEN PRINT "5. Make new character"
IF s2$ = "Y" THEN PRINT "5. "; c2$
IF s3$ = "N" THEN PRINT "6. Make new character"
IF s3$ = "Y" THEN PRINT "6. "; c3$
PRINT "7. Back"
PRINT
INPUT "Select Character: ", cs$
IF cs$ = "7" THEN GOTO menu
IF cs$ = "4" AND s1$ = "N" THEN GOTO makechar1
IF cs$ = "4" AND s1$ = "Y" THEN GOTO activate1
IF cs$ = "5" AND s2$ = "N" THEN GOTO makechar2
IF cs$ = "5" AND s2$ = "Y" THEN GOTO activate2
IF cs$ = "6" AND s3$ = "N" THEN GOTO makechar3
IF cs$ = "6" AND s3$ = "Y" THEN GOTO activate3
IF cs$ = "1" THEN
c$ = "Lancer"
T$ = "Exodus Slash"
f$ = "Gale Blade"
u$ = "Renosuken"
p = 2
st = 1
m = 1
ts = 1
us = 3
hp = 100 + (st * 10)
mhp = hp
chp = (mhp / 10) * 3
sp = 5 + m
up = 1
GOTO enemyselect
ELSEIF cs$ = "2" THEN
c$ = "Kyru"
T$ = "Electrolyte"
f$ = "Particle Blade"
u$ = "Atom Smasher"
p = 1
st = 1
m = 3
ts = 2
us = 1
hp = 100 + (st * 10)
mhp = hp
chp = (mhp / 10) * 3
sp = 5 + m
up = 1
GOTO enemyselect
ELSEIF cs$ = "3" AND cc > 0 THEN
c$ = "Dingo"
T$ = "Hyper Slash"
f$ = "Shuriken Spray"
u$ = "Ryuken"
p = 2
st = 2
m = 2
ts = 0
us = 3
hp = 100 + (st * 10)
mhp = hp
chp = (mhp / 10) * 3
sp = 5 + m
up = 1
GOTO enemyselect
ELSE GOTO charselect
enemyselect:
CLS
PRINT "1. Lancer"
PRINT "2. Kyru"
IF cc > 0 THEN PRINT "3. Dingo"
IF cc < 1 THEN PRINT "3. Locked"
PRINT "4. Back"
PRINT
INPUT "Select enemy: ", es$
IF es$ = "4" THEN GOTO charselect
IF es$ = "1" THEN
ec$ = "Lancer"
et$ = "Exodus Slash"
ef$ = "Gale Blade"
eu$ = "Renosuken"
ep = 2
est = 1
em = 1
etp = 1
eus = 3
ehp = 100 + (est * 10)
emhp = ehp
echp = (emhp / 10) * 3
esp = 5 + em
eup = 1
GOTO turn
ELSEIF es$ = "2" THEN
ec$ = "Kyru"
et$ = "Electrolyte"
ef$ = "Particle Blade"
eu$ = "Atom Smasher"
ep = 1
est = 1
em = 3
etp = 2
eus = 1
ehp = 100 + (est * 10)
emhp = ehp
echp = (emhp / 10) * 3
esp = 5 + em
eup = 1
GOTO turn
ELSEIF es$ = "3" AND cc > 0 THEN
ec$ = "Dingo"
et$ = "Hyper Slash"
ef$ = "Shuriken Spray"
eu$ = "Ryuken"
ep = 2
est = 2
em = 2
etp = 0
eus = 3
ehp = 100 + (est * 10)
emhp = ehp
echp = (emhp / 10) * 3
esp = 5 + em
mesp = esp
eup = 1
GOTO turn
ELSE GOTO enemyselect
turn:
CLS
g = 0
tc = tc + 1
IF hp < 1 THEN GOTO lose
IF ehp < echp + 1 THEN cdg = 1
PRINT c$; , , , , ec$
PRINT "HP: "; hp; , , , , "HP: "; ehp
PRINT "SP: "; sp, , , , "SP: "; esp
PRINT "UP: "; up, , , , "UP: "; eup
PRINT
PRINT
PRINT
PRINT
PRINT "Move Choices:"
PRINT "1. Attack"
PRINT "2. Use Skills"
PRINT "3. Heal"
PRINT "4. Guard"
PRINT "5. Run"
PRINT
INPUT "Choose Action: ", a$
IF a$ = "Death Attack" THEN GOTO win
IF a$ = "5" THEN GOTO lose
IF a$ = "4" THEN
CLS
PRINT c$; , , , , ec$
PRINT "HP: "; hp; , , , , "HP: "; ehp
PRINT "SP: "; sp, , , , "SP: "; esp
PRINT "UP: "; up, , , , "UP: "; eup
PRINT
PRINT
PRINT
PRINT
g = INT(RND * 5) + 2
PRINT c$; " guards!"
GOSUB text
GOTO enemyturn
ELSEIF a$ = "3" THEN
CLS
PRINT c$; , , , , ec$
PRINT "HP: "; hp; , , , , "HP: "; ehp
PRINT "SP: "; sp, , , , "SP: "; esp
PRINT "UP: "; up, , , , "UP: "; eup
PRINT
PRINT
PRINT
PRINT
a% = INT(RND * 10) + 1 + 10 + st
IF hp + a% > mhp THEN a% = mhp - hp
PRINT c$; " heals "; a%; " points!"
GOSUB text
hp = hp + a%
sp = sp - 1
GOTO enemyturn
ELSEIF a$ = "1" THEN
a% = INT(RND * 6) + 1 + (2 + p)
CLS
PRINT c$; , , , , ec$
PRINT "HP: "; hp; , , , , "HP: "; ehp
PRINT "SP: "; sp, , , , "SP: "; esp
PRINT "UP: "; up, , , , "UP: "; eup
PRINT
PRINT
PRINT
PRINT
PRINT c$; " attacks "; ec$; " for "; a%; " points of damage!"
GOSUB text
ehp = ehp - a%
GOTO enemyturn
ELSEIF a$ = "2" THEN GOTO special
ELSE GOTO turn
special:
CLS
a2$ = "0"
PRINT c$; , , , , ec$
PRINT "HP: "; hp; , , , , "HP: "; ehp
PRINT "SP: "; sp, , , , "SP: "; esp
PRINT "UP: "; up, , , , "UP: "; eup
PRINT
PRINT
PRINT
PRINT
IF sp > 0 THEN PRINT "1. Technique: "; T$
IF sp > 0 THEN PRINT "Cost: 1 SP"
IF sp > 2 THEN PRINT "2. Finisher: "; f$
IF sp > 2 THEN PRINT "Cost: 3 SP"
IF sp > 2 AND cdg = 1 THEN PRINT "2C: "; f$; " - Coup De Grace"
IF sp > 2 AND cdg = 1 THEN PRINT "Cost. 3 SP"
IF up > 0 THEN PRINT "3. Ultimate Move: "; u$; " ("; tc; ")"
IF sp > 0 OR up > 0 THEN PRINT "4: Back"
IF sp < 1 AND up < 1 THEN PRINT "Out of SP and UP!"
IF sp < 1 AND up < 1 THEN GOSUB text
IF sp < 1 AND up < 1 THEN GOTO turn
PRINT
PRINT
INPUT "Choose action: ", a2$
IF a2$ = "4" THEN GOTO turn
IF a2$ = "1" AND sp > 0 THEN
a% = INT(RND * 10) + (ts * 2) + 4
CLS
PRINT c$; , , , , ec$
PRINT "HP: "; hp; , , , , "HP: "; ehp
PRINT "SP: "; sp, , , , "SP: "; esp
PRINT "UP: "; up, , , , "UP: "; eup
PRINT
PRINT
PRINT
PRINT
PRINT c$; " used "; T$; " on "; ec$; " for"; a%; "points of damage!"
GOSUB text
ehp = ehp - a%
sp = sp - 1
GOTO enemyturn
ELSEIF a2$ = "2" AND sp > 2 THEN
a% = INT(RND * 8) + (ts * 2) + 14
CLS
PRINT c$; , , , , ec$
PRINT "HP: "; hp; , , , , "HP: "; ehp
PRINT "SP: "; sp, , , , "SP: "; esp
PRINT "UP: "; up, , , , "UP: "; eup
PRINT
PRINT
PRINT
PRINT
PRINT c$; " used "; f$; " on "; ec$; " for "; a%; " points of damage!"
GOSUB text
ehp = ehp - a%
sp = sp - 3
GOTO enemyturn
ELSEIF a2$ = "3" AND up > 0 THEN
a% = INT(RND * 10) + (us * 3) + tc + 10
CLS
PRINT c$; , , , , ec$
PRINT "HP: "; hp; , , , , "HP: "; ehp
PRINT "SP: "; sp, , , , "SP: "; esp
PRINT "UP: "; up, , , , "UP: "; eup
PRINT
PRINT
PRINT
PRINT
PRINT c$; " used "; u$; " on "; ec$; " for "; a%; " points of damage!"
GOSUB text
ehp = ehp - a%
up = up - 1
GOTO enemyturn
ELSEIF a2$ = "2C" AND cdg = 1 AND sp > 2 THEN GOTO coupdegrace
ELSE GOTO special
coupdegrace:
a% = INT(RND * 20) + (ts * 2) + 14
CLS
PRINT c$; , , , , ec$
PRINT "HP: "; hp; , , , , "HP: "; ehp
PRINT "SP: "; sp, , , , "SP: "; esp
PRINT "UP: "; up, , , , "UP: "; eup
PRINT
PRINT
PRINT
PRINT
sp = sp - 3
IF ehp - a% < 1 THEN
PRINT c$; " used "; f$; " on "; ec$; " for"; a%; "points of damage!"
PRINT "Coup De Grace!"
GOSUB text
GOTO win
ELSEIF ehp > 0 THEN
PRINT "Coup De Grace failed..."
GOSUB text
GOTO enemyturn
enemyturn:
CLS
a$ = "0"
IF ehp < 1 THEN GOTO win
a% = 0
IF hp < chp + 1 THEN ecdg = 1
PRINT c$; , , , , ec$
PRINT "HP: "; hp; , , , , "HP: "; ehp
PRINT "SP: "; sp, , , , "SP: "; esp
PRINT "UP: "; up, , , , "UP: "; eup
PRINT
PRINT
PRINT
PRINT
a% = INT(RND * 10) + 1
IF a% < 7 THEN
a% = a% + ep + 2 - g
PRINT ec$; " attacks "; c$; " for "; a%; " points of damage!"
GOSUB text
IF a% <= 0 THEN a% = 0
hp = hp - a%
GOTO turn
ELSEIF a% > 6 AND a% < 9 AND esp > 0 THEN
a% = INT(RND * 10) + 1 + (etp * 2) + 4 - g
PRINT ec$; " uses "; et$; " on "; c$; " for "; a%; " points of damage!"
GOSUB text
IF a% <= 0 THEN a% = 0
hp = hp - a%
esp = esp - 1
GOTO turn
ELSEIF a% > 8 AND a% < 10 AND esp > 2 THEN
a% = INT(RND * 14) + 1 + (etp * 2) + 8 - g
PRINT ec$; " uses "; ef$; " on "; c$; " for "; a%; " points of damage!"
GOSUB text
hp = hp - a%
esp = esp - 3
GOTO turn
ELSEIF a% > 9 AND eup > 0 THEN
a% = INT(RND * 10) + 1 + (eus * 3) + (tc * 2) + 10 - g
PRINT ec$; " uses "; eu$; " on "; c$; " for "; a%; " points of damage!"
GOSUB text
hp = hp - a%
eup = eup - 1
GOTO turn
ELSE GOTO enemyturn
win:
CLS
IF sws = 1 THEN GOTO swin
PRINT "You win!"
w = w + 1
PRINT "Current wins: "; w
PRINT "Current losses: "; l
IF wp = 0 THEN PRINT
IF wp = 1 THEN PRINT "Last Code: Flamberge"
IF wp = 2 THEN PRINT "Last Code: Greatsword"
IF wp = 3 THEN PRINT "Last Code: Hardedge"
IF wp = 4 THEN PRINT "Last Code: Void"
IF wp = 5 THEN PRINT "Last Code: Flare"
IF wp = 6 THEN PRINT "Last Code: Katana"
IF wp = 7 THEN PRINT "Last Code: Fury"
IF wp = 8 THEN PRINT "Last Code: Curse"
IF w = 5 THEN PRINT "Level Code: Flamberge"
IF w = 5 THEN wp = 1
IF w = 10 THEN PRINT "Level Code: Greatsword"
IF w = 10 THEN wp = 2
IF w = 15 THEN PRINT "Level Code: Hardedge"
IF w = 15 THEN wp = 3
IF w = 20 THEN PRINT "Level Code: Void"
IF w = 20 THEN wp = 4
IF w = 25 THEN PRINT "Level Code: Flare"
IF w = 25 THEN wp = 5
IF w = 30 THEN PRINT "Level Code: Katana"
IF w = 30 THEN wp = 6
IF w = 35 THEN PRINT "Level Code: Fury"
IF w = 35 THEN wp = 7
IF w = 40 THEN PRINT " Level Code: Curse"
IF w = 40 THEN wp = 8
IF wp = 8 THEN PRINT "You have beaten the game!"
IF wp = 8 THEN PRINT "PM or email Hitogoroshi (flametounge@gmail.com) with all five level codes and have your character included in the next update!"
PRINT "Current Stat Points: "; wp + wp2 + 8
GOSUB text
GOTO menu
lose:
CLS
IF sws = 1 THEN GOTO slose
PRINT "You lose..."
l = l + 1
PRINT "Current Wins: ", w
PRINT "Current Losses: ", l
GOSUB text
GOTO menu
makechar1:
CLS
PRINT "Character Creation"
PRINT "Basics:"
PRINT
INPUT "Name: ", c1$
INPUT "Technique Name: ", t1$
INPUT "Finisher Name: ", f1$
INPUT "Ultimate Move Name: ", u1$
stats1:
cp = 8 + wp + wp2
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats1
PRINT "Character Creation: "
PRINT "Stats", , , , cp; " point(s) remaining."
PRINT
INPUT "Stamina: ", st1
cp = cp - st1
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats1
PRINT "Character Creation: "
PRINT "Stats", , , , cp; " point(s) remaining."
PRINT
INPUT "Power: ", p1
cp = cp - p1
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats1
PRINT "Character Creation: "
PRINT "Stats", , , , cp; " point(s) remaining."
PRINT
INPUT "Mana: ", m1
cp = cp - m1
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats1
PRINT "Character Creation: "
PRINT "Stats", , , , cp; " point(s) remaining."
PRINT
INPUT "Technique & Finisher Power: ", tp1
cp = cp - tp1
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats1
PRINT "Character Creation: "
PRINT "Stats", , , , cp; " point(s) remaining."
PRINT
INPUT "Ultimate Move Power: ", us1
cp = cp - up1
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats1
INPUT "Would you like to save your character? (Y/N) ", s1$
GOTO activate1
makechar2:
CLS
PRINT "Character Creation"
PRINT "Basics:"
PRINT
INPUT "Name: ", c2$
INPUT "Technique Name: ", t2$
INPUT "Finisher Name: ", f2$
INPUT "Ultimate Move Name: ", u2$
stats2:
cp = 8 + wp + wp2
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats2
PRINT "Character Creation: "
PRINT "Stats", , , , cp; " point(s) remaining."
PRINT
INPUT "Stamina: ", st2
cp = cp - st2
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats2
PRINT "Character Creation: "
PRINT "Stats", , , , cp; " point(s) remaining."
PRINT
INPUT "Power: ", p2
cp = cp - p2
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats2
PRINT "Character Creation: "
PRINT "Stats", , , , cp; " point(s) remaining."
PRINT
INPUT "Mana: ", m2
cp = cp - m2
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats2
PRINT "Character Creation: "
PRINT "Stats", , , , cp; " point(s) remaining."
PRINT
INPUT "Technique & Finisher Power: ", tp2
cp = cp - tp2
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats2
PRINT "Character Creation: "
PRINT "Stats", , , , cp; " point(s) remaining."
PRINT
INPUT "Ultimate Move Power: ", us2
cp = cp - up2
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats2
INPUT "Would you like to save your character? (Y/N) ", s2$
GOTO activate2
makechar3:
CLS
PRINT "Character Creation"
PRINT "Basics:"
PRINT
INPUT "Name: ", c3$
INPUT "Technique Name: ", t3$
INPUT "Finisher Name: ", f3$
INPUT "Ultimate Move Name: ", u3$
stats3:
cp = 8 + wp + wp2
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats3
PRINT "Character Creation: "
PRINT "Stats", , , , cp; " point(s) remaining."
PRINT
INPUT "Stamina: ", st3
cp = cp - st3
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats3
PRINT "Character Creation: "
PRINT "Stats", , , , cp; " point(s) remaining."
PRINT
INPUT "Power: ", p3
cp = cp - p3
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats3
PRINT "Character Creation: "
PRINT "Stats", , , , cp; " point(s) remaining."
PRINT
INPUT "Mana: ", m3
cp = cp - m3
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats3
PRINT "Character Creation: "
PRINT "Stats", , , , cp; " point(s) remaining."
PRINT
INPUT "Special Move Power: ", tp3
cp = cp - tp3
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats3
PRINT "Character Creation: "
PRINT "Stats", , , , cp; " point(s) remaining."
PRINT
INPUT "Ultimate Move Power: ", us3
cp = cp - up3
CLS
IF cp < 0 THEN PRINT "Too many points spent."
IF cp < 0 THEN GOTO stats3
INPUT "Would you like to save your character? (Y/N) ", s3$
GOTO activate3
activate1:
c$ = c1$
f$ = f1$
T$ = t1$
u$ = u1$
p = p1
st = st1
tp = tp1
m = m1
us = us1
hp = 100 + (st * 10)
mhp = hp
chp = (mhp / 10) * 3
sp = 5 + m
up = 1
GOTO enemyselect
activate2:
c$ = c2$
f$ = f2$
T$ = t2$
u$ = u2$
p = p2
st = st2
tp = tp2
m = m2
us = us2
hp = 100 + (st * 10)
mhp = hp
chp = (mhp / 10) * 3
sp = 5 + m
up = 1
GOTO enemyselect
activate3:
c$ = c3$
f$ = f3$
T$ = t3$
u$ = u3$
p = p3
st = st3
tp = tp3
m = m3
us = us3
hp = 100 + (st * 10)
chp = (mhp / 10) * 3
mhp = hp
sp = 5 + m
up = 1
GOTO enemyselect
tutorialselect:
CLS
PRINT "1. Basic Tutorial"
PRINT "2. New Features"
PRINT "3. Back"
INPUT "Which Tutorial do you want to see? ", ts$
IF ts$ = "3" THEN GOTO menu
IF ts$ = "1" THEN GOTO tutorial
IF ts$ = "2" THEN GOTO tutorial2
tutorial:
CLS
PRINT "What would you like to learn about?"
PRINT "1. Menu Options"
PRINT "2. Battles"
PRINT "3. Character Creation"
PRINT "4. Level Codes"
PRINT "5. Back"
PRINT
INPUT "Select Topic: ", T$
IF T$ = "1" THEN
CLS
PRINT "Menu Options:"
PRINT "Story Mode: The plot-driven section of the game."
PRINT "Battle. Begins a battle between you and a CPU."
PRINT "Tutorial. An explanation of the game."
PRINT "Level Code: Allows you to input level codes (see section 4)."
PRINT "Character Management: Where you delete unwanted characters."
PRINT "Edit Stats: Edits stats of an existing character."
PRINT "Quit: Exits the game."
GOSUB text
GOTO tutorial
ELSEIF T$ = "2" THEN
CLS
PRINT "Battles:"
PRINT "First, you set up the fight."
PRINT "You may either play as a premade character or as a created one (see section 3)"
PRINT "Your opponent may only be a premade character."
PRINT "In the fight: you choose from one of seven options:"
PRINT "Attack: Your standard attack. Deals a little damage."
PRINT "Heal: Raises your HP slightly. Costs 1 SP."
PRINT "Guard: Wards off a small ammount of damage."
PRINT "Technique: Slightly stronger then your average attack. Costs 1 SP."
PRINT "Finisher: A fairly strong attack. Costs 3 SP."
PRINT "Ultimate: Very strong attack. Costs 1 UP."
PRINT "Run: Flee the combat and return to menu."
GOSUB text
GOTO tutorial
ELSEIF T$ = "3" THEN
CLS
PRINT "Making Characters:"
PRINT "First, select battle from the main menu."
PRINT "Then, select an empty slot at character selection."
PRINT "You first name your character and his/her various attacks."
PRINT "Next, you spend stat points."
PRINT "You get 8 stat points, plus any gained through winning (see section 4.)"
PRINT "They can be placed in the following stats:"
PRINT "Stamina: Each point gives you 10 HP."
PRINT "Power. Each point adds one damage to your normal attack."
PRINT "Mana: Each point gives you 1 SP."
PRINT "Special Move Power: Each point adds 2 damage to both your Techniques and Finishers."
PRINT "Ultimate Move Power: Each point adds 3 damage to your ultimate move."
PRINT "You can choose to save your character after creating."
PRINT "Saved characters last until game is quitted or character is deleted at CharacterManagment menu."
GOSUB text
GOTO tutorial
ELSEIF T$ = "4" THEN
CLS
PRINT "Level Codes:"
PRINT "Each five wins earns you a level code. Losses do not affect you."
PRINT "Each code gives you an extra stat point."
PRINT "You only have to insert the latest level code to get the points."
PRINT "Also, if you get all eight level codes, your character may be featured in a future edtion of Lancer EX!"
PRINT "PM hitogoroshi or email him at flametounge@gmail.com with codes, questions, or comments."
GOSUB text
GOTO tutorial
ELSEIF T$ = "5" THEN GOTO tutorialselect
tutorial2:
CLS
PRINT "1. Turn Counters"
PRINT "2. Coup De Grace Attacks"
PRINT "3. Healing"
PRINT "4. Guarding"
PRINT "5. Story Mode"
PRINT "6. Back"
PRINT
INPUT "What would you like to learn about? ", t2$
IF t2$ = "6" THEN GOTO tutorialselect
IF t2$ = "1" THEN
CLS
PRINT "Your Ultimate Attack power is not one set value like before."
PRINT "Instead, it starts weak and gains power depending on how long you wait."
PRINT "The Turn Counter is displayed next to the Ultimate Attack."
GOSUB text
GOTO tutorial2
ELSEIF t2$ = "2" THEN
CLS
PRINT "When an enemy has lost at least 7/10ths of their health, you may do a Coup De Grace."
PRINT "You may only do a Coup De Grace if you have at least 3 SP."
PRINT "With a Coup De Grace, the damage from your finisher is drastically increased."
PRINT "However, if the attack isn't fatal, none of the damage is dealt, and you still lose your SP and turn."
GOSUB text
GOTO tutorial2
ELSEIF t2$ = "3" THEN
CLS
PRINT "You may heal instead of using an attack or special attack."
PRINT "The health you recover depends on your Stamina."
PRINT "You may never recover more then your maximum hit points."
PRINT "Healing costs 1 SP."
GOSUB text
GOTO tutorial2
ELSEIF t2$ = "4" THEN
CLS
PRINT "You may guard instead of taking another action."
PRINT "Guarding wards of a small ammount of damage."
PRINT "The ammount defended is not a set value. It has a degree of randomness."
PRINT "Guarding is usually used to save up turn counters."
GOSUB text
GOTO tutorial2
ELSEIF t2$ = "5" THEN
CLS
PRINT "Story Mode is a single, linear plot of the Lancer EX universe."
PRINT "You do not choose your character, and created characters are never used."
PRINT "When you earn a story code, you input it in the story menu."
PRINT "You may also earn character codes, these are entered in the code menu."
GOSUB text
GOTO tutorial2
codes:
CLS
INPUT "Enter Code: ", p$
CLS
IF p$ = "Flamberge" THEN
PRINT "Code accepted!"
w = 5
wp = 1
GOSUB text
GOTO menu
ELSEIF p$ = "Greatsword" THEN
PRINT "Code accepted!"
w = 10
wp = 2
GOSUB text
GOTO menu
ELSEIF p$ = "Hardedge" THEN
PRINT "Code accepted!"
w = 15
wp = 3
GOSUB text
GOTO menu
ELSEIF p$ = "Void" THEN
PRINT "Code accepted!"
w = 20
wp = 4
GOSUB text
GOTO menu
ELSEIF p$ = "Flare" THEN
PRINT "Code accepted!"
w = 25
wp = 5
GOSUB text
GOTO menu
ELSEIF p$ = "Flare" THEN
PRINT "Code accepted!"
w = 25
wp = 5
GOSUB text
GOTO menu
ELSEIF p$ = "Katana" THEN
PRINT "Code accepted!"
w = 30
wp = 6
GOSUB text
GOTO menu
ELSEIF p$ = "Fury" THEN
PRINT "Code accepted!"
w = 35
wp = 7
GOSUB text
GOTO menu
ELSEIF p$ = "Curse" THEN
PRINT "Code accepted!"
PRINT "You've beaten the game! See tutorial: level codes on what happens next...:"
w = 40
wp = 8
GOSUB text
GOTO menu
ELSEIF p$ = "Valkysas" THEN
PRINT "Code accepted!"
wp2 = wp2 + 1
GOSUB text
GOTO menu
ELSEIF p$ = "dingoryuken" THEN
PRINT "Code Accepted!"
cc = 1
GOSUB text
GOTO menu
ELSEIF p$ = "hubris" THEN
e = 1
GOTO epilouge1
ELSE
PRINT "Code Rejected..."
GOSUB text
GOTO menu
charmanage:
CLS
IF s1$ = "N" THEN PRINT "1. Open Slot"
IF s1$ = "Y" THEN PRINT "1. "; c1$
IF s2$ = "N" THEN PRINT "2. Open Slot"
IF s2$ = "Y" THEN PRINT "2. "; c2$
IF s3$ = "N" THEN PRINT "3. Open Slot"
IF s3$ = "Y" THEN PRINT "3. "; c3$
PRINT "4. Back to Menu"
PRINT ""
INPUT "What slot would you like to delete? ", sm$
IF sm$ = "4" THEN GOTO menu
IF sm$ = "1" THEN
s1$ = "N"
GOTO charmanage
ELSEIF sm$ = "2" THEN
s2$ = "N"
GOTO charmanage
ELSEIF sm$ = "3" THEN
s3$ = "N"
GOTO charmanage
ELSE GOTO charmanage
addpoints:
CLS
IF s1$ = "N" THEN PRINT "1. Open Slot"
IF s1$ = "Y" THEN PRINT "1. "; c1$
IF s2$ = "N" THEN PRINT "2. Open Slot"
IF s2$ = "Y" THEN PRINT "2. "; c2$
IF s3$ = "N" THEN PRINT "3. Open Slot"
IF s3$ = "Y" THEN PRINT "3. "; c3$
PRINT "4. Back"
PRINT
INPUT "Who's stats would you like to edit? ", ap$
IF ap$ = "4" THEN GOTO menu
IF ap$ = "1" THEN GOTO stats1
IF ap$ = "2" THEN GOTO stats2
IF ap$ = "3" THEN GOTO stats3
story:
CLS
sws = 1
INPUT "Use Story Code? (Y/N) ", usc$
IF usc$ = "Y" THEN GOTO storycode
IF usc$ = "N" THEN GOTO storystart
storystart:
c$ = "Lancer"
T$ = "Exodus Slash"
f$ = "Gale Blade"
u$ = "Renosuken"
p = 2
st = 1
m = 1
ts = 1
us = 3
hp = 100 + (st * 10)
mhp = hp
chp = (mhp / 10) * 3
sp = 5 + m
msp = sp
up = 1
CLS
PRINT "Lancers Story: Rising Star"
PRINT
PRINT "Lancer: This is where the note told me to go. A challange to a duel by"
PRINT "Kyru Shemanu...but why did he challange me at all?"
GOSUB text
PRINT "Kyru: So, Lancer...you're here."
GOSUB text
PRINT "Lancer: Brilliant observation."
GOSUB text
PRINT "Kyru: So, you got a lip. eh? Guess I'll have to cut it off."
GOSUB text
PRINT "Lancer: Heh. Dream on."
GOSUB text
ec$ = "Kyru"
et$ = "Electrolyte"
ef$ = "Particle Blade"
eu$ = "Atom Smasher"
ep = 1
est = 1
em = 3
etp = 2
eus = 1
ehp = 100 + (est * 10)
emhp = ehp
echp = (emhp / 10) * 3
esp = 5 + em
mesp = esp
eup = 1
GOTO turn
continue1:
CLS
c$ = "Lancer"
T$ = "Exodus Slash"
f$ = "Gale Blade"
u$ = "Renosuken"
p = 2
st = 1
m = 1
ts = 1
us = 3
hp = 100 + (st * 10)
mhp = hp
chp = (mhp / 10) * 3
sp = 5 + m
msp = sp
up = 1
tc = 0
cdg = 0
ecdg = 0
PRINT , , , , "Code: firstglory"
swc = 1
PRINT "Kyru: What? But...you are not nearly as strong as me!"
GOSUB text
PRINT "Lancer: Fool. It's not strength that counts, it's skill."
GOSUB text
PRINT "Kyru: You think you're so tough?"
GOSUB text
PRINT "Lancer: Tougher then you, at any rate. Why'd you challange me anyway?"
GOSUB text
PRINT "Kyru: Why would I bother telling you? Look forward to your soon defeat, Lancer!"
GOSUB text
PRINT "Lancer: He ran...and yet brags of his power? What a card..."
GOSUB text
CLS
PRINT "That night:"
PRINT
PRINT "Lancer: What the...thought I heard a noise..."
GOSUB text
PRINT "???:..."
GOSUB text
PRINT "Lancer: Hey! Who are you?"
GOSUB text
PRINT "???:..."
GOSUB text
PRINT "Lancer: Answer me!"
GOSUB text
PRINT "???:..."
GOSUB text
PRINT "Lancer: If thats the way you're gonna be...I'll pound the answers out of you!"
GOSUB text
ec$ = "???"
et$ = "Energy Shot"
ef$ = "Flash Beam"
eu$ = "Digital Slasher"
ep = 120
est = 100
em = 100
etp = 100
eus = 100
ehp = 100 + (est * 10)
emhp = ehp
echp = (emhp / 10) * 3
esp = 5 + em
mesp = esp
eup = 1
fl = 1
GOTO turn
continue2:
CLS
PRINT , , , , "Story Code: Unbreakable"
c$ = "Lancer"
T$ = "Exodus Slash"
f$ = "Gale Blade"
u$ = "Renosuken"
p = 2
st = 1
m = 1
ts = 1
us = 3
hp = 100 + (st * 10)
mhp = hp
chp = (mhp / 10) * 3
sp = 5 + m
msp = sp
up = 1
fl = 0
swc = 1
tc = 0
cdg = 0
ecdg = 0
PRINT
PRINT "Lancer: Who..who are you?"
GOSUB text
PRINT "???:...Kenji."
GOSUB text
PRINT "Lancer: He's gone...His power was unimaginable...Kenji..."
GOSUB text
CLS
PRINT "Lancer: Kenji went off in this direction..."
GOSUB text
PRINT "Dingo: Who said Kenji?!"
GOSUB text
PRINT "Lancer: I did. My name's Lancer."
GOSUB text
PRINT "Dingo: I'm Dingo. How'd you learn Kenji's name, anyway?"
GOSUB text
CLS
PRINT "Dingo: A fight in the forest, huh?"
GOSUB text
PRINT "Lancer: Yeah. I was lucky to live."
GOSUB text
PRINT "Dingo: Say..do you want to fight?"
GOSUB text
PRINT "Lancer: Sure, but why?"
GOSUB text
PRINT "Dingo: Frankly, if you can beat Kenji, you must be good."
GOSUB text
PRINT "Lancer: A plain, simple duel...haven't done one of those in a while."
GOSUB text
CLS
ec$ = "Dingo"
et$ = "Hyper Slash"
ef$ = "Shuriken Spray"
eu$ = "Ryuken"
ep = 2
est = 2
em = 2
etp = 0
eus = 3
ehp = 100 + (est * 10)
emhp = ehp
echp = (emhp / 10) * 3
esp = 5 + em
mesp = esp
eup = 1
GOTO turn
continue3:
CLS
swc = 2
tc = 0
cdg = 0
ecdg = 0
cc = 1
c$ = "Lancer"
T$ = "Exodus Slash"
f$ = "Gale Blade"
u$ = "Renosuken"
p = 2
st = 1
m = 1
ts = 1
us = 3
hp = 100 + (st * 10)
mhp = hp
chp = (mhp / 10) * 3
sp = 5 + m
msp = sp
up = 1
PRINT , , , , "Story code: simpleduel"
PRINT "You Unlocked Dingo!"
PRINT "Code: dingoryuken"
GOSUB text
CLS
PRINT "Dingo: Whoa. You really are good."
GOSUB text
PRINT "Lancer: Same to you."
GOSUB text
PRINT "Dingo: If you want a real fight, talk to my friend Zieg."
GOSUB text
PRINT "Lancer: Zieg?"
GOSUB text
PRINT "Dingo: Yeah. He's a really great fighter."
GOSUB text
PRINT "Lancer: Well, I need to train, if i'm going to beat Kenji."
GOSUB text
PRINT "Dingo: Beat Kenji?"
GOSUB text
PRINT "Lancer: Yeah. After all, I finally found a fighter who beat me."
GOSUB text
PRINT "Dingo: You mean...you'd never been beaten before Kenji?"
GOSUB text
PRINT "Lancer: Yeah. And Zieg's not going to break that tradition."
GOSUB text
CLS
PRINT "Dingo: Hey, Zieg!"
GOSUB text
PRINT "Zieg: Hey, Dingo! And..."
GOSUB text
PRINT "Lancer: Lancer."
GOSUB text
PRINT "Zieg: Lancer. Tell me, Lancer, why are you here?"
GOSUB text
PRINT "Lancer: To fight you."
GOSUB text
PRINT "Zieg: You're fighting me? Dingo, tell me: is this guy worth my time?"
GOSUB text
PRINT "Dingo: He beat me."
GOSUB text
PRINT "Zieg: Well, then, he's worth a fight."
GOSUB text
PRINT "Lancer: Just the words I wanted to hear."
GOSUB text
ec$ = "Zieg"
et$ = "ARA Blade"
ef$ = "Demonbreaker"
eu$ = "Flame Fury"
ep = 2
est = 1
em = 3
ets = 2
eus = 2
ehp = 100 + (est * 10)
emhp = hp
echp = (mhp / 10) * 3
esp = 5 + em
eup = 1
GOTO turn
continue4:
swc = 3
tc = 0
cdg = 0
ecdg = 0
cc = 1
c$ = "Lancer"
T$ = "Exodus Slash"
f$ = "Gale Blade"
u$ = "Renosuken"
p = 2
st = 1
m = 1
ts = 1
us = 3
hp = 100 + (st * 10)
mhp = hp
chp = (mhp / 10) * 3
sp = 5 + m
msp = sp
up = 1
CLS
PRINT , , , , "Story code: Gaia"
PRINT "Zieg: Lancer...I'll remember that name, I assure you!"
GOSUB text
PRINT "Lancer: So, Dingo, got any more friends who can hold their own in a fight?"
GOSUB text
PRINT "Dingo: There is one..."
GOSUB text
PRINT "Lancer: Who?"
GOSUB text
PRINT "Dingo: His name is Jamos. But..."
GOSUB text
PRINT "Lancer: But what?"
GOSUB text
PRINT "Dingo: He's incredibly strong. more so then Zieg!"
GOSUB text
PRINT "Lancer: I should hope so. A stronger fighter is a step up to Kenji."
GOSUB text
PRINT "Dingo: I know I couldn't talk you out of it...lets go."
GOSUB text
CLS
PRINT "Dingo: Jamos!"
GOSUB text
PRINT "Jamos: What, another challanger?"
GOSUB text
PRINT "Dingo: Yeah..."
GOSUB text
PRINT "Jamos: Guess I'll have to go easy on him."
GOSUB text
PRINT "Lancer: How can you tell that if you haven't even fought me?!"
GOSUB text
PRINT "Jamos: If you were a truly compentent swordsmen, you would not seek this fight."
GOSUB text
PRINT "Lancer: What are you talking about?"
GOSUB text
PRINT "Jamos: You are challanging me simply to prove yourself. You gain nothing but injury."
GOSUB text
PRINT "Lancer: You sound like a sage. Lets just get to the fight already!"
GOSUB text
PRINT "Jamos: If you insist..."
GOSUB text
ec$ = "Jamos"
et$ = "Malice Cannon"
ef$ = "Lightning Sword Flash"
eu$ = "End of Days"
ep = 3
est = 1
em = 0
etp = 2
eus = 5
ehp = 100 + (est * 10)
emhp = ehp
echp = (emhp / 10) * 3
esp = 5 + em
mesp = esp
eup = 1
sws = 1
GOTO turn
continue5:
swc = 4
tc = 0
cdg = 0
ecdg = 0
cc = 1
c$ = "Lancer"
T$ = "Exodus Slash"
f$ = "Gale Blade"
u$ = "Renosuken"
p = 2
st = 1
m = 1
ts = 1
us = 3
hp = 100 + (st * 10)
mhp = hp
chp = (mhp / 10) * 3
sp = 5 + m
msp = sp
up = 1
CLS
PRINT , , , , "Story Code: purgatory"
PRINT "Jamos: I held back, you know."
GOSUB text
PRINT "Lancer: Then show me your true power."
GOSUB text
PRINT "Dingo: Lancer, drop it!"
GOSUB text
PRINT "Lancer: But..."
GOSUB text
PRINT "Dingo: DROP IT!"
GOSUB text
PRINT "Lancer: Okay, okay..."
GOSUB text
CLS
PRINT "Lancer: Was he really holding back? Am I really that weak...?"
GOSUB text
PRINT "Dingo: There's someone watching us...up in the trees..."
GOSUB text
PRINT "Kenji:..."
GOSUB text
PRINT "Lancer: Kenji! Come down here right now and fight me!"
GOSUB text
PRINT "Dingo: Are you CRAZY?!"
GOSUB text
PRINT "Lancer: I...I have to try..."
GOSUB text
PRINT "Dingo: Why? Because of some sucidal drive to be the best?!"
GOSUB text
PRINT "Lancer: Thats exactly it! Don't you see?"
GOSUB text
PRINT "Dingo: Sorry, my common sense is blinding me."
GOSUB text
PRINT "Lancer: If I just let him walk away, it'll mean I surrender! I can't do that!"
GOSUB text
PRINT "Kenji:...hothead."
GOSUB text
PRINT "Lancer: I thought I told you to GET DOWN HERE!"
GOSUB text
PRINT "Kenji: Make me."
GOSUB text
PRINT "Lancer: Fine! RENOSUKEN!"
GOSUB text
CLS
epilouge1:
PRINT "The forest was destroyed by Lancer's fearsome Renosuken attack."
PRINT "However, in his rage to beat Kenji, he neglected to see a falling tree."
PRINT "It crushed him. He was killed instantly."
PRINT "Dingo ran away before he could have the same fate."
PRINT "Kenji was nowhere to be found."
GOSUB text
PRINT "The story of Lancer was one of passion, drive, and foolishness..."
PRINT "But his is only one of many."
GOSUB text
IF e = 1 GOTO menu
CLS
PRINT "Lancers Story: Rising star cleared!"
PRINT "Story Code: deadwind"
PRINT "Epilouge Code: hubris (use in code menu)"
GOSUB text
CLS
PRINT "The story of Lancer may be over, but you can have your tale told!"
PRINT "PM hitogoroshi or email him at flametounge@gmail.com to be included in the game!"
GOSUB text
continue6:
CLS
PRINT "To be continued..."
GOSUB text
GOTO menu
swin:
CLS
PRINT "You win!"
GOSUB text
swc = swc + 1
IF swc = 1 THEN GOTO continue1
IF swc = 2 THEN GOTO continue3
IF swc = 3 THEN GOTO continue4
IF swc = 4 THEN GOTO continue5
slose:
CLS
PRINT "You lose..."
GOSUB text
IF fl = 1 THEN GOTO continue2
GOTO menu
storycode:
CLS
INPUT "Insert code (N to quit): ", sc$
IF sc$ = "N" THEN GOTO storystart
IF sc$ = "firstglory" THEN GOTO continue1
IF sc$ = "unbreakable" THEN GOTO continue2
IF sc$ = "simpleduel" THEN GOTO continue3
IF sc$ = "gaia" THEN GOTO continue4
IF sc$ = "purgatory" THEN GOTO continue5
IF sc$ = "deadwind" THEN GOTO continue6
GOTO storycode
END IF
END IF
END IF
END IF
END IF
END IF
END IF
END IF
END IF
END IF
END
text: REM
PRINT
DO
z$ = INKEY$
LOOP UNTIL z$ <> ""
RETURN
