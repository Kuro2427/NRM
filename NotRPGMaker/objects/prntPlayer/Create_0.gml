#region Movement

//Initialize walk speed
walkSpeed=1;

hsp=0;
vsp=0;

#endregion

#region Animation

//Get desired animation speed from sprite
animSpeed=(sprite_get_speed(sprite_index)/60);
frame=0;
dir=DIRECTIONS.DOWN;

#endregion

#region Redundant vars

wsp=walkSpeed;
asp=animSpeed;

#endregion