'worbles.bas
'Worbles - A game of society building
'by Brad Moore - (c) 2005, all rights reserved
'
'adapted to JustBasic by tsh73, September 2007, with permission
'
'You are granted permission to borrow parts of this program that can
'  be integrated into your project.  No further notice is required.
'
'Please obtain my permission before distributing this work in full.  Do not
'  include this work in a CD pack, website, forum or other file archive
'  or download site without permission.
'
'Do not create modified versions of this program and call them yours.
'  Copyright law permits me to claim copyright on derived works.  As I
'  mentioned - you can use ideas, and protions of the code in your projects
'  without hinderence.
'
'I wish to thank Alyce Watson for the very fantastic Liberty Basic Workshop.
'  Some code found in this program come from LBW's API wrapper library by
'  Alyce Watson.
'
'This program is written in Liberty Basic.  It requires verision 4.x to run
'  Learn more about Liberty Basic at http://www.libertybasic.com
'
'Thanks for your interest.


'== Setup Data =====================================================================

'disaster array
dim disaster$(1000)
'sales amount
dim sales$(10)

'These globals make calling sub and functions easier as fewer arguments need be passed
global idlework, farmers, nursery, scientists, builders, worbles, _
        sunits, sidle, snursery, sfarming, sscience, sbuilder, smarket, _
        tlnursery, tlfarming, tlscience, tlbuilder, tlmarket, _
        prognursery, progfarming, progscience, progbuilder, progmarket, _
        segMain, btnUpd, segScale, segSci, segAssign, segInfo, segMsg

'open "jpeg.dll" for dll as #j
'    calldll #j, "LoadImageFile",_
'    0 as ulong,_
'    "worblescreen.jpg" as ptr,_
'    hPic as ulong
'close #j
'loadbmp "screen",hPic
'tsh73: No DLL support in JB. So we just read BMP (use Paint to convert JPG to BMP)
loadbmp "screen", "worblescreen.bmp"


loadbmp "button1", "worblesctrl1.bmp"
loadbmp "button2", "worblesctrl2.bmp"
loadbmp "button3", "worblesctrl3.bmp"
loadbmp "button4", "worblesctrl4.bmp"
loadbmp "help", "worbleshelp.bmp"

'randomize the random number generator
randomize seedGen()

'initialize the segment variables
segMain = 0
btnUpd = 0
segScale = 0
segSci = 0
segAssign = 0
segInfo = 0
segMsg = 0

'sales amounts
sales$(1) = "None"
sales$(2) = "25%"
sales$(3) = "50%"
sales$(4) = "75%"
sales$(5) = "All"

'setup the variables used for tracking
scale = 1
worbles = 12
born = 0
year = 0
hunger = 4
phase = 3 'tells us what button to present
          '1 = Feed, 2 = Sell, 3 = Next Year
grain = 10
harvest = 0
cash = 0
cultivated = 4
housing = 20 'housing capacity
'worble work assignments
idlework = 0
farmers = 6
nursery = 2
scientists = 0
builders = 4
'scientist study units
sunits = 0
sidle = 0
snursery = 0
sfarming = 0
sscience = 0
sbuilder = 0
smarket = 0
'worble tech levels (current)
tlnursery = 1
tlfarming = 1
tlscience = 1
tlbuilder = 1
tlmarket = 1
'worble tech level progress
prognursery = 0
progfarming = 0
progscience = 0
progbuilder = 0
progmarket = 0

'Populate the disaster array
for x = 1 to 220
    a = int(rnd(0)*1000)+1
    while disaster$(a) <> ""
        a = int(rnd(0)*1000)+1
    wend
    disaster$(a) = "PoorHarvest"
next x
for x = 1 to 120
    a = int(rnd(0)*1000)+1
    while disaster$(a) <> ""
        a = int(rnd(0)*1000)+1
    wend
    disaster$(a) = "Dissent"
next x
for x = 1 to 100
    a = int(rnd(0)*1000)+1
    while disaster$(a) <> ""
        a = int(rnd(0)*1000)+1
    wend
    disaster$(a) = "Drought"
next x
for x = 1 to 50
    a = int(rnd(0)*1000)+1
    while disaster$(a) <> ""
        a = int(rnd(0)*1000)+1
    wend
    disaster$(a) = "Plauge"
next x
for x = 1 to 10
    a = int(rnd(0)*1000)+1
    while disaster$(a) <> ""
        a = int(rnd(0)*1000)+1
    wend
    disaster$(a) = "War"
next x


'== Build the game window ========================================================

    NOMAINWIN
    WindowWidth = 800 : WindowHeight = 570
    UpperLeftX = 1
    UpperLeftY = 1

'ControlSetup
graphicbox  #main.gbx,-2,-5, 840, 620
button      #main.nwminus, "-",[nwminus],UL, 265, 82, 16, 16
button      #main.nwplus, "+",[nwplus],UL, 285, 82, 16, 16
button      #main.fwminus, "-",[fwminus],UL, 265, 106, 16, 16
button      #main.fwplus, "+",[fwplus],UL, 285, 106, 16, 16
button      #main.swminus, "-",[swminus],UL, 265, 130, 16, 16
button      #main.swplus, "+",[swplus],UL, 285, 130, 16, 16
button      #main.bwminus, "-",[bwminus],UL, 265, 154, 16, 16
button      #main.bwplus, "+",[bwplus],UL, 285, 154, 16, 16
button      #main.hdminus, "-",[neminus],UL, 265, 284, 16, 16
button      #main.hdplus, "+",[neplus],UL, 285, 284, 16, 16
button      #main.feminus, "-",[feminus],UL, 265, 308, 16, 16
button      #main.feplus, "+",[feplus],UL, 285, 308, 16, 16
button      #main.seminus, "-",[seminus],UL, 265, 332, 16, 16
button      #main.seplus, "+",[seplus],UL, 285, 332, 16, 16
button      #main.neminus, "-",[hdminus],UL, 265, 356, 16, 16
button      #main.neplus, "+",[hdplus],UL, 285, 356, 16, 16
button      #main.mminus, "-",[mminus],UL, 265, 380, 16, 16
button      #main.mplus, "+",[mplus],UL, 285, 380, 16, 16

Open "Wonderful World of Worbles" for Window_nf as #main
    #main "trapclose [quit]"
    #main "font ms_sans_serif 10"

'    hWnd = hWnd(#main)
'    'map the graphicbox handle so that it can be passed to subs and functions
'    gbx$ = "#gbx.Handle"
'    maphandle #main.gbx, gbx$
'tsh73: There are no maphandle statement in JustBasic. But it seems work fine this way, too
    gbx$ = "#main.gbx"

    #gbx$ "when leftButtonDown [screenClick]"

[buildView]
    'build the game screen
    #gbx$ "down; fill Lightgray; backcolor black; color black;"
    #gbx$ "drawbmp screen 1 1"
    #gbx$ "backcolor 151 151 151"
    #gbx$ "font arial 16 bold"
    #gbx$ "up; goto 22 38; down"
    #gbx$ "\Worbles"
    #gbx$ "up; goto 22 242; down"
    #gbx$ "\Science"
    #gbx$ "up; goto 22 468; down"
    #gbx$ "\Scale"
    #gbx$ "up; goto 342 120; down"
    #gbx$ "\Information"
    #gbx$ "up; goto 210 468; color green; backcolor black; down"
    #gbx$ "\x 1\x 10\x 100"
    #gbx$ "drawbmp button1 344 8; drawbmp help 706 5"
    #gbx$ "segment segMain; flush"

    'draw the scale indicators
    call updateScale scale, gbx$

    'draw the worble assignments screen
    call updateAsign gbx$

    'draw the worble science screen
    call updateScience gbx$

    'draw information screen
    call updateMain year,  born, harvest, grain, cultivated, housing, cash, gbx$

    'post a message
    message$ = "Welcome to the WORBLES simulation.  Have fun.  Click the '?' for help."
    call postMessage message$, gbx$


[loop]
    Wait


'== Event Processing ============================================================

[quit]
    unloadbmp "screen"
    unloadbmp "button1"
    unloadbmp "button2"
    unloadbmp "button3"
    unloadbmp "button4"
    unloadbmp "help"
    close #main
    END

[screenClick]
    x = MouseX
    y = MouseY

    if (y > 7 and y < 81) and (x > 349 and x < 469) then
        'clicked - feed
        if phase <> 1 then
            if phase = 4 then [startOver]
            playwave "ding.wav", async
            wait
        else
            goto [feedThem]
        end if
    end if
    if (y > 7 and y < 81) and (x > 468 and x < 582) then
        'clicked - sell
        if phase <> 2 then
            playwave "ding.wav", async
            wait
        else
            goto [sellGrain]
        end if
    end if
    if (y > 7 and y < 81) and (x > 581 and x < 694) then
        'clicked - next year
        if phase <> 3 then
            if phase = 4 then [quit]
            playwave "ding.wav", async
            wait
        else
            goto [nextyear]
        end if
    end if
    if (y > 5 and y < 85) and (x > 705 and x < 789) then
        call ShellExecute hWnd, "worbles.htm"
        'notice "Hey! I am still working on this thing.  I aint got the HELP stuff done yet!"
        wait
    end if
    if (y > 450 and y < 473) and (x > 177 and x < 201) then
        scale = 1
        call updateScale scale, gbx$ 
        wait
    end if
    if (y > 472 and y < 496) and (x > 177 and x < 201) then
        scale = 10
        call updateScale scale, gbx$ 
        wait
    end if
    if (y > 495 and y < 519) and (x > 177 and x < 201) then
        scale = 100
        call updateScale scale, gbx$ 
        wait
    end if
    wait



[nwminus]
    'remove hatchery worker
    amount = min(scale, nursery)
    if amount > 0 then
        nursery = nursery - amount
        idlework = idlework + amount
        'draw the worble assignments screen
        call updateAsign gbx$
    end if
    wait

[nwplus]
    'add a hatchery worker
    amount = min(scale, idlework)
    if amount > 0 then
        nursery = nursery + amount
        idlework = idlework - amount
        'draw the worble assignments screen
        call updateAsign gbx$
    end if
    wait

[fwminus]
    'remove farm worker
    amount = min(scale, farmers)
    if amount > 0 then
        farmers = farmers - amount
        idlework = idlework + amount
        e = ((tlfarming * .15) + .35) 'farmer efficency
        cultivated = int(farmers * e)
        call updateMain year,  born, harvest, grain, cultivated, housing, cash, gbx$
        'draw the worble assignments screen
        call updateAsign gbx$
    end if
    wait

[fwplus]
    'add farm worker
    amount = min(scale, idlework)
    if amount > 0 then
        farmers = farmers + amount
        idlework = idlework - amount
        e = ((tlfarming * .15) + .35) 'farmer efficency
        cultivated = int(farmers * e)
        call updateMain year,  born, harvest, grain, cultivated, housing, cash, gbx$
        'draw the worble assignments screen
        call updateAsign gbx$
    end if
    wait

[swminus]
    'remove scientists worker
    'each scientist removed generates 10 cash units
    amount = min(scale, scientists)
    if amount > 0 then
        scientists = scientists - amount
        idlework = idlework + amount
        cash = cash + amount * 10
        su = int((tlscience * 1.33) + 4) * amount
        call removeSU su
        'draw the worble assignments screen
        call updateAsign gbx$
        sunits = scientists * (int((tlscience * 1.33) + 4))
        call updateMain year,  born, harvest, grain, cultivated, housing, cash, gbx$
        sidle = sunits - snursery - sfarming - sscience - sbuilder - smarket
        call updateScience gbx$
    end if
    wait

[swplus]
    'add scientists worker
    'each scientist you add costs 50 * techlevel cash units
    amount = min(scale, idlework)
    if amount > 0 then
        if (amount * 50 * tlscience) > cash then
            message$ = "Insufficient funds - this would require "
            message$ = message$ + str$(amount * 50 * tlscience) + " cash units."
            call postMessage message$, gbx$ 
            playwave "ding.wav", async
            wait
        end if
        scientists = scientists + amount
        idlework = idlework - amount
        cash = cash - (amount * 50 * tlscience)
        'draw the worble assignments screen
        call updateAsign gbx$
        sunits = scientists * (int((tlscience * 1.33) + 4))
        call updateMain year,  born, harvest, grain, cultivated, housing, cash, gbx$
        sidle = sunits - snursery - sfarming - sscience - sbuilder - smarket
        call updateScience gbx$
    end if
    wait

[bwminus]
    'remove builders worker
    amount = min(scale, builders)
    if amount > 0 then
        builders = builders - amount
        idlework = idlework + amount
        e = (tlbuilder + 4)  'builder efficency (increases number of homes builder can maintain)
        housing = builders * e
        call updateMain year,  born, harvest, grain, cultivated, housing, cash, gbx$
        'draw the worble assignments screen
        call updateAsign gbx$
    end if
    wait

[bwplus]
    'add builders worker
    amount = min(scale, idlework)
    if amount > 0 then
        builders = builders + amount
        idlework = idlework - amount
        e = (tlbuilder + 4)  'builder efficency (increases number of homes builder can maintain)
        housing = builders * e
        call updateMain year,  born, harvest, grain, cultivated, housing, cash, gbx$
        'draw the worble assignments screen
        call updateAsign gbx$
    end if
    wait

[hdminus]
    'housing density - remove study units
    amount = min(scale, sbuilder)
    if amount > 0 then
        sbuilder = sbuilder - amount
        sidle = sidle + amount
        call updateScience gbx$
    end if
    wait

[hdplus]
    'housing density - add study units
    amount = min(scale, sidle)
    if amount > 0 then
        sbuilder = sbuilder + amount
        sidle = sidle - amount
        call updateScience gbx$
    end if
    wait

[feminus]
    'farmer efficency - remove study units
    amount = min(scale, sfarming)
    if amount > 0 then
        sfarming = sfarming - amount
        sidle = sidle + amount
        call updateScience gbx$
    end if
    wait

[feplus]
    'farmer efficency - add study units
    amount = min(scale, sidle)
    if amount > 0 then
        sfarming = sfarming + amount
        sidle = sidle - amount
        call updateScience gbx$
    end if
    wait

[seminus]
    'science efficency - remove study units
    amount = min(scale, sscience)
    if amount > 0 then
        sscience = sscience - amount
        sidle = sidle + amount
        call updateScience gbx$
    end if
    wait

[seplus]
    'science efficency - add study units
    amount = min(scale, sidle)
    if amount > 0 then
        sscience = sscience + amount
        sidle = sidle - amount
        call updateScience gbx$
    end if
    wait

[neminus]
    'hatchery efficency - remove study units
    amount = min(scale, snursery)
    if amount > 0 then
        snursery = snursery - amount
        sidle = sidle + amount
        call updateScience gbx$
    end if
    wait

[neplus]
    'hatchery efficency - add study units
    amount = min(scale, sidle)
    if amount > 0 then
        snursery = snursery + amount
        sidle = sidle - amount
        call updateScience gbx$
    end if
    wait

[mminus]
    'marketing efficency - remove study units
    amount = min(scale, smarket)
    if amount > 0 then
        smarket = smarket - amount
        sidle = sidle + amount
        call updateScience gbx$
    end if
    wait

[mplus]
    'marketing efficency - add study units
    amount = min(scale, sidle)
    if amount > 0 then
        smarket = smarket + amount
        sidle = sidle - amount
        call updateScience gbx$
    end if
    wait


'== Processing Subroutines =========================================================

'--Process the Next Year Event---------------------------------------------
[nextyear]

    'see if everything is done
    if idlework <> 0 then
        c$ = "There are worbles who are idle." + chr$(13)
        c$ = c$ + "All worbles should be assigned a task." + chr$(13) + chr$(13)
        c$ = c$ + "Continue anyway?"
        confirm c$; answer$
        if answer$ = "no" then wait
    end if

    if sidle <> 0 then
        c$ = "There are scientific study units that are" + chr$(13)
        c$ = c$ + "idle.  All scientific study units should be" + chr$(13)
        c$ = c$ + "assigned to a category of study." + chr$(13) + chr$(13)
        c$ = c$ + "Continue anyway?"
        confirm c$; answer$
        if answer$ = "no" then wait
    end if

    'Process all the year end events
    year = year + 1

    playwave "nextYear.wav", async

    'hatch new worbles - each nursery worker produces a random number of worbles (0-5)
    born = 0
    e = (int((tlnursery * 1.33) + 2)) 'efficency
    if nursery > 0 then
        for x = 1 to nursery
            a = int(rnd(0) * e)
            born = born + a
        next x
        born = born + 1
    end if
    worbles = worbles + born
    idlework = worbles - nursery - farmers - scientists - builders

    'plant the grain and harvest
    e = ((tlfarming * .15) + .35) 'farmer efficency
    cultivated = int(farmers * e)
    harvest = 20 * cultivated
    grain = grain + harvest

    'housing (capacity)
    e = (tlbuilder + 4)  'builder efficency (increases number of homes builder can maintain)
    housing = builders * e

    tech$ = ""

    'scientific progress (goes bonk!)
    'hatching (nursery) first
    th = (tlnursery * 100) - 60 'threashold to achieve a new level
    progress = (prognursery/100) * th
    progress = progress + snursery
    prognursery = (progress/th)*100
    if prognursery >= 100 then
        tlnursery = tlnursery + 1
        prognursery = 0
        tech$ = "hatchery, "
    end if

    'builder
    th = (tlbuilder * 100) - 60 'threashold to achieve a new level
    progress = (progbuilder/100) * th
    progress = progress + sbuilder
    progbuilder = (progress/th)*100
    if progbuilder >= 100 then
        tlbuilder = tlbuilder + 1
        progbuilder = 0
        tech$ = tech$ + "building, "
    end if

    'farming
    th = (tlfarming * 100) - 60 'threashold to achieve a new level
    progress = (progfarming/100) * th
    progress = progress + sfarming
    progfarming = (progress/th)*100
    if progfarming >= 100 then
        tlfarming = tlfarming + 1
        progfarming = 0
        tech$ = tech$ + "farming, "
    end if

    'science
    th = (tlscience * 100) - 60 'threashold to achieve a new level
    progress = (progscience/100) * th
    progress = progress + sscience
    progscience = (progress/th) * 100
    if progscience >= 100 then
        tlscience = tlscience + 1
        progscience = 0
        sunits = scientists * (int((tlscience * 1.33) + 4))
        sidle = sunits - snursery - sfarming - sscience - sbuilder - smarket
        tech$ = tech$ + "science, "
    end if

    'market
    th = (tlmarket * 100) - 60 'threashold to achieve a new level
    progress = (progmarket/100) * th
    progress = progress + smarket
    progmarket = (progress/th) * 100
    if progmarket >= 100 then
        tlmarket = tlmarket + 1
        progmarket = 0
        tech$ = tech$ + "marketing, "
    end if

    'check for disaster
    'Dissent - 5% of worbles leave.  Odds: 20%
    'Poor Harvest - each acre yields only 75% of normal.  Odds: 15%
    'Drought - each acre yields only 45% of normal.  Odds: 9%
    'Plague - Worbles die (anywhere from 5% to 50%).  Odds: 5%
    'War - 35% Worbles die, 50% treasury lost, current science research rolled back to last level achieved.  Odds: 2%

    message$ = ""

    'as the years go, the odds of a disaster increase
    for x = 1 to int(year/6)
        curse = int(rnd(0)*1000)+1
        if disaster$(curse) <> "" then exit for
    next x

    select case disaster$(curse)
        case "War"
            d = int(worbles * .35) + 1
            if d > worbles then d = worbles
            call killWorbles d
            cash = int(cash * .5)
            prognursery = 0
            progfarming = 0
            progscience = 0
            progbuilder = 0
            progmarket = 0
            message$ = "War has broken out!  " + str$(d) + " worbles have " + _
                       "died.  Cash reduced by half and all research progress lost."
        case "Plauge"
            a = int(rnd(0)*45)+1
            d = int(worbles * (a/100)) + 1
            if d > worbles then d = worbles
                call killWorbles d
            message$ = "A plauge has broken out, " + str$(a) + " percent of the " + _
                       "worble population (" + str$(d) + ") have perished!"
        case "Drought"
            grain = grain - harvest
            harvest = int(harvest * .45)
            grain = grain + harvest
            message$ = "A bad drought has struck, harvests are off by 55%!"
        case "Dissent"
            d = int(worbles * .05) + 1
            if d > worbles then d = worbles
            call killWorbles d
            message$ = "Dissent has broke out in your population.  " + _
                       str$(d) + " worbles have left."
        case "PoorHarvest"
            grain = grain - harvest
            harvest = int(harvest * .75)
            grain = grain + harvest
            message$ = "The land has not given freely this year, " + _
                       "harvests are off by 25%!"
    end select

    gosub [housingLoss]

    if message$ = "" then
        message$ = "Another fine year.  You have added " + str$(born) + _
                   " worbles to your population!"
    end if

    if tech$ <> "" then
        tech$ = left$(tech$,len(tech$)-2)
        tech$ = "  You have advanced a tech level in: " + tech$
    end if

    message$ = message$ + tech$

    basex = 556
    basey = 282

    'pause half a second for effect
    call Sleep 500

    for x = 1 to 146

        call Sleep 10

        xoffset = int(x * 1.44)
        yoffset = x

        #gbx$ "up; goto ";basex - xoffset;" ";basey - yoffset
        #gbx$ "down; color yellow; boxfilled ";basex + xoffset;" ";basey + yoffset

    next x

    #gbx$ "down; color black; boxfilled ";basex + xoffset;" ";basey + yoffset
    #gbx$ "discard"

    scale = 1

    'pause half a second for effect
    call Sleep 500

    'due to a weird error in the flush statement, I redraw the backgound
    #gbx$ "redraw ";segMain
    'draw the scale indicators
    call updateScale scale, gbx$
    'draw the worble assignments screen
    call updateAsign gbx$
    'draw the worble science screen
    call updateScience gbx$
    'draw information screen
    call updateMain year,  born, harvest, grain, cultivated, housing, cash, gbx$
    call postMessage message$, gbx$

    'finally change the phase and display a different button set
    if btnUpd > 0 then #gbx$ "delsegment ";btnUpd
    phase = 1
    #gbx$ "down; drawbmp button2 344 8; segment btnUpd; flush"

    'check for the end of the game
    print year, worbles, cash
    if year > 50 or worbles < 1 then [endGame]


    wait

'--Feed the worbles -----------------------------------------------------------
[feedThem]

    'Feed the worbles
    eaten = worbles * hunger
    if eaten > grain then
        dead = int(worbles - (grain / hunger))
        call killWorbles dead
        message$ = "You did not have adequate grain on hand to feed all worbles.  " + _
                    str$(dead) + " worbles have perished.  "
        grain = 0
        gosub [housingLoss]
    else
        message$ = "All the worbles have been fed.  " + str$(eaten) + _
                   " grain was consumed.  You have " + str$(grain - eaten) + _
                   " on hand."
        grain = grain - eaten
    end if

    'due to a weird error in the flush statement, I redraw the backgound
    #gbx$ "redraw ";segMain
    'draw the scale indicators
    call updateScale scale, gbx$
    'draw the worble assignments screen
    call updateAsign gbx$
    'draw the worble science screen
    call updateScience gbx$
    'draw information screen
    call updateMain year,  born, harvest, grain, cultivated, housing, cash, gbx$
    call postMessage message$, gbx$

    'finally change the phase and display a different button set
    if btnUpd > 0 then #gbx$ "delsegment ";btnUpd
    if grain = 0 then
        phase = 3
        #gbx$ "down; drawbmp button1 344 8"
    else
        phase = 2
        #gbx$ "down; drawbmp button3 344 8"
    end if
    #gbx$ "segment btnUpd; flush"


    wait

'--Sell Grain ---------------------------------------------------------------------

[sellGrain]

    'grain value
    grainVal = int(rnd(0)*8) + (tlmarket + 3)

    WindowWidth = 412 : WindowHeight = 190
    UpperLeftX = INT((DisplayWidth-WindowWidth)/2)
    UpperLeftY = INT((DisplayHeight-WindowHeight)/2)

'ControlSetup
statictext  #sales.st1, "You have nnn units of grain available for sale.", 15, 5, 415, 20
statictext  #sales.st4, "Today grain is selling for nnn cash uints each.", 15, 25, 415, 16
statictext  #sales.st2, "Select", 15, 52, 56, 60
statictext  #sales.st3, "", 225, 52, 220, 50
button      #sales.sellit, "SELL GRAIN",[sellit],UL, 225, 105, 140, 35
listbox     #sales.saleAmnt, sales$(),[saleAmnt], 95, 52, 100, 95

Open "Sell Grain" for dialog_modal as #sales
    #sales "trapclose [cantquit]"
    #sales.saleAmnt "selectindex 1"
    #sales "font ms_sans_serif 10"
    #sales.st1 "!font times_roman 12 bold"
    #sales.st2 "!font ms_sans_serif 10 bold"
    #sales.st3 "!font ms_sans_serif 10 bold"
    #sales.st4 "!font ms_sans_serif 10 bold"
    #sales.sellit "!font ms_sans_serif 12 bold"
    #sales.st2 "Select" + chr$(13) + "amount" + chr$(13) + "to sell:"
    #sales.st1 "You have " + str$(grain) + " units of grain available for sale."
    #sales.st4 "Today grain is selling for " + str$(grainVal) + " cash uints each."
    #sales.saleAmnt "singleclickselect"
    #sales.st3 "Sell 0 units" + chr$(13) + " of grain?"


    Wait

[cantquit]
    playwave "ding.wav", async
    wait

[saleAmnt]
    #sales.saleAmnt "selectionindex? index"
    amount = ((index-1) * 25)/100
    amount = int(grain * amount)
    '#sales.st3 "This will result "  + chr$(13) + " in " + str$(amount) + _
    '            " units of "  + chr$(13) + "grain being sold."
    #sales.st3 "Sell " + str$(amount) + " units" + chr$(13) + " of grain?"
    wait

[sellit]
    #sales.saleAmnt "selectionindex? index"
    amount = ((index-1) * 25)/100
    amount = int(grain * amount)
    #sales.st3 "Sell " + str$(amount) + " units" + chr$(13) + " of grain."
    call Sleep 100
    close #sales

    grain = grain - amount
    saleAmount = amount * grainVal
    cash = cash + saleAmount

    message$ = "You sold " + str$(amount) + " units of grain for " + _
               str$(saleAmount) + " cash units."

    'due to a weird error in the flush statement, I redraw the backgound
    #gbx$ "redraw ";segMain
    'draw the scale indicators
    call updateScale scale, gbx$
    'draw the worble assignments screen
    call updateAsign gbx$
    'draw the worble science screen
    call updateScience gbx$
    'draw information screen
    call updateMain year,  born, harvest, grain, cultivated, housing, cash, gbx$
    call postMessage message$, gbx$

    'finally change the phase and display a different button set
    if btnUpd > 0 then #gbx$ "delsegment ";btnUpd
    phase = 3
    #gbx$ "down; drawbmp button1 344 8"
    #gbx$ "segment btnUpd; flush"

wait


'--Game Over -----------------------------------------------------------------------

[endGame]

    'finally change the phase and display a different button set
    if btnUpd > 0 then #gbx$ "delsegment ";btnUpd
    phase = 4
    #gbx$ "down; drawbmp button4 344 8"
    #gbx$ "segment btnUpd; flush"

    basex = 556
    basey = 260

    'pause half a second for effect
    call Sleep 1500

    for x = 1 to 146 step 2

        call Sleep 5

        yoffset = int(x * .3666)
        xoffset = x

        #gbx$ "up; goto ";basex - xoffset;" ";basey - yoffset
        #gbx$ "down; color yellow; boxfilled ";basex + xoffset;" ";basey + yoffset

    next x

    #gbx$ "font arial 24 bold"
    #gbx$ "up; goto 460 250; backcolor black; color red; down"
    #gbx$ "\GAME OVER"
    #gbx$ "font arial 16 bold"

    if cash > 200000 then
            #gbx$ "\    You have WON!"
            message$ = "Congadulations - Cash units on hand: " + _
                       str$(cash) + ", total Worble population: " + _
                       str$(worbles)
    else
            #gbx$ "\   You have lost..."
            message$ = "Oh well... Cash units on hand: " + _
                       str$(cash) + ", total Worble population: " + _
                       str$(worbles) + ".  Better luck next time!"
    end if

    call postMessage message$, gbx$


wait

'--Death Due To Housing Loss--------------------------------------------------------

[housingLoss]

    ttldead = 0 'because housing loss can cause multiple recalculations of the
               'dead, keep track of total dead.

[recalc]
    'recaluculate the dwelling capacity and cultivated land
    e = ((tlfarming * .15) + .35) 'farmer efficency
    cultivated = int(farmers * e)
    e = (tlbuilder + 4)  'builder efficency (increases number of homes builder can maintain)
    housing = builders * e

    'Check for unhoused worbles
    hdead = worbles - housing
    if hdead > 0 then
        call killWorbles hdead
        ttldead = ttldead + hdead
        goto [recalc]
    end if

    if ttldead > 0 then
        message$ = message$ + "You lacked adequate housing and " + _
                   str$(ttldead) + " worbles perished."
    end if

return


'--Start Over ----------------------------------------------------------------------

[startOver]

redim disaster$(10)
redim disaster$(1000)

#gbx$ "cls" 'release all graphic elements, flushed elements and segments

'initialize the segment variables
segMain = 0
btnUpd = 0
segScale = 0
segSci = 0
segAssign = 0
segInfo = 0
segMsg = 0

'setup the variables used for tracking
scale = 1
worbles = 12
born = 0
year = 0
hunger = 4
phase = 3 'tells us what button to present
          '1 = Feed, 2 = Sell, 3 = Next Year
grain = 10
harvest = 0
cash = 0
cultivated = 4
housing = 20 'housing capacity
'worble work assignments
idlework = 0
farmers = 6
nursery = 2
scientists = 0
builders = 4
'scientist study units
sunits = 0
sidle = 0
snursery = 0
sfarming = 0
sscience = 0
sbuilder = 0
smarket = 0
'worble tech levels (current)
tlnursery = 1
tlfarming = 1
tlscience = 1
tlbuilder = 1
tlmarket = 1
'worble tech level progress
prognursery = 0
progfarming = 0
progscience = 0
progbuilder = 0
progmarket = 0

'Populate the disaster array
for x = 1 to 220
    a = int(rnd(0)*1000)+1
    while disaster$(a) <> ""
        a = int(rnd(0)*1000)+1
    wend
    disaster$(a) = "PoorHarvest"
next x
for x = 1 to 120
    a = int(rnd(0)*1000)+1
    while disaster$(a) <> ""
        a = int(rnd(0)*1000)+1
    wend
    disaster$(a) = "Dissent"
next x
for x = 1 to 100
    a = int(rnd(0)*1000)+1
    while disaster$(a) <> ""
        a = int(rnd(0)*1000)+1
    wend
    disaster$(a) = "Drought"
next x
for x = 1 to 50
    a = int(rnd(0)*1000)+1
    while disaster$(a) <> ""
        a = int(rnd(0)*1000)+1
    wend
    disaster$(a) = "Plauge"
next x
for x = 1 to 10
    a = int(rnd(0)*1000)+1
    while disaster$(a) <> ""
        a = int(rnd(0)*1000)+1
    wend
    disaster$(a) = "War"
next x

goto [buildView]

wait


'=Subs and Functions ================================================================

sub updateScale scale, gbx$
    'displays the scale display portion -

    if segScale > 0 then #gbx$ "delsegment ";segScale
    'clear what is there now
    #gbx$ "up; goto 176 450; backcolor black; color black; down; boxfilled 204 522"

    #gbx$ "font arial 16 bold"
    #gbx$ "up; goto 190 463; color lightgray; backcolor lightgray; down ;circlefilled 10"
    #gbx$ "backcolor black ;circlefilled 8"
    if scale = 1 then #gbx$ "color black; backcolor green;circlefilled 6"

    #gbx$ "up; goto 190 486; color lightgray; backcolor lightgray; down ;circlefilled 10"
    #gbx$ "backcolor black ;circlefilled 8"
    if scale = 10 then #gbx$ "color black; backcolor green;circlefilled 6"

    #gbx$ "up; goto 190 509; color lightgray; backcolor lightgray; down ;circlefilled 10"
    #gbx$ "backcolor black ;circlefilled 8"
    if scale = 100 then #gbx$ "color black; backcolor green;circlefilled 6"

    #gbx$ "segment segScale; flush"

end sub

'-------------------------------------------------------

sub updateScience gbx$
    'displays (updates) the science study unit assignments

    if segSci > 0 then #gbx$ "delsegment ";segSci
    'blank out the back by painting black
    #gbx$ "up; goto 30 260; backcolor black; color black; down; boxfilled 244 410"

    'headings
    #gbx$ "font arial 16 bold"
    #gbx$ "up; goto 46 280; backcolor black; color green; down"
    #gbx$ "\Idle:\Hatching:\Farming:\Science:\Building:\Marketing:"

    rightx = 234
    #gbx$ "up; goto ";alignRight(str$(sidle), rightx, gbx$);" 280; down"
    #gbx$ "\";str$(sidle)
    #gbx$ "up; goto ";alignRight(str$(snursery), rightx, gbx$);" 304; down"
    #gbx$ "\";str$(snursery)
    #gbx$ "up; goto ";alignRight(str$(sfarming), rightx, gbx$);" 328; down"
    #gbx$ "\";str$(sfarming)
    #gbx$ "up; goto ";alignRight(str$(sscience), rightx, gbx$);" 352; down"
    #gbx$ "\";str$(sscience)
    #gbx$ "up; goto ";alignRight(str$(sbuilder), rightx, gbx$);" 376; down"
    #gbx$ "\";str$(sbuilder)
    #gbx$ "up; goto ";alignRight(str$(smarket), rightx, gbx$);" 400; down"
    #gbx$ "\";str$(smarket)

    #gbx$ "segment segSci; flush"


end sub

'-------------------------------------------------------

sub updateAsign gbx$
    'displays (repaints) the worble assignments screen

    if segAssign > 0 then #gbx$ "delsegment ";segAssign
    'blank out the back by painting black
    #gbx$ "up; goto 30 52; backcolor black; color black; down; boxfilled 244 186"

    'headings
    #gbx$ "font arial 16 bold"
    #gbx$ "up; goto 46 78; backcolor black; color green; down"
    #gbx$ "\Idle:\Hatchery:\Farmer:\Scientist:\Builder:"

    rightx = 234
    #gbx$ "up; goto ";alignRight(str$(idlework), rightx, gbx$);" 78; down"
    #gbx$ "\";str$(idlework)
    #gbx$ "up; goto ";alignRight(str$(nursery), rightx, gbx$);" 102; down"
    #gbx$ "\";str$(nursery)
    #gbx$ "up; goto ";alignRight(str$(farmers), rightx, gbx$);" 126; down"
    #gbx$ "\";str$(farmers)
    #gbx$ "up; goto ";alignRight(str$(scientists), rightx, gbx$);" 150; down"
    #gbx$ "\";str$(scientists)
    #gbx$ "up; goto ";alignRight(str$(builders), rightx, gbx$);" 174; down"
    #gbx$ "\";str$(builders)

    #gbx$ "segment segAssign; flush"

end sub

'-------------------------------------------------------

sub updateMain year,  born, harvest, grain, cultivated, housing, cash, gbx$
    'this function will print the game status information

    if segInfo > 0 then #gbx$ "delsegment ";segInfo
    'blank out the back by painting black
    #gbx$ "up; goto 341 135; backcolor black; color black; down; boxfilled 771 429"
    #gbx$ "up; goto 518 103; backcolor black; color black; down; boxfilled 758 150"

    'Main
    #gbx$ "font arial 20 bold"
    #gbx$ "up; goto 586 130; backcolor black; color green; down"
    #gbx$ "\Year: "; str$(year)
    c$ = "\Total Worbles: " + str$(worbles)
    c$ = c$ + "\Total Study Units: " + str$(sunits) + "\Worbles Hatched: " + str$(born)
    c$ = c$ + "\Grain Harvested: " + str$(harvest)
    c$ = c$ + "\Total Grain Onhand: " + str$(grain)
    c$ = c$ + "\Acres Cultivated: " + str$(cultivated)
    c$ = c$ + "\Dwelling Capacity: " + str$(housing)
    c$ = c$ + "\Treasury: " + str$(cash) + "\Tech Level:"
    #gbx$ "font arial 16 bold; up; goto 360 156; down"
    #gbx$ c$

    'tech levels
    #gbx$ "font arial 12 bold; up; goto 500 343; down"
    #gbx$ "\Hatchery:\Farming:\Science:\Building:\Marketing:"

    rightx = 616
    #gbx$ "up; goto ";alignRight(str$(tlnursery), rightx, gbx$);" 343; down"
    #gbx$ "\";str$(tlnursery)
    #gbx$ "up; goto ";alignRight(str$(tlfarming), rightx, gbx$);" 362; down"
    #gbx$ "\";str$(tlfarming)
    #gbx$ "up; goto ";alignRight(str$(tlscience), rightx, gbx$);" 381; down"
    #gbx$ "\";str$(tlscience)
    #gbx$ "up; goto ";alignRight(str$(tlbuilder), rightx, gbx$);" 400; down"
    #gbx$ "\";str$(tlbuilder)
    #gbx$ "up; goto ";alignRight(str$(tlmarket), rightx, gbx$);" 419; down"
    #gbx$ "\";str$(tlmarket)

    #gbx$ "backcolor lightgray; color lightgray; up"
    #gbx$ "goto 640 334; down; boxfilled 740 340; backcolor red; color red"
    #gbx$ "boxfilled "; 640 + prognursery ;" 340"
    #gbx$ "backcolor lightgray; color lightgray; up"
    #gbx$ "goto 640 353; down; boxfilled 740 359; backcolor red; color red"
    #gbx$ "boxfilled "; 640 + progfarming ;" 359"
    #gbx$ "backcolor lightgray; color lightgray; up"
    #gbx$ "goto 640 372; down; boxfilled 740 378; backcolor red; color red"
    #gbx$ "boxfilled "; 640 + progscience ;" 378"
    #gbx$ "backcolor lightgray; color lightgray; up"
    #gbx$ "goto 640 391; down; boxfilled 740 397; backcolor red; color red"
    #gbx$ "boxfilled "; 640 + progbuilder ;" 397"
    #gbx$ "backcolor lightgray; color lightgray; up"
    #gbx$ "goto 640 410; down; boxfilled 740 416; backcolor red; color red"
    #gbx$ "boxfilled "; 640 + progmarket ;" 416"

    #gbx$ "segment segInfo; flush"

end sub

'-------------------------------------------------------

sub postMessage message$, gbx$
    'this will place a message in the message field...

    if segMsg > 0 then #gbx$ "delsegment ";segMsg
    'blank out the back by painting black
    #gbx$ "up; goto 345 437; backcolor black; color black; down; boxfilled 766 522"
    #gbx$ "font arial 12 bold"

    message$ = message$ + " ######"
    buffer$ = wrapMsg$("\", message$, 1, 2, gbx$)

    #gbx$ "up; goto 354 458; backcolor black; color yellow; down"
    #gbx$ buffer$

    #gbx$ "segment segMsg; flush"

end sub

'-------------------------------------------------------

function wrapMsg$(buffer$, msg$, cnt, ln, gbx$)
    'recursive word wrapper function

    a$ = word$(msg$, cnt)
    if a$ <> "######" then
        work$ = buffer$ + a$ + " "
        curline$ = word$(work$, ln, "\")
        '#gbx$ "stringwidth? curline$ width"
        'tsh73: there are no stringwidth command in Just Basic, we'll use 9 as average character width
         width = 9*len( curline$)
        if width < 413 then
            wrapMsg$ = wrapMsg$(work$, msg$, cnt+1, ln, gbx$)
        else
            work$ = buffer$ + "\" + a$ + " "
            wrapMsg$ = wrapMsg$(work$, msg$, cnt+1, ln+1, gbx$)
        end if
    else
        wrapMsg$ = buffer$
    end if

end function

'-------------------------------------------------------

sub killWorbles d
   'removes "d" worbles from the game

   for x = 1 to d
       success = 0
       while success = 0
            if worbles > builders then
                type = int(rnd(0)*6) + 1
            else
                type = 7
            end if
            select case type
                case 2, 4, 6
                    'remove scientist
                    if scientists > 0 then
                        scientists = scientists - 1
                        su = int((tlscience * 1.33) + 4)
                        call removeSU su
                        success = 1
                    end if
                case 1
                    'remove nursery
                    if nursery > 0 then
                        nursery = nursery - 1
                        success = 1
                    end if
                case 3
                    'remove farmer
                    if farmers > 0 then
                        farmers = farmers - 1
                        success = 1
                    end if
                case 7
                    'remove builder
                    if builders > 0 then
                        if worbles > 1 then 'don't remove the last builder
                           builders = builders - 1
                           success = 1
                        end if
                    end if
                case 5
                    'remove idle worble
                    if idlework > 0 then
                        idlework = idlework - 1
                        success = 1
                    end if
            end select
        wend
        worbles = worbles - 1
    next x

end sub

'-------------------------------------------------------

sub removeSU su

   for x = 1 to su
       success = 0
       while success = 0
           type = int(rnd(0)*6) + 1
           select case type
                case 1
                    'remove study sidle
                    if sidle > 0 then
                        sidle = sidle - 1
                        success = 1
                    end if
                case 2
                    'remove snursery
                    if snursery > 0 then
                        snursery = snursery - 1
                        success = 1
                    end if
                case 3
                    'remove sfarming
                    if sfarming > 0 then
                        sfarming = sfarming - 1
                        success = 1
                    end if
                case 4
                    'remove sscience
                    if sscience > 0 then
                        sscience = sscience - 1
                        success = 1
                    end if
                case 5
                    'remove sbuilder
                    if sbuilder > 0 then
                        sbuilder = sbuilder - 1
                        success = 1
                    end if
                case 6
                    'remove smarket
                    if smarket > 0 then
                        smarket = smarket - 1
                        success = 1
                    end if
            end select
        wend
    next x

end sub


'-------------------------------------------------------

function alignRight(value$, rightx, gbx$)
    'this function will find the correct x coordinate at wich to place
    'the passed string so that it will align right at rightx

    '#gbx$, "stringwidth? value$ width"
    'tsh73: there are no stringwidth command in Just Basic, but all digits in given font have same width. We'll use 12
    width = 12*len( value$)
    alignRight = rightx - width

end function

'-------------------------------------------------------

Sub Sleep value
    'CallDLL #kernel32, "Sleep",value As Long,r As Void
    'tsh73: no Sleep API in JustBasic. Revert to TIMER instead
    timer value, [timeUp]
    wait
[timeUp]
    timer 0
End Sub

'-------------------------------------------------------

Sub ShellExecute hWnd, file$
'    parameter = _SW_SHOWNORMAL    ' set up for viewing
'    lpszOp$ = "open" + Chr$(0)    ' "open" or "print"
'    lpszFile$ = file$ + Chr$(0)
'    lpszDir$ = DefaultDir$ + Chr$(0)
'    lpszParams$="" + Chr$(0)
'    CallDLL #shell32, "ShellExecuteA", hWnd As Long,lpszOp$ As Ptr,lpszFile$ As Ptr,_
'    lpszParams$ As Ptr,lpszDir$ As Ptr,parameter As Long, result As Long
    'tsh73: we can ask Explorer to show HTML file for us. No need to use API
    run "Explorer "; file$
    End Sub

'-------------------------------------------------------

function seedGen()
    'creates a psuedo-random seed for seeding RND number generator

    tm = time$("ms")
    tmp = date$("days")
    d = val(word$(time$(),3,":")) + 1
    tmp = ((tmp/d)/d)
    while tm > .99
        tm = tm / (tmp+.000000001)
    wend
    tm$ = using("#.##",tm)
    seedGen = val(tm$)

end function

'*************************************************************
    'tsh73: and yes, we need min() function
'------------------------------------------------
function max(x,y)
    max = x
    if y>x then max = y
end function

'------------------------------------------------
function min(x,y)
    min = x
    if y<x then min = y
end function
