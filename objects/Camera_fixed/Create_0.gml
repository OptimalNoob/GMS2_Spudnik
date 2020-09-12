/// @desc

scale = 4;
wW = windowWidth;
wH = windowHeight;

x = room_width / 2;
y = room_height / 2;

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(wW / scale,wH / scale,-10000,10000);

camera_set_view_mat(camera_1,vm);
camera_set_proj_mat(camera_1,pm);
surface_resize(application_surface,1280,720);
display_set_gui_size(wW, wH);
view_camera[0] = camera_1;
view_enabled[0] = true;
view_visible[0] = true;
view_wport[0] = windowWidth;
view_hport[0] = windowHeight;