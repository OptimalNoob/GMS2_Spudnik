/// @desc
draw_set_font(font_debugGUI)
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(10,windowHeight - 200,200,windowHeight - 10,false);
draw_set_alpha(1);
draw_set_color(c_red);
draw_point(10,windowHeight - 200);
draw_point(200,windowHeight - 32);
draw_set_color(c_white);
draw_text(16,windowHeight - 32,input + cursor);
draw_text(216,windowHeight - 196,"Available Commands:");
draw_text(216,windowHeight - 156,"debug");
draw_text(216,windowHeight - 136,"noclip");

if (!ds_list_empty(inputLog)) {
	var list_at = 0; repeat(ds_list_size(inputLog)){
		draw_text(16,windowHeight - 48 - (16 * list_at),string(inputLog[| list_at]));	
		list_at++;
	};
};
draw_text(4,4,keyboard_lastkey);