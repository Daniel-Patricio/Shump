//Vida
vida = 10;

//Variavel que controla meu estado
estado = "chegando";

//State machine
maquina_de_estado = function()
{
	//Switch variável que estou checando o valor
	switch(estado)
	{
		//Estado de chegando
		case "chegando":
		{
			if (y < 160) vspeed = 1.2;
			else estado = "carregando";
		}
		break;
		
		case "carregando":
		{
			vspeed = 0;
		}
		break;
		
	}
}


morrendo = function()
{
	//Perder vida
	if (vida > 1)
	{
		vida--;
	}
	else
	{
		//Se ficar sem vida se destroi e cria particula
		instance_destroy();
		instance_create_layer(x, y, "Particulas", obj_part_explosao_inimigo);
	}
}
