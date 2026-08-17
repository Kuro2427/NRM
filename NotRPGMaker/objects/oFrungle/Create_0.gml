event_inherited();

actorName="frungle";
state=ACTORSTATES.EVENT;
prevState=state;

interacted=false;

on_interact =  function(){
	if(!interacted){
		show_dialog("test.yarn","frungle");
		interacted=true;
	} else{
		show_dialog("test.yarn","frungle2");
	}
}