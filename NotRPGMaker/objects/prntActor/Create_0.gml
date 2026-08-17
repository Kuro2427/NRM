#region Player state management

actorName="player";
state=ACTORSTATES.CONTROL;
prevState=state;

#endregion

#region Movement

//HSP and VSP if being controlled by player
hsp=0;
vsp=0;

//Targets if in cutscene
targetX = 0;
targetY= 0;
cutsceneWalkSpeed=walkSpeed;

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