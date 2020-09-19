/// @desc
cam_title = camera_create()
scale = 4;
wW = 1280;
wH = 720;

x = room_width / 2;
y = room_height / 2;

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(wW,wH,-10000,10000);

camera_set_view_mat(cam_title,vm);
camera_set_proj_mat(cam_title,pm);
surface_resize(application_surface,1280,720);
display_set_gui_size(wW, wH);
view_camera[0] = cam_title;
view_enabled[0] = true;
view_visible[0] = true;
view_wport[0] = 1280;
view_hport[0] = 720;