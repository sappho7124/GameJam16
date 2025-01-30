// Fade out effect
image_alpha -= fade_speed;
image_xscale -= scale_reduction;
image_yscale -= scale_reduction;

// Destroy when invisible
if (image_alpha <= 0) {
    instance_destroy();
}