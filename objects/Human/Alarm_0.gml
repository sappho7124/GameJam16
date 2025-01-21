switch (mini_state) {
    case 0:
	//show_debug_message("Walking randomly")
        if (!path_exists(path) || path_position == 0 || path_position == 1) {
            // Determine a random direction and distance (3 to 7 tiles)
            var distance = irandom_range(2, 5) * Grid.tile_size;
            var angle = irandom_range(0, 359); // Random angle in degrees

            // Calculate target coordinates
            var target_x = x + lengthdir_x(distance, angle);
            var target_y = y + lengthdir_y(distance, angle);

            // Ensure the target position is within the grid boundaries
            target_x = clamp(target_x, 0, room_width - Grid.tile_size);
            target_y = clamp(target_y, 0, room_height - Grid.tile_size);

            path_to_location(target_x, target_y, speedWalking);
        }
    break;
case 1:
    // If no pal is assigned, search for the closest one
    if (pal == noone) {
        //show_debug_message("Searching for the closest pal..."); // Debug log

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
            //show_debug_message("Closest pal found! My ID: " + string(id) + ", Pal ID: " + string(closest_pal)); // Debug log
        }
    }

    // If a pal is assigned, proceed with the interaction
    if (pal != noone) {
        //show_debug_message("Pal assigned! My ID: " + string(id) + ", Pal ID: " + string(pal)); // Debug log

        // Use the lower ID to determine who is stationary
        if (id < pal.id) {
            is_stationary = true; // The entity with the lower ID becomes stationary
            am_i_moving = false; // Stationary entity is not moving
            //show_debug_message("I am stationary. My ID: " + string(id)); // Debug log
        } else {
            is_stationary = false; // The other entity moves to the stationary one

            // If not already moving, calculate an offset and create a path
            if (!am_i_moving) {
                var offset_x = 0;
                var offset_y = 0;

                // Determine the initial offset based on the direction to the pal
                var angle = point_direction(x, y, pal.x, pal.y);
                if (angle >= 45 && angle < 135) { // Moving down (north of the pal)
                    offset_x = 0;
                    offset_y = -Grid.tile_size * offset_multiplier;
                } else if (angle >= 135 && angle < 225) { // Moving left (east of the pal)
                    offset_x = Grid.tile_size * offset_multiplier;
                    offset_y = 0;
                } else if (angle >= 225 && angle < 315) { // Moving up (south of the pal)
                    offset_x = 0;
                    offset_y = Grid.tile_size * offset_multiplier;
                } else { // Moving right (west of the pal)
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

                // Attempt to create a path to the valid offset
                for (var i = 0; i < array_length(directions); i++) {
                    var target_x = pal.x + directions[i].x;
                    var target_y = pal.y + directions[i].y;
                    if (path_to_location(target_x, target_y, speedWalking)) {
                        //show_debug_message("Moving to offset position: X: " + string(target_x) + ", Y: " + string(target_y)); // Debug log
                        am_i_moving = true; // Mark this entity as moving
                        break;
                    }
                }
            }
        }
    }

    // Check if moving entity has reached its target
    if (am_i_moving) {
        show_debug_message("Checking distance to pal..."); // Debug log
        if (point_distance(x, y, pal.x, pal.y) < Grid.tile_size * offset_multiplier) {
            am_i_moving = false; // Stop moving
            mini_state_duration = 60 * 60; // Refresh timer for talking (1 minute in frames)
            //show_debug_message("Reached pal's offset. Stopped moving."); // Debug log
        }
    }

    // Handle facing direction using the built-in direction variable
    if (pal != noone && !am_i_moving) { // Only adjust direction when not moving
        direction = point_direction(x, y, pal.x, pal.y);
        //show_debug_message("Facing pal. Direction: " + string(direction)); // Debug log
    }

    break;
    case 2:
        // Behavior for mini_state 2 (e.g., interacting with nearby objects)
        mini_state = 0;
        break;
}

// Reset the alarm loop
alarm_set(0, 120); // 2 seconds at 60 FPS
