#include "stdafx.h"
#include "detonate.h"


Detonate::Detonate(void)
{
	X = 0;
	Y = 0;

/*	sprite[0] = 250;
	sprite[1] = 42;
	sprite[2] = 15;
	sprite[3] = 219; //42;
	sprite[4] = EMPTY;*/

	sprite[0] = 42;
	sprite[1] = 15;
	sprite[2] = 219;
	sprite[3] = 250; //42;
	sprite[4] = EMPTY;

	index = 0;

	fire[SPEED] = SPEED_FIRE;
	fire[DELAY] = 0;

	color[0] = 0;
	color[1] = 14;

}

//Player::Player(Level* _l_ptr, Stone* _s_ptr, int _speed)
Detonate::Detonate(int _x, int _y)
{
	X = _x;
	Y = _y;

	fire[SPEED] = SPEED_FIRE;
	fire[DELAY] = 0;

	color[0] = 12;
	color[1] = 14;
}

void Detonate::init(int _x, int _y)
{
	X = _x;
	Y = _y;
}

void Detonate::slowdown(void)
{
	if (fire[DELAY] < fire[SPEED])
		fire[DELAY]++;
	else
		fire[DELAY] = 0;
}

void Detonate::draw(void)
{
    COORD point;
    point.X = X-1;
    point.Y = Y-1;
/*	int c = color[0];
	color[0] = color[1];
	color[1] = c;*/

	for (int y=0; y<3; y++)
		for (int x=0; x<3; x++)
		{
			point.X = X-1+x;
			point.Y = Y-1+y;
			// ist explosion auch nicht auf menü-rand?
			if (point.X > 1 && point.X < 78 && point.Y > 2 && point.Y < 23)
			{
				SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), point);
				setColor(color[0], color[1]);
				std::cout << (char)sprite[index];
			}
		}


/*	 << (char)sprite[index] << (char)sprite[index];
    point.X = X-1;
    point.Y = Y;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), point);
	setColor(color[0], color[1]);
	std::cout << (char)sprite[index] << (char)sprite[index] << (char)sprite[index];
    point.X = X-1;
    point.Y = Y+1;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), point);
	setColor(color[0], color[1]);
	std::cout << (char)sprite[index] << (char)sprite[index] << (char)sprite[index];*/
}

void Detonate::setColor(int colorBack, int colorFore)
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
          
void Detonate::firing(Level* _l_ptr)
{
	if (getDelay() == 0)
	{
		draw();
		// auf map eintragen, wo es brennt bei explosion
		if (index<4)
		{
			_l_ptr->map[X-1][Y-1][0] = FIRE; _l_ptr->map[X][Y-1][0] = FIRE; _l_ptr->map[X+1][Y-1][0] = FIRE;
			_l_ptr->map[X-1][Y][0] = FIRE; _l_ptr->map[X][Y][0] = FIRE; _l_ptr->map[X+1][Y][0] = FIRE;
			_l_ptr->map[X-1][Y+1][0] = FIRE; _l_ptr->map[X][Y+1][0] = FIRE; _l_ptr->map[X+1][Y+1][0] = FIRE;
		}
		else {
			_l_ptr->map[X-1][Y-1][0] = EMPTY; _l_ptr->map[X][Y-1][0] = EMPTY; _l_ptr->map[X+1][Y-1][0] = EMPTY;
			_l_ptr->map[X-1][Y][0] = EMPTY; _l_ptr->map[X][Y][0] = EMPTY; _l_ptr->map[X+1][Y][0] = EMPTY;
			_l_ptr->map[X-1][Y+1][0] = EMPTY; _l_ptr->map[X][Y+1][0] = EMPTY; _l_ptr->map[X+1][Y+1][0] = EMPTY;

			if (_l_ptr->map[X+2][Y-1][0] == STONE)
				_l_ptr->draw(X+2, Y-1, STONE);
			if (_l_ptr->map[X+2][Y][0] == STONE)
				_l_ptr->draw(X+2, Y, STONE);
			if (_l_ptr->map[X+2][Y+1][0] == STONE)
				_l_ptr->draw(X+2, Y+1, STONE);

			if (_l_ptr->map[X+2][Y-1][0] == PLAYER)
				_l_ptr->draw(X+2, Y-1, PLAYER);
			if (_l_ptr->map[X+2][Y][0] == PLAYER)
				_l_ptr->draw(X+2, Y, PLAYER);
			if (_l_ptr->map[X+2][Y+1][0] == PLAYER)
				_l_ptr->draw(X+2, Y+1, PLAYER);
		}

		index++;
	}
	slowdown();
}