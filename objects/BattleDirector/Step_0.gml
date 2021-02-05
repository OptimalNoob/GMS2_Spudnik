/// @desc

get_player_input();

if(!ds_list_empty(enemy_IDs)){
	switch(current_turn){
		case turn.player: playerturn(); break; // Player Turn Logic
		case turn.enemy: enemyturn(); break; // Enemy Turn Logic
	};
};


if(ds_list_empty(enemy_IDs)){ //END BATTLE
	if(alarm[2] == -1) alarm[2] = 2;
};