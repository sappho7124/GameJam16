// Check if currently following something other than PlayerInvis
if (follow != PlayerInvis) {
    // Update target coordinates to the current follow object
    xTo = follow.x;
    yTo = follow.y;

    // Check if any WASD key is pressed
    if (PlayerInvis.keyLeft || PlayerInvis.keyRight || PlayerInvis.keyUp || PlayerInvis.keyDown) {
        // Increment the timer
        movementTimer += delta_time / 1000; // Convert delta_time to seconds
    } else {
        // Reset the timer if no WASD keys are pressed
        movementTimer = 0;
    }

    // If WASD keys have been pressed for more than 2 seconds
    if (movementTimer >= 2) {
        PlayerInvis.x = follow.x;
        PlayerInvis.y = follow.y;
        follow = PlayerInvis; // Revert follow target to PlayerInvis
        movementTimer = 0; // Reset the timer
    }
} else {
    // Logic for when follow == PlayerInvis
    xTo = PlayerInvis.x;
    yTo = PlayerInvis.y;

    // Reset the timer if already following PlayerInvis
    global.wasd_timer = 0;
}

x += (xTo - x) / camSnap;
y += (yTo - y) / camSnap;

// Controls zoom
if (keyboard_check(vk_add) || keyboard_check(ord("=")) || mouse_wheel_down() ) {
    camZoom -= camZoomSpeed;
} else if (keyboard_check(vk_subtract) || keyboard_check(ord("-")) || mouse_wheel_up()) {
    camZoom += camZoomSpeed;
}

// Clamp zoom level to stay within bounds
camZoom = clamp(camZoom, minZoom, maxZoom);

// Adjust camera width and height for zoom
var adjustedWidth = camWidth / camZoom;
var adjustedHeight = camHeight / camZoom;

// Center the camera to keep the focus
camera_set_view_pos(view_camera[0], x - (adjustedWidth * 0.5), y - (adjustedHeight * 0.5));
camera_set_view_size(view_camera[0], adjustedWidth, adjustedHeight);

double_click_set_follow();
