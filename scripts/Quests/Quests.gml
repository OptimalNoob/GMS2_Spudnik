/// @func build_quests();
/// @desc Build Quests Table
function build_quests(){
	
	var quest_array = [ 
		[
			"0001",
			"Kill Some Slimes!",
			0,
			"Cornovich has asked you to clear out some slimes from the neighboring area",
			[0,0],
			["Go to the Winterland", "Kill 3 Slimes", "Return to Cornovich"]
		],
	];
	library_quests = ds_grid_create_from_array(quest_array);
};

/// @func ds_grid_create_from_array();
/// @desc Generates a DS Grid from a passed array.
/// @arg {array} _array The array to create the DS Grid from.
function ds_grid_create_from_array(_array){
	var ds_grid;
	var array = _array;
	var array_quest_count = array_length_1d(array);
	var array_w = array_length_1d(array[0]);
	
	ds_grid = ds_grid_create(array_w, array_quest_count);
	
	var yy = 0;
	repeat(array_quest_count){
		var quest_array = array[yy];
		var xx = 0;
		repeat(array_w){
			ds_grid[# xx, yy] = quest_array[xx];
			xx++;
		}
		yy++
	}
	return ds_grid;
};

#region QUEST LISTENERS

///@func listen_npc();
///@desc Listens to Player talking to NPCs
function listen_npc(){
	
};

///@func listen_battle();
///@desc Listens to Player completing a battle and counting specified enemy
function listen_battle(){

};

///@func listen_tran();
///@desc Listens to Player transitioning to another room
function listen_tran(_warpid){
	var targ_room = _warpid.target_room;
	return targ_room;
};
///@func listen_purchase();
///@desc Listens to Player transitioning to another room
function listen_purchase(){
	
};

///@func listen_use_item();
///@desc Listens to Player transitioning to another room
function listen_use_item(){
	
};

#endregion
function count_enemies(_enemyID){
	var enemycount = 0;
	var i = 0; repeat(ds_list_size(return_battle_list)){
		var enemy_row = ds_grid_value_y(library_enemies,10,0,10,ds_grid_height(library_enemies)-1, return_battle_list[|i]);
		var enemy_id = library_enemies[# enemy_col.enemyID, enemy_row];
		if(enemy_id = _enemyID) enemycount++;
		i++;
	};
	//ds_list_clear(return_battle_list);
	return enemycount;
};

function quest_activate(_questID){
	var quest_row = ds_grid_value_y(library_quests, 0, 0, 0, ds_grid_height(library_quests) - 1, _questID);
	library_quests[# quest_col.quest_state, quest_row] = 0;
	quest_notif = update_quest.activate;
	ds_list_insert(spud_quests, 0, _questID);
};

function quest_update(){
	quest_notif = update_quest.update;
};

function quest_progress(_questID){
	var quest_row = ds_grid_value_y(library_quests, 0, 0, 0, ds_grid_height(library_quests) - 1, _questID);
	library_quests[# quest_col.obj_flag, quest_row][0] += 1;
};