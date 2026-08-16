//Define constants
nazo_define_constants();

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