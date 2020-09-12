/// @desc
if(input_SELECT || input_START){
	audio_play_sound(sndBP_close,10,0);
	paused = false;
	instance_destroy();
}
if(input_ACTION2 && !inMenu){
	audio_play_sound(sndBP_close,10,0);
	paused = false;
	instance_destroy();
};
if(input_UP && !inMenu) {
	if(selected_menu > 0) audio_play_sound(sndMenu_up,10,0);
	selected_menu = max(0, --selected_menu);
};
if(input_DOWN && !inMenu) {
	if(selected_menu < 5) audio_play_sound(sndMenu_down,10,0);
	selected_menu = min(5, ++selected_menu);
};
if(input_ACTION1 && !inMenu){
	audio_play_sound(sndMenu_confirm,10,0);
	alarm[0] = 2;
	inMenu = true;
	selected_inventory = 0;
};
if(inMenu){
	switch (selected_menu) {
		case backpackMenu.inventory: control_inventory(); break;
		case backpackMenu.party: break;
		case backpackMenu.quests: break;
		case backpackMenu.journal: break;
		case backpackMenu.settings: break;
		case backpackMenu.quit: break;
		default: break;
	};
};
	
if(input_ACTION2 && inMenu){
	audio_play_sound(sndMenu_cancel,10,0);
	inMenu = false;	
};