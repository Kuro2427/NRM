if(global.debugMode){
	draw_set_colour(c_black);
	draw_text_scribble(11,8,string(fps)+"fps ("+string(fps_real)+")");
	
	draw_set_colour(c_white);
	draw_text_scribble(10,7,string(fps)+"fps ("+string(fps_real)+")");
}