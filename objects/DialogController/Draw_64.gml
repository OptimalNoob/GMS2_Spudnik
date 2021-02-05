/// @desc
if(speaking){
	var npc_name = speaker_name;
	var text_x = win_midX - textbox_width / 2 + 40;
	var text_y = windowHeight - textbox_height + 16;
	draw_sprite(sDBox_message,0,win_midX, windowHeight - 32);	
	draw_sprite(sDBox_name,0,win_midX - namebox_width - 96,windowHeight - textbox_height - 32);
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_set_font(font_dialog);
	draw_set_halign(fa_center);
	draw_text(text_x + 120, text_y - 112, npc_name);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	if(char_count < string_length(message_array[current_line])){
		if(char_count mod 2 = 0) audio_play_sound(sndVoice1, 10, false);
		char_count++;	
	};
	var substr = string_copy(message_array[current_line],1,char_count);
	draw_text(text_x, text_y, substr);
};