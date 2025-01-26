switch (mini_state) {
	case 0:

    break;
	case 1:

    break;
    case 2:
        // Behavior for mini_state 2 (e.g., interacting with nearby objects)
        mini_state = 0;
    break;
	default:
		alarm_set(0, irandom_range(80,140));
	break;
}
