function show_dialog(_file, _node = undefined, _window = undefined) {
    var _inst = instance_create_depth(0, 0, -100, MNGRDialog);
    
    with (_inst) {
        // Force assignment to the INSTANCE scope
        self.file   = _file;
        self.targetNode   = _node;
        
        if (_window != undefined) {
            self.window = _window;
        }
        
        // Trigger initialization AFTER variables are set
        init_dialog(); 
    }
	
	print("NRM: Creating dialog box. file="+string(_file)+" targetNode="+string(_node));
}

//Create dumb textbox that doesn't use chatterbox
function show_dumb_textbox(_text,_speaker=undefined,_window=undefined){
	var _inst = instance_create_depth(0, 0, -100, MNGRDumbTextbox);
	
	 with (_inst) {
		 self.text=_text;
		 self.speaker=_speaker;
		 if (_window != undefined) {
			self.window = _window;
        }
	 }
}