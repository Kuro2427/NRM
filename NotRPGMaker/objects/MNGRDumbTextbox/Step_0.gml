// Kill textbox on EOF

var _textComplete = (global.typist.get_state() == 1);

// Skip Text Typing
if (InputPressed(INPUT_VERB.CANCEL) && !_textComplete) {
    global.typist.skip();
}

// Advance Text or Destroy object if at end of array
if (InputPressed(INPUT_VERB.ACCEPT) && _textComplete) {
	if(page+1>=array_length(text)){
		instance_destroy();
		exit;
	}else{
		page++;
	}
}