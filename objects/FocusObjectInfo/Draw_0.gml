 // Check if global.object_in_focus is valid
if (global.object_in_focus != noone) {
    // Fixed box dimensions
    var box_width = infobox_box_width;
    var box_height = infobox_box_height;

    // Infobox center position relative to the global.object_in_focus
    var center_x = global.object_in_focus.x + infobox_x_offset;
    var center_y = global.object_in_focus.y + infobox_y_offset;

    // Calculate the top-left corner of the box
    var box_x = center_x - box_width / 2;
    var box_y = center_y - box_height / 2;

    // Set background color and draw the box
    draw_set_color(c_blue); // Blue background
    draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);

    // Text properties
    var text_margin = infobox_margin; // Fixed margin
    draw_set_color(c_white);          // White text
    draw_set_halign(fa_left);         // Align text to the left
    draw_set_valign(fa_top);          // Align text to the top

    // Display `title` and `description` variables from the focus object
    var text_x = box_x + text_margin;
    var text_y = box_y + text_margin;

    draw_text(text_x, text_y, string(global.object_in_focus.title)); // Title at the top
    draw_text(text_x, text_y + 20, string(global.object_in_focus.description)); // Description below the title

    // Add debugging information if global.debugger_on is true
    if (global.debugger_on) {
        // Display debugging variables with checks to avoid crashes
        text_y += 40; // Start debug info below description

        // Display the object ID
        draw_text(text_x, text_y, "ID: " + string(global.object_in_focus.id));
        text_y += 20;

        if (variable_instance_exists(global.object_in_focus, "current_state")) {
            draw_text(text_x, text_y, "State: " + string(global.object_in_focus.current_state));
            text_y += 20;
        }

        if (variable_instance_exists(global.object_in_focus, "mini_state")) {
            draw_text(text_x, text_y, "Mini-State: " + string(global.object_in_focus.mini_state));
            text_y += 20;
        }

        if (variable_instance_exists(global.object_in_focus, "pal")) {
            draw_text(text_x, text_y, "Pal: " + string(global.object_in_focus.pal));
            text_y += 20;
        }

        if (variable_instance_exists(global.object_in_focus, "found_pal")) {
            draw_text(text_x, text_y, "Found Pal: " + string(global.object_in_focus.found_pal));
            text_y += 20;
        }

        if (variable_instance_exists(global.object_in_focus, "mini_state_duration")) {
            draw_text(text_x, text_y, "Mini-State Duration: " + string(global.object_in_focus.mini_state_duration));
            text_y += 20;
        }
    }

    // Draw a line from the bottom-left corner of the box to the object in focus
    var focus_x = global.object_in_focus.x;
    var focus_y = global.object_in_focus.y;

    // Bottom-left of the box
    var line_start_x = box_x;
    var line_start_y = box_y + box_height;

    // Draw the line with the same color as the box
    draw_set_color(c_blue);
    draw_line(line_start_x, line_start_y, focus_x, focus_y);
}