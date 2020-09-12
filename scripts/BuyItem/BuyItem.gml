/// @func buy_item(_item);
function buy_item(_item){
	var buy_row = ds_grid_value_y(library_items,0,0,0,ds_grid_height(library_items),_item);
	var buy_value = library_items[# item_col.buyValue, buy_row];
	ds_list_add(player_inventory,_item);
	spud_money -= buy_value;
	ds_list_sort(player_inventory,1);
};