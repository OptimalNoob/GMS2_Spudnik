/// @desc
name = "Cornovich";
type = "generic";
flag_id = npc_flag.cornovich;
width = sprite_get_width(sCornovich_idle);
height = sprite_get_height(sCornovich_idle);

dialog = ds_grid_create(2,4);

dialog[# 0,0] = [ // 
	"Hello there potato guy!",
	"Oh, your name is Spudnik?",
	"They call me Cornovich, nice to meet you!",
	"Hopefully this dialog system is working fine. \n\nThis is a test of multiline dialog too."
];
dialog[# 1,0] = [
	"This is some text in the second flag. \n\nIt only has 1 line of text."
];