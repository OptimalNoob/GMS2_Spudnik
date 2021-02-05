
// Draw Background
draw_set_alpha(1);
draw_sprite(sTitle_bg,0,room_width / 2,room_height / 2);
draw_sprite(sTitle_title, 0, room_width / 2, 64);

// Draw 'Press E Prompt'
if(pre_title){
	draw_set_alpha(e_alpha);
	draw_sprite(sTitleBtn_pressE,0,e_x, room_height - 150);
};

draw_set_alpha(1);
var i = 0;
repeat(ds_list_size(btn)){
	draw_sprite(btn[| i], 0, button_x, 320 + (i * button_pad));
	i++;
};

draw_set_color(c_black);
if(!pre_title){
	draw_sprite(sTitle_cursor, 0, (room_width / 2) - (sprite_get_width(sTitleBtn_new) / 2) + 30,320 + (button_sel * button_pad));
	draw_sprite(sTitle_cursor, 1, (room_width / 2) + (sprite_get_width(sTitleBtn_new) / 2) - 30,320 + (button_sel * button_pad));
};