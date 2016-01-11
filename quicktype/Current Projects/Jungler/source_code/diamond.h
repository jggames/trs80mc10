#ifndef DIAMOND_H
#define DIAMOND_H

#include "level.h"

class Diamond
{
public:
	Diamond(void);
	Diamond(int _speed);

	void move(Level* _l_ptr, int _v);
	void gravity(Level* _l_ptr);

	int getX() { return X; }
	int getY() { return Y; }

	void setX(int _x) { X = _x; }
	void setY(int _y) { Y = _y; }

	int getSpeed() { return fall[SPEED]; }
	int getDelay() { return fall[DELAY]; }

	void setDelay(int v) { fall[DELAY] = v; }

	void slowdown();

	int getState() { return destroyed; }
	void setState(bool _v) { destroyed = _v; }

	void draw(void);
	void draw(Level* _l_ptr);

	void setColor(int colorBack, int colorFore);
	int color;

private:
	int X;
	int Y;
	bool destroyed;

	int fall[2];

};

#endif