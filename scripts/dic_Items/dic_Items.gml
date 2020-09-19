function build_dictionary_items(){
	//[
	//	ID,								{string}
	//	Name,							{string}
	//	Description,					{string}
	//	Usable Outside Battle,			{bool}
	//	Purchase Price,					{real}
	//	Sell Price,						{real}
	//	Item Sprite,					{sprite}
	//	Heal Percent,					{real}
	//	Strength Increase,				{real}
	//	Speed Increase					{real}
	//],(comma for more entries)
	var item_array = [
		[
			"i_0001",
			"Small Healing Potion",
			"Heals 25% of your HP",
			true,
			10,
			5,
			sItem_healing_potion01,
			0.25,
			0,
			0
		],
		[
			"i_0002",
			"Medium Healing Potion",
			"Heals 50% of your HP",
			true,
			10,
			5,
			sItem_healing_potion01,
			0.25,
			0,
			0
		],
		[
			"i_0003",
			"Large Healing Potion",
			"Heals 75% of your HP",
			true,
			10,
			5,
			sItem_healing_potion01,
			0.25,
			0,
			0
		],
		[
			"i_0004",
			"Bottle of Vodka",
			"Provides a full Heal",
			true,
			10,
			5,
			sItem_healing_potion01,
			0.25,
			0,
			0
		],
	];
	dict_items = ds_grid_create_from_array(item_array);
};