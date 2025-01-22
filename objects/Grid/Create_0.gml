depth = -3000;

tile_size = 16

grid = mp_grid_create(0,0, room_width/tile_size, room_height/tile_size,tile_size,tile_size);

var hard_objects = instance_number(ParentHardObject);
for (var i = 0; i < hard_objects; i++) {
    var inst = instance_find(ParentHardObject, i);
    mp_grid_add_instances(Grid.grid, inst, 0);
}

var doors = instance_number(Door);
for (var i = 0; i < doors; i++) {
    var door = instance_find(Door, i);
    if (!variable_instance_exists(door, "is_closed") || !door.is_closed) {
        mp_grid_add_instances(Grid.grid, door, 0);
    }
}