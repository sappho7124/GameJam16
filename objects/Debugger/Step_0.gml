// Get the viewport's position and size
var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);
var view_width = camera_get_view_width(view_camera[0]);

// Position the object at the top-right corner of viewport 0
x = view_x + view_width - sprite_width / 2;
y = view_y + sprite_height / 2;


var scale = camera_get_view_width(view_camera[0])/PlayerCamera.camWidth
image_xscale = scale;
image_yscale = scale;