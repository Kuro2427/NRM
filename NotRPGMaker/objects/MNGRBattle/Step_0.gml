//Ignore controls if in dialogue
if(instance_exists(MNGRDialog)||instance_exists(MNGRDumbTextbox)){
	exit;
}

switch(state){
	//Initialize battle
	case BATTLESTATES.INIT:
		
		//Spawn in enemies
		spawn_troop(global.battleData.troop);
		state=BATTLESTATES.PLAYER_INPUT;
		
	break;
	
	//Player selects command
	case BATTLESTATES.PLAYER_INPUT:
		
		//1. Action menu
		if(battleMenuState==BATTLEMENUSTATES.ACTION){
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
			
			//Choose action
			if(InputPressed(INPUT_VERB.ACCEPT)){
				//Execute action from array and set the action picked variable
				battleMenuFunctions[battleMenuCursor]();
				battleMenuActionPicked=battleMenuCursor
				
				//Go to next hero's turn or pass controller to enemy
				if(heroChoiceTurn<partySize-1){
					heroChoiceTurn++;
				} else{
					state = BATTLESTATES.ENEMY_INPUT;
					//Reset hero choice turn for next real battle turn
					heroChoiceTurn = 0;
				}
			}
		}
		
	break;
}