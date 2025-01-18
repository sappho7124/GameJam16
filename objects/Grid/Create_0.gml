depth = -3000

grid = mp_grid_create(0,0, room_width/16, room_height/16,16,16);

// Get all instances of obj_parent_hard
var instances = instance_number(ParentHardObject);

// Loop through each instance
for (var i = 0; i < instances; i++) {
    var inst = instance_find(ParentHardObject, i);
    
	//this code is a copy and past from the gamejam 15 project, 
	//i dont really remember what it did so just comment it for now
	
    // Check if the instance's parent is not obj_door_parent
    //if (object_get_parent(inst.object_index) != obj_door_parent) {
        // Add the instance to the grid
	//	mp_grid_add_instances(grid, inst,0);
    //}
}
mp_grid_add_instances(grid, ParentHardObject,0);



depth = -3000