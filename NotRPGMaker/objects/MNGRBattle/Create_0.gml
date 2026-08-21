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
turn=0;

#region UI

//Battle UI Container
battleUIHeight = 86

uiContainerX = horizontalMargin;
uiContainerY = (global.guiH - battleUIHeight) - global.windowMarginV;

uiContainerW = global.guiW - horizontalMargin*2;
uiContainerH = battleUIHeight;

//Battle commands
commandWindowW=80;

//Action Menu
battleMenu=["Attack","Magic","Item","Flee"];
battleMenuCursor=0;

curSpd = sprite_get_speed(global.defaultCursor);
curFrameCount = sprite_get_number(global.defaultCursor);
curW = sprite_get_width(global.defaultCursor);
curH = sprite_get_height(global.defaultCursor);
	
curFrame=0;

#endregion