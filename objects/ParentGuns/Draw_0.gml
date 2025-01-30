draw_self()

if global.debugger_on {
	var bx = x + lengthdir_x(1, image_angle);
	var by = y + lengthdir_y(1, image_angle);
	draw_circle_colour(bx, by, 2,c_red,c_red, false);
}