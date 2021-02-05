/// @desc
battle_count = irandom_range(1,2);
battle_list = ds_list_create();
var xx = 0; repeat(battle_count){
	var rand_enemy = dict_enemies[# dic_e.OBJB, irandom(1)];
	ds_list_add(battle_list,rand_enemy);
	xx++;
};

var spawn = dict_enemies[# dic_e.OBJS, irandom(1)];
var spawned = instance_create_layer(x,y,"Instances",spawn);
spawned.parent_spawner = self;
ds_list_copy(spawned.spawn_table, battle_list);