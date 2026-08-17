//Freeze game
prevState=global.nazoState;
global.nazoState=NAZOSTATES.MENU;

// Set text
page = 0;
//Text array
text=["Fiddlesticks! What now?"];
//Speaker array
speaker=[""];

//Text box dimensions
textboxX=boxHorizontalMargin;
textboxY=global.guiH-(boxHeight+boxVerticalMargin);
textboxWidth=global.guiW-(boxHorizontalMargin*2);
textboxHeight=boxHeight;

//Override window on event summoned
windowOverride=undefined;
if windowOverride!=undefined{
	window=windowOverride;
}