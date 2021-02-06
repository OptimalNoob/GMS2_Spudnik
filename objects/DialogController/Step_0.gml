/// @desc
get_player_input();

//npc_state = npc_state_broc;
//npcID = 0001;
//name = "broc"
//type = "shop";
//bookmark = NPCBookmark.cornovich

var dict_h = ds_grid_height(dict_dialog_normal)-1
var dict_row = ds_grid_value_y(dict_dialog_normal, DialogNormal.npcID, 0, DialogNormal.npcID, dict_h, npcID)
var npc_bm = npc_bookmark[| bookmark] - 1
var link_bm = dict_dialog_normal[# DialogNormal.npcDict, dict_row][# NPCDialogNormal.npcLinkedBookmark, npc_bm];

//if(keyboard_check_pressed(ord("E"))){
//	current_line = min(++current_line, array_length(dict_dialog_normal[# DialogNormal.npcDict, dict_row][# NPCDialogNormal.npcDialogArray, npc_bm]) - 1)		
//}

//show_debug_message(dict_dialog_normal[# DialogNormal.npcDict, dict_row][# NPCDialogNormal.npcDialogArray, npc_bm][current_line])

message_array = dict_dialog_normal[# DialogNormal.npcDict, dict_row][# NPCDialogNormal.npcDialogArray, npc_bm]; // Store array of dialog from NPC

if(input_ACTION1 && !speaking && !paused){
	input_ACTION1 = false;
	paused = true;
	speaking = true;
};

if(speaking && input_ACTION1){
	if(char_count >= string_length(message_array[current_line])){
		if(current_line < array_length(message_array) - 1){
			char_count = 0;
			current_line++;	
		} else if (current_line >= array_length(message_array) - 1){
			switch(link_bm){
				case -1:
					break;
				default:
					npc_bookmark[| bookmark] = link_bm;
					break;
			}
			switch(type){
				case "shop":
					create_shop(npc_instance);
					paused = true;
					instance_destroy();	
					break;
				default: 
					paused = false;
					instance_destroy();	
					break;	
			};
		};
	};
};