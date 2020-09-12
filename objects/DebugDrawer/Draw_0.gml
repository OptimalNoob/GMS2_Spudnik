/// @
if(debugMode) draw_self();
var coll_color = c_white;
if (instance_exists(oSpud)) {
	with (oSpud){
		var w = range;
		var h = range / 2;
		draw_set_color(coll_color);
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1); // Mask
		draw_ellipse(x - w,y - h,x + w,y + h,1); // Show Range
	};
};
if(instance_exists(oCornovich)){
	with(oCornovich){
		draw_set_color(coll_color);
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1); // Mask
	}
};
if(instance_exists(oBroc)){
	with(oBroc){
		draw_set_color(coll_color);
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1); // Mask
	}
};