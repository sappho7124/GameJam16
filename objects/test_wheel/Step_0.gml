 if (global.object_in_focus != noone && variable_instance_exists(global.object_in_focus,"wheel_options")) {
	 
	menu_center_x = global.object_in_focus.x;
	menu_center_y = global.object_in_focus.y;

var mouse_angle = point_direction(menu_center_x, menu_center_y, mouse_x, mouse_y);

if (exists == true){
	selected_item = floor((mouse_angle - menu_angle_offset + 360 / 4 / 2) / (360 / 4)) mod 4;
	
}

if (selected_item < 0) selected_item += 4;
}

if point_distance(menu_center_x,menu_center_y,mouse_x,mouse_y) < inner_circle {
	selected_item = -5
} else if point_distance(menu_center_x,menu_center_y,mouse_x,mouse_y) > outer_circle {
	selected_item = -10
}
 

if (mouse_check_button_pressed(mb_left) && exists == true) {
	switch selected_item{
		case -5:
		break;
		case -10:
			exists = false;
		break;
		case 2:
			try {
				global.object_in_focus.left_menu()
			} catch (error){
				show_debug_message("focus object missing left function")
			}
		break;
		case 0:
			try {
				global.object_in_focus.right_menu()
			} catch (error){
				show_debug_message("focus object missing right function")
			}
		break;
		case 1:
			try {
				global.object_in_focus.top_menu()
			} catch (error){
				show_debug_message("focus object missing top function")
			}
		break;
		case 3:
			try {
				global.object_in_focus.bottom_menu()
			} catch (error){
				show_debug_message("focus object missing bottom function")
			}
		break;
		default:
			show_message("coso seleccionado: " + string(selected_item));
			exists = false;
		break;
	}
}