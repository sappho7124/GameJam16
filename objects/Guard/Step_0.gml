// Guard Step Event
// Handle direction and sprites
var final_direction = direction;

// STATE 3: Combat behavior override
if (current_state == 3 && instance_exists(attacking)) {
    // Always face attack target
    final_direction = point_direction(x, y, attacking.x, attacking.y);
    
    // Update weapon direction immediately
    if (equiped != noone) {
        equiped.wp_look_dir = round(((final_direction + 22.5) mod 360) / 45) mod 4;
    }
}

// Original direction-to-sprite logic (modified to use final_direction)
switch ((((final_direction + 22.5) mod 360) + 360) mod 360) div 45 {
    case 0: 
        sprite_index = spriteRight; 
        if (equiped != noone) equiped.wp_look_dir = 0;
        break;
    case 1: 
        sprite_index = spriteRight; 
        if (equiped != noone) equiped.wp_look_dir = 0;
        break;
    case 2: 
        sprite_index = spriteBack; 
        if (equiped != noone) equiped.wp_look_dir = 1;
        break;
    case 3: 
        sprite_index = spriteLeft; 
        if (equiped != noone) equiped.wp_look_dir = 2;
        break;
    case 4: 
        sprite_index = spriteLeft; 
        if (equiped != noone) equiped.wp_look_dir = 2;
        break;
    case 5: 
        sprite_index = spriteLeft; 
        if (equiped != noone) equiped.wp_look_dir = 2;
        break;
    case 6: 
        sprite_index = spriteFront; 
        if (equiped != noone) equiped.wp_look_dir = 3;
        break;
    case 7: 
        sprite_index = spriteRight; 
        if (equiped != noone) equiped.wp_look_dir = 0;
        break;
}

depth = -y;

// Mini-state duration (disabled for combat state)
if (current_state != 3) {
    if (mini_state_duration > 0) {
        mini_state_duration--;
    } else {
        mini_state = irandom(1);
        am_i_moving = false;
        is_stationary = false;
        switch (mini_state) {
            case 0: mini_state_duration = irandom_range(20*60, 45*60); break;
            case 1: pal = noone; mini_state_duration = irandom_range(30*60, 60*60); break;
            case 2: mini_state_duration = irandom_range(60*60, 120*60); break;
        }
    }
}