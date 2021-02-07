function build_dict_dialog(){
	#region CORNOVICH DIALOG ARRAY
	var dialog_corn_normal_array  = [
		[
			0001, ["This is some corn text!", "Corn is porn"], 0002
		],
		
		[
			0002, ["isn't text cool?", "it sure is dank as shit"], 0003
		],
		
		[
			0003, ["this text loops, I don't know any other words"], -1
		],
	]
	dialog_corn_normal = ds_grid_create_from_array(dialog_corn_normal_array);
	#endregion
	#region BROC DIALOG ARRAY
	var dialog_broc_normal_array  = [
	
		[
			0001, ["This is some broc text!", "they really should call me brocc"], 0002
		],
		
		[
			0002, ["doesn't text fucking suck?", "it sure is dumb as shit"], -1
		],
		
	]
	dialog_broc_normal = ds_grid_create_from_array(dialog_broc_normal_array);
	#endregion
	#region MASTER NORMAL DIALOG
	var dict_dialog_normal_array = [
            //npc_id //npc_dialog_normal(ds_grid) //bookmark_normal
        [
            0001, dialog_corn_normal, "0001"
        ],
        [
            0002, dialog_broc_normal, "0001"
        ],
    ];
	dict_dialog_normal = ds_grid_create_from_array(dict_dialog_normal_array);
	#endregion
}