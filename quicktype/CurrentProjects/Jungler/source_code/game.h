#ifndef GAME_H
#define GAME_H

#include "stdafx.h"
#include "level.h"
#include "player.h"
#include "stone.h"
#include "enemy.h"
#include "detonate.h"
#include "diamond.h"

class Game
{
public:
	Game(void);
	~Game();

	void init(Player* _p_ptr);

	void move(int _v);
	//void gravity(void);

	void update(void);
	void debug(void);
	void gravity(void);
	void ai(void);

	Player* player_ptr;
	
	Level level;
	void explosion(int _x, int _y);

	void setColor(int colorBack, int colorFore);
	void centerText(const char *message, int ypos);
	void centerText(int _l, const char *text1, int _d, const char *text2, int _t, const char *text3, int _p, const char *text4, int ypos);
	void gotoxy(int _x, int _y);

	void cursorHide();
//     // Iterator (zum Durchlaufen):
//     vector<int>::iterator i;
	int color;

	void restart(void);

private:
	Stone* stone_ptr;
	std::vector<Stone*> stoneVec;

	Diamond* dia_ptr;
	std::vector<Diamond*> diaVec;

	Enemy* enemy_ptr;
	std::vector<Enemy*> enemyVec;

	//int MAX_STONE;
	Detonate* expl_ptr;
	std::vector<Detonate*> explVec;

	int curr_diamond;
	int curr_time[2];
	bool ending;
};

#endif