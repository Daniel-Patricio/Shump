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

function screenshake(_treme = 1)
{
	//Meu código vai rodar dentro da instancia desse objeto
	with(obj_screenshake)
	{
		//Muda o valor do treme se for maior que a tremida atual
		if (_treme > treme) treme = _treme;
	}
}

#endregion