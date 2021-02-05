function build_inputs(){
	globalvar input_UP;
	globalvar input_DOWN;
	globalvar input_LEFT;
	globalvar input_RIGHT;
	globalvar input_UP_hold;
	globalvar input_DOWN_hold;
	globalvar input_LEFT_hold;
	globalvar input_RIGHT_hold;
	
	globalvar input_ACTION1;
	globalvar input_ACTION2;
	globalvar input_ACTION3;
	globalvar input_ACTION4;
	globalvar input_ACTION1_hold;
	globalvar input_ACTION2_hold;
	globalvar input_ACTION3_hold;
	globalvar input_ACTION4_hold;
	
	globalvar input_MISC1;
	globalvar input_MISC2;
	globalvar input_MISC3;
	globalvar input_MISC4;
	globalvar input_MISC1_hold;
	globalvar input_MISC2_hold;
	globalvar input_MISC3_hold;
	globalvar input_MISC4_hold;
	
	globalvar input_START;
	globalvar input_SELECT;
};

function get_player_input(){
	input_UP			= keyboard_check_pressed(ord("W"))	|| gamepad_button_check_pressed(0,gp_padu);
	input_DOWN			= keyboard_check_pressed(ord("S"))	|| gamepad_button_check_pressed(0,gp_padd);
	input_LEFT			= keyboard_check_pressed(ord("A"))	|| gamepad_button_check_pressed(0,gp_padl);
	input_RIGHT			= keyboard_check_pressed(ord("D"))	|| gamepad_button_check_pressed(0,gp_padr);
	input_UP_hold		= keyboard_check(ord("W"))			|| gamepad_button_check(0,gp_padu);
	input_DOWN_hold		= keyboard_check(ord("S"))			|| gamepad_button_check(0,gp_padd);
	input_LEFT_hold		= keyboard_check(ord("A"))			|| gamepad_button_check(0,gp_padl);
	input_RIGHT_hold	= keyboard_check(ord("D"))			|| gamepad_button_check(0,gp_padr);
	
	input_ACTION1		= keyboard_check_pressed(ord("E"))	|| gamepad_button_check_pressed(0,gp_face1);
	input_ACTION2		= keyboard_check_pressed(ord("Q"))	|| gamepad_button_check_pressed(0,gp_face2);
	input_ACTION3		= keyboard_check_pressed(ord("W"))	|| gamepad_button_check_pressed(0,gp_face3);
	input_ACTION4		= keyboard_check_pressed(ord("W"))	|| gamepad_button_check_pressed(0,gp_face4);
	input_ACTION1_hold	= keyboard_check(ord("E"))			|| gamepad_button_check(0,gp_face1);
	input_ACTION2_hold	= keyboard_check(ord("Q"))			|| gamepad_button_check(0,gp_face2);
	input_ACTION3_hold	= keyboard_check(ord("W"))			|| gamepad_button_check(0,gp_face3);
	input_ACTION4_hold	= keyboard_check(ord("W"))			|| gamepad_button_check(0,gp_face4);
	
	input_MISC1			= keyboard_check_pressed(ord("Z"))	|| gamepad_button_check_pressed(0,gp_shoulderl);
	input_MISC2			= keyboard_check_pressed(ord("W"))	|| gamepad_button_check_pressed(0,gp_shoulderlb);
	input_MISC3			= keyboard_check_pressed(ord("X"))	|| gamepad_button_check_pressed(0,gp_shoulderr);
	input_MISC4			= keyboard_check_pressed(vk_shift)	|| gamepad_button_check_pressed(0,gp_shoulderrb);
	input_MISC1_hold	= keyboard_check(ord("Z"))			|| gamepad_button_check(0,gp_shoulderl);
	input_MISC2_hold	= keyboard_check(ord("W"))			|| gamepad_button_check(0,gp_shoulderlb);
	input_MISC3_hold	= keyboard_check(ord("X"))			|| gamepad_button_check(0,gp_shoulderr);
	input_MISC4_hold	= keyboard_check(vk_shift)			|| gamepad_button_check(0,gp_shoulderrb);
	
	input_START			= keyboard_check_pressed(vk_escape)	|| gamepad_button_check_pressed(0,gp_start);
	input_SELECT		= keyboard_check_pressed(ord("I"))	|| gamepad_button_check_pressed(0,gp_select);
};