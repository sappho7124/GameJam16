keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));

var inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
var inputMagnitude = (keyRight-keyLeft != 0) || (keyDown-keyUp != 0);

hSpeed = lengthdir_x(inputMagnitude * camSpeed, inputDirection);
vSpeed = lengthdir_y(inputMagnitude * camSpeed, inputDirection);

if PlayerCamera.follow = PlayerInvis{
	x += hSpeed
	y += vSpeed
}