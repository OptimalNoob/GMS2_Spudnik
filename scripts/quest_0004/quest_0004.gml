function quest_0004(){
	if(!ds_list_empty(listenerBattle)){
		var enemy_count = listener_enemy_count("e_0001");
		var quest_row = quest_get_row("q_0004");
		dict_quests[# dic_q.OFLAG, quest_row][1] += enemy_count;
		if(dict_quests[# dic_q.OFLAG, quest_row][1] >= 1){
			quest_complete("q_0004");
			quest_activate("q_0005");
		};
	};
};