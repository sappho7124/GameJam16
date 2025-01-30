 draw_set_color(c_white);
 
 if (global.object_in_focus != noone) { 
	 
	 exists = true 

for (var i = 0; i < menu_items; i++) {
    var angle = i * (360 / menu_items) + menu_angle_offset;
    var item_x = menu_center_x + menu_radius * dcos(angle);
    var item_y = menu_center_y - menu_radius * dsin(angle);

    if (i == selected_item) {
        draw_set_color(c_yellow); 
    } else {
        draw_set_color(c_white);
    }
    
    draw_circle(item_x, item_y, 20, false); 
    draw_text(item_x, item_y, string(i + 1));
}

button_bg = [wheel_r,wheel_u,wheel_l,wheel_d]
button_icons = global.object_in_focus.wheel_options
// Draw the four fixed background sprites (stacked to form the wheel)
for (var i = 0; i < 4; i++) {
    draw_sprite(button_bg[i], 0, menu_center_x - menu_radius, menu_center_y - menu_radius);
}

// Draw the four action icons (context-sensitive)
for (var i = 0; i < 4; i++) {
    draw_sprite(button_icons[i], 0, menu_center_x - menu_radius, menu_center_y - menu_radius);
}

// Highlight the selected button (optional visual feedback)

draw_set_color(c_red);
draw_circle(menu_center_x, menu_center_y, 5, false);

 }
