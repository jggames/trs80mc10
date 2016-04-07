// stdafx.h : Includedatei für Standardsystem-Includedateien
// oder häufig verwendete projektspezifische Includedateien,
// die nur in unregelmäßigen Abständen geändert werden.
//
#ifndef STDAFX_H
#define STDAFX_H

#pragma once

#include "targetver.h"

#define RAUF 10000
#define RECHTS 10001
#define RUNTER 10002
#define LINKS 10003

#define ADD 10004

const int SPEED = 0;
const int DELAY = 1;

const int SPEED_PLAYER = 1;
const int SPEED_ENEMY = 3;
const int SPEED_STONE = 2;
const int SPEED_FIRE = 1;

const int MAX_X = 80;
const int MAX_Y = 25;

const int MAX_EMEMY = 8;

#define EMPTY 32
#define SAND 177 //219
#define ROCK 167 //206 //188
#define WALL 58 //197 //177
#define STONE 169 //184
#define PLAYER 1
#define ENEMY 186 //186 //2      <-------------------------
#define DIAMOND 254 //4
#define FIRE 0

const int KEY_UP = 0x48;
const int KEY_DOWN = 0x50;
const int KEY_LEFT = 0x4b;
const int KEY_RIGHT = 0x4d;
const int KEY_ESCAPE = 0x1b;
const int KEY_RETURN = 0x0d;

const int CONSOLE_WIDTH = 80;
const int CONSOLE_HEIGHT = 25;

#include <cstdio>
#include <conio.h>
#include <tchar.h>
#include <windows.h>
#include <WinCon.h>
#include <iostream>
#include <stdlib.h>
#include <vector>
#include <dos.h> 
#include <Mmsystem.h>
#include <ctime>

enum color
{
    black,
    darkblue,
    darkgreen,
    darkcyan,
    darkred,
    darkpurple,
    darkgray,
    darkwhite,
    gray,
    blue,
    green,
    cyan,
    red,
    purple,
    yellow,
    white
};


// TODO: Hier auf zusätzliche Header, die das Programm erfordert, verweisen.
#endif