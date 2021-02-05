/// @desc

draw_set_font(font_shop);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_black);

switch(quest_notif){
    case update_quest.activate:
        draw_set_alpha(notif_alpha);
        draw_text(16, 16, "New Quest Added!");
        if(alarm[0] == -1) alarm[0] = 360;
        break;
    case update_quest.update:
        draw_set_alpha(notif_alpha);
        draw_text(16, 16, "Quest Updated!");
        if(alarm[0] == -1) alarm[0] = 360;
        break;
    case update_quest.complete:
        draw_set_alpha(notif_alpha);
        draw_text(16, 16, "Quest Completed!");
        if(alarm[0] == -1) alarm[0] = 360;
        break;
    default: break;
};

if(alarm[0] != -1){
    notif_alpha += 0.01;
};
draw_set_alpha(1);