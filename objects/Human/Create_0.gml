image_xscale = 0.75;
image_yscale = 0.75;

spriteFront = placeholder_person_1;
spriteBack = placeholder_person_2;
spriteLeft = placeholder_person_3;
spriteRight = placeholder_person_4;

speedWalking = 0.6;
speedRunning = 1.25;

current_state = 0;
// 0 menial work
// 1 scared
// 2 scared shitless
// 3 attack

mini_state = 0;
// Mini state shows what the entity is doing within the state itself

mini_state_duration = 0; // Timer for how long the current mini_state lasts

path = path_add();

alarm[0] = 1; // Start the alarm loop
