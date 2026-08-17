//Freeze game
prevState=global.nazoState;
global.nazoState=NAZOSTATES.MENU;

file=undefined;
targetNode=undefined;

//Run initialization after variables are set by script
init_dialog = function(){
	//Stop game from crashing if bad filename is given
	if(!file_exists(file)){
		print("============================================================");
		print("NRM: FATAL ERROR!!! YARN FILE \""+string(file)+"\" DOES NOT EXIST!!!");
		print("============================================================");
		instance_destroy();
		exit;
	}

	ChatterboxLoadFromFile(file);
	chatterbox=ChatterboxCreate();

	//Jump to specified node
	if(targetNode!=undefined){
		ChatterboxJump(chatterbox, targetNode);
	}else{
		// Otherwise, default to the very first node found in the 
		var _nodes = ChatterboxGetSourceNodeArray(file)
	
		if (array_length(_nodes) > 0) {
			ChatterboxJump(chatterbox, _nodes[0]);
		}
	}
}

//Option menu layout
choicePaddingX = textPaddingHorizontal;
choicePaddingY = textPaddingVertical;
choiceLineHeight = 20;

// Cursor Setup
cursor = 0;
cursorWidth = sprite_get_width(cursorSprite);
cursorYOffset = sprite_get_height(cursorSprite) / 2;

curSpd = sprite_get_speed(cursorSprite);
curFrameCount = sprite_get_number(cursorSprite);
	
curFrame=0;

// Page & State
page = 0;

text="ERROR! YARN FILE NOT SPECIFIED";

//Text box dimensions
textboxX=boxHorizontalMargin;
textboxY=global.guiH-(boxHeight+boxVerticalMargin);
textboxWidth=global.guiW-(boxHorizontalMargin*2);
textboxHeight=boxHeight;