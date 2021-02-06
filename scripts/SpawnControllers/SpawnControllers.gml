function create_dialog(_npc){
	if(!instance_exists(DialogController)){
		instance_create_layer(_npc.x,_npc.y - _npc.height,"Dialog",DialogController);
	};
	if(instance_exists(DialogController)){
		with (DialogController){
			npc_instance = _npc;
			npc_state = _npc.npc_state;
			npcID = _npc.npcID;
			name = _npc.name;
			type = _npc.type;
			bookmark = _npc.bookmark;
		};	
	};
};

function create_shop(_npc){
	if(!instance_exists(ShopController)){
		instance_create_layer(_npc.x,_npc.y - _npc.height,"Dialog",ShopController);
		ds_list_copy(ShopController.shop_inventory,_npc.npc_inventory);	
	};
};