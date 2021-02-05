/// @desc
draw_set_font(font_debugGUI);
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_center);
draw_set_alpha(1);
draw_text(windowWidth - 16, 16, "Move: W,A,S,D");
draw_text(windowWidth - 16, 48, "Confirm/Talk: E");
draw_text(windowWidth - 16, 80, "Cancel/Exit: Q");
draw_text(windowWidth - 16, 112, "Run: Shift");
draw_text(windowWidth - 16, 144, "Inventory: I");
draw_text(windowWidth - 16, 176, "Console: F1");