function quest_0001(){
	if(listenerTalk!=undefined){
		if(listenerTalk.object_index == oCornovich){
			quest_complete("q_0001");
			quest_activate("q_0002");
		};
	};
};