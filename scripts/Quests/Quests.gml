/// @func build_quests();
/// @desc Build Quests Table
function build_quests(){
	
	var quest_array = [ 
		[
			"0001",
			"TUTORIAL: NPCs",
			-1,
			"You can talk to NPCs when the prompt appears and you press 'E'.",
			[0],
			["Talk to Cornovich"]
		],
		[
			"0002",
			"TUTORIAL: Shops",
			-1,
			"Shops allow you to purchase helpful items that assist you throughout your adventure!",
			[0],
			["Talk to Broc", "Purchase a small Health Potion"]
		],
		[
			"0003",
			"TUTORIAL: Using Items",
			-1,
			"You can use items from your backpack to heal!",
			[0],
			["Use a small healing potion to recover some health after your brutal yet awesome battles."]
		],
		[
			"0004",
			"TUTORIAL: Battles",
			-1,
			"Goops are fucking assholes, got eeeeem",
			[0,0],
			["Encounter and Defeat 3 Goops"]
		],
		[
			"0005",
			"TUTORIAL: Exploring the World",
			-1,
			"Get the fuck out of here you damn hermit",
			[0],
			["l e a v e"]
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

function quest_activate(_questID){
	QuestDirector.quest_notif = update_quest.activate;
	var quest_height = ds_grid_height(library_quests) - 1;
	var quest_row = ds_grid_value_y(library_quests, 0,0,0,quest_height,_questID);
	library_quests[# quest_col.quest_state, quest_row] = 0;
	ds_list_add(spud_quests,_questID);
};

function quest_progress(_questID){
	QuestDirector.quest_notif = update_quest.update;
	var quest_height = ds_grid_height(library_quests) - 1;
	var quest_row = ds_grid_value_y(library_quests, 0,0,0,quest_height,_questID);
	library_quests[# quest_col.obj_flag, quest_row][0]++;
};

function quest_complete(_questID){
	QuestDirector.quest_notif = update_quest.complete;
	var quest_height = ds_grid_height(library_quests) - 1;
	var quest_row = ds_grid_value_y(library_quests, 0,0,0,quest_height,_questID);
	library_quests[# quest_col.quest_state, quest_row] = 1;
	var quest = ds_list_find_index(spud_quests, _questID)
	ds_list_delete(spud_quests,quest);
};

function check_listeners(){
	if(listenerWarp!=undefined || listenerTalk!=undefined || listenerPurchase!=undefined
	|| listenerItemUse!=undefined || !ds_list_empty(listenerBattle)){
		return true;
	};
};

function quest_get_row(_questID){
	var quest_height = ds_grid_height(library_quests) - 1;
	var quest_row = ds_grid_value_y(library_quests, 0,0,0,quest_height,_questID);
	return quest_row;
};

function enemy_get_row(_enemyID){
	
};

function quest_get_progress(_questID){
	var quest_height = ds_grid_height(library_quests) - 1;
	var quest_row = ds_grid_value_y(library_quests, 0,0,0,quest_height,_questID);
	var obj_flag = library_quests[# quest_col.obj_flag, quest_row][0];
	return obj_flag;
};

function listener_enemy_count(_enemyID){
	var enemycount = 0;
    var i = 0; repeat(ds_list_size(listenerBattle)){
        var enemy_row = ds_grid_value_y(library_enemies,10,0,10,ds_grid_height(library_enemies)-1, listenerBattle[|i]);
        var enemy_id = library_enemies[# enemy_col.enemyID, enemy_row];
        if(enemy_id = _enemyID) enemycount++;
        i++;
    };
    //ds_list_clear(return_battle_list);
    return enemycount;
};