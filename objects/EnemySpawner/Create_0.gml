/// @desc
battle_count = irandom_range(1,5);
battle_list = ds_list_create();
var xx = 0; repeat(battle_count){
	var rand_enemy = library_enemies[# 10, irandom(1)];
	ds_list_add(battle_list,rand_enemy);
	xx++;
};

var spawn = library_enemies[# 9, irandom(1)];
var spawned = instance_create_layer(x,y,"Instances",spawn);
spawned.parent_spawner = self;
ds_list_copy(spawned.spawn_table, battle_list);