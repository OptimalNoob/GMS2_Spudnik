/// @desc
name = "Broc";
type = "shop";
flag_id = npc_flag.broc;
width = sprite_get_width(sBroc_idle);
height = sprite_get_height(sBroc_idle);

dialog = ds_grid_create(1,4);
npc_inventory = ds_list_create();

#region DIALOG
dialog[# 0,0] = [
	"Welcome to the shop!",
	"Let me know if you see anything you like."
];
#endregion

#region SHOP INVENTORY
ds_list_add(npc_inventory,
"i_0001","i_0002","i_0003","i_0004"
);
#endregion