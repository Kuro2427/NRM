if(global.debugMode){
	switch state{
		case ACTORSTATES.CONTROL: show_debug_message("NRM - "+object_get_name(object_index)+", Current state: ACTORSTATES.CONTROL"); break;
		case ACTORSTATES.CUTSCENE: show_debug_message("NRM - "+object_get_name(object_index)+", Current state: ACTORSTATES.CUTSCENE"); break;
		case ACTORSTATES.IDLE: show_debug_message("NRM - "+object_get_name(object_index)+", Current state: ACTORSTATES.IDLE"); break;
		case ACTORSTATES.EVENT: show_debug_message("NRM - "+object_get_name(object_index)+", Current state: ACTORSTATES.EVENT"); break;
	}
}