enum sprite_lib{		// Accessing Sprite Libraries
	idle,
	attacking,
	damaged
};

enum update_quest{		// Triggering Quest Updates
	activate,
	update,
	complete
};

enum npc_flag{			// Accessing NPC Flags
	cornovich,
	broc
};

enum dic_q{
	ID,
	NAME,
	STATE,
	DESC,
	OFLAG,
	ONAME
};


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
};

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
};