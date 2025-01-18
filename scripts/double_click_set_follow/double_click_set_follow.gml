// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function double_click_set_follow() {

    // Check for a left mouse button press
    if (mouse_check_button_pressed(mb_left)) {
        // Get the object under the mouse
        var clicked_object = instance_position(mouse_x, mouse_y, ParentFocusable);

        // If an object was clicked
        if (clicked_object != noone) {
            // Get the object index
            var obj_index = clicked_object.object_index;

            // Ensure the object inherits from ParentFocusable
            if (object_is_ancestor(obj_index, ParentFocusable)) {
                // Handle focusable logic
                if (clicked_object.focusable) {
                    // Set the focus object
                    global.object_in_focus = clicked_object;
                }

                // Handle followable logic for double-click
                if (clicked_object.followable) {

                    // If this is a double-click on the same object
                    if (clicked_object == global.last_clicked_object && current_time - global.last_click_time <= global.double_click_interval) {
                        follow = clicked_object; // Set the follow target
                    }

                    // Update last clicked object and time
                    global.last_clicked_object = clicked_object;
                    global.last_click_time = current_time;
                }
            }
        } else {
            // If no object was clicked or clicked object is not focusable, unfocus
            global.object_in_focus = noone;
        }
    }
}

