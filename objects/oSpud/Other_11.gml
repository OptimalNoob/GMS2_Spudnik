/// @desc Sprite Animation Control

depth = -y;

if ((input_UP || input_DOWN || input_LEFT || input_RIGHT) && !paused){
	image_index = 0;
};

if (input_MISC4_hold && (move_h != 0 || move_v != 0)) {
	image_speed = 2;
} else{
	image_speed = 1.4;
};

if(move_h != 0) {
	image_xscale = move_h;
};

switch (move_h){
	case -1:
		if(move_v != -1) sprite_index = sSpud_walk; else sprite_index = sSpud_walk_back;
		break;
	case 1:
		if(move_v != -1) sprite_index = sSpud_walk; else sprite_index = sSpud_walk_back;
		break;
	case 0:
		switch (move_v){
			case -1: sprite_index = sSpud_walk_back; break;
			case 1: sprite_index = sSpud_walk; break;
			case 0: sprite_index = sSpud_idle; break;
			default: break;
		}
		break;
	default: break;
};