//Get input
keyLeft=keyboard_check(vk_left);
keyRight=keyboard_check(vk_right);
keyUp=keyboard_check(vk_up);
keyDown=keyboard_check(vk_down);

keyUse=keyboard_check_pressed(ord("Z"));

#region Movement

//Calculate movement
hsp=keyRight-keyLeft;
vsp=keyDown-keyUp;

// Normalize movement if moving diagonally
if (hsp != 0 || vsp != 0) {
    var len = point_distance(0, 0, hsp, vsp);
    hsp /= len;
    vsp /= len;
}

//Collide with tiles and entities
var _collisions = move_and_collide(hsp*walkSpeed,vsp*walkSpeed,collideWith);

//Change direction
if(hsp!=0 || vsp!=0){
	//If not moving vertically
	if(vsp==0){
		if(hsp>0) dir=DIRECTIONS.RIGHT;
		if(hsp<0) dir=DIRECTIONS.LEFT;
	}
	
	//If not moving horizontally
	if(hsp==0){
		if(vsp>0) dir=DIRECTIONS.DOWN;
		if(vsp<0) dir=DIRECTIONS.UP;
	}
}


#endregion

#region Animation

//Update sprite based on diretion
switch dir{
	
	case DIRECTIONS.UP:
		sprite_index=upSprite;
	break;
	
	case DIRECTIONS.DOWN:
		sprite_index=downSprite;
	break;
	
	case DIRECTIONS.LEFT:
		sprite_index=leftSprite;
	break;
	
	case DIRECTIONS.RIGHT:
		sprite_index=rightSprite;
	break;
	
}

//Only animate if moving
if (hsp==0)&&(vsp==0){
	asp=0;
	image_index=0;
} else{
	asp=animSpeed;
}
image_speed=asp;


#endregion

#region Interaction

// Determine the point to check based on direction
interactHitboxX=x;
interactHitboxY=y;


switch (dir) {
	case DIRECTIONS.UP:    interactHitboxY -= interactRange; break;
	case DIRECTIONS.DOWN:  interactHitboxY += interactRange; break;
	case DIRECTIONS.LEFT:  interactHitboxX -= interactRange; break;
	case DIRECTIONS.RIGHT: interactHitboxX += interactRange; break;
}

if(keyUse){
	
	// Check if an interactable object exists at that target point
    var _target = instance_position(interactHitboxX, interactHitboxY, prntCheckEvent);

    // Trigger the event if found
    if (_target != noone) {
        with (_target) {
            on_interact();
        }
    }

}

#endregion