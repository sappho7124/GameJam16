depth = -3000;

global.grid = mp_grid_create(0, 0, room_width / 16, room_height / 16, 16, 16);

var hard_objects = instance_number(ParentHardObject);
for (var i = 0; i < hard_objects; i++) {
    var inst = instance_find(ParentHardObject, i);
    mp_grid_add_instances(global.grid, inst, 0);
}

var doors = instance_number(Door);
for (var i = 0; i < doors; i++) {
    var door = instance_find(Door, i);
    if (!variable_instance_exists(door, "is_closed") || !door.is_closed) {
        mp_grid_add_instances(global.grid, door, 0);
    }
}

depth = -3000;