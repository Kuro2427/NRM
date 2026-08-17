if(global.debugMode){
	var _targetfps=60;
	var _pct=(fps/_targetfps)*100;

	
	draw_healthbar(1,1,global.guiW-1,5,_pct,c_black,c_red,c_lime,0,true,true);
	
	
	draw_set_colour(c_black);
	draw_text_scribble(11,8,string(fps)+"fps ("+string(fps_real)+")");
	
	draw_set_colour(c_white);
	draw_text_scribble(10,7,string(fps)+"fps ("+string(fps_real)+")");
	
}