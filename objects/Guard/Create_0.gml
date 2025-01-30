event_inherited();

spriteFront = guard_1;
spriteBack = guard_2;
spriteLeft = guard_3;
spriteRight = guard_4;

equiped = noone;

attacking = noone;

function monster_detected_guard(closest_monster) {
    alarm_set(0, -1);
    alarm_set(1, -1);
    alarm_set(2, -1);
    alarm_set(3, 1); // Start attack behavior immediately
    current_state = 3;
    attacking = closest_monster;
    mini_state = 0; // Start with stationary shooting
}

// FUNCTION TO MANUALLY CHANGE ATTACK STATES
function set_attack_ministate(new_state) {
    if (current_state == 3) {
        mini_state = new_state;
        // Immediately process state change
        alarm_set(3, 1); // Triggers next frame
    }
}

// Add to Create Event
combat_cooldown = 0;
preferred_combat_range = 192; // 3 tiles at 64px
current_cover = noone;