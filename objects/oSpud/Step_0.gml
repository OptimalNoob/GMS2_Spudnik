/// @desc
get_player_input();
//Testing Source Control
#region MOVEMENT
if(!paused){
	move_h = input_RIGHT_hold - input_LEFT_hold;
	move_v = input_DOWN_hold - input_UP_hold;
} else {
	move_h = 0;
	move_v = 0;
};
#endregion
#region COLLISION
hsp = move_h * move_speed / sqrt(abs(move_h) + abs(move_v) + .1);
vsp = move_v * move_speed / sqrt(abs(move_v) + abs(move_h) + .1);

if(!noclipMode) collide_with_object(Collider);
collide_with_npc(range);
listen_warp = collide_with_warp(Warp);
if(listen_warp != noone) event_tran = true;

x += hsp;
y += vsp;
#endregion
#region ANIMATION
if (input_MISC4_hold) {
	move_speed = run_speed;
} else{
	move_speed = walk_speed;
};
event_user(1); //  Sprite Animation
#endregion

if(input_SELECT && !paused){
	if(!instance_exists(BackPack)) instance_create_layer(x,y,"Instances",BackPack);	
};

// Debug
if(keyboard_check_pressed(vk_f1)){
	if(!instance_exists(Console)) instance_create_layer(x,y,"GUI",Console);	
};

if(debugMode){
	if(!instance_exists(DebugDrawer)) instance_create_layer(0,0,"Instances",DebugDrawer);	
};