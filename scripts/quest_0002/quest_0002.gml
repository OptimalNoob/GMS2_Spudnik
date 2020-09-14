function quest_0002(){
	var quest_prog = quest_get_progress("0002");
	switch(quest_prog){
		case 0:
			if(listenerTalk != undefined){
				if(listenerTalk.object_index == oBroc){
					quest_progress("0002");
				};
			};
		break;
		case 1:
			if(listenerPurchase != undefined){
				if(listenerPurchase == "0001"){
					quest_complete("0002");
					quest_activate("0003");
				};
			};
		break;
	};
};