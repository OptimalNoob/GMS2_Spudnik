#region CONTROLS

// -- CONTROL INVENTORY
function control_inventory(){
	item_id = 0;
	item_used = false;
	var inventory_max = ds_list_size(player_inventory) - 1;
	if(input_UP) {
		if(selected_inventory > 0) audio_play_sound(sndMenu_up,10,0);
		selected_inventory = max(0, --selected_inventory);
	}
	if(input_DOWN) {
		if(selected_inventory < inventory_max) audio_play_sound(sndMenu_down,10,0);
		selected_inventory = min(inventory_max, ++selected_inventory);
	}
	if(input_ACTION1){
		item_id = player_inventory[| selected_inventory];
		use_inventory_item(item_id);
	}
}
// -- CONTROL SETTINGS
function control_settings(){
	var setting_max = ds_list_size(setting_labels) - 1;
	if(input_UP && !inSettings){
		if(selected_setting > 0) audio_play_sound(sndMenu_up,10,0);
		selected_setting = max(0, --selected_setting);
	}
	if(input_DOWN && !inSettings){
		if(selected_setting < setting_max) audio_play_sound(sndMenu_down,10,0);
		selected_setting = min(setting_max, ++selected_setting);
	}
	if(input_ACTION1 && !inSettings){
		input_ACTION1 = false;
		inSettings = true;
	}
	
	if(inSettings){
		if(input_ACTION2){
			input_ACTION2 = false;
			inSettings = false;
			selected_general_setting = 0;
		}
		switch(selected_setting){
			case 0: control_settings_general(); break; //General
			case 1: control_settings_controls(); break; //Controls
			case 2: control_settings_audio(); break; //Audio
			case 3: control_settings_display(); break; //Display
			default: break;
		}
	}
}

function control_settings_general(){
	var setting_max = ds_list_size(setting_general_labels) - 1;
	if(input_UP){
		if(selected_general_setting > 0) audio_play_sound(sndMenu_up,10,0);
		selected_general_setting = max(0, --selected_general_setting);
	}
	if(input_DOWN){
		if(selected_general_setting < setting_max) audio_play_sound(sndMenu_down,10,0);
		selected_general_setting = min(setting_max, ++selected_general_setting);
	}
	if(input_ACTION1){
		input_ACTION1 = false;
		inGeneralSettings = true;
	}
	if(inGeneralSettings){
		inGeneralSettings = false;
		switch(selected_general_setting){
			case 0: save_game(saveslot); // Save Game
				break;
			case 1: load_game(saveslot); // Load Game
				break;
			default: break;
		}
	}
}

function control_settings_controls(){
	
}

function control_settings_audio(){
	
}

function control_settings_display(){
	
}

// -- CONTROL QUIT
function control_exit(){ //TODO: Prompt confirmation before quitting
	if(input_ACTION1){
		game_end();
	}
}

#endregion
#region DRAW UI

function draw_inventory(){
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	// Draw Base Inventory UI
	draw_sprite(sBP_inventory_itemList,0,336,112);
	draw_sprite(sBP_inventory_stats,0,736,112);
	draw_sprite(sBP_inventory_itemDescription,0,736,496);
	if(inMenu){
		draw_set_color(c_white);
		// Draw Item Cursor
		if(!ds_list_empty(player_inventory)) draw_rectangle(344,128 + (item_padding * selected_inventory),710,160 + (item_padding * selected_inventory),0);
		draw_set_color(c_black);
	};
	
	// Draw Item Inventory List
	if (!ds_list_empty(player_inventory)) {
		var item_dic_height = ds_grid_height(dict_items) - 1;
		var invyy = 0; repeat(ds_list_size(player_inventory)){
			var item_current = player_inventory[| invyy];
			var item_row = ds_grid_value_y(dict_items, dic_i.ID, 0, dic_i.ID, item_dic_height, item_current);
			var item_display = dict_items[# dic_i.NAME, item_row]; // Assign the Display Name column value from item_row
			var item_icon = dict_items[# dic_i.SPRITE, item_row]; // Assign the Sprite column value for item_row
			draw_sprite(item_icon,0,368,160 + (item_padding * invyy));
			draw_text(400,134 + (item_padding * invyy),item_display); // Draw the Display Name for the item
			invyy++;
		};
	};
	
	// Draw Stats
	draw_text(752,160,"HP: " + string(spud_hp) + "/" + string(spud_max_hp));
	
	// Draw Monies
	var player_money = format_number(spud_money);
	draw_text(752,432,"Money: " + player_money);
};

function draw_quests(){
	var quest_height = ds_grid_height(dict_quests) - 1;
	var questxx = 0 repeat(ds_list_size(spud_quests)){
		var quest_row = ds_grid_value_y(dict_quests, 0,0,0,quest_height, spud_quests[|questxx]);
		var quest_name = dict_quests[# dic_q.NAME, quest_row];
		draw_text(384,136 + (item_padding * questxx),quest_name)
		questxx++;
	};
};

function draw_settings(){ //Draw Main Setting Labels
	draw_set_font(font_dialog);
	draw_text(320, 100, "Settings");
	draw_set_font(font_shop);
	var setting_max = ds_list_size(setting_labels) - 1;
	var setting_yy = 0; repeat(setting_max + 1){
		var setting_display = setting_labels[| setting_yy];
		if(setting_yy == selected_setting){
			if(inMenu){
				draw_set_color(c_grey);
			} else {
				draw_set_color(c_white);
			}
		} else {
			draw_set_color(c_white);
		}
		draw_rectangle(312, 142 + (setting_padding * setting_yy), 420, 172 + (setting_padding * setting_yy), false);
		draw_set_color(c_black);
		draw_text(320,148 + (setting_padding * setting_yy),setting_display); // Draw the Display Name for the item
		setting_yy++;
	};
	
	if(inMenu){
		switch(selected_setting){
			case 0: draw_settings_general(); break; //Genreal
			case 1: draw_settings_controls(); break; //Controls
			case 2: draw_settings_audio(); break; //Audio
			case 3: draw_setting_display(); break; //Display
			default: break;
		}
	}
}

function draw_settings_general(){ //Draw General Setting
	draw_sprite(sBP_inventory_itemList,0,436,142);
	//draw_text(446, 152, "Save Game");
	var setting_max = ds_list_size(setting_general_labels) - 1;
	var setting_yy = 0; repeat(setting_max + 1){
		var setting_display = setting_general_labels[| setting_yy];
		if(setting_yy == selected_general_setting){
			if(inSettings){
				draw_set_color(c_grey);
			} else {
				draw_set_color(c_white);
			}
		} else {
			draw_set_color(c_white);
		}
		draw_rectangle(312 + 140, 142 + 20 + (setting_padding * setting_yy), 420 + 140, 172 + 20 + (setting_padding * setting_yy), false);
		draw_set_color(c_black);
		draw_text(320 + 140,148 + 20 + (setting_padding * setting_yy),setting_display); // Draw the Display Name for the item
		setting_yy++;
	};
}

function draw_settings_controls(){ //Draw Control Setting
	draw_sprite(sBP_inventory_itemList,0,436,142);
}

function draw_settings_audio(){ //Draw Audio Setting
	draw_sprite(sBP_inventory_itemList,0,436,142);
}

function draw_setting_display(){ //Draw Display Setting
	draw_sprite(sBP_inventory_itemList,0,436,142);
}

#endregion

#region OTHER

function use_inventory_item(_itemid) {
	var item_row = ds_grid_value_y(dict_items, dic_i.ID, 0, dic_i.ID, ds_grid_height(dict_items), _itemid);
	var item_type = string_copy(string(_itemid),3,2);
	switch (item_type) {
		case "00":
			if (spud_hp < spud_max_hp) {
				item_used = true;
				audio_play_sound(sndItem_usePotion,10,0);
				var healing_factor = dict_items[# dic_i.HEAL, item_row];
				spud_hp = min(spud_max_hp, floor(spud_hp + (spud_max_hp * healing_factor)));
				ds_list_delete(player_inventory, selected_inventory);
				if (selected_inventory > 0) {
					selected_inventory--;	
				} else {
					selected_inventory = 0;
				};
			};
			break;
		default: break;
	};
	if (ds_list_empty(player_inventory)) inMenu = false;
}

function format_number(_number){ // Adds Commas in 4+ digit numbers
	var str = string(_number);
	var len = string_length(str);
	for(i = len - 3; i > 0; i -= 3){
		str = string_insert(",",str,i + 1);	
	}
	return str;
}
#endregion







	
