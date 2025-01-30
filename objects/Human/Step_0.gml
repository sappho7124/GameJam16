switch ((((direction + 22.5) mod 360) + 360) mod 360) div 45 {
    case 0: sprite_index = spriteRight; break;
    case 1: sprite_index = spriteRight; break;
    case 2: sprite_index = spriteBack; break;
    case 3: sprite_index = spriteLeft; break;
    case 4: sprite_index = spriteLeft; break;
    case 5: sprite_index = spriteLeft; break;
    case 6: sprite_index = spriteFront; break;
    case 7: sprite_index = spriteRight; break;
}

depth = -y