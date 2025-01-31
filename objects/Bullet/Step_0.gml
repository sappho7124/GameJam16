// Straight movement
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Lifetime management
if (life-- <= 0) instance_destroy();

// Collision detection with ParentMonsters
var hit_target = instance_place(x, y, ParentMonsters);
if (hit_target != noone) {
    hit_target.hp -= damage;
    if (penetration <= 0) instance_destroy();
    else penetration--;
}

// Collision detection with Human (if friendly_fire is true)
if (friendly_fire) {
    var hit_human = instance_place(x, y, Human);
    if (hit_human != noone) {
        hit_human.hp -= damage;
        if (penetration <= 0) instance_destroy();
        else penetration--;
    }
}

// Wall collision
if (place_meeting(x, y, ParentHardObject)) {
    instance_destroy();
}