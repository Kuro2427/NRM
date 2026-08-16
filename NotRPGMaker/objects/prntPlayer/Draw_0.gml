draw_self();

if(global.debugMode){
	
	//Show interaction "hitbox"
	var _target = instance_position(interactHitboxX, interactHitboxY, prntCheckEvent);
	
	if(_target==noone){
		draw_set_colour(c_blue);
	}
	else{
		draw_set_colour(c_lime);
	}
	
	
	draw_set_alpha(0.5);
	
	draw_rectangle(interactHitboxX-2,interactHitboxY-2,interactHitboxX+2,interactHitboxY+2,false);
	
	draw_set_alpha(1);
	draw_set_colour(c_white);
	
}