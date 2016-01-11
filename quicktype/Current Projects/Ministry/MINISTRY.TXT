//Ministry by Wesley May, 2002
//Version 4.1 Full

#include <iostream.h>
#include <fstream.h>
#include <stdlib.h>

int main()
{
srand((unsigned)time( NULL ));
//Initialization Start

//Main Variables
long zen=6500;
long networth=0;
short land=50;
short fland=28;
long food=350;
long lumber=25;
long respoints=0;
short days=1;
short explore=0;
long maxpop=500;
long banked=0;
short type=0;

//Enemy Variables
short ebonus=0;
short eforce=0;
short pforce=0;

//Workers
long pop=150;
long farmers=50;
long lumberjacks=10;
long officers=35;
long firemen=35;
long scholars=15;
long troops=50;
long bankers=0;
long doctors=40;
long merchants=0;
long priests=0;
long politicians=0;

//Buildings
int houses=6;
int farms=5;
int lumberyards=2;
int pstats=2;
int fstats=2;
int universities=1;
int barracks=2;
int banks=0;
int hospitals=2;
int marketplaces=0;
int temples=0;
int embassies=0;

//Technology
long t_housing=0;
long t_economy=0;
long t_combat=0;
long t_horticulture=0;
long t_religion=0;
long t_politics=0;
long t_romance=0;

//Misc. Variables
long x=0;
long y=0;
long z=0;
char filename[15];
short save=0;
short load=0;
short protect=7;

//Initialization End


save:
if (save == 1)
{
cout << "\n\nEnter a filename to save to: ";
cin >> filename;

ofstream fout(filename);
fout << zen;
fout << "\n";
fout << networth;
fout << "\n";
fout << land;
fout << "\n";
fout << fland;
fout << "\n";
fout << food;
fout << "\n";
fout << lumber;
fout << "\n";
fout << respoints;
fout << "\n";
fout << days;
fout << "\n";
fout << explore;
fout << "\n";
fout << maxpop;
fout << "\n";
fout << banked;
fout << "\n";
fout << ebonus;
fout << "\n";
fout << pop;
fout << "\n";
fout << farmers;
fout << "\n";
fout << lumberjacks;
fout << "\n";
fout << officers;
fout << "\n";
fout << firemen;
fout << "\n";
fout << scholars;
fout << "\n";
fout << troops;
fout << "\n";
fout << bankers;
fout << "\n";
fout << doctors;
fout << "\n";
fout << merchants;
fout << "\n";
fout << priests;
fout << "\n";
fout << politicians;
fout << "\n";
fout << houses;
fout << "\n";
fout << farms;
fout << "\n";
fout << lumberyards;
fout << "\n";
fout << pstats;
fout << "\n";
fout << fstats;
fout << "\n";
fout << universities;
fout << "\n";
fout << barracks;
fout << "\n";
fout << banks;
fout << "\n";
fout << hospitals;
fout << "\n";
fout << marketplaces;
fout << "\n";
fout << temples;
fout << "\n";
fout << embassies;
fout << "\n";
fout << t_housing;
fout << "\n";
fout << t_economy;
fout << "\n";
fout << t_combat;
fout << "\n";
fout << t_horticulture;
fout << "\n";
fout << protect;
fout << "\n";
fout << type;
fout << "\n";
fout << t_religion;
fout << "\n";
fout << t_politics;
fout << "\n";
fout << t_romance;
fout << "\n";

fout.close();
fout.clear();

save = 0;
}
//-------------

if (load == 1)
{
cout << "\n\n\nEnter a filename to load from: ";
cin >> filename;

ifstream fin(filename);
fin >> zen;
fin >> networth;
fin >> land;
fin >> fland;
fin >> food;
fin >> lumber;
fin >> respoints;
fin >> days;
fin >> explore;
fin >> maxpop;
fin >> banked;
fin >> ebonus;
fin >> pop;
fin >> farmers;
fin >> lumberjacks;
fin >> officers;
fin >> firemen;
fin >> scholars;
fin >> troops;
fin >> bankers;
fin >> doctors;
fin >> merchants;
fin >> priests;
fin >> politicians;
fin >> houses;
fin >> farms;
fin >> lumberyards;
fin >> pstats;
fin >> fstats;
fin >> universities;
fin >> barracks;
fin >> banks;
fin >> hospitals;
fin >> marketplaces;
fin >> temples;
fin >> embassies;
fin >> t_housing;
fin >> t_economy;
fin >> t_combat;
fin >> t_horticulture;
fin >> protect;
fin >> type;
fin >> t_religion;
fin >> t_politics;
fin >> t_romance;


fin.close();
fin.clear();
load = 0;
}

//Main Menu
short choice=0;

menu:
cout << "\n\n";
cout << "Welcome to Ministry! (V 4.1)\n";
cout << "Made by Wesley May (2002)\n\n";
cout << "Please choose an option below:\n\n";

cout << "1) Start Game\n";
cout << "2) Save Game\n";
cout << "3) Load Game\n";
cout << "4) Credits\n";
cout << "5) Quit\n";
cin >> choice;

switch(choice)
{
case 1: goto game;
break;
case 2: goto load;
break;
case 3: goto load;
break;
case 4: goto credits;
break;
default: goto quit;
break;
}

goto menu;
//End Main Menu

//----------
//Start Game
//----------
game:
cout << "\n\n";
if (type == 0)
{
cout << "Before you start, what will your empire's speciality be?";
cout << "\n\n1) Horticulture";
cout << "\n2) Science";
cout << "\n3) Combat";
cout << "\n4) Politics";
cout << "\n5) Romance\n";
cin >> choice;

if ((choice < 1) || (choice > 5)) goto menu;

if (choice == 1)
{
type = 1;
t_horticulture = t_horticulture + 150;
}
if (choice == 2)
{
type = 2;
}
if (choice == 3)
{
type = 3;
t_combat = t_combat + 150;
}
if (choice == 4)
{
type = 4;
t_politics = t_politics + 100;
t_economy = t_economy + 50;
}
if (choice == 5)
{
type = 5;
t_romance = t_romance + 150;
}
}

//------------------
//Start User Control
control:
cout << "\n\n\nHow will you manage your town?\n\n";
cout << "1) Construct Buildings\n";
cout << "2) Train Workers\n";
cout << "3) Utilize Units/Buildings\n";
cout << "4) Explore New Land\n";
cout << "5) Empire Status\n";
cout << "6) End Day\n";
cout << "7) Back to Main\n";
cin >> choice;

switch(choice)
{
case 1: goto build;
break;
case 2: goto train;
break;
case 3: goto util;
break;
case 4: goto explore;
break;
case 5: goto status;
break;
case 6: goto endday;
break;
}

goto menu;

build:
cout << "\n\n\nWhat would you like to build?\n\n";
cout << "1) Houses          (500/10)\n";
cout << "2) Farms           (500/15)\n";
cout << "3) Lumberyards     (500/15)\n";
cout << "4) Police Stations (1000/20)\n";
cout << "5) Fire Stations   (1000/20)\n";
cout << "6) Universities    (1750/25)\n";
cout << "7) Barracks        (2000/30)\n";
cout << "8) Banks           (2500/30)\n";
cout << "9) Hospitals       (2000/30)\n";
cout << "10) Marketplaces   (3000/45)\n";
cout << "11) Temples        (1750/35)\n";
cout << "12) Embassies      (2750/40)\n";

cout << "\n\nType '0' for Empire Menu\n";
cin >> choice;

if ((choice < 1) || (choice > 12)) goto control;
//-------------
if (choice == 1)
{
cout << "\n\nHow many houses would you like to build?\n";
cin >> choice;
if (choice < 1) goto control;
x = 500 * choice;
y = 10 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (y > lumber)
{
cout << "\n\nYou need " << y << " lumber. You only have " << lumber;
goto control;
}
if (choice > fland)
{
cout << "\n\nYou need " << choice << " free land. You only have " << fland;
goto control;
}
houses = houses + choice;
zen = zen - x;
lumber = lumber - y;
fland = fland - choice;
cout << "\n\nYou have successfully constructed " << choice << " houses!";
goto control;
}
//-------------
//-------------
if (choice == 2)
{
cout << "\n\nHow many farms would you like to build?\n";
cin >> choice;
if (choice < 1) goto control;
x = 500 * choice;
y = 15 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (y > lumber)
{
cout << "\n\nYou need " << y << " lumber. You only have " << lumber;
goto control;
}
if (choice > fland)
{
cout << "\n\nYou need " << choice << " free land. You only have " << fland;
goto control;
}
farms = farms + choice;
zen = zen - x;
lumber = lumber - y;
fland = fland - choice;
cout << "\n\nYou have successfully constructed " << choice << " farms!";
goto control;
}
//-------------
//-------------
if (choice == 3)
{
cout << "\n\nHow many lumberyards would you like to build?\n";
cin >> choice;
if (choice < 1) goto control;
x = 500 * choice;
y = 15 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (y > lumber)
{
cout << "\n\nYou need " << y << " lumber. You only have " << lumber;
goto control;
}
if (choice > fland)
{
cout << "\n\nYou need " << choice << " free land. You only have " << fland;
goto control;
}
lumberyards = lumberyards + choice;
zen = zen - x;
lumber = lumber - y;
fland = fland - choice;
cout << "\n\nYou have successfully constructed " << choice << " lumberyards!";
goto control;
}
//-------------
//-------------
if (choice == 4)
{
cout << "\n\nHow many police stations would you like to build?\n";
cin >> choice;
if (choice < 1) goto control;
x = 1000 * choice;
y = 20 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (y > lumber)
{
cout << "\n\nYou need " << y << " lumber. You only have " << lumber;
goto control;
}
if (choice > fland)
{
cout << "\n\nYou need " << choice << " free land. You only have " << fland;
goto control;
}
pstats = pstats + choice;
zen = zen - x;
lumber = lumber - y;
fland = fland - choice;
cout << "\n\nYou have successfully constructed " << choice << " police stations!";
goto control;
}
//-------------
if (choice == 5)
{
cout << "\n\nHow many fire stations would you like to build?\n";
cin >> choice;
if (choice < 1) goto control;
x = 1000 * choice;
y = 20 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (y > lumber)
{
cout << "\n\nYou need " << y << " lumber. You only have " << lumber;
goto control;
}
if (choice > fland)
{
cout << "\n\nYou need " << choice << " free land. You only have " << fland;
goto control;
}
fstats = fstats + choice;
zen = zen - x;
lumber = lumber - y;
fland = fland - choice;
cout << "\n\nYou have successfully constructed " << choice << " fire stations!";
goto control;
}
//-------------
if (choice == 6)
{
cout << "\n\nHow many universities would you like to build?\n";
cin >> choice;
if (choice < 1) goto control;
x = 1750 * choice;
y = 25 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (y > lumber)
{
cout << "\n\nYou need " << y << " lumber. You only have " << lumber;
goto control;
}
if (choice > fland)
{
cout << "\n\nYou need " << choice << " free land. You only have " << fland;
goto control;
}
universities = universities + choice;
zen = zen - x;
lumber = lumber - y;
fland = fland - choice;
cout << "\n\nYou have successfully constructed " << choice << " universities!";
goto control;
}
//-------------
if (choice == 7)
{
cout << "\n\nHow many barracks would you like to build?\n";
cin >> choice;
if (choice < 1) goto control;
x = 2000 * choice;
y = 30 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (y > lumber)
{
cout << "\n\nYou need " << y << " lumber. You only have " << lumber;
goto control;
}
if (choice > fland)
{
cout << "\n\nYou need " << choice << " free land. You only have " << fland;
goto control;
}
barracks = barracks + choice;
zen = zen - x;
lumber = lumber - y;
fland = fland - choice;
cout << "\n\nYou have successfully constructed " << choice << " barracks!";
goto control;
}
//-------------
if (choice == 8)
{
cout << "\n\nHow many banks would you like to build?\n";
cin >> choice;
if (choice < 1) goto control;
x = 2500 * choice;
y = 30 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (y > lumber)
{
cout << "\n\nYou need " << y << " lumber. You only have " << lumber;
goto control;
}
if (choice > fland)
{
cout << "\n\nYou need " << choice << " free land. You only have " << fland;
goto control;
}
banks = banks + choice;
zen = zen - x;
lumber = lumber - y;
fland = fland - choice;
cout << "\n\nYou have successfully constructed " << choice << " banks!";
goto control;
}
//-------------
if (choice == 9)
{
cout << "\n\nHow many hospitals would you like to build?\n";
cin >> choice;
if (choice < 1) goto control;
x = 2000 * choice;
y = 20 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (y > lumber)
{
cout << "\n\nYou need " << y << " lumber. You only have " << lumber;
goto control;
}
if (choice > fland)
{
cout << "\n\nYou need " << choice << " free land. You only have " << fland;
goto control;
}
hospitals = hospitals + choice;
zen = zen - x;
lumber = lumber - y;
fland = fland - choice;
cout << "\n\nYou have successfully constructed " << choice << " hospitals!";
goto control;
}
//-------------
if (choice == 10)
{
cout << "\n\nHow many marketplaces would you like to build?\n";
cin >> choice;
if (choice < 1) goto control;
x = 3000 * choice;
y = 45 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (y > lumber)
{
cout << "\n\nYou need " << y << " lumber. You only have " << lumber;
goto control;
}
if (choice > fland)
{
cout << "\n\nYou need " << choice << " free land. You only have " << fland;
goto control;
}
marketplaces = marketplaces + choice;
zen = zen - x;
lumber = lumber - y;
fland = fland - choice;
cout << "\n\nYou have successfully constructed " << choice << " marketplaces!";
goto control;
}
//-------------
if (choice == 11)
{
cout << "\n\nHow many temples would you like to build?\n";
cin >> choice;
if (choice < 1) goto control;
x = 1750 * choice;
y = 35 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (y > lumber)
{
cout << "\n\nYou need " << y << " lumber. You only have " << lumber;
goto control;
}
if (choice > fland)
{
cout << "\n\nYou need " << choice << " free land. You only have " << fland;
goto control;
}
temples = temples + choice;
zen = zen - x;
lumber = lumber - y;
fland = fland - choice;
cout << "\n\nYou have successfully constructed " << choice << " temples!";
goto control;
}
//-------------
if (choice == 12)
{
cout << "\n\nHow many embassies would you like to build?\n";
cin >> choice;
if (choice < 1) goto control;
x = 2750 * choice;
y = 40 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (y > lumber)
{
cout << "\n\nYou need " << y << " lumber. You only have " << lumber;
goto control;
}
if (choice > fland)
{
cout << "\n\nYou need " << choice << " free land. You only have " << fland;
goto control;
}
embassies = embassies + choice;
zen = zen - x;
lumber = lumber - y;
fland = fland - choice;
cout << "\n\nYou have successfully constructed " << choice << " embassies!";
goto control;
}
//-------------
//-------------
//End of Build Control


//-------------
train:
cout << "\n\n\nWhat would you like to train?\n\n";
cout << "1) Farmers      (50)\n";
cout << "2) Lumberjacks  (50)\n";
cout << "3) Officers     (80)\n";
cout << "4) Firemen      (80)\n";
cout << "5) Scholars     (110)\n";
cout << "6) Troops       (150)\n";
cout << "7) Bankers      (135)\n";
cout << "8) Doctors      (170)\n";
cout << "9) Merchants    (120)\n";
cout << "10) Priests     (130)\n";
cout << "11) Politicians (160)\n";

cout << "\n\nType '0' for Empire Menu\n";
cin >> choice;

if ((choice < 1) || (choice > 11)) goto control;
//-------------
if (choice == 1)
{
cout << "\n\nHow many farmers would you like to train?\n";
cin >> choice;
if (choice < 1) goto control;
x = 50 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (choice > pop)
{
cout << "\n\nYou need " << choice << " civilians. You only have " << pop;
goto control;
}
farmers = farmers + choice;
zen = zen - x;
pop = pop - choice;
cout << "\n\nYou have successfully trained " << choice << " farmers!";
goto control;
}
//-------------
//-------------
if (choice == 2)
{
cout << "\n\nHow many lumberjacks would you like to train?\n";
cin >> choice;
if (choice < 1) goto control;
x = 50 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (choice > pop)
{
cout << "\n\nYou need " << choice << " civilians. You only have " << pop;
goto control;
}
lumberjacks = lumberjacks + choice;
zen = zen - x;
pop = pop - choice;
cout << "\n\nYou have successfully trained " << choice << " lumberjacks!";
goto control;
}
//-------------
//-------------
if (choice == 3)
{
cout << "\n\nHow many officers would you like to train?\n";
cin >> choice;
if (choice < 1) goto control;
x = 80 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (choice > pop)
{
cout << "\n\nYou need " << choice << " civilians. You only have " << pop;
goto control;
}
officers = officers + choice;
zen = zen - x;
pop = pop - choice;
cout << "\n\nYou have successfully trained " << choice << " officers!";
goto control;
}
//-------------
//-------------
if (choice == 4)
{
cout << "\n\nHow many firemen would you like to train?\n";
cin >> choice;
if (choice < 1) goto control;
x = 80 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (choice > pop)
{
cout << "\n\nYou need " << choice << " civilians. You only have " << pop;
goto control;
}
firemen = firemen + choice;
zen = zen - x;
pop = pop - choice;
cout << "\n\nYou have successfully trained " << choice << " firemen!";
goto control;
}
//-------------
//-------------
if (choice == 5)
{
cout << "\n\nHow many scholars would you like to train?\n";
cin >> choice;
if (choice < 1) goto control;
x = 110 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (choice > pop)
{
cout << "\n\nYou need " << choice << " civilians. You only have " << pop;
goto control;
}
scholars = scholars + choice;
zen = zen - x;
pop = pop - choice;
cout << "\n\nYou have successfully trained " << choice << " scholars!";
goto control;
}
//-------------
//-------------
if (choice == 6)
{
cout << "\n\nHow many troops would you like to train?\n";
cin >> choice;
if (choice < 1) goto control;
x = 150 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (choice > pop)
{
cout << "\n\nYou need " << choice << " civilians. You only have " << pop;
goto control;
}
troops = troops + choice;
zen = zen - x;
pop = pop - choice;
cout << "\n\nYou have successfully trained " << choice << " troops!";
goto control;
}
//-------------
//-------------
if (choice == 7)
{
cout << "\n\nHow many bankers would you like to train?\n";
cin >> choice;
if (choice < 1) goto control;
x = 135 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (choice > pop)
{
cout << "\n\nYou need " << choice << " civilians. You only have " << pop;
goto control;
}
bankers = bankers + choice;
zen = zen - x;
pop = pop - choice;
cout << "\n\nYou have successfully trained " << choice << " bankers!";
goto control;
}
//-------------
//-------------
if (choice == 8)
{
cout << "\n\nHow many doctors would you like to train?\n";
cin >> choice;
if (choice < 1) goto control;
x = 170 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (choice > pop)
{
cout << "\n\nYou need " << choice << " civilians. You only have " << pop;
goto control;
}
doctors = doctors + choice;
zen = zen - x;
pop = pop - choice;
cout << "\n\nYou have successfully trained " << choice << " doctors!";
goto control;
}
//-------------
if (choice == 9)
{
cout << "\n\nHow many merchants would you like to train?\n";
cin >> choice;
if (choice < 1) goto control;
x = 120 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (choice > pop)
{
cout << "\n\nYou need " << choice << " civilians. You only have " << pop;
goto control;
}
merchants = merchants + choice;
zen = zen - x;
pop = pop - choice;
cout << "\n\nYou have successfully trained " << choice << " merchants!";
goto control;
}
//-------------
if (choice == 10)
{
cout << "\n\nHow many priests would you like to train?\n";
cin >> choice;
if (choice < 1) goto control;
x = 130 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (choice > pop)
{
cout << "\n\nYou need " << choice << " civilians. You only have " << pop;
goto control;
}
priests = priests + choice;
zen = zen - x;
pop = pop - choice;
cout << "\n\nYou have successfully trained " << choice << " priests!";
goto control;
}
//-------------
if (choice == 11)
{
cout << "\n\nHow many politicians would you like to train?\n";
cin >> choice;
if (choice < 1) goto control;
x = 160 * choice;
if (x > zen)
{
cout << "\n\nYou need " << x << " zen. You only have " << zen;
goto control;
}
if (choice > pop)
{
cout << "\n\nYou need " << choice << " civilians. You only have " << pop;
goto control;
}
politicians = politicians + choice;
zen = zen - x;
pop = pop - choice;
cout << "\n\nYou have successfully trained " << choice << " politicians!";
goto control;
}
//-------------
//End of Train Control

explore:
x = land + 50;
cout << "\n\n\nIt will cost you " << x << " zen for each land you explore.\n";
cout << "How much land should your scout explore?\n";
cin >> choice;
y = choice * x;
if (y > zen)
{
cout << "It will cost " << y << " zen to explore that much. You only have " << zen;
goto control;
}
zen = zen - y;
explore = explore + choice;
cout << "\n\nYou will have " << explore << " more land tomorrow.";
goto control;
//End of Explore Control


status:
cout << "\n\n\nWhich report do you want to see?";
cout << "\n\n1) General Information";
cout << "\n2) Buildings and Units";
cout << "\n3) Research";
cout << "\n4) Resource Flow";
cout << "\n5) Disasters\n";
cin >> choice;

if ((choice < 1) || (choice > 5)) goto control;

if (choice == 1)
{
cout << "\n\n\nEmpire Status:\n";
cout << "\nDay " << days;

cout << "\n\nZen: " << zen;
cout << "\nNetworth: " << networth;
cout << "\nTotal Land: " << land;
cout << "\nFree Land: " << fland;
cout << "\nCivilians: " << pop;
cout << "\nProtection: " << protect;
cout << "\n\nFood: " << food;
cout << "\nLumber: " << lumber;
goto control;
}

if (choice == 2)
{
cout << "\n\nHouses:          " << houses << "   " << pop << "/" << maxpop;
cout << "\nFarms:           " << farms << "   " << farmers << "/" << (farms * 50);
cout << "\nLumberyards:     " << lumberyards << "   " << lumberjacks << "/" << (lumberyards * 50);
cout << "\nPolice Stations: " << pstats << "   " << officers << "/" << (pstats * 50);
cout << "\nFire Stations:   " << fstats << "   " << firemen << "/" << (fstats * 50);
cout << "\nUniversities:    " << universities << "   " << scholars << "/" << (universities * 50);
cout << "\nBarracks:        " << barracks << "   " << troops <<  "/" << (barracks * 50);
cout << "\nBanks:           " << banks << "   " << bankers << "/" << (banks * 50);
cout << "\nHospitals:       " << hospitals << "   " << doctors << "/" << (hospitals * 50);
cout << "\nMarketplaces:    " << marketplaces << "   " << merchants << "/" << (marketplaces * 50);
cout << "\nTemples:         " << temples << "   " << priests << "/" << (temples * 50);
cout << "\nEmbassies:       " << embassies << "   " << politicians << "/" << (embassies * 50);
cout << "\n\n";
goto control;
}

if (choice == 3)
{
cout << "\n\nSpare RP: " << respoints;
cout << "\nHousing Lv:      " << t_housing;
cout << "\nEconomy Lv:      " << t_economy;
cout << "\nCombat Lv:       " << t_combat;
cout << "\nHorticulture Lv: " << t_horticulture;
cout << "\nReligion Lv:     " << t_religion;
cout << "\nPolitics Lv:     " << t_politics;
cout << "\nRomance Lv:      " << t_romance;
goto control;
}

if (choice == 4)
{
cout << "\n\n\nFood Gain: " << farmers - (pop / 4);
cout << "\nLumber Gain: " << lumberjacks;
cout << "\nRP Gain: " << scholars;
cout << "\nZen Gain: " << pop * 5;
cout << "\nMax. Civilians: " << houses * 50;
goto control;
}

if (choice == 5)
{
cout << "\n\n";

x = pop / 4;
if (officers > x) cout << "Angry Mob: Controlled\n";
else cout << "Angry Mob: Possible (" << officers << "/" << x << ")\n";

x = houses * 4;
if (firemen > x) cout << "Arson: Controlled\n";
else cout << "Arson: Possible (" << firemen << "/" << x << ")\n";

x = universities * 7;
if (officers > x) cout << "Sabotage: Controlled\n";
else cout << "Sabotage: Possible (" << officers << "/" << x << ")\n";

x = banks * 5;
if (officers > x) cout << "Robbery: Controlled\n";
else cout << "Robbery: Possible (" << officers << "/" << x << ")\n";

x = pop / 7;
if (doctors > x) cout << "Plauge: Controlled\n";
else cout << "Plauge: Possible (" << doctors << "/" << x << ")\n";

goto control;
}
//End of Status Control

util:
cout << "\n\n\nWhat would you like to do?\n\n";
cout << "1) Research\n";
cout << "2) Attack\n";
cout << "3) Convert\n";
cout << "4) Banking\n";
cout << "\n\nType '0' for Empire Menu\n";
cin >> choice;

if ((choice < 1) || (choice > 5)) goto control;

if (choice == 1)
{
cout << "\n\n\nYou have " << respoints << " Research Points left. What will you use them on?\n\n";
cout << "1) Housing\n";
cout << "2) Economy\n";
cout << "3) Combat\n";
cout << "4) Horticulture\n";
cout << "5) Religion\n";
cout << "6) Politics\n";
cout << "7) Romance\n";
cout << "8) Check Current Research";
cout << "\n\nType '0' for Empire Menu\n";
cin >> choice;

if ((choice < 1) || (choice > 8)) goto control;

if (choice == 1)
{
cout << "\n\nYou have " << t_housing << " Research Points in Housing.";
cout << "\nYou have a " << (t_housing / 100) << "% bonus to your maximum population.";
cout << "\nHow many more points will you put into Housing?\n";
cin >> choice;

if (choice < 1) goto util;
if (choice > respoints)
{
cout << "\n\nYou don't have that many Research Points left.";
goto control;
}
respoints = respoints - choice;
t_housing = t_housing + choice;
goto control;
}

//-------------

if (choice == 2)
{
cout << "\n\nYou have " << t_economy << " Research Points in Economy.";
cout << "\nYou have a " << (t_economy / 100) << "% bonus to your tax revenue.";
cout << "\nHow many more points will you put into Economy?\n";
cin >> choice;

if (choice < 1) goto util;
if (choice > respoints)
{
cout << "\n\nYou don't have that many Research Points left.";
goto control;
}
respoints = respoints - choice;
t_economy = t_economy + choice;
goto control;
}

//-------------

if (choice == 3)
{
cout << "\n\nYou have " << t_combat << " Research Points in Combat.";
cout << "\nYou have a " << (t_combat / 100) << "% bonus to your combat power.";
cout << "\nHow many more points will you put into Combat?\n";
cin >> choice;

if (choice < 1) goto util;
if (choice > respoints)
{
cout << "\n\nYou don't have that many Research Points left.";
goto control;
}
respoints = respoints - choice;
t_combat = t_combat + choice;
goto control;
}

//-------------

if (choice == 4)
{
cout << "\n\nYou have " << t_horticulture << " Research Points in Horticulture.";
cout << "\nYou have a " << (t_horticulture / 100) << "% bonus to your food/lumber production.";
cout << "\nHow many more points will you put into Horticulture?\n";
cin >> choice;

if (choice < 1) goto util;
if (choice > respoints)
{
cout << "\n\nYou don't have that many Research Points left.";
goto control;
}
respoints = respoints - choice;
t_horticulture = t_horticulture + choice;
goto control;
}
//-------------
if (choice == 5)
{
cout << "\n\nYou have " << t_religion << " Research Points in Religion.";
cout << "\nYou have a " << (t_religion / 100) << "% bonus to your conversion rate.";
cout << "\nHow many more points will you put into Religion?\n";
cin >> choice;

if (choice < 1) goto util;
if (choice > respoints)
{
cout << "\n\nYou don't have that many Research Points left.";
goto control;
}
respoints = respoints - choice;
t_religion = t_religion + choice;
goto control;
}

//-------------

if (choice == 6)
{
cout << "\n\nYou have " << t_politics << " Research Points in Politics.";
cout << "\nYou have a " << (t_politics / 100) << "% bonus to your protection.";
cout << "\nHow many more points will you put into Politics?\n";
cin >> choice;

if (choice < 1) goto util;
if (choice > respoints)
{
cout << "\n\nYou don't have that many Research Points left.";
goto control;
}
respoints = respoints - choice;
t_politics = t_politics + choice;
goto control;
}

//-------------

if (choice == 7)
{
cout << "\n\nYou have " << t_romance << " Research Points in Romance.";
cout << "\nYou have a " << (t_romance / 100) << "% bonus to your reproduction.";
cout << "\nHow many more points will you put into Romance?\n";
cin >> choice;

if (choice < 1) goto util;
if (choice > respoints)
{
cout << "\n\nYou don't have that many Research Points left.";
goto control;
}
respoints = respoints - choice;
t_romance = t_romance + choice;
goto control;
}

//-------------


if (choice == 8)
{
cout << "\n\nResearch Status:\n\n";
cout << "Housing:      " << (t_housing / 100) << "%\n";
cout << "Economy:      " << (t_economy / 100) << "%\n";
cout << "Combat:       " << (t_combat / 100) << "%\n";
cout << "Horticulture: " << (t_horticulture / 100) << "%\n";
cout << "Religion: " << (t_religion / 100) << "%\n";
cout << "Politics: " << (t_politics / 100) << "%\n";
cout << "Romance: " << (t_romance / 100) << "%";
goto control;
}

}

//-------------

if (choice == 2)
{
cout << "\n\nYou send your troops to attack the enemy!!";

eforce = rand() % pop +1;
y = rand() % 15 +1;
z = eforce * y;
z = z / 100;
eforce = eforce + z;
eforce = eforce + ebonus;

cout << "\n\nYou attack with " << troops << " troops!";
cout << "\nThe enemy defends with " << eforce << " troops!";

pforce = troops;
y = rand() % 15 +1;
z = pforce * y;
z = z / 100;
pforce = pforce + z;

y = t_combat / 100;
z = pforce * y;
z = z / 100;
pforce = pforce + z;

if (type == 3)
{
x = troops / 20;
pforce = pforce + x;
}

cout << "\nWith bonuses your " << troops << " troops have the power of " << pforce << "!";

if (pforce > eforce)
{
cout << "\n\nYou win the battle!!";
x = troops / 2;
troops = troops - x;
cout << "\n" << x << " of your troops were killed.";

y = pforce - eforce;

z = y / 10;
fland = fland + z;
land = land + z;
cout << "\nYou took control of " << z << " land!";

z = y * 50;
if (z > zen) z = zen;
zen = zen - z;
cout << "\n" << z << " zen was stolen from the enemy!";

y = rand() % 250 +1;
t_combat = t_combat + y;
cout << "\nOur troops gained " << y << " battle experience!";

z = rand() % 3 +1;
ebonus = ebonus + z;
}
else
{
cout << "\n\nYou lost the battle...";
x = eforce / 2;
if (x > troops) x = troops;
troops = troops - x;
cout << "\n" << x << " of your troops died in the battle.";
if (troops < 0) troops = 0;
}
goto control;
}
//--------
if (choice == 3)
{
if (priests < 1)
{
cout << "\n\n\nYou don't have any priests.";
goto control;
}
z = 0;
cout << "\n\n\nYou send " << priests << " priests to convert enemy civilians.";

for (x = priests;x > 0;x--)
{
y = rand() % 100 +1;
if (y < 75) z++;
}

y = t_religion / 100;
x = z * y;
x = x / 100;
z = z + x;

cout << "\n\nYou manage to convert " << z << " civilians!";
pop = pop + z;

x = priests - z;
if (x < 0) x = 0;
cout << "\n" << x << " priests were captured by the enemy.";
priests = priests - x;

goto control;
}

//--------



//--------
if (choice == 4)
{
cout << "\n\n\nWhat would you like to do?";
cout << "\n\n1) Deposit Money";
cout << "\n2) Withdraw Money";
cout << "\n3) Bank Status";
cout << "\n\nType '0' for Empire Menu\n";
cin >> choice;

if ((choice < 1) || (choice > 3)) goto control;

if (choice == 1)
{
cout << "\n\nYou have " << banked << " zen in the bank.";
cout << "\nYou can hold " << (banks * 5000) << " zen in total.";
cout << "\nYou have " << zen << " zen on hand.";
cout << "\nHow much will you deposit?\n";
cin >> choice;

if (choice < 1) goto control;

x = banks * 5000;
y = choice + banked;
if (y > x)
{
cout << "\n\nYou don't have that much room in the bank.";
goto control;
}

if (choice > zen)
{
cout << "\n\nYou don't have that much money";
goto control;
}

banked = banked + choice;
zen = zen - choice;
goto control;
}

//-------

if (choice == 2)
{
cout << "\n\nYou have " << banked << " zen in the bank.";
cout << "\nYou have " << zen << " zen on hand.";
cout << "\nHow much will you withdraw?\n";
cin >> choice;

if (choice < 1) goto control;

if (choice > banked)
{
cout << "You don't have that much money in the bank.";
goto control;
}

banked = banked - choice;
zen = zen + choice;
goto control;
}

if (choice == 3)
{
cout << "\n\n\nBank Status:";
cout << "\n\nGold in Bank: " << banked;
cout << "\nDaily Interest: ";


if (banked > 1000)
{
x = banked;
y = (bankers * 100) / (banks * 50);
z = x * y;
z = z / 1000;
if (z < 0) z = z * -1;
cout << z;
}
else cout << "0";

}
goto control;
}
//End of Utilize Control




//End User Control
//------------------

//------------         
//Start Upkeep
endday:
cout << "\n\n\n\nDaily Report:";


//Phase 1: Disaster
x = pop / 4;
if (officers < x)
{
y = rand() % 100 +1;
if (y < 20)
{
z = farms / 5;
farms = farms - z;
cout << "\n" << z << " of your farms were destroyed by an angry mob.";
}
}

x = houses * 4;
if (firemen < x)
{
y = rand() % 100 +1;
if (y < 20)
{
z = houses / 6;
houses = houses - z;
cout << "\n" << z << " of your houses were destroyed by an arson.";
}
}

x = universities * 7;
if (officers < x)
{
y = rand() % 100 +1;
if (y < 10)
{
if (t_housing > 0)
{
z = rand() % (t_housing / 3) +1;
t_housing = t_housing - z;
cout << "\n" << z << " of your research points in Housing were sabotaged.";
}
if (t_economy > 0)
{
z = rand() % (t_economy / 3) +1;
t_economy = t_economy - z;
cout << "\n" << z << " of your research points in Economy were sabotaged.";
}
if (t_combat > 0)
{
z = rand() % (t_combat / 3) +1;
t_combat = t_combat - z;
cout << "\n" << z << " of your research points in Combat were sabotaged.";
}
if (t_horticulture > 0)
{
z = rand() % (t_horticulture / 3) +1;
t_horticulture = t_horticulture - z;
cout << "\n" << z << " of your research points in Horticulture were sabotaged.";
}
if (t_religion > 0)
{
z = rand() % (t_religion / 3) +1;
t_religion = t_religion - z;
cout << "\n" << z << " of your research points in Religion were sabotaged.";
}
if (t_politics > 0)
{
z = rand() % (t_politics / 3) +1;
t_politics = t_politics - z;
cout << "\n" << z << " of your research points in Politics were sabotaged.";
}
if (t_romance > 0)
{
z = rand() % (t_romance / 3) +1;
t_romance = t_romance - z;
cout << "\n" << z << " of your research points in Romance were sabotaged.";
}
}
}

x = banks * 5;
if (officers < x)
{
y = rand() % 100 +1;
if (y < 10)
{
z = zen / 4;
zen = zen - z;
cout << "\n" << z << " zen was stolen.";
}
}

x = pop / 7;
if (doctors < x)
{
y = rand() % 100 +1;
if (y < 5)
{
z = pop / 3;
pop = pop - z;
cout << "\n" << z << " of your civilians were killed by a plauge.";
}
}

//Phase 2: Produce
land = land + explore;
fland = fland + explore;
cout << "\n\nYour scout explored " << explore << " land.";
explore = 0;

x = pop * 5;
y = pop / 5;
if (y > pop) x = pop * 7;
y = pop / 3;
if (y > pop) x = pop * 9;
if (merchants > pop) x = pop * 11;

z = networth / 10000;
x = x + z;

y = t_economy / 100;
z = x * y;
z = z / 100;
y = z + x;
zen = zen + y;
cout << "\nYou got " << y << " zen in tax revenue.";

x = pop / 4;
if (food > x) food = food - x;
else
{
y = x - food;
z = y * 4;
cout << "\n" << z << " civilians died of starvation.";
food = 0;
}

x = pop / 20;
x++;

y = t_romance / 100;
z = x * y;
z = z / 100;
x = x + z;

pop = pop + x;
cout << "\n" << x << " more civilians were born.";


x = lumberjacks;
y = t_horticulture / 100;
z = x * y;
z = z / 100;
y = z + x;
lumber = lumber + y;
cout << "\nYou got " << y << " more lumber.";

x = farmers;
y = t_horticulture / 100;
z = x * y;
z = z / 100;
y = z + x;
if (type == 1)
{
z = y / 20;
y = y + z;
}
food = food + y;
cout << "\nYou got " << y << " more food.";

x = scholars;
if (type == 2)
{
y = scholars / 20;
x = x + y;
}
respoints = respoints + x;

cout << "\nYou got " << x << " more Research Points.";

if (banked > 1000)
{
x = banked;
y = (bankers * 100) / (banks * 50);
z = x * y;
z = z / 1000;
if (z < 0) z = z * -1;
banked = x + z;
cout << "\nYou got " << z << " zen in bank interest.";
x = banks * 5000;
if (banked > x) banked = x;
}

//Phase 3: Overmax

x = farms * 50;
if (farmers > x)
{
y = farmers - x;
farmers = farmers - y;
pop = pop + y;
cout << "\n" << y << " farmers were unemployed due to lack of working areas.";
}

x = lumberyards * 50;
if (lumberjacks > x)
{
y = lumberjacks - x;
lumberjacks = lumberjacks - y;
pop = pop + y;
cout << "\n" << y << " lumberjacks were unemployed due to lack of working areas.";
}

x = pstats * 50;
if (officers > x)
{
y = officers - x;
officers = officers - y;
pop = pop + y;
cout << "\n" << y << " officers were unemployed due to lack of working areas.";
}

x = fstats * 50;
if (firemen > x)
{
y = firemen - x;
firemen = firemen - y;
pop = pop + y;
cout << "\n" << y << " firemen were unemployed due to lack of working areas.";
}

x = universities * 50;
if (scholars > x)
{
y = scholars - x;
scholars = scholars - y;
pop = pop + y;
cout << "\n" << y << " scholars were unemployed due to lack of working areas.";
}

x = barracks * 50;
if (troops > x)
{
y = troops - x;
troops = troops - y;
pop = pop + y;
cout << "\n" << y << " troops were unemployed due to lack of working areas.";
}

x = banks * 50;
if (bankers > x)
{
y = bankers - x;
bankers = bankers - y;
pop = pop + y;
cout << "\n" << y << " bankers were unemployed due to lack of working areas.";
}

x = hospitals * 50;
if (doctors > x)
{
y = doctors - x;
doctors = doctors - y;
pop = pop + y;
cout << "\n" << y << " doctors were unemployed due to lack of working areas.";
}

x = marketplaces * 50;
if (merchants > x)
{
y = merchants - x;
merchants = merchants - y;
pop = pop + y;
cout << "\n" << y << " merchants were unemployed due to lack of working areas.";
}

x = temples * 50;
if (priests > x)
{
y = priests - x;
priests = priests - y;
pop = pop + y;
cout << "\n" << y << " priests were unemployed due to lack of working areas.";
}

x = embassies * 50;
if (politicians > x)
{
y = politicians - x;
politicians = politicians - y;
pop = pop + y;
cout << "\n" << y << " politicians were unemployed due to lack of working areas.";
}


x = houses * 50;
y = t_housing / 100;
z = x * y;
z = z / 100;
maxpop = z + x;
if (pop > maxpop)
{
y = pop - maxpop;
pop = pop - y;
cout << "\n" << y << " civilians died due to lack of shelter.";
}

//Phase 4: Combat

if (protect < 1)
{
x = rand() % 100 +1;
if (x < 20)
{
cout << "\n\nYou were attacked by enemy forces!!";

eforce = rand() % pop +1;
y = rand() % 15 +1;
z = eforce * y;
z = z / 100;
eforce = eforce + z;
eforce = eforce + ebonus;
cout << "\n\nThe enemy attacked with " << eforce << " troops!";

cout << "\nYou defend with " << troops << " troops!";

pforce = troops;
y = rand() % 15 +1;
z = pforce * y;
z = z / 100;
pforce = pforce + z;

y = t_combat / 100;
z = pforce * y;
z = z / 100;
pforce = pforce + z;

if (type == 3)
{
x = troops / 20;
pforce = pforce + x;
}


cout << "\nWith bonuses your " << troops << " troops have the power of " << pforce << "!";

if (eforce > pforce)
{
cout << "\n\nYou lose the battle...";
protect = 2;

x = troops / 2;
troops = troops - x;
cout << "\n" << x << " troops were killed.";

y = eforce - pforce;
if (y > pop) y = pop;
pop = pop - y;
cout << "\n" << y << " civilians were killed.";

x = y / 8;
protect = protect + x;

z = y / 10;
if (z > fland) z = fland;
fland = fland - z;
land = land - z;
cout << "\nThe enemy took control of " << z << " land.";

z = y * 50;
if (z > zen) z = zen;
zen = zen - z;
cout << "\n" << z << " zen was stolen by the enemy.";

z = 0;
for (x = politicians;x > 0;x--)
{
y = rand() % 100 +1;
if (y < 3) z++;
}


protect = protect + z;
if (type == 4) protect++;

y = t_politics / 100;
z = x * y;
z = z / 100;
protect = protect + z;

cout << "\n\nYou were put into protection for " << protect << " days.";
}
else
{
cout << "\n\nYou successfully defend your territory!!";
x = eforce / 2;
troops = troops - eforce;
cout << "\n" << x << " of your troops died in the battle.";

y = rand() % 250 +1;
t_combat = t_combat + y;
cout << "\nOur troops gained " << y << " battle experience!";

z = rand() % 3 +1;
ebonus = ebonus + z;
}
}
}

//Phase 5: Networth Calculation
networth=0;
networth = networth + houses;
networth = networth + farms;
networth = networth + lumberyards;
networth = networth + pstats;
networth = networth + fstats;
networth = networth + universities;
networth = networth + barracks;
networth = networth + banks;
networth = networth + hospitals;
networth = networth + marketplaces;
networth = networth + temples;
networth = networth + embassies;
networth = networth * 50;

x=0;
x = x + farmers;
x = x + lumberjacks;
x = x + officers;
x = x + firemen;
x = x + scholars;
x = x + troops;
x = x + bankers;
x = x + doctors;
x = x + merchants;
x = x + priests;
x = x + politicians;
x = x * 2;

networth = networth + x;
networth = networth + pop;
networth = networth + (food / 3);
networth = networth + (lumber / 2);

x = fland * 5;
networth = networth + x;

days++;
if (protect > 0) protect--;

goto control;
//End Upkeep
//------------


//--------
//End Game
//--------
credits:
cout << "\n\n\nConcept, Programming, and basically almost everything: Wesley May";
cout << "\n\nSpecial Thanks to:";
cout << "\nJordan M., for letting me take your ideas.";
cout << "\n\nPeter Neufeld, for finding some bugs.";

goto menu;


load:
if (choice == 2) save = 1;
if (choice == 3) load = 1;
goto save;

quit:
return(0);
}


