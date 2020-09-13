/// @desc
#region ENUMS
enum pMenu{
	items = 1,
	special = 2,
	attack = 3,
	command = 4
};
enum turn{
	player,
	enemy
};
#endregion

current_turn = turn.player;

inv_sel_item = 0;
att_sel_enem = 0;
spc_sel_item = 0;
com_sel_item = 0;
listen_enemy_count = 0;


#region PLAYER MENU INIT
ui_off_y = 64;
inMenu = false;
current_menu = 0;
ui_ind_items = 0;
ui_ind_special = 0;
ui_ind_attack = 0;
ui_ind_other = 0;
ui_max_items = sprite_get_number(sBattleUI_items) - 1;
ui_max_special = sprite_get_number(sBattleUI_special) - 1;
ui_max_attack = sprite_get_number(sBattleUI_attack) - 1;
ui_max_other = sprite_get_number(sBattleUI_other) - 1;
in_items = false;
in_special = false;
in_attack = false;
in_other = false;
sel_enemy = 0;
player_attacked = false;
current_enemy = 0;
attack_enemy = 0;



c1_x1 = 170;
c1_y = 93;
c1_x2 = 340;
c1_r = 8;
rec1_x1 = 170;
rec1_y1 = 86;
rec1_x2 = 340;
rec1_y2 = 101;
hb_width = 170;

instance_create_layer(56,54 + ui_off_y,"Instances",oSpud_battle);
#endregion

#region ENEMY INIT

current_enemy = 0;
enemy_turn_order = -1;
attack_state = false;
done_anim = false;


spawn_x[0] = 208;
spawn_y[0] = 64;
spawn_x[1] = 264;
spawn_y[1] = 80;
spawn_x[2] = 224;
spawn_y[2] = 104;
spawn_x[3] = 264;
spawn_y[3] = 108;
spawn_x[4] = 208;
spawn_y[4] = 144;

battle_enemies = ds_list_create();
ds_list_copy(battle_enemies,battle_spawn_table);
enemy_IDs = ds_list_create();
for(i = 0; i < ds_list_size(battle_enemies); i++){
	enemy_IDs[| i] = instance_create_layer(spawn_x[i],spawn_y[i],"Instances",battle_enemies[|i]);
};
#endregion
