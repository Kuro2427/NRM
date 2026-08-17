//Reset input every frame
keyLeft  = false;
keyRight = false;
keyUp    = false;
keyDown  = false;
keyUse   = false;

//Only make actor controllable if set up to do so
if(state==ACTORSTATES.CONTROL)&&(global.nazoState==NAZOSTATES.FIELD){

	//Get input
	keyLeft=InputCheck(INPUT_VERB.LEFT);
	keyRight=InputCheck(INPUT_VERB.RIGHT);
	keyUp=InputCheck(INPUT_VERB.UP);
	keyDown=InputCheck(INPUT_VERB.DOWN);

	keyUse=InputPressed(INPUT_VERB.ACCEPT);
	
	//Interaction cooldown
	if(interactCooldown>0){
		interactCooldown--;
	}

	#region Movement

	//Calculate movement
	hsp=keyRight-keyLeft;
	vsp=keyDown-keyUp;
	

}

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
interactHitboxX=x+interactHitboxOffsetX;
interactHitboxY=y+interactHitboxOffsetY;


switch (dir) {
	case DIRECTIONS.UP:    interactHitboxY -= interactRange; break;
	case DIRECTIONS.DOWN:  interactHitboxY += interactRange; break;
	case DIRECTIONS.LEFT:  interactHitboxX -= interactRange; break;
	case DIRECTIONS.RIGHT: interactHitboxX += interactRange; break;
}

//Only interact if player has control of actor and cooldown is 0
if(keyUse)&&(interactCooldown==0)&&(state==ACTORSTATES.CONTROL)&&(global.nazoState==NAZOSTATES.FIELD){

	// Check if an interactable object exists at that target point
    var _target = instance_position(interactHitboxX, interactHitboxY, prntCheckEvent);

    // Trigger the event if found
    if (_target != noone) {
		interactCooldown = 15;
        with (_target) {
            on_interact();
        }
    }

}

#endregion