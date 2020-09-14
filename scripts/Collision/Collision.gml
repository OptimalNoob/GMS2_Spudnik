function collide_with_object(_object){
	if(place_meeting(x + hsp,y,_object)){
		while(!place_meeting(x + sign(hsp),y,_object)){
			x += sign(hsp);
		};
		hsp = 0;
	};
	if(place_meeting(x,y + vsp,_object)){
		while(!place_meeting(x,y + sign(vsp),_object)){
			y += sign(vsp);
		};
		vsp = 0;
	};
};

function collide_with_npc(_range){
	var w = _range;
	var h = _range / 2;
	var _inst;
	_inst = collision_ellipse(x - w, y - h, x + w, y + h, NPCParent, 0, 1);
	if (_inst != noone) {
		create_dialog(_inst);
	} else {
		if(instance_exists(DialogController)) instance_destroy(DialogController)
	};
};

function collide_with_warp(_warp){
	_warp = instance_place(x,y,Warp);
	if (_warp != noone && !warping) {
		if(!instance_exists(RoomTransition)) instance_create_layer(0,0,"Instances",RoomTransition);
		paused = true;
		warping = true;
		alarm[0] = 60;
		show_debug_message("Warp");
		room_persistent = false;
		spud_spawn_x = _warp.spud_x;
		spud_spawn_y = _warp.spud_y;
	};
	return _warp;
};