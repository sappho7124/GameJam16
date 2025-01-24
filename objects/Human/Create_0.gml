image_xscale = 0.75;
image_yscale = 0.75;

spriteFront = placeholder_person_1;
spriteBack = placeholder_person_2;
spriteLeft = placeholder_person_3;
spriteRight = placeholder_person_4;

offset_multiplier = 1.5

speedWalking = 0.6;
speedRunning = 1.25;

pal = noone

current_state = 0;
// 0 menial work
// 1 scared
// 2 scared shitless
// 3 attack

mini_state = 1;
// Mini state shows what the entity is doing within the state itself

mini_state_duration = 1000; // Timer for how long the current mini_state lasts

am_i_moving = false; // Tracks if this entity is currently moving, not always used
is_stationary = false; // Determines if this entity is stationary
target_position = noone; // The position the moving entity is heading toward
pal = noone; // Tracks the pal entity (no pal initially)

talk_emote_attributes = {
	emote: speech_bubble,
	timetolive: 60 * 60,
	type_of_emote: 0,
	move_angle: 45,
	initial_size: 0.25,
	incremental: 0.001,
	stay_on_top_of: id,
	flip: false,
	max_size: 1.5,
	break_point:2,
}

path = path_add();

alarm[0] = 1; // Start the alarm loop
