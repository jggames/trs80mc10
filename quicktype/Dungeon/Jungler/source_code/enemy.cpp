#include "stdafx.h"
#include "enemy.h"


Enemy::Enemy(void)
{
	X = 0;
	Y = 0;

	route[SPEED] = SPEED_ENEMY;
	route[DELAY] = SPEED_ENEMY;

	destroyed = false;

	color[0] = 12;
	color[1] = 14;

	debug = 205; //179;

	way = RECHTS;
}

Enemy::Enemy(int _speed)
{
	X = 5;
	Y = 4;

	route[SPEED] = _speed;
	route[DELAY] = SPEED_ENEMY;

	destroyed = false;

	color[0] = 12;
	color[1] = 14;

	debug = 30;

	way = RECHTS;
}

void Enemy::move(Level* _l_ptr, int _v)
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
			_l_ptr->map[X][Y][0] = ENEMY;
			_l_ptr->map[X][Y][1] = i;
			//draw();
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
			X--;
			_l_ptr->map[X][Y][0] = ENEMY;
			_l_ptr->map[X][Y][1] = i;
			//draw();
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

			Y++;
			_l_ptr->map[X][Y][0] = ENEMY;
			_l_ptr->map[X][Y][1] = i;
			//draw();
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
			// Wenn rechts ein stein liegt, stein muss neu gezeichnet werden
			if (_l_ptr->map[X+1][Y][0] == STONE)
				_l_ptr->draw(X+1, Y, STONE);
			else if (_l_ptr->map[X+1][Y][0] == PLAYER)
				_l_ptr->draw(X+1, Y, PLAYER);

			Y--;
			_l_ptr->map[X][Y][0] = ENEMY;
			_l_ptr->map[X][Y][1] = i;
			//draw();
		}
	}
}

void Enemy::slowdown(void)
{
	if (route[DELAY] < route[SPEED])
		route[DELAY]++;
	else
		route[DELAY] = 0;
}

void Enemy::draw(void)
{
    COORD point;
    point.X = X;
    point.Y = Y;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), point);

	setColor(color[0], color[1]); //15

//	if (route[DELAY] == 0 || route[DELAY] == 2)
//	{
	int c = color[0];
	color[0] = color[1];
	color[1] = c;
//	}
	std::cout << (char)ENEMY;
	//std::cout << (char)debug;
	//std::cout << (char)debug;
}

/*
179
186*/

// Debug
void Enemy::draw(Level* _l_ptr)
{
    COORD point;
    point.X = X;
    point.Y = Y;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), point);
	setColor(12, 14); //15
	std::cout << _l_ptr->map[X][Y][1];
}

void Enemy::setColor(int colorBack, int colorFore)
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
