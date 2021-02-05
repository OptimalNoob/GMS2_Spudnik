function build_globals(){
	//----------------------------------------Camera
	globalvar camX;					camX = 0;
	globalvar camY;					camY = 0;
	globalvar camera_1;				camera_1 = camera_create();
	//----------------------------------------System
	globalvar paused;				paused = false;
	globalvar debugMode;			debugMode = false;
	globalvar noclipMode;			noclipMode = false;
	//----------------------------------------Dictionaries
	globalvar dict_items;
	globalvar dict_enemies;
	globalvar dict_quests;
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
	globalvar spud_hp;				spud_hp = 250;
	globalvar spud_max_hp;			spud_atk = 999;
	globalvar spud_atk;				spud_max_hp = 1000;
	globalvar spud_money;			spud_money = 1000;
	globalvar spud_spawn_x;			spud_spawn_x = 328;
	globalvar spud_spawn_y;			spud_spawn_y = 288;
	globalvar spud_quests;			spud_quests = ds_list_create();
	globalvar player_inventory;		player_inventory = ds_list_create();
	ds_list_add(player_inventory, "i_0001","i_0001","i_0004");
	//----------------------------------------Flags (TO BE REMOVED)
	globalvar npc_flags;			npc_flags = ds_list_create();
	//----------------------------------------State Machine
	globalvar state_quests;
	globalvar dict_dialog_corn;
	globalvar dict_dialog_broc;
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