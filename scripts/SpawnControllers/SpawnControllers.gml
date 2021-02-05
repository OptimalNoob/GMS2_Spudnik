function create_dialog(_npc){
	if(!instance_exists(DialogController)){
		instance_create_layer(_npc.x,_npc.y - _npc.height,"Dialog",DialogController);
	};
	if(instance_exists(DialogController)){
		with (DialogController){
			speaker_name = _npc.name;
			speaker_text_flag = npc_flags[|_npc.flag_id];
			speaker_type = _npc.type;
			speaker_id = _npc;
			ds_grid_copy(DialogController.dialog_library,_npc.dialog);	
		};	
	};
};

function create_shop(_npc){
	if(!instance_exists(ShopController)){
		instance_create_layer(_npc.x,_npc.y - _npc.height,"Dialog",ShopController);
		ds_list_copy(ShopController.shop_inventory,_npc.npc_inventory);	
	};
};