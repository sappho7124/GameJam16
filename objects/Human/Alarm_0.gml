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
            show_debug_message("Walking to random position: X: " + string(target_x) + ", Y: " + string(target_y));
        } else {
            show_debug_message("Failed to create path to: X: " + string(target_x) + ", Y: " + string(target_y));
        }
    }
	
	alarm_set(0, irandom_range(80,140));
    break;
case 1:
    // If no pal is assigned, search for the closest one
    if (pal == noone) {
        var closest_pal = noone; // Tracks the closest pal
        var shortest_distance = -1; // Tracks the shortest distance

        with (Human) {
            if (id != other.id // Not the same object
                && current_state == other.current_state // Same state
                && mini_state == other.mini_state // Same mini-state
                && pal == noone // This entity has no pal yet
            ) {
                // Calculate the distance between this instance and the caller
                var distance = point_distance(other.x, other.y, x, y);

                // If this is the first check or the closest so far, update the closest pal
                if (shortest_distance == -1 || distance < shortest_distance) {
                    closest_pal = id;
                    shortest_distance = distance;
                }
            }
        }

        // Assign the closest pal if one is found
        if (closest_pal != noone) {
            pal = closest_pal; // Assign the closest pal
            with (closest_pal) { pal = other.id; } // Assign this instance as their pal
        }
    }

    // If a pal is assigned, proceed with the interaction
    if (pal != noone) {
        if (id < pal.id) {
            is_stationary = true; // Lower ID becomes stationary
            am_i_moving = false; // Ensure stationary entity isn't moving
        } else if (!am_i_moving && !is_stationary) {
            // If not moving, calculate an offset and create a path
            var offset_x = 0;
            var offset_y = 0;

            // Determine the initial offset based on direction to the pal
            var angle = point_direction(x, y, pal.x, pal.y);
            if (angle >= 45 && angle < 135) { // North
                offset_x = 0;
                offset_y = Grid.tile_size * offset_multiplier;
            } else if (angle >= 135 && angle < 225) { // East
                offset_x = Grid.tile_size * offset_multiplier;
                offset_y = 0;
            } else if (angle >= 225 && angle < 315) { // South
                offset_x = 0;
                offset_y = -Grid.tile_size * offset_multiplier;
            } else { // West
                offset_x = -Grid.tile_size * offset_multiplier;
                offset_y = 0;
            }

            // Test the initial offset and fallback to other directions if necessary
            var directions = [
                { x: offset_x, y: offset_y }, // Initial offset
                { x: 0, y: -Grid.tile_size * offset_multiplier }, // North
                { x: Grid.tile_size * offset_multiplier, y: 0 },  // East
                { x: -Grid.tile_size * offset_multiplier, y: 0 }, // West
                { x: 0, y: Grid.tile_size * offset_multiplier }   // South
            ];

            for (var i = 0; i < array_length(directions); i++) {
                var target_x = pal.x + directions[i].x;
                var target_y = pal.y + directions[i].y;
                if (path_to_location(target_x, target_y, speedWalking)) {
                    am_i_moving = true; // Mark as moving
                    break;
                }
            }
        }
    }

    // Reset the alarm to loop
    alarm_set(0, 60);
    break;
    case 2:
        // Behavior for mini_state 2 (e.g., interacting with nearby objects)
        mini_state = 0;
    break;
	default:
		alarm_set(0, irandom_range(80,140));
	break;
}
