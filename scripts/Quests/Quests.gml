/// @func build_quests();
/// @desc Build Quests Table
function build_quests(){
	enum quest{
		tutorial,
		slime_clean_up,
		a_helping_hust
	}
	var quest_array = [ //questID, questStage, etc.
		[
			"Tutorial",
			0,
			["Use WASD to Move", "Press I to access your Pack", "Talk to CornShade", "Buy a Health Potion from Broc and Cauli", "Open your pack and use a Health Potion"]
		],
		[
			"Slime Clean Up",
			-1,
			["Defeat a group of Slime! (0/3)", "Defeat a group of Slime! (1/3)", "Defeat a group of Slime! (2/3)", "Talk to CornShade"]
		],
		[
			"A Helping Husk",
			-1,
			["Find and enter the dungeon in town", "Find CornShade's lucky sunglasses", "Return to CornShade"]
		]
	];
	ds_quests = ds_grid_create_from_array(quest_array);
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
}