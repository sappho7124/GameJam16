 is_closed = true;
 spr_open = door_open;
 spr_closed = door_closed;
 
 
 wheel_options = [btn_block_open, btn_info]
 
function right_menu(){
	var grid_x = floor(bbox_left);
	var grid_y = floor(bbox_top);

	var grid_x_2 = floor(bbox_right)-1;
	var grid_y_2 = floor(bbox_bottom)-1;

	//mp_grid_clear_cell(Grid.grid, grid_x, grid_y);
	mp_grid_clear_rectangle(Grid.grid, grid_x, grid_y,grid_x_2,grid_y_2)

	if (is_closed) {
	    sprite_index = spr_open;
		wheel_options[0] = btn_block_open
	} else {
	    sprite_index = spr_closed;
		wheel_options[0] = btn_block_closed
	    mp_grid_add_rectangle(Grid.grid, grid_x, grid_y,grid_x_2,grid_y_2)
	}

	is_closed = !is_closed;
}
 
function top_menu(){
	show_message("hi im the top menu im a placeholder")
 }