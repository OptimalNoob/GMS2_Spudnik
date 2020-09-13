set_display();
build_globals();
build_player_globals();
build_inputs();
build_flags();
build_library_items();
build_library_enemies();
load_sounds();
build_quests();
randomize();

// Finish Init
room_goto(room_debug);