#ifndef DETONATE_H
#define DETONATE_H

#include "stdafx.h"
#include "level.h"

class Detonate
{
public:
	Detonate(void);
	Detonate(int _x, int _y);

	void setColor(int colorBack, int colorFore);

	int getX() { return X; }
	int getY() { return Y; }

	int getSpeed() { return fire[SPEED]; }
	int getDelay() { return fire[DELAY]; }

	void setDelay(int _v) { fire[DELAY] = _v; }

	void slowdown(void);
	void init(int _x, int _y);

	void firing(Level* _l_ptr);
	int getIndex() { return index; }

	void draw(void);

private:
	//COORD point;
	int X;
	int Y;

	int fire[2];
	int sprite[5];

	int color[2];

	int index;
	
};

#endif