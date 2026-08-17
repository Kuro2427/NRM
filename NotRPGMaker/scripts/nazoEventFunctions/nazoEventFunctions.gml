// Finds an instance based on its cutscene string name
function get_actor_by_name(_name) {
	print("get actor by name called")
    // Look for NPC with matching actorName variable
	if(instance_exists(prntActor)){
	    with (prntActor) {
	        if (variable_instance_exists(id, "actorName") && actorName == _name) {
				show_debug_message("NRM - find_actor_by_name("+_name+"): Found actor "+object_get_name(id.object_index));
	            return id;
	        }
	    }
		show_debug_message("NRM - find_actor_by_name("+_name+"): Error! Invalid actor name")
	    return noone;
	}
	else{
		show_debug_message("NRM - find_actor_by_name("+_name+"): Error! There are no valid actors in this room!");
	}
}

function nazo_event_init(){
	
}