/// @desc
if(current_turn = turn.player && current_menu = pMenu.attack){
	draw_set_color(c_red);
	draw_set_alpha(0.3);
	draw_rectangle(
	enemy_IDs[| sel_enemy].x - 8,
	enemy_IDs[| sel_enemy].y - 8,
	enemy_IDs[| sel_enemy].x + 8,
	enemy_IDs[| sel_enemy].y + 8,
	false
	);
};