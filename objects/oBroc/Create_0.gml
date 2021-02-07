/// @desc
npc_state = npc_states[|NPCList.cornovich];
npcID = 0002;
name = "Broc"
type = "shop";
bookmark = NPCList.broc

width = sprite_get_width(sBroc_idle);
height = sprite_get_height(sBroc_idle);

#region SHOP INVENTORY
npc_inventory = ds_list_create();
ds_list_add(npc_inventory,"i_0001","i_0002","i_0003","i_0004");
#endregion