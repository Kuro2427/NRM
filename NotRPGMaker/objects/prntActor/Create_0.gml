#region Player state management

actorName="player";
state=ACTORSTATES.CONTROL;
prevState=state;

//Actor individual functions
actor_switch_state = function(_state){
	//Stop moving and animating
	hsp=0;
	vsp=0;
	asp=0;
	
	//Store old state and apply specified state
	prevState=state;
	state=_state;
}

actor_revert_state = function(){
	//Stop moving and animating just in case
	hsp=0;
	vsp=0;
	asp=0;
	
	//Revert to previous state
	state=prevState;
	prevState=state;
}

#endregion

#region Movement

hsp=0;
vsp=0;

collisionTilemapID = layer_tilemap_get_id(layer_get_id(collisionLayerName));

collideWith = [collisionTilemapID, prntSolidCheckEvent];

#endregion

#region Animation

//Get desired animation speed from sprite
animSpeed=image_speed;
frame=0;
dir=DIRECTIONS.DOWN;

#endregion

#region Interaction

interactHitboxX=x;
interactHitboxY=y;

//Center interact hitbox
interactHitboxOffsetX=sprite_width/2;
interactHitboxOffsetY=sprite_height/2;

interactCooldown=0;

#endregion

#region Redundant vars

wsp=walkSpeed;
asp=0;

#endregion