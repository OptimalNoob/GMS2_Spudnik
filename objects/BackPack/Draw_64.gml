/// @desc

// Draw Main UI
draw_set_alpha(1);
draw_set_color(c_black);
draw_sprite(sBP_background,0,64,40);
draw_set_font(font_shop);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var label_bg_yy = 0; repeat(6) {
	draw_sprite(sBP_menuLabels,0,96,176 + (48 * label_bg_yy));
	label_bg_yy++;
};
if(!inMenu) draw_sprite(sBP_menuLabels_selected,0,96,176 + (48 * selected_menu));
var label_yy = 0; repeat(6) {
	draw_text(100,182 + (48 * label_yy),menu_labels[| label_yy]);
	label_yy++;
};


// Draw Sub-Menus
switch (selected_menu) {
	case backpackMenu.inventory: draw_inventory(); break;
	case backpackMenu.party: break;
	case backpackMenu.quests: draw_quests(); break;
	case backpackMenu.journal: break;
	case backpackMenu.settings: break;
	case backpackMenu.quit: break;
	default: break;
};