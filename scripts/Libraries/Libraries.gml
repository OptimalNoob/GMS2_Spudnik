function build_library_items(){
	enum item_col{
		itemID,
		displayName,
		description,
		itemType,
		outsideBattle,
		buyValue,
		sellValue,
		sprite,
		healValue,
		strengthValue,
		speedValue,
	}
	var item_array = ds_list_create();
	ds_list_add(item_array,
	"0001", "Small Healing Potion", "A Small Healing Potion", "consumable", true, 10, 5, sItem_healing_potion01, 0.25, 0, 0,
	"0002", "Medium Healing Potion", "A Medium Healing Potion", "consumable",true, 25, 12, sItem_healing_potion02, 0.5, 0, 0,
	"0003", "Large Healing Potion", "A Large Healing Potion", "consumable", true, 75, 37, sItem_healing_potion03, 1, 0, 0,
	"0004", "Bottle of Vodka", "Vodka Description", "consumable", true, 250, 125, sItem_vodka, 2, 0, 0,
	);
	library_items = ds_grid_create(11,4);
	var xx = 0; repeat(11){
		var yy = 0; repeat(4){
			ds_grid_add(library_items, xx, yy, item_array[| xx + yy * 11]);
			yy++;
		};
		xx++
	};
	ds_list_destroy(item_array);
};

function build_library_enemies(){
	enum enemy_col{
		enemyID,
		displayName,
		description,
		enemyType,
		rarity,
		baseHP,
		baseAtk,
		baseDef,
		baseSpd,
		o_spawn,
		o_battle
	}
	var enemy_array = ds_list_create();
	//ID		//Name				//Description								//Type			//Rarity	//HP	//Atk	//Def	//Spd	//ObjectSpawn			//ObjectBattle
	ds_list_add(enemy_array,
	"0001",		"Small Goop",		"A small gelatenous creature.",				"normal",		1,			10,		3,		1,		1,		oGoop01_field,			oGoop01_battle,
	"0002",		"Antonovka",		"An apple with strong acidic flavor",		"normal",		1,			16,		8,		4,		3,		oApple01_field,			oApple01_battle,
	);
	library_enemies = ds_grid_create(11,2);
	var xx = 0; repeat(11){
		var yy = 0; repeat(2){
			ds_grid_add(library_enemies, xx, yy, enemy_array[| xx + yy * 11]);
			yy++;
		};
		xx++
	};
	ds_list_destroy(enemy_array);
};