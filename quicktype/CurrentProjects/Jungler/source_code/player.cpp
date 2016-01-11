#include "stdafx.h"
#include "player.h"


Player::Player(void)
{
	X = 2;
	Y = 3;

	walk[SPEED] = SPEED_PLAYER;
	walk[DELAY] = 0;

	destroyed = false;
}

//Player::Player(Level* _l_ptr, Stone* _s_ptr, int _speed)
Player::Player(int _speed)
{
	X = 2;
	Y = 3;

	walk[SPEED] = _speed;
	walk[DELAY] = 0;

/*	level_ptr = _l_ptr;
	level_ptr->map[X][Y][0] = PLAYER;

	stone_ptr = _s_ptr;*/

	destroyed = false;
} 

void Player::init(Level* _l_ptr)
{
	level_ptr = _l_ptr;
}

void Player::move(int _v)
{
	if (_v == RECHTS)
	{
		PlaySound( TEXT("walk2.wav"), NULL, SND_ASYNC);
		X++;
		draw();
	}
	else if (_v == LINKS)
	{
		PlaySound( TEXT("walk2.wav"), NULL, SND_ASYNC);
		X--;
		draw();
	}
	else if (_v == RUNTER)
	{
		PlaySound( TEXT("walk2.wav"), NULL, SND_ASYNC);
		Y++;
		draw();
	}
	else if (_v == RAUF) 
	{
		PlaySound( TEXT("walk2.wav"), NULL, SND_ASYNC);
		Y--;
		draw();
	}
}




/*
void Player::move(int _v)
{
	if (_v == RECHTS)
	{
		// Nur wenn rechts Sand oder Leer ist
		if (level_ptr->map[X+1][Y][0] == SAND || level_ptr->map[X+1][Y][0] == EMPTY)
		{
			level_ptr->map[X][Y][0] = EMPTY;
			level_ptr->draw(X, Y, EMPTY);
			X++;
			level_ptr->map[X][Y][0] = PLAYER; 
			draw();
		}
		// Spieler schiebt stein
		else if (level_ptr->map[X+1][Y][0] == STONE && level_ptr->map[X+2][Y][0] == EMPTY)
		{
			stone_ptr->move(RECHTS);
		
	}
	else if (_v == LINKS)
	{
		// Nur wenn links Sand oder Leer ist
		if (level_ptr->map[X-1][Y][0] == SAND || level_ptr->map[X-1][Y][0] == EMPTY)
		{
			level_ptr->map[X][Y][0] = EMPTY;
			level_ptr->draw(X, Y, EMPTY);
			// Wenn rechts ein stein liegt, stein muss neu gezeichnet werden
			if (level_ptr->map[X+1][Y][0] == STONE)
				level_ptr->draw(X+1, Y, STONE);
			X--;
			level_ptr->map[X][Y][0] = PLAYER;
			draw();
		}
		else if (level_ptr->map[X-1][Y][0] == STONE && level_ptr->map[X-2][Y][0] == EMPTY)
		{
			stone_ptr->move(LINKS);
		}
	}
	else if (_v == RUNTER)
	{
		if (level_ptr->map[X][Y+1][0] == SAND || level_ptr->map[X][Y+1][0] == EMPTY)
		{
			level_ptr->map[X][Y][0] = EMPTY;
			level_ptr->draw(X, Y, EMPTY);
			// Wenn rechts ein stein liegt, stein muss neu gezeichnet werden
			if (level_ptr->map[X+1][Y][0] == STONE)
				level_ptr->draw(X+1, Y, STONE);

			Y++;
			level_ptr->map[X][Y][0] = PLAYER;
			draw();
		}
	}
	else if (_v == RAUF) 
	{
		if (level_ptr->map[X][Y-1][0] == SAND || level_ptr->map[X][Y-1][0] == EMPTY)
		{
			level_ptr->map[X][Y][0] = EMPTY;
			level_ptr->draw(X, Y, EMPTY);
			// Wenn rechts ein stein liegt, stein muss neu gezeichnet werden
			if (level_ptr->map[X+1][Y][0] == STONE)
				level_ptr->draw(X+1, Y, STONE);
			Y--;
			level_ptr->map[X][Y][0] = PLAYER;
			draw();
		}
	}
}*/

void Player::slowdown(void)
{
	if (walk[DELAY] < walk[SPEED])
		walk[DELAY]++;
	else
		walk[DELAY] = 0;
}

void Player::draw(void)
{
    COORD point;
    point.X = X;
    point.Y = Y;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), point);
	setColor(black, 14);
	std::cout << (char)PLAYER;
}

void Player::setColor(int colorBack, int colorFore)
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