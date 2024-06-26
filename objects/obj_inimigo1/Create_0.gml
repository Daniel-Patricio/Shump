//Chamando o alarme
alarm[0] = 120;

//Descobrindo se foi criado em uma sequencia
criado_em_sequencia = in_sequence;

//Metodo de atirar
atirando = function()
{
	var _tiro = instance_create_layer(x, y, "Tiros", obj_tiro_inimigo1);
	_tiro.vspeed = 4;
}

morrendo = function()
{
	sendo_destruido(obj_part_explosao_inimigo);
	
	var _chance = random(100);
	
	if (_chance > 90)
	{
		instance_create_layer(x, y, layer, obj_power_up);
	}
}
