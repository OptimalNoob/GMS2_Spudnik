function save_game(_saveslot){
	
	// Create and Populate Map to be Saved
	var _save_map = ds_map_create();
	// Create throwaway lists to store into the map
	var _inventory_list = ds_list_create();
	var _bookmark_list = ds_list_create();
	var _spud_quest_list = ds_list_create();
	ds_list_copy(_inventory_list, player_inventory);
	ds_list_copy(_bookmark_list, npc_bookmark);
	ds_list_copy(_spud_quest_list, spud_quests);
	
	// Assign values to Map
	_save_map[? "PlayerX"] = oSpud.x;	// Player X coordinate
	_save_map[? "PlayerY"] = oSpud.y;	// Player Y corrdinate
	_save_map[? "SpudHP"] = spud_hp;
	_save_map[? "SpudMaxHP"] = spud_max_hp;
	_save_map[? "SpudAttack"] = spud_atk;
	_save_map[? "SpudMoney"] = spud_money;
	_save_map[? "Room"] = room;			// Current Room
	_save_map[? "Slot"] = saveslot;
	
	ds_map_add_list(_save_map, "Inventory", _inventory_list);
	ds_map_add_list(_save_map, "NPCBookmarks", _bookmark_list);
	ds_map_add_list(_save_map, "SpudQuests", _spud_quest_list);
	
	// Open/Create current save file, convert map to JSON string, and write to the file
	file_delete("save_" + string(_saveslot) + ".spud");
	var _save_file = file_text_open_write("save_" + string(_saveslot) + ".spud");
	file_text_write_string(_save_file, json_encode(_save_map));
	file_text_close(_save_file);
	
	ds_map_destroy(_save_map); // Map Cleanup
}

function load_game(_saveslot){
	
	// Open current save file, convert JSON string back to ds_map
	var _load_file = file_text_open_read("save_" + string(_saveslot) + ".spud")
    var _load_map = file_text_read_string(_load_file)
    _load_map = json_decode(_load_map)
    file_text_close(_load_file)
	
	// Disperse Map values into their corresponding global variables
	spud_hp =			_load_map[? "SpudHP"];
	spud_max_hp =		_load_map[? "SpudMaxHP"];
	spud_atk =			_load_map[? "SpudAttack"];
	spud_money =		_load_map[? "SpudMoney"];
	spud_spawn_x =		_load_map[? "PlayerX"];
	spud_spawn_y =		_load_map[? "PlayerY"];
	loadroom =			_load_map[? "Room"];
	saveslot =			_load_map[? "Slot"];
	
	ds_list_clear(player_inventory); // Refresh Player Inventory from Map
	ds_list_copy(player_inventory, _load_map[? "Inventory"]);
	ds_list_clear(npc_bookmark); // Refresh NPC Bookmarks from Map
	ds_list_copy(npc_bookmark, _load_map[? "NPCBookmarks"]);
	ds_list_clear(spud_quests); // Refresh Player Quests from Map
	ds_list_copy(spud_quests, _load_map[? "SpudQuests"]);
	
	ds_map_destroy(_load_map); // Map Cleanup
	room_persistent = false;
	samesession = true;
	gamechoice = gameChoice.loading;
	room_goto(room_init);
}