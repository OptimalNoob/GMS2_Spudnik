audio_stop_all();
set_display();
build_globals();
build_player_globals();
build_inputs();
build_flags();
build_dictionary_items();
build_dictionary_enemies();
build_dictionary_quests();
load_sounds();
randomize();

instance_create_layer(0,0,"Instances", QuestDirector);
instance_create_layer(0,0,"Instances", EventListener);

// Finish Init
room_goto(room_debug);