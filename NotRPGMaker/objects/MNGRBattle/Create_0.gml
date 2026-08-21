//Define battle states
enum BATTLESTATES{
	INIT,
	PLAYER_INPUT,
	ENEMY_INPUT,
	TURN_EXECUTION,
	CHECK_WIN_LOSS,
	VICTORY,
	DEFEAT
}

//Dummy battle data
global.battleData = {
	troop:["coolFrungle"],
	prevRoom:rmDebug,
	prevX: 16,
	prevY: 16,
	prevDir: DIRECTIONS.DOWN
};

global.party = [global.heroes.hero,global.heroes.hero,global.heroes.hero,global.heroes.hero];

state = BATTLESTATES.INIT;
turnQueue = [];

//Battle UI Container
battleUIHeight = 84

uiContainerX = horizontalMargin;
uiContainerY = (global.guiH - battleUIHeight) - global.windowMarginV;

uiContainerW = global.guiW - horizontalMargin*2;
uiContainerH = battleUIHeight;

//Battle commands
commandWindowW=80;

//Action Menu
battleMenu=["Attack","Magic","Item","Flee"];

turn=0;