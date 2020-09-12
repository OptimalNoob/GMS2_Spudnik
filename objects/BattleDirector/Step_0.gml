/// @desc

get_player_input();

switch(current_turn){
	case turn.player: playerturn(); break; // Player Turn Logic
	case turn.enemy: enemyturn(); break; // Enemy Turn Logic
};

show_debug_message("Mouse(" 
+ string(device_mouse_x_to_gui(0)) 
+ "," 
+ string(device_mouse_y_to_gui(0)) + ")");


if(ds_list_empty(enemy_IDs)){
	ds_list_destroy(enemy_IDs);
	ds_list_clear(battle_spawn_table);
	room_goto(room_debug);
};