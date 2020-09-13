/// @func build_quests();
/// @desc Build Quests Table
function build_quests(){
	enum quest{
		tutorial,
		slime_clean_up,
		a_helping_hust
	}
	var quest_array = [ //questID, Name, Status, Description, ObjFlags, ObjNames, 
		[
			"0001",
			"Kill Some Slimes!",
			-1,
			"Cornovich has asked you to clear out some slimes from the neighboring area",
			[0,0],
			["Go to the Forest", "Kill 3 Slimes", "Return to Cornovich"]
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
///@func listener_npc();
///@desc Listens to Player talking to NPCs
function listener_npc(){
	
};
///@func listener_enemy_kill();
///@desc Listens to Player completing a battle and counting specified enemy
function listener_enemy_kill(){
	
};
///@func listener_room_tran();
///@desc Listens to Player transitioning to another room
function listener_room_tran(){
	
};

function listener_npc(){
	
};

function listener_npc(){
	
};

#endregion