switch (mini_state) {
    case 0:
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
        // Define behavior for mini_state 1
        // Example: standing still, looking around, or idle animations
		mini_state = 0
        break;
    case 2:
        // Define behavior for mini_state 2
        // Example: interacting with nearby objects or performing a task
		mini_state = 0
        break;
}

// Reset the alarm loop
alarm_set(0, 120); // 2 seconds at 60 FPS
