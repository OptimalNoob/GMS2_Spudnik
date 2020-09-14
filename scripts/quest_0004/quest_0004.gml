function quest_0004(){
	if(!ds_list_empty(listenerBattle)){
		var enemy_count = listener_enemy_count("0001");
		var quest_row = quest_get_row("0004");
		library_quests[# quest_col.obj_flag, quest_row][1] += enemy_count;
		if(library_quests[# quest_col.obj_flag, quest_row][1] >= 1){
			quest_complete("0004");
			quest_activate("0005");
		};
	};
};