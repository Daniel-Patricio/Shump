//Checando se sai da room
if (y <= -32) instance_destroy();

//Fazendo o tiro ficar menor
image_xscale = lerp(image_xscale, 1, .1);
image_yscale = lerp(image_yscale, 1, .1);

//Fazendo o tiro do player ganhar velocidade
vspeed = lerp(vspeed, -10, .1);