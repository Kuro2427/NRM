//If event has the default sprite, only draw when in debug mode
if(global.debugMode)||(sprite_index!=sEvent){
	draw_self();	
}