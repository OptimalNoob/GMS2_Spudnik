/// @desc

scale = 4;
wW = windowWidth;
wH = windowHeight;
x_min = (wW / scale) / 2;
y_min = (wH / scale) / 2;
x_max = room_width - x_min;
y_max = room_height - y_min;
//camX = 0;
//camY = 0;
follow_speed = 20;
surface_resize(application_surface,1280,720);
display_set_gui_size(wW, wH);

follow = oSpud;
x = clamp(follow.x,x_min,x_max);
y = clamp(follow.y,y_min,y_max);
xTo = x;
yTo = y;

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(wW / scale,wH / scale,-10000,10000);

camera_set_view_mat(camera_1,vm);
camera_set_proj_mat(camera_1,pm);
view_camera[0] = camera_1;
view_enabled[0] = true;
view_visible[0] = true;
//view_wport[0] = windowWidth;
//view_hport[0] = windowHeight;