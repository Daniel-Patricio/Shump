//Vida
vida = 10;

//Variavel que controla meu estado
estado = "chegando";
tempo_carregando = game_get_speed(gamespeed_fps) *.5;
timer_carregando = 0;
contador = 0;
decidi_direcao = false;

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
		
		//Carrega o ataque por 3 segundos parado
		case "carregando":
		{
			vspeed = 0;
			timer_carregando++;
			if (timer_carregando >= tempo_carregando)
			{
				estado = choose("atirando", "atirando2");
				
				//Resetando o timer
				timer_carregando = 0;
				
				//Aumentando  valor do contador
				contador++;
			}
		}
		break;
		
		//Usa o tiro A
		case "atirando":
		{
			if (instance_exists(obj_player))
			{
				//Encontrando a direção do player
				var _dir = point_direction(x, y, obj_player.x, obj_player.y);
			
				//Criando o tiro A
				var _tiro = instance_create_layer(x, y, "Tiros", obj_tiro_inimigo3a);
				_tiro.speed = 2;
				_tiro.direction = _dir;
				_tiro.image_angle = _dir +90;
			}
			//Atirei e volto a carregar
			if (contador < 3) estado = "carregando";
			else estado = "fugindo";
		}
		break;
		
		//Usa o tiro B
		case "atirando2":
		{
			var _ang = 255;
			//Repetir o tiro
			repeat(3)
			{
				var _tiro = instance_create_layer(x, y, "tiros", obj_tiro_inimigo3b);
				_tiro.speed = 4;
				_tiro.direction = _ang;
				_ang += 15;
			}
			
			//Atirei e volto a carregar
			if (contador < 3) estado = "carregando";
			else estado = "fugindo";
		}
		break;
		
		//Começa a fugir
		case "fugindo":
		{
			//Decidindo a direção que ele vai fugir
			if (!decidi_direcao)
			{
				hspeed = choose(-1, 1);
				decidi_direcao = true;
				vspeed = -1;
			}
			
			//Destruindo ao sair da tela
			if (y < -100) instance_destroy();
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
