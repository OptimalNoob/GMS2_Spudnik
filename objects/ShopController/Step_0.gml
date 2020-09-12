/// @desc

get_player_input();
shop_inventory_length = ds_list_size(shop_inventory);
if(!confirm_buy){
	if(input_DOWN){
		if(selected_buy >= shop_inventory_length -1){
			selected_buy = 0;	
		} else {
			audio_play_sound(sndMenu_down,10,0);
			selected_buy++;
		};
	};
	if (input_UP) {
		if (selected_buy <= 0) {
			selected_buy = shop_inventory_length - 1;	
		} else {
			audio_play_sound(sndMenu_up,10,0);
			selected_buy--;	
		};
	};
	if (input_ACTION1 && !confirm_buy) {
		audio_play_sound(sndMenu_confirm,10,0);
		confirm_buy = true;
		alarm[0] = 2;	
	};
	if (input_ACTION2) {
		audio_play_sound(sndMenu_cancel,10,0);
		paused = false;
		instance_destroy();
	};
};

if(confirm_buy){
	var selected_item_id = shop_inventory[| selected_buy];
	if(input_ACTION1 && alarm[0] == -1) {
		audio_play_sound(sndShop_buyItem,10,0);
		buy_item(selected_item_id);
		confirm_buy = false;
	};
	if(input_ACTION2){
		audio_play_sound(sndMenu_cancel,10,0);
		confirm_buy = false;	
	};
};

if (input_START) {
	paused = false;
	instance_destroy();	
};