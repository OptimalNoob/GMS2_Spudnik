function build_dictionary_enemies(){
	//[
	//	ID,					{string}
	//	Display Name,		{string}
	//	Description,		{string}
	//	Rarity,				{real}
	//	Health,				{real}
	//	Attack,				{real}
	//	Defense,			{real}
	//	Speed,				{real}
	//	ObjectSpawn			{object}
	//	ObjectBattle		{object}
	//],(comma for more entries)
	var enemy_array = [
		[
			"e_0001",
			"Small Goop",
			"A small gelatenous creature.",
			1,
			10,
			3,
			1,
			1,
			oGoop01_field,
			oGoop01_battle
		],
		[
			"e_0002",
			"Antonovka",
			"An apple with strong acidic flavor",
			1,
			16,
			8,
			4,
			3,
			oApple01_field,
			oApple01_battle
		],
	];
	dict_enemies = ds_grid_create_from_array(enemy_array);	
};