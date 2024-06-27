//Se desenhando
draw_self();


//Efeito de brilho no tiro

//Mudando a forma como o computador processa as cores
gpu_set_blendmode(bm_add);

//Desenhando a sprite do tiro novamente por cima dela um pouco transparente
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale*2, image_yscale*2, image_angle, cor, 0.5);

//Resetando como o computador processa as cores
gpu_set_blendmode(bm_normal);