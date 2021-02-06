/// @desc
npc_state = npc_state_broc;
npcID = 0002;
name = "Broc"
type = "shop";
bookmark = NPCBookmark.broc

//flag_id = npc_flag.broc;

width = sprite_get_width(sBroc_idle);
height = sprite_get_height(sBroc_idle);

#region SHOP INVENTORY
npc_inventory = ds_list_create();
ds_list_add(npc_inventory,
"i_0001","i_0002","i_0003","i_0004"
);
#endregion

//dialog = ds_grid_create(1,4);
//#region DIALOG
//dialog[# 0,0] = [
//	"Welcome to the shop!",
//	"Let me know if you see anything you like."
//];
//#endregion

