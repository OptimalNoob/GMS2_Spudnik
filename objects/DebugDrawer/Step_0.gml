/// @desc

if(!debugMode) instance_destroy();

if(item_number > ds_grid_height(dict_items) - 1){
	item_number = 0;	
};
if(item_number < 0){
	item_number = ds_grid_height(dict_items) - 1;
};