/// @desc
paused = true;
selected_menu = 0;
selected_inventory = 0;
enum backpackMenu {inventory,party,quests,journal,settings,quit};
menu_labels = ds_list_create();
ds_list_add(menu_labels,"Inventory","Party","Quests","Journal","Settings","Exit to Title");
inMenu = false;
item_padding = 36;
audio_play_sound(sndBP_open,10,0);