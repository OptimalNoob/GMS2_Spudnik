function global_state_create_quests(){
	var questState_array = [
		["q_0001",0],["q_0002",0],["q_0003",0],["q_0004",0],["q_q_0005",0],["q_0006",0],["q_0007",0],["q_0008",0],["q_0009",0],["q_0010",0],
		["q_0011",0],["q_0012",0],["q_0013",0],["q_0014",0],["q_q_0015",0],["q_0016",0],["q_0017",0],["q_0018",0],["q_0019",0],["q_0020",0],
	];
	state_quests = ds_grid_create_from_array(questState_array);
};

function global_state_create_dialogs(){
	var dialogState_array = [
		["npc_corn",0],
		["npc_broc",0],
	];
	state_dialog = ds_grid_create_from_array(dialogState_array);
};