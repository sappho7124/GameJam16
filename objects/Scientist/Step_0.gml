event_inherited()

// Decrement the mini_state duration timer (in frames)
if (mini_state_duration > 0) {
    mini_state_duration--; // Reduce by 1 frame
} else {
	//show_debug_message("change mini state, duration: " + string(mini_state_duration))
    // Timer expired; pick a new mini_state and set its duration
    mini_state = irandom(1); // Random selection between cases (adjust range for more mini_states)
	//show_debug_message("new ministate" + string(mini_state))
	
	am_i_moving = false;
	is_stationary = false;
    switch (mini_state) {
        case 0:
            mini_state_duration = irandom_range(20 * 60, 45 * 60); // sec*frames
            break;
        case 1:
			pal = noone
            mini_state_duration = irandom_range(30 * 60, 60 * 60);
            break;
        case 2:
            mini_state_duration = irandom_range(60 * 60, 120 * 60);
            break;
    }
}