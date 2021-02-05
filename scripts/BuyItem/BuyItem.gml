/// @func buy_item(_item);
function buy_item(_item){
	var buy_row = ds_grid_value_y(dict_items,dic_e.ID,0,dic_e.ID,ds_grid_height(dict_items),_item);
	var buy_value = dict_items[# dic_i.PRICE, buy_row];
	ds_list_add(player_inventory,_item);
	spud_money -= buy_value;
	ds_list_sort(player_inventory,1);
};