room_persistent = false;
pre_title = true;
e_slide = false;
e_fade = true;
e_alpha = 1;
e_x = room_width / 2;
button_x = room_width + sprite_get_width(sTitleBtn_new);
button_pad = 80;
button_sel = 0;
btn = ds_list_create();
ds_list_add(btn, sTitleBtn_new, sTitleBtn_continue,
sTitleBtn_load, sTitleBtn_options, sTitleBtn_quit);