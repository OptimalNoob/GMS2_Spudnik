/// @desc

switch(current_turn){
	case turn.player: draw_player_ui(); break; // Draw Player Buttons
	default: break;
};

draw_set_alpha(0.8);
draw_set_color(c_black);
draw_rectangle(-1,0,windowWidth,160,0);
draw_set_alpha(1);
draw_sprite_ext(sAvatar_spud,0,16,16,4,4,0,c_white,1);
draw_set_font(font_dialog);
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text(160,24,"Spudnik");
draw_set_font(font_shop);
draw_text(160,64,"HP");
draw_text(160,104,"MP");

draw_set_color(c_black);
draw_circle(c1_x1,c1_y,c1_r,0)
draw_circle(c1_x2,c1_y,c1_r,0)
if(spud_hp <= spud_max_hp * 0.25) draw_set_color(c_red);
if(spud_hp > (spud_max_hp * 0.25) && spud_hp < (spud_max_hp * 0.60)) draw_set_color(c_yellow);
if(spud_hp > (spud_max_hp * 0.60)) draw_set_color(c_lime);
draw_circle(c1_x1,c1_y,c1_r - 2,0)
draw_circle(c1_x2,c1_y,c1_r - 2,0)
draw_set_color(c_black);
draw_rectangle(rec1_x1,rec1_y1,rec1_x2,rec1_y2,0);
if(spud_hp <= spud_max_hp * 0.25) draw_set_color(c_red);
if(spud_hp > (spud_max_hp * 0.25) && spud_hp < (spud_max_hp * 0.60)) draw_set_color(c_yellow);
if(spud_hp > (spud_max_hp * 0.60)) draw_set_color(c_lime);
draw_rectangle(rec1_x1,rec1_y1 + 2,rec1_x1 + (hb_width * (spud_hp / spud_max_hp)),rec1_y2 - 2,0);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(255,84,string(spud_hp) + "/" + string(spud_max_hp));