 if (global.object_in_focus != noone) {
	 
	menu_center_x = global.object_in_focus.x;
	menu_center_y = global.object_in_focus.y;

var mouse_angle = point_direction(menu_center_x, menu_center_y, mouse_x, mouse_y);

if (exists == true){
selected_item = floor((mouse_angle - menu_angle_offset + 360 / menu_items / 2) / (360 / menu_items)) 
mod menu_items; }

if (selected_item < 0) selected_item += menu_items;
 }

if (mouse_check_button_pressed(mb_left) && exists == true) {
    show_message("coso seleccionado: " + string(selected_item + 1));
	exists = false;
}