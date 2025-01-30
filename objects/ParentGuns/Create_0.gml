look_direction = 0;

wp_look_dir = 0;

image_xscale = scale_equiped;
image_yscale = scale_equiped;

shoot_cooldown = 0;
is_reloading = false;
bullet_spawn_offset = 16; // Distance from weapon origin where bullets spawn





function look_dir_set () {
			switch wp_look_dir {
		    case 0: //right
				depth = equiped_to.depth - 2;
				image_angle = 315
				image_xscale = scale_equiped * right_left_scale_offset;
				image_yscale = scale_equiped * right_left_scale_offset;
				x = equiped_to.x + right_offset_x
				y = equiped_to.y + right_offset_y
			break;
		    case 1: //back
				depth = equiped_to.depth + 2;
				image_angle = 315
				image_xscale = scale_equiped;
				image_yscale = scale_equiped;
				x = equiped_to.x + behind_offset_x
				y = equiped_to.y + behind_offset_y
			break;
		    case 2: //left 
				depth = equiped_to.depth - 2;
				image_angle = 45
				image_xscale = -(scale_equiped * right_left_scale_offset);
				image_yscale = scale_equiped * right_left_scale_offset;
				x = equiped_to.x + left_offset_x
				y = equiped_to.y + left_offset_y
			break;
		    case 3: //front
				depth = equiped_to.depth - 2;
				image_angle = 315
				image_xscale = scale_equiped;
				image_yscale = scale_equiped;
				x = equiped_to.x + front_offset_x
				y = equiped_to.y + front_offset_y
			break;
		}
}