switch(state){
	//Initialize battle
	case BATTLESTATES.INIT:
		
		//Spawn in enemies
		spawn_troop(global.battleData.troop);
		state=BATTLESTATES.PLAYER_INPUT;
		
	break;
}