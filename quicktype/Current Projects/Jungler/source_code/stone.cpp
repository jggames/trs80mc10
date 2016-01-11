#include "stdafx.h"
#include "stone.h"


Stone::Stone(void)
{
	X = 0;
	Y = 0;

	fall[SPEED] = SPEED_STONE;
	fall[DELAY] = SPEED_STONE;

	destroyed = false;

	debug = 12;
}

Stone::Stone(int _speed)
{
	X = 5;
	Y = 4;

	fall[SPEED] = _speed;
	fall[DELAY] = SPEED_STONE;

	destroyed = false;
}

void Stone::move(Level* _l_ptr, int _v)
{
	if (_v == RECHTS)
	{
		// Nur wenn rechts Leer ist
		if (_l_ptr->map[X+1][Y][0] == EMPTY)
		{
			// index umkopieren
			int i = _l_ptr->map[X][Y][1];
			_l_ptr->map[X][Y][1] = NULL;

			_l_ptr->map[X][Y][0] = EMPTY;
			_l_ptr->draw(X, Y, EMPTY);
			X++;
			_l_ptr->map[X][Y][0] = STONE;
			_l_ptr->map[X][Y][1] = i;
			draw();
		}
	}
	else if (_v == LINKS)
	{
		// Nur wenn links Leer ist
		if (_l_ptr->map[X-1][Y][0] == EMPTY)
		{
			// index umkopieren
			int i = _l_ptr->map[X][Y][1];
			_l_ptr->map[X][Y][1] = NULL;

			_l_ptr->map[X][Y][0] = EMPTY;
			_l_ptr->draw(X, Y, EMPTY);
			// Wenn rechts ein stein liegt, stein muss neu gezeichnet werden
			if (_l_ptr->map[X+1][Y][0] == STONE)
				_l_ptr->draw(X+1, Y, STONE);
			else if (_l_ptr->map[X+1][Y][0] == PLAYER)
				_l_ptr->draw(X+1, Y, PLAYER);
			else if (_l_ptr->map[X+1][Y][0] == DIAMOND)
				_l_ptr->draw(X+1, Y, DIAMOND);
			X--;
			_l_ptr->map[X][Y][0] = STONE;
			_l_ptr->map[X][Y][1] = i;
			draw();
		}
	}
	else if (_v == RUNTER)
	{
		if (_l_ptr->map[X][Y+1][0] == EMPTY)
		{
			// index umkopieren
			int i = _l_ptr->map[X][Y][1];
			_l_ptr->map[X][Y][1] = NULL;

			_l_ptr->map[X][Y][0] = EMPTY;
			_l_ptr->draw(X, Y, EMPTY);
			// Wenn rechts ein stein liegt, stein muss neu gezeichnet werden
			if (_l_ptr->map[X+1][Y][0] == STONE)
				_l_ptr->draw(X+1, Y, STONE);
			else if (_l_ptr->map[X+1][Y][0] == PLAYER)
				_l_ptr->draw(X+1, Y, PLAYER);
			else if (_l_ptr->map[X+1][Y][0] == DIAMOND)
				_l_ptr->draw(X+1, Y, DIAMOND);

//			if (_l_ptr->map[X][Y+2][0]!=EMPTY) 
//				PlaySound( TEXT("stone.wav"), NULL, SND_ASYNC);

			Y++;
			_l_ptr->map[X][Y][0] = STONE;
			_l_ptr->map[X][Y][1] = i;
			draw();
		}
	}
	else if (_v == RAUF) 
	{
		if (_l_ptr->map[X][Y-1][0] == EMPTY)
		{
			// index umkopieren
			int i = _l_ptr->map[X][Y][1];
			_l_ptr->map[X][Y][1] = NULL;

			_l_ptr->map[X][Y][0] = EMPTY;
			_l_ptr->draw(X, Y, EMPTY);
			Y--;
			_l_ptr->map[X][Y][0] = STONE;
			_l_ptr->map[X][Y][1] = i;
			draw();
		}
	}
}
/*
void Stone::gravity(Level* _l_ptr)
{
	if (getDelay() == 0)
	{
		if (_l_ptr->map[X][Y+1][0] == EMPTY)
		{
			move(_l_ptr, RUNTER);
		}
		else if (_l_ptr->map[X-1][Y][0] == EMPTY && _l_ptr->map[X-1][Y+1][0] == EMPTY
			&& (_l_ptr->map[X][Y+1][0] == STONE || _l_ptr->map[X][Y+1][0] == WALL || _l_ptr->map[X][Y+1][0] == DIAMOND))
		{
			move(_l_ptr, LINKS);
		}
		else if (_l_ptr->map[X+1][Y][0] == EMPTY && _l_ptr->map[X+1][Y+1][0] == EMPTY
			&& (_l_ptr->map[X][Y+1][0] == STONE || _l_ptr->map[X][Y+1][0] == WALL || _l_ptr->map[X][Y+1][0] == DIAMOND))
		{
			move(_l_ptr, RECHTS);
		}
	}
	slowdown();
}*/

void Stone::slowdown(void)
{
	if (fall[DELAY] > 0)
		fall[DELAY]--;
	else
		fall[DELAY] = fall[SPEED];
}

void Stone::draw(void)
{
    COORD point;
    point.X = X;
    point.Y = Y;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), point);
	setColor(black, 3); //11
	std::cout << (char)STONE;
}

// Debug
void Stone::draw(Level* _l_ptr)
{
    COORD point;
    point.X = X;
    point.Y = Y;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), point);
	setColor(black, 3); //15
	//std::cout << (char)STONE;
	std::cout << _l_ptr->map[X][Y][1];
}

void Stone::setColor(int colorBack, int colorFore)
{
    int back = 0;
    if (colorBack & 1) back |= BACKGROUND_BLUE;
    if (colorBack & 2) back |= BACKGROUND_GREEN;
    if (colorBack & 4) back |= BACKGROUND_RED;
    if (colorBack & 8) back |= BACKGROUND_INTENSITY;

    int fore = 0;
    if (colorFore & 1) fore |= FOREGROUND_BLUE;
    if (colorFore & 2) fore |= FOREGROUND_GREEN;
    if (colorFore & 4) fore |= FOREGROUND_RED;
    if (colorFore & 8) fore |= FOREGROUND_INTENSITY;

    SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), back | fore);
}
