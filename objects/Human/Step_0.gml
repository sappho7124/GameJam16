switch ((((direction + 22.5) mod 360) + 360) mod 360) div 45 {
    case 0: sprite_index = spriteRight; break;
    case 1: sprite_index = spriteRight; break;
    case 2: sprite_index = spriteBack; break;
    case 3: sprite_index = spriteLeft; break;
    case 4: sprite_index = spriteLeft; break;
    case 5: sprite_index = spriteLeft; break;
    case 6: sprite_index = spriteFront; break;
    case 7: sprite_index = spriteRight; break;
}

// Decrement the mini_state duration timer (in frames)
if (mini_state_duration > 0) {
    mini_state_duration--; // Reduce by 1 frame
} else {
	show_debug_message("change mini state")
	show_debug_message(mini_state_duration)
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
