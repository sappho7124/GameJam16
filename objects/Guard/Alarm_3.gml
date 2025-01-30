// Alarm[3] Event - Revised Retreat Behavior
if (current_state == 3) {
    switch (mini_state) {
        case 0: // Stationary Shooting
            if (instance_exists(attacking)) {
                // Maintain facing direction
                direction = point_direction(x, y, attacking.x, attacking.y);
                
                // Set next check timer
                alarm_set(3, 30);
                
                // 30% chance to start retreating
                if (irandom(100) < 30) {
                    mini_state = 1;
                    alarm_set(3, 1);
                }
            }
            break;

        case 1: // Retreat While Shooting
            if (instance_exists(attacking)) {
                // Calculate retreat direction (directly away from target)
                var retreat_angle = point_direction(attacking.x, attacking.y, x, y);
                var retreat_distance = 160; // 2.5 tiles at 64px
                
                // Find retreat position
                var target_x = x + lengthdir_x(retreat_distance, retreat_angle);
                var target_y = y + lengthdir_y(retreat_distance, retreat_angle);
                
                if (path_to_location(target_x, target_y, speedWalking * 0.5)) {
                    alarm_set(3, 45);
                }
                
                // Continue facing target while retreating
                direction = point_direction(x, y, attacking.x, attacking.y);
                
                // 25% chance to return to stationary shooting
                if (irandom(100) < 25) {
                    mini_state = 0;
                    alarm_set(3, 1);
                }
            }
            break;

        case 2: // Full Retreat
            // Clear combat state
            current_state = 1;
            attacking = noone;
            
            // Find random retreat position
            var retreat_x = x + irandom_range(-5, 5) * Grid.tile_size;
            var retreat_y = y + irandom_range(-5, 5) * Grid.tile_size;
            path_to_location(retreat_x, retreat_y, speedRunning);
            
            // Reset AI
            alarm_set(0, 1);
            break;
    }
}