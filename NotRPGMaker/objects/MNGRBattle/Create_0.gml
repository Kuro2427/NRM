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

global.party = [global.heroes.hero];

state = BATTLESTATES.INIT;
turnQueue = [];

//Battle narration
narrationText = "A strange enemy appeared!"

//Battle UI
heroCardW=90;
heroCardH=75;
heroCardX=0;
heroCardY=(global.guiH-heroCardH)-windowPaddingV;
raiseWhenTunUp=16;
raiseModifier=0;

//Action Menu
battleMenu=["Attack","Magic","Item","Flee"];

turn=0;