if equiped_to != noone {
	switch wp_look_dir {
	    case 0: //right
			depth = equiped_to.depth - 2;
			image_angle = 135
			image_xscale = scale_equiped - right_left_scale_offset;
			image_yscale = -(scale_equiped - right_left_scale_offset);
			x = equiped_to.x + 4
			y = equiped_to.y + 10
		break;
	    case 1: //back
			depth = equiped_to.depth + 2;
			image_angle = 45
			image_xscale = scale_equiped;
			image_yscale = scale_equiped;
			x = equiped_to.x
			y = equiped_to.y + 10
		break;
	    case 2: //left 
			depth = equiped_to.depth - 2;
			image_angle = 45
			image_xscale = scale_equiped - right_left_scale_offset;
			image_yscale = scale_equiped - right_left_scale_offset;
			x = equiped_to.x - 4
			y = equiped_to.y + 10
		break;
	    case 3: //front
			depth = equiped_to.depth - 2;
			image_angle = 45
			image_xscale = scale_equiped;
			image_yscale = scale_equiped;
			x = equiped_to.x
			y = equiped_to.y + 10
		break;
	}
} else {
	show_debug_message("IJUEPUTA")
}