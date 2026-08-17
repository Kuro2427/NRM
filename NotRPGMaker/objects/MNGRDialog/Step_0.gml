// Kill textbox on EOF
if (ChatterboxGetContent(chatterbox, 0) == undefined) {
    instance_destroy();
    exit;
}

var _textComplete = (global.typist.get_state() == 1);
var _optionCount = ChatterboxGetOptionCount(chatterbox);


//Stops player from skipping dialogue when events are moving
if(inCutsceneWait){
	if(!is_any_actor_moving()){
		inCutsceneWait=false;
	} else{
		exit;
	};
}

// Skip Text Typing
if (InputPressed(INPUT_VERB.CANCEL) && !_textComplete) {
    global.typist.skip();
}

// Advance Text or Select Option
if (InputPressed(INPUT_VERB.ACCEPT) && _textComplete) {
    if (_optionCount == 0) {
        ChatterboxContinue(chatterbox);
    } else {
        ChatterboxSelect(chatterbox, cursor);
        cursor = 0; // Reset cursor for next set of choices
    }
    global.typist.reset();
}

// Navigate Choice Menu
if (_optionCount > 0 && _textComplete) {
    if (InputPressed(INPUT_VERB.UP)) {
        cursor = (cursor == 0) ? _optionCount - 1 : cursor - 1;
    }
    if (InputPressed(INPUT_VERB.DOWN)) {
        cursor = (cursor == _optionCount - 1) ? 0 : cursor + 1;
    }
}