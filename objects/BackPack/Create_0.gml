/// @desc

//---Pause Game and Play Sound
paused = true;
audio_play_sound(sndBP_open,10,0);

//---Reset Selectors
selected_menu = 0;
inMenu = false;
inSettings = false;
inGeneralSettings = false;

//---Create Main Button Labels
menu_labels = ds_list_create();
ds_list_add(menu_labels,"Inventory","Party","Quests","Journal","Settings","Exit to Title");

//---Inventory Init
item_padding = 36;
selected_inventory = 0;
item_id = 0;
item_used = false;

//---Settings Init
setting_labels = ds_list_create();
ds_list_add(setting_labels, "General", "Controls", "Audio", "Display");
setting_padding = 36;
selected_setting = 0;
selected_general_setting = 0;
// General
setting_general_labels = ds_list_create();
ds_list_add(setting_general_labels, "Save Game", "Load Game");