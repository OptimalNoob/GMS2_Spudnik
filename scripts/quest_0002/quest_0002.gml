function quest_0002(){
	var quest_prog = quest_get_progress("q_0002");
	switch(quest_prog){
		case 0:
			if(listenerTalk != undefined){
				if(listenerTalk.object_index == oBroc){
					quest_progress("q_0002");
				};
			};
		break;
		case 1:
			if(listenerPurchase != undefined){
				if(listenerPurchase == "i_0001"){
					quest_complete("q_0002");
					quest_activate("q_0003");
				};
			};
		break;
	};
};