//Para de tocar todos os sons
audio_stop_all();

//Tocando a musica do jogo
audio_play_sound(musica_fundo, 0, 1);

#region variaveis

//Velocidade
vel = 2;

//Espera do tiro
espera_tiro = 8;

//Timer do tiro
timer_tiro = 0;

//Level do tiro
level_tiro = 1;

//Vidas
vidas = 3;

inicia_efeito_branco();

//Escudos
escudos = 3;

//Tenho escudo
meu_escudo = noone;

//Invencibilidade do player
tempo_invencivel = game_get_speed(gamespeed_fps);
timer_invencivel = 0;

//Variaveis para a escala
inicia_efeito_mola();

#endregion

#region

//Metodo para controlar o player
controla_player = function()
{
	//Diminuindo o timer invencivel
	timer_invencivel--;
	
	//Pegando as teclas
	var _cima, _baixo, _esq, _dire, _atirar;
	_cima	= keyboard_check(ord("W")) or keyboard_check(vk_up);
	_baixo	= keyboard_check(ord("S")) or keyboard_check(vk_down);
	_esq	= keyboard_check(ord("A")) or keyboard_check(vk_left);
	_dire	= keyboard_check(ord("D")) or keyboard_check(vk_right);
	_atirar	= keyboard_check(vk_space) or mouse_check_button(mb_left);
	
	//Velocidade horizontal
	var _velh = (_dire - _esq) * vel;
	x += _velh;
	
	//Velocidade vertical
	var _velv = (_baixo - _cima) * vel;
	y += _velv;
	
	//Impedindo que o jogador saia pela esquerda e direita
	//O ideal é fazer isso após pedir para ele se mover pois fica bugando frame
	x = clamp(x, sprite_width/2, room_width-sprite_width/2);
	
	//Impedindo que o jogador saia por cima e baixo
	y = clamp(y, 19, room_height - 19);
	
	//Caso utilize o escudo
	com_escudo();
	
	//Diminuindo o timer do tiro
	timer_tiro--;
	
	//Criar um tiro quando apertar a tecla e o timer ta zerado
	if(_atirar && timer_tiro <= 0)
	{
		
		//Mudando o tamanho do player
		efeito_mola(.8, 1.2);
		audio_stop_sound(sfx_laser1);
		efeito_som(sfx_laser1, .1);
		
		//Checa o lvl do tiro
		if(level_tiro == 1)
		{
			tiro_1();
		}
		else if(level_tiro == 2)
		{
			tiro_2();
		}
		else if(level_tiro == 3)
		{
			tiro_3();
		}
		
		//O timer do tiro foi resetado
		timer_tiro = espera_tiro;
	}
	
}

//Metodo do tiro 1
tiro_1 = function()
{
	//Criando o tiro e salvando o id dele
	var _tiro = instance_create_layer(x, y, "Tiros", obj_tiro_player);
		
	//Fazendo o tiro ir pra frente
	//_tiro.vspeed = -10;
}

//Metodo do tiro 2
tiro_2 = function()
{
	//Criando 2 tiros
	var _tiro = instance_create_layer(x - 10, y, "Tiros", obj_tiro_player);
	//_tiro.vspeed = -10;
	_tiro = instance_create_layer(x + 10, y, "Tiros", obj_tiro_player);
	//_tiro.vspeed = -10;
}

//Metodo do tiro 3
tiro_3 = function()
{
	//Criando 3 tiros
	tiro_1();
	tiro_2();
}

//Metodo de ganhar level do tiro
ganha_lvl_tiro = function()
{
	//Ganha lvl e não passa do limite
	if(level_tiro < 3)
	{
		level_tiro++;
	}
}

//Metodo de desenhar o icone
desenha_icone = function(_icone = spr_icone_vida, _qtd = 1, _y = 20)
{
	//A altura da GUI e a altura normal varia por causa do viewport, então tem que usar esta função pra poder
	//desenhar na altura certa em baixo da room.
	var _espaco = 0;

	//Repeat: repete o trecho de código dentro dele X vezes
	repeat(_qtd)
	{
		draw_sprite_ext(_icone, 0, 20 + _espaco, _y, 1, 1, 0, c_white, 0.5);
		_espaco += 30;
	}

}

//Metodo de perder vida
perde_vida = function()
{
	//Só pode perder vida se não estiver invencível
	if (timer_invencivel > 0) return;
	
	//Toma dano fica achatado
	efeito_mola(2, .5);
	timer_efeito_branco(3);
	
	//Perdendo vida se ainda tem vida
	if(vidas > 0)
	{
		vidas--;
		
		//Avisando que o tempo de invencibilidade ta valendo
		timer_invencivel = tempo_invencivel;
		
		screenshake(10);
	}
	else
	{
		instance_destroy();
		instance_create_layer(x, y, "Particulas", obj_explosao_jogador);
		screenshake(50);
	}
	
}

//Metodo para usar escudos
usa_escudo = function()
{
	if(escudos > 0 && meu_escudo == noone)
	{
		//Decrementa o valor de escudos
		escudos--;
		
		//ativando o escudo toca o som
		efeito_som(sfx_shieldUp, 0);
		
		//Guardando o escudo criado
		meu_escudo = instance_create_layer(x, y, "Escudo", obj_escudo);
	}
}

//Metodo para controlar os escudos
com_escudo = function()
{
	//Se existir a instancia do escudo ela segue o player
	if(instance_exists(meu_escudo))
	{
		meu_escudo.x = x;
		meu_escudo.y = y;
		
		timer_invencivel = 10;
	}
	else //Não existe instancia do escudo
	{
		meu_escudo = noone;
	}
}

#endregion