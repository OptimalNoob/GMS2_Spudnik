function quest_0001(){
	if(listenerTalk!=undefined){
		if(listenerTalk.object_index == oCornovich){
			quest_complete("0001");
			quest_activate("0002");
		};
	};
	//if(library_quests[# 4,0][0] == 0){
	//	if(listenerWarp == room_snow){
	//		library_quests[# 4,0][0] = 1
	//	};
	//};

	//if(library_quests[# 4,0][0] == 1){
	//	if(!ds_list_empty(listenerBattle)){
	//	var i = 0
	//	var eCount = 0
	//	repeat(ds_list_size(listenerBattle)){
	//		if(listenerBattle[|i] == oGoop01_battle){
	//			eCount++
	//		}
	//	i++
	//	};
	//	library_quests[# 4, 0][1] += eCount;
	//	if(library_quests[# 4, 0][1] >= 1){
	//		library_quests[# 4,0][0] = 2;
	//	};
	//	};
	//};

	//if(library_quests[# 4,0][0] == 2){
		
	//};
};