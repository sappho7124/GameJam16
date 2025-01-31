 draw_set_color(c_white);
 
 if (global.object_in_focus != noone && variable_instance_exists(global.object_in_focus,"wheel_options")) { 
	 
	exists = true 

	//*for (var i = 0; i < 4; i++) {
	//    var angle = i * (360 / 4) + menu_angle_offset;
	//    var item_x = menu_center_x + menu_radius * dcos(angle);
	//    var item_y = menu_center_y - menu_radius * dsin(angle);

	//    if (i == selected_item) {
	//        draw_set_color(c_yellow); 
	//    } else {
	//        draw_set_color(c_white);
	//    }
    
	//    draw_circle(item_x, item_y, 20, false); 
	//    draw_text(item_x, item_y, string(i + 1));
	//}
	
	if global.object_in_focus.wheel_options != []{
		button_icons = global.object_in_focus.wheel_options
	}
	// Draw the four fixed background sprites (stacked to form the wheel)
	for (var i = 0; i < array_length(global.object_in_focus.wheel_options); i++) {
		if i = selected_item {
			draw_sprite_ext(button_bg[i],0,menu_center_x,menu_center_y,selected_offset,selected_offset,0,c_white,1)
		} else {
			draw_sprite(button_bg[i], 0, menu_center_x, menu_center_y);
		}
	}

	// Draw the four action icons (context-sensitive)
	for (var i = 0; i < array_length(global.object_in_focus.wheel_options); i++) {
		switch i {
			case 0:
				if i = selected_item {
					draw_sprite_ext(button_icons[i],0,menu_center_x + right_left_offsetx*selected_offset,menu_center_y + right_left_offsety,selected_offset,selected_offset,0,c_white,1)
				} else {
					draw_sprite(button_icons[i], 0, menu_center_x + right_left_offsetx, menu_center_y + right_left_offsety);
				}
			break;
			case 1:
				if i = selected_item {
					draw_sprite_ext(button_icons[i],0,menu_center_x - top_down_offsetx,menu_center_y - top_down_offsety*selected_offset,selected_offset,selected_offset,0,c_white,1)
				} else {
					draw_sprite(button_icons[i], 0, menu_center_x - top_down_offsetx, menu_center_y - top_down_offsety);
				}
			break;
			case 2:
				if i = selected_item {
					draw_sprite_ext(button_icons[i],0,menu_center_x - right_left_offsetx*selected_offset,menu_center_y + right_left_offsety,selected_offset,selected_offset,0,c_white,1)
				} else {
					draw_sprite(button_icons[i], 0, menu_center_x - right_left_offsetx, menu_center_y + right_left_offsety);
				}
			break;
			case 3:
				if i = selected_item {
					draw_sprite_ext(button_icons[i],0,menu_center_x - top_down_offsetx,menu_center_y + top_down_offsety*selected_offset,selected_offset,selected_offset,0,c_white,1)
				} else {
					draw_sprite(button_icons[i], 0, menu_center_x - top_down_offsetx, menu_center_y + top_down_offsety);
				}
			break;
			default:
				show_debug_message("there are more than 4 icons")
			break;
		}
	}

}



if global.debugger_on {
	draw_circle_color(menu_center_x, menu_center_y, 3,c_red,c_red, false);
	draw_circle_color(menu_center_x,menu_center_y,inner_circle,c_yellow,c_yellow,true)
	draw_circle_color(menu_center_x,menu_center_y,outer_circle,c_yellow,c_yellow,true)
}