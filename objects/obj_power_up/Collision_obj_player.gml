//Colide com o player e se destroi
instance_destroy();

//Rodando o metodo de ganhar level do player
other.ganha_lvl_tiro();

//Cria a particula turo na posção atual
var _part = instance_create_layer(x, y, layer, obj_part_tiro);
_part.image_angle = random(359);