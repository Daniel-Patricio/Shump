//Destruindo
morrendo();

//Variando som da explosao
var _pitch = random_range(0.9, 1.1);

//Som de explosao
audio_play_sound(sfx_explosion, 0, 0, , ,_pitch);


//Fazendo a tela tremer quando toma tiro
screenshake(2);
instance_destroy(other);