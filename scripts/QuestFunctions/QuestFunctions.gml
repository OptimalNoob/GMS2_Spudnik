function quest_activate(_questID){
	QuestDirector.quest_notif = update_quest.activate;
	var quest_height = ds_grid_height(dict_quests) - 1;
	var quest_row = ds_grid_value_y(dict_quests, dic_q.ID,0,dic_q.ID,quest_height,_questID);
	dict_quests[# dic_q.STATE, quest_row] = 0;
	ds_list_add(spud_quests,_questID);
};

function quest_progress(_questID){
	QuestDirector.quest_notif = update_quest.update;
	var quest_height = ds_grid_height(dict_quests) - 1;
	var quest_row = ds_grid_value_y(dict_quests, dic_q.ID,0,dic_q.ID,quest_height,_questID);
	dict_quests[# dic_q.OFLAG, quest_row][0]++;
};

function quest_complete(_questID){
	QuestDirector.quest_notif = update_quest.complete;
	var quest_height = ds_grid_height(dict_quests) - 1;
	var quest_row = ds_grid_value_y(dict_quests, dic_q.ID,0,dic_q.ID,quest_height,_questID);
	dict_quests[# dic_q.STATE, quest_row] = 1;
	var quest = ds_list_find_index(spud_quests, _questID)
	ds_list_delete(spud_quests,quest);
};

function check_listeners(){
	if(listenerWarp!=undefined || listenerTalk!=undefined || listenerPurchase!=undefined
	|| listenerItemUse!=undefined || !ds_list_empty(listenerBattle)){
		return true;
	};
};

function quest_get_row(_questID){
	var quest_height = ds_grid_height(dict_quests) - 1;
	var quest_row = ds_grid_value_y(dict_quests, dic_q.ID,0,dic_q.ID,quest_height,_questID);
	return quest_row;
};

function enemy_get_row(_enemyID){
	
};

function quest_get_progress(_questID){
	var quest_height = ds_grid_height(dict_quests) - 1;
	var quest_row = ds_grid_value_y(dict_quests, dic_q.ID,0,dic_q.ID,quest_height,_questID);
	var obj_flag = dict_quests[# dic_q.OFLAG, quest_row][0];
	return obj_flag;
};

function listener_enemy_count(_enemyID){
	var enemycount = 0;
	var dic_height = ds_grid_height(dict_enemies) - 1;
    var i = 0; repeat(ds_list_size(listenerBattle)){
        var enemy_row = ds_grid_value_y(dict_enemies,dic_e.OBJB,0,dic_e.OBJB,dic_height, listenerBattle[|i]);
        var enemy_id = dict_enemies[# dic_e.ID, enemy_row];
        if(enemy_id = _enemyID) enemycount++;
        i++;
    };
    //ds_list_clear(return_battle_list);
    return enemycount;
};