event_inherited()

talkedTo=false;

on_interact = function(){
	if(!talkedTo){
		showDialog("test.yarn", "frungle");
		talkedTo=true;
	} else{
		showDialog("test.yarn", "frungle2");
	}
}