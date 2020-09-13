/// @desc
if(event_npc) {
	listen_npc();
};
if(event_battle){
	return_battle = listen_battle();
};
if(event_tran) {
	return_room = listen_tran(listen_warp);
};
if(event_purchase){
	listen_purchase();
};
if(event_use_item) {
	listen_use_item();
};

show_debug_message(string(library_quests[# quest_col.obj_flag, 0][1]));
#region QUEST LOGIC
if(ds_list_find_index(spud_quests,"0001") != -1){
	var quest_row = ds_grid_value_y(library_quests, 0, 0, 0, ds_grid_height(library_quests) - 1, "0001");
	var quest_obj = library_quests[# quest_col.obj_flag, quest_row];
	switch(quest_obj[0]){
		case 0:
			if(return_room == room_snow){
				quest_progress("0001");
				quest_update();
			};
			break;
		case 1:
			if(event_battle){
				library_quests[# quest_col.obj_flag, quest_row][1] += count_enemies("0001");
				if(library_quests[# quest_col.obj_flag, quest_row][1] >= 3){
					quest_progress("0001");
					quest_update();
				}
				
			};
			
			break;
		case 2:
			
			break;
	};
};


#endregion

// Reset Everything
return_room = 0;
event_npc = false;
event_tran = false;
event_battle = false;
event_purchase = false;
event_use_item = false;