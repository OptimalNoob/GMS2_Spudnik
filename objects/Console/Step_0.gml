/// @desc Console Logic

// Write Text in Console
input = keyboard_string;
if (keyboard_check(vk_anykey)) {
	cursor = cursorIcon;
	alarm[0] = delay;
}

if (keyboard_check_pressed(vk_enter)) {
	switch (input) {
		case "debug":
			debugMode = !debugMode;
			ds_list_insert(inputLog,0,"Debug Mode: " + string(debugMode));
			break;
		case "restart":
			paused = false;
			room_restart();
			break;
		case "reload":
			game_restart();
			break;
		case "noclip":
			noclipMode = !noclipMode
			ds_list_insert(inputLog,0,"Noclip Mode: " + string(noclipMode));
			break;
		case "flag_cornovich":
			npc_flags[| npc_flag.cornovich] = 1;
			ds_list_insert(inputLog,0,"+1 Cornovich Flag");
			break;
		case "item next":
			if(instance_exists(DebugDrawer)) DebugDrawer.item_number++;
			break;
		case "item prev":
			if(instance_exists(DebugDrawer)) DebugDrawer.item_number--;
			break;
		case "room debug":
			room_goto(room_debug);
			paused = false;
			break;
		case "room battle":
			room_goto(room_debug_battle);
			paused = false;
			break;
		case "room shop":
			room_goto(room_debug_interior);
			paused = false;
			break;
		case "quit":
			game_end();
			break;
		case "buff":
			ds_list_insert(inputLog,0,"OVER 9000!");
			spud_atk = 9001;
			break;
		case "quest activate":
			QuestDirector.quest_notif = update_quest.activate;
			break;
		case "quest update":
			QuestDirector.quest_notif = update_quest.update;
			break;
		case "quest complete":
			QuestDirector.quest_notif = update_quest.complete;
			break;
		case "quest start":
			quest_activate("q_0001");
			break;
		default:
			ds_list_insert(inputLog,0,"UNKNOWN COMMAND");
			break;
	}
	keyboard_string = ""
}

if(ds_list_size(inputLog) > 10){
	ds_list_delete(inputLog,ds_list_size(inputLog)-1);
};

// Close Console
if (keyboard_check_pressed(vk_f1) || keyboard_check_pressed(vk_escape)) {
	paused = false;
	instance_destroy();	
}