#region Process Cutscene Movement Queue

// Process pending movement commands in the queue
while (array_length(moveQueue) > 0) {
    var _nextMove = moveQueue[0];
    
    // If this command is blocking, we CANNOT start it until current actors stop moving
    if (_nextMove.isBlocking && is_any_actor_moving()) {
        break; // Stop queue processing for this frame; wait for active moves to complete
    }
    
    // Start the movement on the target actor
    move_actor_internal(_nextMove.actor, _nextMove.dir, _nextMove.distance);
    
    // Remove the executed command from the front of the queue
    array_delete(moveQueue, 0, 1);
}

#endregion