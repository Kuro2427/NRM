function nazo_define_constants(){
	
//Nazo game states
enum NAZOSTATES{
	FIELD,
	MENU
}

//Cardinal directions
enum DIRECTIONS{
	UP,
	DOWN,
	LEFT,
	RIGHT
}

//Actor states
enum ACTORSTATES{
	CONTROL, //Behaves as player
	EVENT, //Behaves as event
	IDLE, //No behaviour
	CUTSCENE //Behaves as cutscene actor
}


}