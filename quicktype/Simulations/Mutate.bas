generate:
CLS : PRINT "Random Mutation Sequence for"; : a = 10: GOSUB getran
PRINT a; "generations. . .": PRINT : PRINT : FOR d = 1 TO a: RESTORE:a =
100: GOSUB getran
IF a > 84 THEN PRINT "- 00%: Heightened Intelligence": GOTO leavegen
IF a > 79 THEN PRINT "Â"; : GOSUB getphys1: PRINT "À"; : GOSUB getment1:
GOTO leavegen
IF a > 49 THEN PRINT "-"; : GOSUB getment1: GOTO leavegen
PRINT "-"; : GOSUB getphys1: GOTO leavegen

getphys1:
RESTORE: a = 100: GOSUB getran: m = a
getphys2:
READ b, b$: a = a - b: IF a > 0 THEN GOTO getphys2
c$ = RIGHT$(b$, 3): IF w = 1 AND c$ = "(D)" THEN GOTO getphys1
IF b$ = "Good" THEN w = 1: GOTO getphys1
PRINT " "; RIGHT$(STR$(100 + m), 2); "%: "; b$: w = 0: RETURN

getment1:
RESTORE: FOR a = 0 TO 50: READ b, b$: NEXT: a = 100: GOSUB getran: m = a
getment2:
READ b, b$: a = a - b: IF a > 0 THEN GOTO getment2
c$ = RIGHT$(b$, 3): IF w = 1 AND c$ = "(D)" THEN GOTO getment1
IF b$ = "Good" THEN PRINT w = 1: GOTO getment1
PRINT " "; RIGHT$(STR$(100 + m), 2); "%: "; b$: w = 0: RETURN

leavegen:
NEXT d
PRINT "Press Enter to generate another sequence or X to exit. . ."

recurse:
a$ = INKEY$: IF a$ = "" THEN GOTO recurse
IF a$ = CHR$(13) THEN GOTO generate
IF a$ <> "x" THEN GOTO recurse
END

getran:
z = 0: FOR x = 0 TO 11
loop1:
a$ = INKEY$: IF a$ = "" THEN GOTO loop1
y = INT(TIMER * 100)
z = z + 2 ^ ((y - INT(y / 2) * 2) * x)
NEXT x: a = INT(a * (z / 4096)) + 1: RETURN

DATA 2,"Attraction Odor (D)"
DATA 2,"Body Structure Change (D)"
DATA 1,"Chameleon Powers"
DATA 1,"Density Control"
DATA 2,"Diminished Sense (D)"
DATA 2,"Double Physical Pain (D)"
DATA 2,"Electrical Generation"
DATA 2,"Fat Cell Accumulation (D)"
DATA 2,"Gas Generation - Musk"
DATA 1,"Heat Generation"
DATA 1,"Heightened Balance"
DATA 4,"Heightened Constitution"
DATA 1,"Heightened Dexterity"
DATA 1,"Heightened Hearing"
DATA 1,"Heightened Precision"
DATA 1,"Heightened Smell"
DATA 6,"Heightened Strength"
DATA 1,"Heightened Taste"
DATA 1,"Heightened Touch"
DATA 1,"Heightened Vision"
DATA 2,"Hemophilia (D)"
DATA 2,"Increased Metabolism (D)"
DATA 3,"Increased Speed"
DATA 1,"Infravision"
DATA 1,"Light Generation"
DATA 2,"Multiple Body Parts"
DATA 5,"New Body Parts"
DATA 2,"No Resistance to Bacteria (D)"
DATA 2,"No Resistance to Poison (D)"
DATA 2,"No Sensory Nerve Endings (D)"
DATA 1,"Oversized Body Parts"
DATA 1,"Partial Carapace"
DATA 2,"Photosynthetic Skin"
DATA 1,"Physical Reflection"
DATA 2,"Poor Respiratory System (D)"
DATA 1,"Quills/Spines"
DATA 2,"Radiated Eyes"
DATA 2,"Regeneration"
DATA 1,"Shapechange"
DATA 4,"Shorter"
DATA 2,"Skin Structure Change (D)"
DATA 1,"Sonic Attack Ability"
DATA 1,"Symbiotic Attachment"
DATA 5,"Taller"
DATA 1,"Total Carapace"
DATA 1,"Ultravision"
DATA 2,"Vision Defect (D)"
DATA 2,"Weight Decrease (D)"
DATA 1,"Wings"
DATA 4,"Good"
DATA 6,"Pick Any Mutation"

DATA 1,"Absorption"
DATA 1,"Anti-Reflection (D)"
DATA 4,"Complete Mental Block (D)"
DATA 1,"Cryokinesis"
DATA 1,"Death Field Generation"
DATA 2,"De-evolution"
DATA 1,"Density Control (others)"
DATA 1,"Directional Sense"
DATA 1,"Dual Brain"
DATA 1,"Empathy"
DATA 4,"Epilepsy (D)"
DATA 4,"Fear Impulse (D)"
DATA 3,"Force Field Generation"
DATA 1,"Genius Capability"
DATA 5,"Heightened Brain Talent"
DATA 10,"Heightened Intelligence"
DATA 4,"Hostility Field (D)"
DATA 1,"Illusion Generation"
DATA 1,"Intuition"
DATA 5,"Life Leech"
DATA 1,"Light Wave Manipulation"
DATA 1,"Magnetic Control"
DATA 1,"Mass Mind"
DATA 3,"Mental Blast"
DATA 1,"Mental Control"
DATA 1,"Mental Control over Physical State"
DATA 2,"Mental Defenslessness (D)"
DATA 1,"Mental Defense Shield"
DATA 1,"Molecular Disruption"
DATA 2,"Molecular Understanding"
DATA 3,"Multiple Damage (D)"
DATA 1,"Planar Travel"
DATA 3,"Poor Dual Brain (D)"
DATA 1,"Precognition"
DATA 1,"Pyrokinesis"
DATA 1,"Radar/Sonar"
DATA 1,"Reflection"
DATA 1,"Repulsion Field"
DATA 1,"Sound Imitation"
DATA 3,"Telekinesis"
DATA 1,"Telekinetic Arm"
DATA 1,"Telekinetic Flight"
DATA 1,"Telepathy"
DATA 1,"Teleportation"
DATA 1,"Thought Imitation"
DATA 1,"Time Field Manipulation"
DATA 1,"Total Healing"
DATA 1,"Weather Manipulation"
DATA 5,"Will Force"
DATA 4,"Good"
DATA 1,"Pick Any Mutation"




