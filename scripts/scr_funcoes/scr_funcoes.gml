// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
#region globais

global.debug = false;

#endregion

#region funções

function sendo_destruido(_particula = obj_part_tiro)
{
	instance_destroy();
	
	//Criando minha particula
	instance_create_layer(x, y, "Particulas", _particula);
}

#endregion