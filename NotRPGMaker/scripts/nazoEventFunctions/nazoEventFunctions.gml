// Finds an actor based on its string name
function get_actor_by_name(_name) {
    // Look for NPC with matching actorName variable
	if(instance_exists(prntActor)){
	    with (prntActor) {
	        if (variable_instance_exists(id, "actorName") && actorName == _name) {
				show_debug_message("NRM - get_actor_by_name("+_name+"): Found actor "+object_get_name(id.object_index));
	            return id;
	        }
	    }
		show_debug_message("NRM - get_actor_by_name("+_name+"): Error! Invalid actor name!")
	    return noone;
	}
	else{
		show_debug_message("NRM - get_actor_by_name("+_name+"): Error! There are no valid actors in this room!");
	}
}

//Set actor state
function set_actor_state(_actor,_state){
	//Get actor from name
	var _actorObj = get_actor_by_name(_actor);
	
	//Only run if actor not invalid
	if(_actorObj!=noone){
		
		with(_actorObj){
			//Store previous state and switch to specified state
			self.prevState = self.state;
			self.state = _state
			
			//Stop animating and moving just in case
			self.hsp=0;
			self.vsp=0;
			self.asp=0;
		}
		
		show_debug_message("NRM - set_actor_state: Set "+_actor+" state to "+string(_state));
	}
}

//Set actor direction
function set_actor_dir(_actor, _dir){
	//Get actor from name
	var _actorObj = get_actor_by_name(_actor);
	
	//Only run if actor not invalid
	if(_actorObj!=noone){
		switch (_dir){
			case "up": _actorObj.dir = DIRECTIONS.UP break;
			case "down": _actorObj.dir = DIRECTIONS.DOWN break;
			case "left": _actorObj.dir = DIRECTIONS.LEFT break;
			case "right": _actorObj.dir = DIRECTIONS.RIGHT break;
			
			default:
				show_debug_message("NRM - set_actor_dir: Error! \""+_dir+"\" is not a valid direction!")
			break;
		}
	}
}

//Set actor speed
function set_actor_speed(_actor, _spd){
	//Get actor from name
	var _actorObj = get_actor_by_name(_actor);
	
	//Only run if actor not invalid
	if(_actorObj!=noone){
		_actorObj.cutsceneWalkSpeed=_spd;
	}
}

//Move actor 
function move_actor(_actor, _dir, _dist){
	//Hide textbox and pause chatterbox
	if(instance_exists(MNGRDialog)){
		MNGRDialog.inCutsceneWait = true;
	}
			
	array_push(MNGRCutscene.moveQueue, {
		actor: _actor,
		dir: _dir,
		distance: real(_dist),
		isBlocking: true
	})
	
	MNGRCutscene.inCutsceneWait=true;

}

//Move actor asynchronously, stacks like default Yarn behaviour
function move_actor_async(_actor, _dir, _dist){
	//Hide textbox and pause chatterbox
	if(instance_exists(MNGRDialog)){
		MNGRDialog.inCutsceneWait = true;
	}
		
	array_push(MNGRCutscene.moveQueue, {
		actor: _actor,
		dir: _dir,
		distance: real(_dist),
		isBlocking: false
	})
	
	MNGRCutscene.inCutsceneWait=true;
}

#region Internal functions

function is_any_actor_moving() {
    var _isMoving = false;
    
    // Check every actor currently in the room
    with (prntActor) {
        // If an actor is in cutscene state and still has distance left to move
        if (state == ACTORSTATES.CUTSCENE && (targetX != 0 || targetY != 0)) {
            _isMoving = true;
            break; // Stop checking other actors early—we only need to find one!
        }
    }
    
    return _isMoving;
}

//Internal move actor function. Should never be called directly
function move_actor_internal(_actor,_dir,_distance){
	//Get actor from name
	var _actorObj = get_actor_by_name(_actor);
	
	//Only run if actor not invalid
	if(_actorObj!=noone){
		
		//Store actor state and override to cutscene if not already set to it
		var _prevState = _actorObj.state;
		if (_actorObj.state!=ACTORSTATES.CUTSCENE){
			_actorObj.state=ACTORSTATES.CUTSCENE;
		}
		
		//Face direction and move
		switch (_dir){
			
			case "up":
				_actorObj.dir = DIRECTIONS.UP;
				_actorObj.targetY -= global.tileSize*_distance;
			break;
			
			
			case "down": 
				_actorObj.dir = DIRECTIONS.DOWN;
				_actorObj.targetY += global.tileSize*_distance;
			break;
			
			
			case "left": 
				_actorObj.dir = DIRECTIONS.LEFT;
				_actorObj.targetX -= global.tileSize*_distance;
			break;
			
			
			case "right": 
				_actorObj.dir = DIRECTIONS.RIGHT;
				_actorObj.targetX += global.tileSize*_distance;
			break;
			
			default:
				show_debug_message("NRM - set_actor_dir: Error! \""+_dir+"\" is not a valid direction!")
			break;
			
		}
		
	}
}

#endregion

//Add functions to chatterbox
function nazo_event_init(){
	
	//State override
	ChatterboxAddFunction("set_actor_state",set_actor_state);
	
	//Movement
	ChatterboxAddFunction("set_actor_dir",set_actor_dir);
	ChatterboxAddFunction("set_actor_speed",set_actor_speed);
	ChatterboxAddFunction("move_actor",move_actor);
	ChatterboxAddFunction("move_actor_async",move_actor_async);
	
}