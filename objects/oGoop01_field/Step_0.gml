/// @desc
event_inherited();

// Detect Player and begin chase
var target = collision_ellipse(x - range,y - range / 2, x + range, y + range / 2,oSpud,0,0)
if (target != noone){
	return_home = false;
	path_found = mp_grid_path(mpGrid,path,x,y,target.x,target.y,1);
	if(path_found){
		path_start(path, my_speed, 0, 0);	
	};
} else {
	if(alarm[0] == -1 && !return_home) alarm[0] = 180;
};

// Lost Player and returning home
if(return_home){
	path_found = mp_grid_path(mpGrid,path,x,y,parent_spawner.x,parent_spawner.y,1);
	if(path_found) path_start(path, my_speed, 0,0);
};

// Collide with Player > Set Spawn Table > Send to Battle
if(place_meeting(x,y,oSpud)){
	battle_room_prev = room;
	ds_list_copy(battle_spawn_table,spawn_table);
	room_persistent = true;
	with(parent_spawner) instance_destroy();
	instance_destroy();
	room_goto(room_debug_battle);
};