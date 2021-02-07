if(!samesession){
audio_stop_all();
set_display();
build_globals();
build_inputs();
build_dictionary_items();
build_dictionary_enemies();
build_dictionary_quests();
build_dict_dialog();
global_state_create_quests();
global_state_create_dialogs();
load_sounds();
instance_create_layer(0,0,"Instances", QuestDirector);
instance_create_layer(0,0,"Instances", EventListener);
randomize();
}

// Finish Init
switch(gamechoice){
	case gameChoice.newgame:
		new_game();
		break;
	case gameChoice.contgame:
		load_game(1);
		//loadlastplayedgame
		break;
	case gameChoice.loadgame:
		//loadgame
		break;
	case gameChoice.loading:
		show_debug_message("poop");
		room_goto(loadroom);
		break;
	default: break;
}
