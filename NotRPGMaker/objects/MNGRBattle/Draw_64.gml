//Draw container bounds if in debug mode
if(global.debugMode){
	draw_set_colour(c_red);
	draw_rectangle(uiContainerX,uiContainerY,uiContainerX+uiContainerW,uiContainerY+uiContainerH,true);
}

#region 1. Draw battle commands

//Draw window
draw_sprite_stretched(battleWindow,0,uiContainerX,uiContainerY,commandWindowW,uiContainerH);

//Draw text
for(i=0; i<array_length(battleMenu); i++){
	var _textX = uiContainerX + global.textPadingH;
	var _textY = uiContainerY + global.textPaddingV;
	
	var _text = global.defaultUIFont+battleMenu[i];
	var _lineHeight = string_height_scribble(_text)
	
	scribble(_text).draw(_textX, _textY+_lineHeight*i);
}

#endregion

#region 2. Draw party list

var _partyListX = uiContainerX + commandWindowW + global.windowMarginH;
var _partyListW = uiContainerW - commandWindowW - global.windowMarginH;

//Draw window
draw_sprite_stretched(battleWindow,0,_partyListX,uiContainerY,_partyListW,battleUIHeight);

for(i=0; i<array_length(global.party); i++;){
	var _highlight = ""
	var _textX = _partyListX + global.textPadingH;
	var _textY = uiContainerY + global.textPaddingV;
	
	//Highlight hero name if it's their turn
	if(turn==i) _highlight = ""
	else _highlight = "[c_gray]"
	
	var _text = global.defaultUIFont+global.party[i].heroName;
	var _lineHeight = string_height_scribble(_text);
	
	//Draw hero name
	scribble(_highlight+_text).draw(_textX,_textY+_lineHeight*i);
	
	//2.5 Draw hero HP/MP
	//Everything in this secrion is right aligned
	
		var _heroStatsContainerX = _partyListX + (_partyListW - global.textPadingH);
		var _heroStatsContainerY = _textY+(_lineHeight-1)*i;
		var _heroStatsContainerW = _partyListW/1.5;
		var _heroStatsContainerH = _lineHeight;
		
		var _heroStatsX = _heroStatsContainerX+_heroStatsContainerW;
	
		//Draw hero stats container bounds if in debug mode
		if(global.debugMode) draw_rectangle(_heroStatsContainerX,_heroStatsContainerY,_heroStatsContainerX-_heroStatsContainerW,_heroStatsContainerY+_heroStatsContainerH,true);
		
		//Draw MP
		
			//Get MP and convert to highlighted string with UI font
			var _mpString = _highlight+global.defaultUIFont+    "MP: "+string(global.party[i].mp)+"/"+string(global.party[i].maxMP);
			var _mpStringW = string_width_scribble(_mpString);
		
			var _mpBarX = (_heroStatsContainerX-_mpStringW)-1;
			var _mpBarY =_heroStatsContainerY+8;
			var _mpbarW = _mpStringW;
			
			//Draw fake bar outline
			draw_set_colour(c_black);
			draw_rectangle(_mpBarX-1,_mpBarY-1,_mpBarX+_mpbarW+1,_mpBarY+6,false);
		
			//Draw MP bar
			var _mpPerc = (global.party[i].mp/global.party[i].maxMP) * 100;
			draw_healthbar(_mpBarX,_mpBarY,_mpBarX+_mpbarW,_mpBarY+5,_mpPerc,c_black,c_gray,c_teal,0,true,false);
		
			//Draw MP Text
			scribble(_mpString).align(fa_right,fa_top).draw(_heroStatsContainerX,_heroStatsContainerY);
			
		//Draw HP
		
			//Get HP and convert to highlighted string with UI font
			var _hpString = _highlight+global.defaultUIFont+    "HP: "+string(global.party[i].hp)+"/"+string(global.party[i].maxHP);
			var _hpStringW = string_width_scribble(_mpString);
			var _hpX = (_heroStatsContainerX-_hpStringW)-_hpStringW-(global.textPadingH/2);
		
			var _hpBarX = _hpX-2;
			var _hpBarY =_heroStatsContainerY+8;
			var _hpbarW = _hpStringW;
			
			//Draw fake bar outline
			draw_set_colour(c_black);
			draw_rectangle(_hpBarX-1,_hpBarY-1,_hpBarX+_hpbarW+1,_hpBarY+6,false);
		
			//Draw MP bar
			var _hpPerc = (global.party[i].hp/global.party[i].maxHP) * 100;
			draw_healthbar(_hpBarX,_hpBarY,_hpBarX+_hpbarW,_hpBarY+5,_hpPerc,c_black,c_maroon,c_green,0,true,false);
		
			//Draw MP Text
			scribble(_hpString).align(fa_left,fa_top).draw(_hpX,_heroStatsContainerY);
	
}

#endregion