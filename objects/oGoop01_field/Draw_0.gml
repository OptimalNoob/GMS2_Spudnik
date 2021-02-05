/// @desc
if(debugMode){
	draw_set_color(c_white);
	draw_ellipse(x - range,y - range / 2, x + range, y + range / 2,1);
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
};
draw_self();

switch(path_index){
	case -1:
		image_speed = 1;
		break; //Idle
	default:
		image_speed = 2;
		if(!return_home){ // Following Player
			if(x < oSpud.x) image_xscale = -1;
			if(x >= oSpud.x) image_xscale = 1;
		}else{
			if(x > parent_spawner.x) image_xscale = 1;
			if(x <= parent_spawner.x) image_xscale = -1;
		};
		break; //Moving
};