
// Player Control Functions

#region BEGINNING OF PLAYER TURN
function playerturn(){
	#region CONTROL BATTLE MENU
	if(!inMenu){
		ui_ind_items = 0;
		ui_ind_special = 0;
		ui_ind_attack  = 0;
		ui_ind_other = 0;
		if(input_UP){
			alarm[0] = 2;
			show_debug_message("Pressed Up");
			audio_play_sound(sndMenu_confirm,10,0);
			current_menu = pMenu.items;
			inMenu = true; in_items = true; in_special = false; in_attack = false; in_other = false;
		};
		if(input_LEFT){
			alarm[0] = 2;
			audio_play_sound(sndMenu_confirm,10,0);
			current_menu = pMenu.special;
			inMenu = true; in_items = false; in_special = true; in_attack = false; in_other = false;
		};
		if(input_RIGHT){
			alarm[0] = 2;
			audio_play_sound(sndMenu_confirm,10,0);
			current_menu = pMenu.attack;
			inMenu = true; in_items = false; in_special = false; in_attack = true; in_other = false;
		};
		if(input_DOWN){
			alarm[0] = 2;
			audio_play_sound(sndMenu_confirm,10,0);
			current_menu = pMenu.command;
			inMenu = true; in_items = false; in_special = false; in_attack = false; in_other = true;
		};
	};
	if(inMenu && input_ACTION2){
		alarm[0] = 2;
		audio_play_sound(sndMenu_cancel,10,0);
		reset_selections();
	};
	#endregion
	#region CONTROL SUBMENUS
	if(alarm[0] == -1){
		switch(current_menu){
			case pMenu.items: item_menu(); break;
			case pMenu.special: special_menu(); break;
			case pMenu.attack: attack_menu(); break;
			case pMenu.command: command_menu(); break;
			default: break;
		};
	};
	
	#endregion
	if(!attack_state && !done_anim && player_attacked){
		if(attack_enemy.sprite_index = attack_enemy.sprite_library[sprite_lib.idle]){
			show_debug_message("Beginning Attack Animation");
			oSpud_battle.sprite_index = oSpud_battle.sprite_library[sprite_lib.attacking];
			oSpud_battle.image_index = 0;
			attack_enemy.image_index = 0;
			attack_enemy.sprite_index = attack_enemy.sprite_library[sprite_lib.damaged];
		}
		//Once the attack (animation) has ended, set the sprite back to idle then begin dealing damage to Spud
		if(attack_enemy.sprite_index = attack_enemy.sprite_library[sprite_lib.damaged] && attack_enemy.image_index >= (attack_enemy.image_number - 1)){
			show_debug_message("Finishing Attack Animation, switching back to idle");
			attack_enemy.image_index = 0;
			done_anim = true;
			attack_state=false;
			attack_enemy.sprite_index = attack_enemy.sprite_library[sprite_lib.idle];
			oSpud_battle.sprite_index = oSpud_battle.sprite_library[sprite_lib.idle];
			oSpud_battle.image_index = 0;
			player_attack_reg();
		}
	};
};
#endregion

#region BATTLE SUBMENU CONTROLS
function item_menu(){
	var inv_size = ds_list_size(player_inventory) - 1;
	if(alarm[0] == -1){
		if(input_UP){
			if(inv_sel_item > 0) audio_play_sound(sndMenu_up,10,0);
			inv_sel_item = max(0,--inv_sel_item);
		};
		if(input_DOWN){
			if(inv_sel_item < inv_size) audio_play_sound(sndMenu_down,10,0);
			inv_sel_item = min(inv_size,++inv_sel_item);
		};
		if(input_ACTION1){
			var item_id = player_inventory[| inv_sel_item];
			use_battle_item(item_id)
		};
	};
	show_debug_message("Inventory Item: " + string(inv_sel_item));
};

function special_menu(){
	
};

function attack_menu(){
	if(input_RIGHT) sel_enemy++;
	if(input_LEFT) sel_enemy--;
	
	if(sel_enemy > ds_list_size(enemy_IDs) - 1){
		sel_enemy = 0;
	}
	if(sel_enemy < 0){
		sel_enemy = ds_list_size(enemy_IDs) - 1;
	}
	if(input_ACTION1){
		player_attack_reg();
		player_attacked = true;
		reset_selections();
	};
	if(input_ACTION2){
		player_attack_reg();
		player_attacked = true;
		reset_selections();
	};
};

function command_menu(){
	
};

function reset_selections(){
	inMenu = false;
	current_menu = 0;
	in_items = false;
	in_special = false;
	in_attack = false;
	in_other = false;
	inv_sel_item = 0;
	att_sel_enem = 0;
	spc_sel_item = 0;
	com_sel_item = 0;
};
#endregion

// Player Battle Actions

#region PLAYER REGULAR ATTACK
function player_attack_reg(){
	reset_selections();
	attack_enemy = enemy_IDs[| sel_enemy];
	if(done_anim){
		attack_enemy.hp -= spud_atk; // TODO: ADD PLAYER DAMAGE
		player_attacked = false;
		if(attack_enemy.hp <= 0){
			with (attack_enemy){
				instance_destroy();
			};
			ds_list_delete(enemy_IDs, sel_enemy);
			sel_enemy = 0;
		};
		alarm[0] = 2;
		current_turn = turn.enemy;
		done_anim = false;
	};
};
#endregion

#region USE ITEM IN BATTLE
function use_battle_item(_itemid) {
	var item_row = ds_grid_value_y(library_items, 0, 0, 0, ds_grid_height(library_items), _itemid);
	var item_type = string_copy(string(_itemid),0,2);
	switch (item_type) {
		case "00":
			if (spud_hp < spud_max_hp) {
				audio_play_sound(sndItem_usePotion,10,0);
				var healing_factor = library_items[# item_col.healValue, item_row];
				spud_hp = min(spud_max_hp, floor(spud_hp + (spud_max_hp * healing_factor)));
				ds_list_delete(player_inventory, inv_sel_item);
				if (inv_sel_item > 0) {
					inv_sel_item--;	
				} else {
					inv_sel_item = 0;
				};
				alarm[0] = 2;
				current_turn = turn.enemy;
				reset_selections();
				done_anim = false;
			};
			break;
		default: break;
	};
};
#endregion

// Enemy Functions

#region ENEMY TURN
function enemyturn(){
	player_attacked = false;
	enemy_count = ds_list_size(enemy_IDs);
	// Start the attack
	if(enemy_turn_order == -1){
		enemy_turn_order++;
		attack_state = true;
	};
	
	if(enemy_turn_order >= 0) current_enemy = enemy_IDs[| enemy_turn_order];
	
	if(attack_state && !done_anim){
		
		// If enemy is attacking, change their sprite index to attacking
		if(current_enemy.sprite_index = current_enemy.sprite_library[sprite_lib.idle]){
			current_enemy.image_index = 0;
			current_enemy.sprite_index = current_enemy.sprite_library[sprite_lib.attacking];
		};
		
		//Once the attack (animation) has ended, set the sprite back to idle then begin dealing damage to Spud
		if(current_enemy.sprite_index = current_enemy.sprite_library[sprite_lib.attacking] && current_enemy.image_index >= (current_enemy.image_number - 1)){
			current_enemy.image_index = 0;
			done_anim = true;
			attack_state=false;
			spud_hp -= current_enemy.atk;
			current_enemy.sprite_index = current_enemy.sprite_library[sprite_lib.idle];
			oSpud_battle.image_index = 0;
			oSpud_battle.sprite_index = oSpud_battle.sprite_library[sprite_lib.damaged];
			alarm[1] = 60;
		};
	};
	if(done_anim && alarm[1] == -1){
		enemy_turn_order++;
		//spud_hp -= 1;
		attack_state = true;
		done_anim = false;
	};
	if(enemy_turn_order >= enemy_count){
		attack_state = false;
		done_anim = false;
		current_turn = turn.player;
		enemy_turn_order = -1;
	};
	
};
#endregion

// Draw Functions

#region DRAW PLAYER UI
function draw_player_ui(){
	draw_set_alpha(1);
	if(!player_attacked){
		if(in_items){
			ui_ind_items = min(ui_max_items,++ui_ind_items);
			ui_ind_special = max(0, --ui_ind_special);
			ui_ind_attack = max(0, --ui_ind_attack);
			ui_ind_other = max(0, --ui_ind_other);
			in_special = false;in_attack = false;in_other = false;
			if(input_ACTION2) in_items = false;
		};
		if(in_special){
			ui_ind_special = min(ui_max_special,++ui_ind_special);
			ui_ind_items = max(0, --ui_ind_items);
			ui_ind_attack = max(0, --ui_ind_attack);
			ui_ind_other = max(0, --ui_ind_other);
			in_items = false;in_attack = false;in_other = false;
			if(input_ACTION2) in_special = false;
		};
		if(in_attack){
			ui_ind_attack = min(ui_max_attack,++ui_ind_attack);
			ui_ind_items = max(0, --ui_ind_items);
			ui_ind_special = max(0, --ui_ind_special);
			ui_ind_other = max(0, --ui_ind_other);
			in_items = false;in_special = false;in_other = false;
			if(input_ACTION2) in_attack = false;
		};
		if(in_other){
			ui_ind_other = min(ui_max_other,++ui_ind_other);
			ui_ind_items = max(0, --ui_ind_items);
			ui_ind_special = max(0, --ui_ind_special);
			ui_ind_attack = max(0, --ui_ind_attack);
			in_items = false;
			in_special = false;
			in_attack = false;
			if(input_ACTION2) in_other = false;
		};
		if(!inMenu){
			ui_ind_items = max(0, --ui_ind_items);
			ui_ind_special = max(0, --ui_ind_special);
			ui_ind_attack = max(0, --ui_ind_attack);
			ui_ind_other = max(0, --ui_ind_other);
		};
		draw_sprite(sBattleUI_items,ui_ind_items,232,152 + ui_off_y);
		draw_sprite(sBattleUI_special,ui_ind_special,184,200 + ui_off_y);
		draw_sprite(sBattleUI_attack,ui_ind_attack,280,200 + ui_off_y);
		draw_sprite(sBattleUI_other,ui_ind_other,232,248 + ui_off_y);
	
		switch(current_menu){
			case pMenu.items: draw_item_menu(); break;
			case pMenu.special: break;
			case pMenu.attack: break;
			case pMenu.command: break;
			default: break;
		};
	};
};

#endregion

#region DRAW SUBMENU WINDOWS
function draw_item_menu(){
	draw_sprite(sBattleUI_window_inventory,0,344,128 + ui_off_y);
	draw_set_color(c_white);
	// Draw Item Cursor
	draw_rectangle(360,144 + (inv_sel_item * 32) + ui_off_y,606,180 + (inv_sel_item * 32) + ui_off_y,0);
	// Draw List of Items
	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	if (!ds_list_empty(player_inventory)) {
		var item_padding = 32;
		var invyy = 0; repeat(ds_list_size(player_inventory)){
			var item_current = player_inventory[| invyy];
			var item_row = ds_grid_value_y(library_items, 0, 0, 0, ds_grid_height(library_items), item_current);
			var item_display = library_items[# item_col.displayName, item_row]; // Assign the Display Name column value from item_row
			var item_icon = library_items[# item_col.sprite, item_row]; // Assign the Sprite column value for item_row
			draw_sprite(item_icon,0,376,242 + (item_padding * invyy));
			draw_text(398,216 + (item_padding * invyy),item_display); // Draw the Display Name for the item
		invyy++;
		};
	};
};

function draw_special_menu(){
	
};

function draw_attack_menu(){
	
};

function draw_command_menu(){
	
};
#endregion
