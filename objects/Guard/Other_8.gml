// Main logic for handling states and mini-states using a combined key switch
var state_key = (current_state * 10) + mini_state; // Combine state and mini-state into a single key

switch (state_key) {
    // State 0: Menial Work
    case 0: // State 0, Mini-state 0: Idle/Waiting
		am_i_moving = false; // Mark as no longer moving
		//show_debug_message("Reached random destination.");
	break;

    case 1: // State 0, Mini-state 1: Moving to Pal
	if (pal != noone && point_distance(x, y, pal.x, pal.y) < ((Grid.tile_size * offset_multiplier)+4)) {
            path_end(); // Stop the path
            am_i_moving = false; // Mark as no longer moving
			is_stationary = true;
            mini_state_duration = 60 * 60; // Refresh timer for talking (1 minute in frames)
			pal.mini_state_duration = 60 * 60; // Refresh timer for pal
			direction = point_direction(x, y, pal.x, pal.y); // Update facing direction
			pal.direction = point_direction(pal.x, pal.y, x, y); // Update facing direction
            // Show speech bubble immediately after reaching position
            instance_create_depth(x + -8, y - 15, -450, EmoteForHumans,talk_emote_attributes);
			instance_create_depth(pal.x + -8, pal.y - 15, -450, EmoteForHumans,talk_emote_attributes);
	}
	break;

    case 2: // State 0, Mini-state 2: Performing Task
        // Logic for State 0, Mini-state 2
        break;

    // State 1: Scared
    case 10: // State 1, Mini-state 0: Frozen in Fear
        // Logic for State 1, Mini-state 0
        break;

    case 11: // State 1, Mini-state 1: Fleeing
        // Logic for State 1, Mini-state 1
        break;

    case 12: // State 1, Mini-state 2: Hiding
        // Logic for State 1, Mini-state 2
        break;

    // State 2: Scared Shitless
    case 20: // State 2, Mini-state 0: Screaming
        // Logic for State 2, Mini-state 0
        break;

    case 21: // State 2, Mini-state 1: Running Wild
        // Logic for State 2, Mini-state 1
        break;

    case 22: // State 2, Mini-state 2: Collapsed in Panic
        // Logic for State 2, Mini-state 2
        break;

    // State 3: Attack
    case 30: // State 3, Mini-state 0: Target Searching
        // Logic for State 3, Mini-state 0
        break;

    case 31: // State 3, Mini-state 1: Preparing to Attack
        // Logic for State 3, Mini-state 1
        break;

    case 32: // State 3, Mini-state 2: Engaged in Combat
        // Logic for State 3, Mini-state 2
        break;

    default:
		show_debug_message("unkown state " + string(state_key))
        break;
}
