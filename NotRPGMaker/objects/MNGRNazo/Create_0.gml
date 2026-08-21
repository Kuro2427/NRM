//Define states
enum NAZOSTATES{
	FIELD,
	MENU
}

//Set up scribble
scribble_font_set_default(global.defaultFont);
global.typist = scribble_typist();
global.typist.in(0.7,0);

scribble_font_bake_shadow(global.defaultUIFont,"fnNazoDefaultOutline",1,1,c_black,0.5,0,false);

global.defaultUIFont = "[fnNazoDefaultOutline]";

//Define constants
nazo_event_init();

global.nazoState=NAZOSTATES.FIELD;
global.prevNazoState=global.nazoState;

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