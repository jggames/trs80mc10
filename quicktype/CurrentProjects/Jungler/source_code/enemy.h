#ifndef ENEMY_H
#define ENEMY_H

#include "level.h"

class Enemy
{
public:
	Enemy(void);
	Enemy(int _speed);

	void move(Level* _l_ptr, int _v);
	//void gravity(Level* _l_ptr);

	int getX() { return X; }
	int getY() { return Y; }

	void setX(int _x) { X = _x; }
	void setY(int _y) { Y = _y; }

	int getSpeed() { return route[SPEED]; }
	int getDelay() { return route[DELAY]; }

	void setDelay(int v) { route[DELAY] = v; }

	void slowdown();

	int getState() { return destroyed; }
	void setState(bool _v) { destroyed = _v; }

	int getWay() { return way; }
	void setWay(int _v) { way = _v; }

	void draw(void);
	void draw(Level* _l_ptr);

	void setColor(int colorBack, int colorFore);
	int debug;

private:
	int X;
	int Y;
	bool destroyed;

	int color[2];
	int route[2];
	int way;

	//Level* level_ptr;

};

#endif