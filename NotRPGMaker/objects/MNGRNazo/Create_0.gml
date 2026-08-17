//Set up scribble
scribble_font_set_default("fnNazoDefault");
global.typist = scribble_typist();
global.typist.in(0.7,0);

//Define constants
nazo_define_constants();
nazo_event_init();

global.nazoState=NAZOSTATES.FIELD;
global.prevNazoState=global.nazoState;

stateSwitchCD=0;
doStateReset=false;

reset_state = function(){
	stateSwitchCD=30;
	doStateReset=true;
}


//Set up GUI
global.guiW=360;
global.guiH=270;
display_set_gui_size(global.guiW,global.guiH);

#region Debug mode stuff

if(os_get_config()=="debug"){
	global.debugMode=true;
	window_set_caption(window_get_caption()+" | DEBUG MODE ON");
	show_debug_message("=========================");
	show_debug_message("NRM: Debug Mode Activated");
	show_debug_message("=========================");
}
else{
	global.debugMode=false;
}

isConsoleUp=false;

#endregion