#ifndef _PLAYER_H
#define _PLAYER_H

#include "level.h"
//#include "stone.h"

class Player
{
public:
	Player(void);
	Player(int _speed);

	void move(int _v);

	void init(Level *_l_ptr);

	int getX() { return X; }
	int getY() { return Y; }

	int getSpeed() { return walk[SPEED]; }
	int getDelay() { return walk[DELAY]; }

	int getState() { return destroyed; }
	void setState(bool _v) { destroyed = _v; }

	void setDelay(int v) { walk[DELAY] = v; }

	void slowdown();

	void draw(void);

	void setColor(int colorBack, int colorFore);

private:
	int X;
	int Y;

	int walk[2];

	Level* level_ptr;
	bool destroyed;

};

#endif