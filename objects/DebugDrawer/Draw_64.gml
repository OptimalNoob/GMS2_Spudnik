/// @desc
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if(instance_exists(Camera)){
	draw_set_color(c_white);
	draw_set_font(font_debugGUI);
	draw_set_alpha(1);
	draw_text(16,16,"[Camera]");
	draw_text(16,32,"Window Width: " + string(Camera.wW));
	draw_text(16,48,"Window Height: " + string(Camera.wH));
	draw_text(16,64,"X Min: " + string(Camera.x_min));
	draw_text(16,80,"Y Min: " + string(Camera.y_min));
	draw_text(16,96,"X Max: " + string(Camera.x_max));
	draw_text(16,112,"Y Max: " + string(Camera.y_max));
	draw_text(16,128,"Camera X: " + string(camX));
	draw_text(16,144,"Camera Y: " + string(camY));
	draw_text(16,160,"Follow Speed: " + string(Camera.follow_speed));
	draw_text(16,176,"Following: " + string(Camera.follow));
	draw_text(16,192,"xTo: " + string(Camera.xTo));
	draw_text(16,208,"yTo: " + string(Camera.yTo));
};

if(instance_exists(Camera_unrestricted)){
	draw_set_color(c_white);
	draw_set_font(font_debugGUI);
	draw_set_alpha(1);
	draw_text(16,16,"[Camera Unrestricted]");
	draw_text(16,32,"Window Width: " + string(Camera_unrestricted.wW));
	draw_text(16,48,"Window Height: " + string(Camera_unrestricted.wH));
	draw_text(16,64,"Camera X: " + string(camX));
	draw_text(16,80,"Camera Y: " + string(camY));
	draw_text(16,96,"Follow Speed: " + string(Camera_unrestricted.follow_speed));
	draw_text(16,112,"Following: " + string(Camera_unrestricted.follow));
	draw_text(16,128,"xTo: " + string(Camera_unrestricted.xTo));
	draw_text(16,144,"yTo: " + string(Camera_unrestricted.yTo));
};

if(item_number >= 0 && item_number <= ds_grid_height(library_items) - 1){
	draw_text(16,240,"[Items]");
	draw_text(16,256,"ID: " + string(library_items[# 0,item_number]));
	draw_text(16,272,"Display Name: " + string(library_items[# 1,item_number]));
	draw_text(16,288,"Description: " + string(library_items[# 2,item_number]));
	draw_text(16,304,"Type: " + string(library_items[# 3,item_number]));
	draw_text(16,320,"Use Outside Battle?: " + string(library_items[# 4,item_number]));
	draw_text(16,336,"Buy Value: " + string(library_items[# 5,item_number]));
	draw_text(16,352,"Sell Value: " + string(library_items[# 6,item_number]));
	draw_text(16,368,"Sprite: " + string(sprite_get_name(library_items[# 7,item_number])));	
	draw_text(16,384,"Heal Amount: " + string(library_items[# 8,item_number]) + "%");
	draw_text(16,400,"Strength Amount: " + string(library_items[# 9,item_number]) + "%");
	draw_text(16,416,"Speed Value: " + string(library_items[# 10,item_number]) + "%");
};
draw_set_color(c_black);