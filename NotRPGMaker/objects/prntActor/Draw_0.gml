draw_self();

if(global.debugMode)&&(state==ACTORSTATES.CONTROL){
	
	//Show interaction "hitbox"
	var _target = instance_position(interactHitboxX, interactHitboxY, prntCheckEvent);
	
	//Blue if no event at target
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