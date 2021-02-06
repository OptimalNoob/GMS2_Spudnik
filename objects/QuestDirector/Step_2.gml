/// @desc
if(check_listeners()){
	if(!ds_list_empty(spud_quests)){
		var i = 0;
		repeat(ds_list_size(spud_quests)){
			var _str = spud_quests[| i];
			var quest_str = string_copy(_str,3,string_length(_str)-2);
			script_execute(asset_get_index("quest_" + quest_str));
			i++;
		};
	};
};

//reset global listeners at end of frame
listenerWarp = undefined
listenerTalk = undefined
listenerPurchase = undefined
listenerItemUse = undefined
ds_list_clear(listenerBattle);