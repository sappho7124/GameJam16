// Draw the object's default sprite
draw_self();

// Get the mouse coordinates
var mouse_x_pos = device_mouse_x(0);
var mouse_y_pos = device_mouse_y(0);

// Create the text to display
var mouse_text = "Mouse X: " + string(mouse_x_pos) + "\nMouse Y: " + string(mouse_y_pos);

// Set the position for the text relative to the object
var text_x = x - 80 * ui_debugger_scale; // Offset horizontally from the object
var text_y = y - 12 * ui_debugger_scale;      // Align vertically with the object

// Set the text alignment and color
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

// Draw the text
draw_text_transformed(text_x, text_y,mouse_text,0.6*ui_debugger_scale,0.6*ui_debugger_scale,0)

// Reset the drawing color to default (optional)
draw_set_color(c_white);
