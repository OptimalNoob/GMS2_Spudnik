function build_dictionary_dialog(){
	//[
	//	DIALOG STATE,		{real}				THIS IS IN REFERENCE TO THE DIALOG STATE IN 'IniStates' Script >> global_state_create_dialogs()
	//	DIALOG STRINGS,		{array}{string}		These are the dialogs that the NPC will speak based on the dialog state
	//],(comma for more entries)
#region CORNOVICH DIALOG
	var dialog_array_corn = [
		[
			0,
			["Cornovich message in Flag 0","Cornovich second message in Flag 0"]
		],
		[
			1,
			["Cornovich message in Flag 1","Cornovich second message in Flag 1","Cornovich third message in Flag 1"]
		],
	];
#endregion
#region BROC DIALOG
	var dialog_array_broc = [
		[
			0,
			["Broc message in Flag 0","Broc second message in Flag 0"]
		],
		[
			1,
			["Broc message in Flag 1","Broc second message in Flag 1","Broc third message in Flag 1"]
		],
	];
#endregion

#region COMPILE ARRAYS INTO GRIDS
	dict_dialog_corn = ds_grid_create_from_array(dialog_array_corn);
	dict_dialog_broc = ds_grid_create_from_array(dialog_array_broc);
#endregion
};