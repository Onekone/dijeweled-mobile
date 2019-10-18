shader_set(shdr_bloom);
shader_set_uniform_f(bloomIntensity,varbloom) //0 = off, 1 = a bit, 80 = extremely intense
shader_set_uniform_f(bloomblurSize, 1/512);
draw_surface(application_surface, 0, 0);
shader_reset();


