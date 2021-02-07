function new_game(){
	
	// -- Player Globals
	spud_hp = 250;
	spud_atk = 999;
	spud_max_hp = 1000;
	spud_money = 1000;
	spud_spawn_x = 328;
	spud_spawn_y = 288;
	ds_list_add(player_inventory, "i_0001","i_0001","i_0004");
	saveslot = 1;
	
	// -- NPC Globals
	npc_bookmark[| NPCList.cornovich] = 0001;
	npc_bookmark[| NPCList.broc] = 0001;
	
	// Finish Initialization
	samesession = true;
	room_goto(room_debug); //This will be the first room of the game
}