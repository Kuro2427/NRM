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

enum BATTLEMENUSTATES{
	ACTION,
	MAGIC,
	ITEM
}

battleMenuState = BATTLEMENUSTATES.ACTION;

//Dummy battle data
global.battleData = {
	troop:["coolFrungle"],
	canFlee:true,
	prevRoom:rmDebug,
	prevX: 16,
	prevY: 16,
	prevDir: DIRECTIONS.DOWN
};

global.party = [global.heroes.hero,global.heroes.hero,global.heroes.hero,global.heroes.hero];

partySize = array_length(global.party);
heroChoiceTurn = 0;

state = BATTLESTATES.INIT;

//Turn management
turnQueue = [];


#region UI

//Battle UI Container
battleUIHeight = 86

uiContainerX = horizontalMargin;
uiContainerY = (global.guiH - battleUIHeight) - global.windowMarginV;

uiContainerW = global.guiW - horizontalMargin*2;
uiContainerH = battleUIHeight;


curSpd = sprite_get_speed(global.defaultCursor);
curFrameCount = sprite_get_number(global.defaultCursor);
curW = sprite_get_width(global.defaultCursor);
curH = sprite_get_height(global.defaultCursor);
	
curFrame=0;

#endregion

#region Battle Action Menu

//Battle commands
commandWindowW=80;

//Action Menu
battleMenu=["Attack","Magic","Item","Flee"];

#region What happens when you pick each menu option

selectAttack = function(){
	print("schwingaling! you did 0 damage");
}

selectMagic = function(){
	print("bazinga! you cast a powerful spell")
}

selectItem = function(){
	print("...?! you reach into your pockets but all your items had fallen through a comically big hole in them you hadn't noticed!")
}

selectFlee = function(){
	//Show text if player 
	if(global.battleData.canFlee){
		show_dumb_textbox(["Now is our chance! Make a run for it!"]);
	}
}

#endregion

battleMenuFunctions = [selectAttack,selectMagic,selectItem,selectFlee];
battleMenuCursor=0;
battleMenuActionPicked=undefined;

#endregion