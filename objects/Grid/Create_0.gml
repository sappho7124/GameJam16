depth = -3000

tile_size = 16

grid = mp_grid_create(0,0, room_width/tile_size, room_height/tile_size,tile_size,tile_size);

// Get all instances of obj_parent_hard
var instances = instance_number(ParentHardObject);

// Loop through each instance
for (var i = 0; i < instances; i++) {
    var inst = instance_find(ParentHardObject, i);
}
mp_grid_add_instances(grid, ParentHardObject,0);

depth = -3000