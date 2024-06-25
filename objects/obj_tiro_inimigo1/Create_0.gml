/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Destruindo o tiro
morrendo = function()
{
	//Se destroi
	instance_destroy();

	//Criando a particula
	instance_create_layer(x, y, layer, obj_part_tiro);
}