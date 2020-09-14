/// @desc
name = "Cornovich";
type = "generic";
flag_id = npc_flag.cornovich;
width = sprite_get_width(sCornovich_idle);
height = sprite_get_height(sCornovich_idle);

dialog = ds_grid_create(2,4);

dialog[# 0,0] = [ //
	"Hi Spudnik",
	"Here's some Dialog!"
];
dialog[# 0,1] = [
	"There you go! You're looking a lot better now.",
	"We've had a bit of a slime problem in the village,\n\n would you mind clearing them out of the town\n\nfor me?"
];

