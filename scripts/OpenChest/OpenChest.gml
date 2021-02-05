///@func chest_open(_chest);
///@desc Triggers the opening of a chest, adding loot to the player inventory
function chest_open(_chest){
	audio_play_sound(sndBP_open,10,false);
	_chest.image_index = 1;
	ds_list_add(player_inventory, _chest.loot);
	ds_list_sort(player_inventory, true);
	_chest.interactable = false;
}