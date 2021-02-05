/// @desc
draw_sprite(sShop_UI, 0, shop_x, shop_y); // Draw Shop background

// Draw selected item cursor
draw_set_color(c_white);
draw_rectangle(shop_x + 120, shop_y - 256 + (selected_buy * list_padding), shop_x + 518, shop_y - 256 + 32 + (selected_buy * list_padding), false);

// Setup drawing for Shop Items
draw_set_color(c_black);
draw_set_font(font_shop);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw Player Inventory on Left
var invyy = 0; repeat(ds_list_size(player_inventory)){
	var draw_item = player_inventory[| invyy];
	var draw_row = ds_grid_value_y(dict_items, 0, 0, 0, ds_grid_height(dict_items), draw_item);
	var draw_display = dict_items[# dic_i.NAME, draw_row];
	var draw_icon = dict_items[# dic_i.SPRITE, draw_row];
	draw_sprite(draw_icon, 0, 128 + 16, 144 + (list_padding * invyy));
	draw_text(156 + 16, 144 - 24 + (list_padding * invyy),draw_display);
	invyy++;
};


// Draw Shop Inventory on Right
var shopyy = 0; repeat (shop_inventory_length) {
	var draw_item = shop_inventory[| shopyy]; // Get each value from the NPCs inventory
	var draw_row = ds_grid_value_y(dict_items, 0, 0, 0, ds_grid_height(dict_items), draw_item); // Match each value to their corresponding row in dict_items
	var draw_display = dict_items[# dic_i.NAME, draw_row]; // Assign the Display Name column value from draw_row
	var draw_icon = dict_items[# dic_i.SPRITE, draw_row]; // Assign the Sprite column value for draw_row
	draw_sprite(draw_icon, 0, shop_x + 140, shop_y - 224 + (list_padding * shopyy)); // Draw the Sprite/Icon for the item
	draw_text(shop_x + 164, shop_y - 246 + (list_padding * shopyy),draw_display); // Draw the Display Name for the item
	shopyy++; // Move to the next item in the NPC inventory
};

// Draw the Description of the selected shop item
var selected_item_id = shop_inventory[| selected_buy]; // Get the id of the currently selected item
var selected_row = ds_grid_value_y(dict_items, 0, 0, 0, ds_grid_height(dict_items), selected_item_id); // Locate the row in librar_items for the selected item
var draw_description = dict_items[# dic_i.DESC, selected_row]; // Assign the Item Description for the selected item from the library
draw_text(shop_x + 132, shop_y + 120,draw_description); // Draw the description of the selected item each time the selection changes

// Draw Confirmation Text when buying an item
if (confirm_buy) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(shop_x,shop_y + 176,"Purchase?");	
};