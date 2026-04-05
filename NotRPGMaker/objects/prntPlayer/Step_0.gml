//Get input
keyLeft=keyboard_check(vk_left);
keyRight=keyboard_check(vk_right);
keyUp=keyboard_check(vk_up);
keyDown=keyboard_check(vk_down);

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

//Apply movement
x+=hsp*walkSpeed;
y+=vsp*walkSpeed;

#endregion

#region Animation

//Update direction
//Check if moving
if(hsp!=0 || vsp!=0){
	//If not moving vertically
	if(vsp==0){
		if(hsp>0) dir=DIRECTIONS.LEFT;
		if(hsp<0) dir=DIRECTIONS.RIGHT;
	}
}

//Update sprite based on diretion

//Only animate if moving
if(hsp==0)&&(vsp==0){
	asp=0;
} else{
	asp=animSpeed;
}

#endregion