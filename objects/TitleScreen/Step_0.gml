get_player_input();
if(!audio_is_playing(musTitleTheme01)) audio_play_sound(musTitleTheme01, 10, 1);

if(pre_title){
	if(e_fade){
		e_alpha = max(0, e_alpha - 0.02);
		if(e_alpha == 0) e_fade = false;
	}else{
		e_alpha = min(1, e_alpha + 0.02);
		if(e_alpha == 1) e_fade = true;
	};
	if(input_ACTION1){
		e_slide = true;
		if(alarm[0] == -1) alarm[0] = 60;
	};
	
};

if(e_slide && pre_title){
	e_x = max(-sprite_get_width(sTitleBtn_pressE), e_x - 20);
	button_x = max(room_width / 2, button_x - 20);
};

if(!pre_title){
	if(input_DOWN) button_sel = min(4, ++button_sel);
	if(input_UP) button_sel = max(0, --button_sel);
	if(input_ACTION1){
		switch (button_sel){
			case 0: room_goto(room_init); break;
			case 1: break;
			case 2: break;
			case 3: break;
			case 4: game_end(); break;
		};
	};
};