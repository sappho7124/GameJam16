switch (mini_state) {
	case 0:
    // If not already moving, calculate a random path
    if (!am_i_moving && (!path_exists(path) || path_position == 0 || path_position == 1)) {
        // Determine a random direction and distance (3 to 7 tiles)
        var distance = irandom_range(2, 5) * Grid.tile_size;
        var angle = irandom_range(0, 359); // Random angle in degrees

        // Calculate target coordinates
        var target_x = x + lengthdir_x(distance, angle);
        var target_y = y + lengthdir_y(distance, angle);

        // Ensure the target position is within the grid boundaries
        target_x = clamp(target_x, 0, room_width - Grid.tile_size);
        target_y = clamp(target_y, 0, room_height - Grid.tile_size);

        // Attempt to create a path to the target
        if (path_to_location(target_x, target_y, speedWalking)) {
            am_i_moving = true; // Mark as moving if path creation was successful
            //show_debug_message("Walking to random position: X: " + string(target_x) + ", Y: " + string(target_y));
        } else {
            //show_debug_message("Failed to create path to: X: " + string(target_x) + ", Y: " + string(target_y));
        }
    }
	
	alarm_set(0, irandom_range(80,140));
    break;
	case 1:
		mini_state = 0;
    break;
    case 2:
        // Behavior for mini_state 2 (e.g., interacting with nearby objects)
        mini_state = 0;
    break;
	default:
		alarm_set(0, irandom_range(80,140));
	break;
}
