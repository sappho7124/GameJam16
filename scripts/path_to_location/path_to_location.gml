/// @description Creates a path from the object's current position to the specified target coordinates
/// @param p_target_x The x-coordinate of the target
/// @param p_target_y The y-coordinate of the target
/// @param p_speed The speed at which the object will move along the path

function path_to_location(p_target_x, p_target_y, p_speed) {
    // Delete any existing path
    if (path_exists(path)) {
        path_delete(path);
    }
    
    // Add a new path
    path = path_add();
    
    // Create the path from the current position to the target coordinates
    if (mp_grid_path(Grid.grid, path, x, y, p_target_x, p_target_y, 1)) {
        // Start moving along the path
        path_start(path, p_speed, path_action_stop, true);
    } else {
        // Path creation failed (e.g., no valid path to target)
        path_delete(path); // Cleanup
        show_debug_message("Failed to create a path to the target!");
    }
}
