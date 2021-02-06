/// @desc

// Main Init
path = path_add();
range = 80;
my_speed = 0.8;
pause_speed = 0;
regular_speed = 0.8;
path_found = 0;
parent_spawner = 0;
return_home = false;
spawn_table = ds_list_create();

// Pathfind Grid Init
var gSize = 16;
mpGrid = mp_grid_create(0,0,room_width / gSize,room_height / gSize,gSize,gSize);
mp_grid_add_instances(mpGrid,Collider,1);

