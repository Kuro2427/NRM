#region Program Controls

//Fullscreen toggle
if(keyboard_check_pressed(vk_f4)){
	if(window_get_fullscreen()){
		window_set_fullscreen(false);
		window_center();
	}
	else{
		window_set_fullscreen(true);
	}
}

//Show console
if(keyboard_check_pressed(vk_f1))&&(global.debugMode){
	if(isConsoleUp){
		show_debug_log(false)
		isConsoleUp=false;
	}
	else{
		show_debug_log(true);
		isConsoleUp=true;
	}
}

#endregion