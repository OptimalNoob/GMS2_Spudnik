function create_camera_normal(){
	if(!instance_exists(Camera)) instance_create_layer(oSpud.x, oSpud.y, "Instances", Camera);
	with (Camera){
		x = clamp(follow.x,x_min,x_max);
		y = clamp(follow.y,y_min,y_max);	
	};
};

function create_camera_free(){
	if(!instance_exists(Camera_interior)) instance_create_layer(oSpud.x, oSpud.y, "Instances", Camera_interior);
	with (Camera_interior){
		x = oSpud.x;
		y = oSpud.y;
	};
};

function create_camera_fixed(){
	if(!instance_exists(Camera_fixed)) instance_create_layer(room_width / 2, room_height / 2, "Instances", Camera_fixed);
};