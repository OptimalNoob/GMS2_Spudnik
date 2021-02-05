audio_stop_all();
set_display();
build_globals();
build_inputs();
build_flags();
build_dictionary_items();
build_dictionary_enemies();
build_dictionary_quests();
build_dictionary_dialog();
global_state_create_quests();
global_state_create_dialogs();
load_sounds();
randomize();

instance_create_layer(0,0,"Instances", QuestDirector);
instance_create_layer(0,0,"Instances", EventListener);

// Finish Init
room_goto(room_debug);