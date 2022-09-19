function build_dictionary_quests(){
	//[
	//	ID,								{string}
	//	Quest Name,						{string}
	//	State,							{real}	[-1] Inactve | [0] Active | [1] Completed
	//	Description,					{string}
	//	Objective Flag Array,			{array} [0] Simple Objective | [0,0] Simple Objective with Counter | [0,0,0] Multiple Objectives/Counters
	//	Objective Name Array			{array} ["Objective 1", "Objective 2", "Objective 3", ...]
	//],(comma for more entries)
	var quest_array = [ 
		[
			"q_0001", // quest_0001
			"TUTORIAL: NPCs",
			-1,
			"You can talk to NPCs when the prompt appears and you press 'E'.",
			[0],
			["Talk to Cornovich"]
		],
		[
			"q_0002", // quest_0002
			"TUTORIAL: Shops",
			-1,
			"Shops allow you to purchase helpful items that assist you throughout your adventure!",
			[0],
			["Talk to Broc", "Purchase a small Health Potion"]
		],
		[
			"q_0003", // quest_0003
			"TUTORIAL: Using Items",
			-1,
			"You can use items from your backpack to heal!",
			[0],
			["Use a small healing potion to recover some health after your brutal yet awesome battles."]
		],
		[
			"q_0004", // quest_0004
			"TUTORIAL: Battles",
			-1,
			"Goops are fucking assholes, got eeeeem",
			[0,0],
			["Encounter and Defeat 3 Goops"]
		],
		[
			"q_0005", // quest_0005
			"TUTORIAL: Exploring the World",
			-1,
			"Get the fuck out of here you damn hermit",
			[0],
			["l e a v e"]
		],
	];
	dict_quests = ds_grid_create_from_array(quest_array);	
};