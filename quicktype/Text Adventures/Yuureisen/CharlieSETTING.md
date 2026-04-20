# Game Setting — Yuureisen (幽霊船 / Ghost Ship)

**Platform:** NEC PC-8001  
**Author:** Y.Kume  
**Genre:** Text adventure (command-parser)

---

## Premise

The player is a modern-day person who was aboard a ship that suffered an accident in the Pacific Ocean. Cast adrift and alone, they have been drifting helplessly across the open sea. Then, against all odds, a medieval sailing vessel appears before them.

The opening text (lines 700–730) in translation reads roughly:

> *Before your eyes, as you drifted across the Pacific Ocean following the accident of the ship you were on — a medieval sailing ship appeared! With great effort you finally hauled yourself up to the figurehead at the bow of the vessel. What will happen now? What secret is hidden aboard this ship? ......*

---

## The Ship

The ghost ship is a large, multi-deck medieval sailing vessel modelled on a European square-rigger — the game references an illustration from a real Japanese children's encyclopaedia (*Shougakukan Gakushuu Hyakka Jiten Vol. 17, "Fune"*, line 1040) showing a ship called the *Royal Louis*. The ship has three masts (foremast, mainmast, mizzenmast) and multiple distinct deck levels:

- **Upper gangway** (ｼﾞｮｳｺｳﾊﾝ) — the main upper deck, running north, south, and centre
- **Lower gangway** (ｹﾞｺｳﾊﾝ) — the lower deck, running north, south, and centre
- **Quarterdeck** (ｸｫｰﾀｰ･ﾃﾞｯｷ) — the raised stern deck
- **Poop deck** (ﾌﾞｰﾌﾟ･ﾃﾞｯｷ) — the very rear upper deck
- **Forecastle deck** (ﾌｫｸｽﾙ･ﾃﾞｯｷ) — the raised bow deck
- **Basement / hold** (ﾁｶｼﾂ) — reached by searching

Internally the ship contains over 45 named rooms connected by hallways, stairways, and doors. Officer accommodations include the captain's cabin, the commander's cabin (each with a spare ante-room), and four petty officers' cabins. Working spaces include a chart room, cook's quarters, a conference room, a medical room, a laundry room, a rest room, two armouries, two food stores, storage areas, and a workshop.

---

## Atmosphere

The ship is deserted — no living crew. Skeletons (ｶﾞｲｺﾂ) are scattered throughout, eight in total, with one room containing a *pile* of bones (ｶﾞｲｺﾂ ﾉ ﾔﾏ). The spirits of the dead sailors are still present as vengeful ghosts (ｵﾝﾘｮｳ), and their cries can be heard echoing through the hull:

> *"The sad cries of the sailors can be heard throughout the ship."*  
> *"Give us peaceful sleep!"*

One mechanic involves the command ｱｰﾒﾝ (amen), which, when performed at the right moment, lays the spirits to rest. This sets a flag (AH=1) that unlocks a subsequent hint from a grateful ghost.

---

## The Mystery and Goal

The commander's cabin holds a map to **Treasure Island** (ﾀｶﾗｼﾞﾏ), where pirates (ｶｲｿﾞｸﾀﾁ) have hidden their treasure. The ship itself is full of potential loot: gold coins (ｷﾝｶ), diamonds (ﾀﾞｲﾔﾓﾝﾄﾞ), and other valuables locked in a safe (ｷﾝｺ) that requires the right key to open.

**The winning condition** is revealed in the game's in-fiction hint (lines 3040–3050):

> *"This game: kick (ｹｯﾄﾊﾞｽ) the boat (ﾎﾞｰﾄ) located at the centre of the upper gangway. Then ride (ﾉﾙ) the boat — and the game ends."*

The player must launch the ship's lifeboat, which is stored amidships on the upper gangway, and sail away to safety. The game's ending text hints that recovering the treasure map opens the door to a further adventure:

> *"But you, who have obtained the map to Treasure Island, harboring an even greater dream — will you set out on an adventure?"*

---

## Mechanical Summary

- **Parser-driven** text adventure with an eight-direction movement system (N/S/E/W + left/right/up/down)
- **Eight function-key shortcuts** for the most common commands (look, north, east, south, west, open, left, right, up, down)
- **Verb vocabulary** of ~45 entries covering movement, inspection, manipulation, consumption, and combat
- **Item system** with ~67 named objects, each with a room location and a state code
- **Locked doors** requiring specific keys, a locked safe requiring a specific key
- **Multiple endings/states** depending on whether the player has prayed for the sailors, found the treasure, and successfully escaped on the lifeboat
