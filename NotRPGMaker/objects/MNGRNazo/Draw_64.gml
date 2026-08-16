if(global.isDebugMode){
	draw_set_colour(c_black);
	draw_text(12,12,string(fps)+"fps ("+string(fps_real)+")");
	
	draw_set_colour(c_white);
	draw_text(10,10,string(fps)+"fps ("+string(fps_real)+")");
}