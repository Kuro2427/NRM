//Spawn enemies from troops array
function spawn_troop(_troopKeysArray){
	var _count = array_length(_troopKeysArray);
	var _spacing = room_width / (_count+1);
	
	for(var i=0; i<_count; i++){
		var _key = _troopKeysArray[i]
		var _data = global.enemies[$ _key]
		
		var _spawnX = _spacing * (i+1);
		var _spawnY = room_height * 0.45; //???
		
		var _inst = instance_create_layer(_spawnX, _spawnY, "Enemies", prntBattleEnemy);
		
		_inst.enemyName=_data.enemyName;
		_inst.sprite_index=_data.sprite;
		_inst.maxHP=_data.maxHP;
		_inst.hp=_data.maxHP;
		_inst.atk=_data.atk;
		_inst.def=_data.def;
		_inst.spd=_data.spd;
	}
}