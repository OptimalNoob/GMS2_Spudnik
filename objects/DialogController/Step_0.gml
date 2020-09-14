/// @desc
get_player_input();

message_array = dialog_library[# 0,speaker_text_flag]; // Store array of dialog from NPC

if(input_ACTION1 && !speaking && !paused){
	input_ACTION1 = false;
	paused = true;
	speaking = true;
};

if(speaking && input_ACTION1){
	if(char_count >= string_length(message_array[current_line])){
		if(current_line < array_length_1d(message_array) - 1){
			char_count = 0;
			current_line++;	
		} else if (current_line >= array_length_1d(message_array) - 1){
			switch(speaker_type){
				case "shop":
					create_shop(speaker_id);
					paused = true;
					instance_destroy();	
					break;
				default: 
					paused = false;
					instance_destroy();	
					break;	
			};
		};
	};
};