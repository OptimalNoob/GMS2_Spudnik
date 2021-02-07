enum sprite_lib{		// Accessing Sprite Libraries
	idle,
	attacking,
	damaged
}

enum update_quest{		// Triggering Quest Updates
	activate,
	update,
	complete
}

enum dic_q{				// Accessing Quest Dictionary
	ID,
	NAME,
	STATE,
	DESC,
	OFLAG,
	ONAME
}

enum dic_e{				// Accessing Enemy Dictionary
	ID,
	NAME,
	DESC,
	RARITY,
	HP,
	ATK,
	DEF,
	SPD,
	OBJS,
	OBJB
}

enum dic_i{				// Accessing Item Dictionary
	ID,
	NAME,
	DESC,
	OUTBAT,
	PRICE,
	VALUE,
	SPRITE,
	HEAL,
	STRENGTH,
	SPEED,
}

enum DialogNormal{			// Columns for Master Normal Dialog Grid
	npcID,
	npcDict,
	npcBookmark
}
	
enum NPCDialogNormal{		// Columns for NPC Normal Dialog Grid
	npcBookmark,
	npcDialogArray,
	npcLinkedBookmark
}

enum NPCList{			// Used for accessing ds_list 'npc_bookmark'
	cornovich,
	broc,
}

enum NPCState{				// Used for controlling NPC Dialog and Quests
	normal,
	givequest,
	completequest
}

enum backpackMenu {			// Used for accessing Backpack submenus
	inventory,
	party,
	quests,
	journal,
	settings,
	quit
}

enum gameChoice{
	newgame,
	contgame,
	loadgame,
	loading
}