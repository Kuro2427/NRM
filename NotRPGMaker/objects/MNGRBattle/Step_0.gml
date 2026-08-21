switch(state){
	//Initialize battle
	case BATTLESTATES.INIT:
		
		//Spawn in enemies
		spawn_troop(global.battleData.troop);
		state=BATTLESTATES.PLAYER_INPUT;
		
	break;
	
	case BATTLESTATES.PLAYER_INPUT:
		
		//Move battle commands cursor
		if(InputPressed(INPUT_VERB.UP)){
			if(battleMenuCursor>0){
				battleMenuCursor--;
			} else{
				battleMenuCursor=array_length(battleMenu)-1;
			}
		}
		
		if(InputPressed(INPUT_VERB.DOWN)){
			if(battleMenuCursor<array_length(battleMenu)-1){
				battleMenuCursor++;
			} else{
				battleMenuCursor=0;
			}
		}
		
	break;
}