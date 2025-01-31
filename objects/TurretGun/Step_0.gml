// Weapon Step Event
if equiped_to != noone {
    var guard = equiped_to;
    
    // Default positioning
    if guard.attacking == noone {
        look_dir_set();
    } 
    // Combat positioning
    else if instance_exists(guard.attacking) {
        // Base position on guard's facing direction
        switch (wp_look_dir) {
            case 0: // Right
                x = guard.x;
                y = guard.y;
                depth = equiped_to.depth - 2;
                image_yscale = scale_equiped;
                break;
            case 1: // Back
                x = guard.x;
                y = guard.y;
                depth = equiped_to.depth + 2;
                break;
            case 2: // Left
                x = guard.x;
                y = guard.y;
                depth = equiped_to.depth - 2;
                image_yscale = -scale_equiped;
                break;
            case 3: // Front
                x = guard.x;
                y = guard.y;
                depth = equiped_to.depth - 2;
                break;
        }
        
        // Point weapon at target
        image_angle = point_direction(x, y, guard.attacking.x, guard.attacking.y);
        
        // Shooting logic
        if shoot_cooldown <= 0 && !is_reloading {
            if current_mag > 0 {
                // Calculate bullet spawn point
                var bx = x + lengthdir_x(1, image_angle);
                var by = y + lengthdir_y(1, image_angle);
                
                // Create bullet(s)
                if (is_shotgun) {
                    for (var i = 0; i < amount_of_bullets; i++) {
                        // Calculate evenly distributed spread offsets
                        var spread_offset = 0;
                        if (amount_of_bullets > 1) {
                            spread_offset = -spread + (i * (2 * spread) / (amount_of_bullets - 1));
                        }
        
                        // Create bullet
                        var var_bullet = instance_create_depth(bx, by, depth-1, Bullet);
                        var_bullet.direction = image_angle + spread_offset;  // Apply spread
                        var_bullet.image_angle = var_bullet.direction;      // Sync rotation
						if equiped_to.mode = 2 {var_bullet.friendly_fire = true}
                    }
                } else {
                    // Default single bullet
                    var a = instance_create_depth(bx, by, depth-1, Bullet);
                    a.direction = image_angle;
                    a.image_angle = a.direction;
					if equiped_to.mode = 2 {a.friendly_fire = true}
                }
                
                // Weapon kick effect
                image_xscale *= 0.9;
                image_yscale *= 0.9;
                
                current_mag--;
                shoot_cooldown = firerate;
            } else {
                // Start reloading
                is_reloading = true;
                shoot_cooldown = reload_cooldown;
            }
        }
        
        // Update cooldowns
        if (shoot_cooldown > 0) shoot_cooldown--;
        if (is_reloading && shoot_cooldown <= 0) {
            current_mag = mag_total;
            is_reloading = false;
        }
    }
    
    // Restore weapon scale
    image_xscale = lerp(image_xscale, scale_equiped, 0.1);
    image_yscale = lerp(image_yscale, scale_equiped, 0.1);
}