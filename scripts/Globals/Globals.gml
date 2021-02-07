function build_globals(){
	//----------------------------------------Camera
	globalvar camX;					camX = 0;
	globalvar camY;					camY = 0;
	globalvar camera_1;				camera_1 = camera_create();
	//----------------------------------------System / Debug
	globalvar paused;				paused = false;
	globalvar saveslot;
	globalvar debugMode;			debugMode = false;
	globalvar noclipMode;			noclipMode = false;
	globalvar loadroom;
	//----------------------------------------Dialog & Quest System
	globalvar npc_bookmark;		npc_bookmark = ds_list_create();
	globalvar npc_states;		npc_states = ds_list_create();
	globalvar dict_dialog_normal;
	globalvar dialog_corn_normal;
	globalvar dialog_broc_normal;
	//----------------------------------------Dictionaries	
	globalvar dict_items;
	globalvar dict_enemies;
	globalvar dict_quests;
	globalvar dict_dialog_corn;
	globalvar dict_dialog_broc;
	//----------------------------------------BattleSystem
	globalvar battle_spawn_table;	battle_spawn_table = ds_list_create();
	globalvar battle_room_prev;		battle_room_prev = 0;
	//----------------------------------------Listeners
	globalvar listenerWarp;			listenerWarp = undefined
    globalvar listenerTalk;			listenerTalk = undefined
    globalvar listenerBattle;		listenerPurchase = undefined
    globalvar listenerPurchase;		listenerItemUse = undefined
    globalvar listenerItemUse;		listenerBattle = ds_list_create();
	//----------------------------------------Player
	globalvar spud_hp;
	globalvar spud_max_hp;
	globalvar spud_atk;
	globalvar spud_money;
	globalvar spud_spawn_x;
	globalvar spud_spawn_y;
	globalvar spud_quests;			spud_quests = ds_list_create();
	globalvar player_inventory;		player_inventory = ds_list_create();
	//----------------------------------------State Machine
	globalvar state_quests;
};

function set_display(){
	globalvar windowWidth;			windowWidth = 1280;
	globalvar windowHeight;			windowHeight = 720;
	surface_resize(application_surface,windowHeight,windowWidth);
};

function load_sounds(){
	audio_group_load(audgroup_Dialog);
	audio_group_load(audgroup_UI);
	audio_group_load(audgroup_Music);
};