#region Movement

hsp=0;
vsp=0;

collisionTilemapID = layer_tilemap_get_id(layer_get_id(collisionLayerName));

collideWith = [collisionTilemapID, prntSolidEvent];

#endregion

#region Animation

//Get desired animation speed from sprite
animSpeed=image_speed;
frame=0;
dir=DIRECTIONS.DOWN;

#endregion

#region Redundant vars

wsp=walkSpeed;
asp=0;

#endregion