/// @desc Listener Logic

if(instance_exists(RoomTransition)){
	if(oSpud.warp != noone){
		_warp = oSpud.warp;
		listenerWarp = _warp.target_room;
	};
};

if(instance_exists(BattleDirector)){
    if(ds_list_empty(BattleDirector.enemy_IDs)){
		ds_list_copy(listenerBattle, battle_spawn_table);
    };
};

if(instance_exists(DialogController)){
    if(DialogController.speaking &&
        DialogController.char_count == 1 &&
        DialogController.current_line == 0){
        listenerTalk = DialogController.speaker_id;
    };
};

if(instance_exists(ShopController)){
	if(!ShopController.confirm_buy && ShopController.selected_item_id != 0){
		listenerPurchase = ShopController.selected_item_id;
	};
};

if(instance_exists(BackPack)){
	if(BackPack.item_used && BackPack.item_id != 0){
		listenerItemUse = BackPack.item_id;
	};
};