/// @desc
npc_state = npc_state_broc;
npcID = 0001;
name = "broc"
type = "shop";
bookmark = NPCBookmark.cornovich
npc_instance = 0;

//speaker_name = "";
//speaker_text_flag = 0;
//speaker_type = "";
//speaker_id = 0;
//dialog_library = ds_grid_create(9,9);
speaking = false;
text_out = "";
current_line = 0;
char_count = 0;

// UI Init
textbox_width = sprite_get_width(sDBox_message);
textbox_height = sprite_get_height(sDBox_message);
namebox_width = sprite_get_width(sDBox_name);
namebox_height = sprite_get_height(sDBox_name); 

win_midX = windowWidth / 2;
win_midY = windowHeight / 2;

