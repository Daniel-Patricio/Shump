
#region variaveis

//Velocidade
vel = 2;

//Espera do tiro
espera_tiro = 8;

//Timer do tiro
timer_tiro = 0;

//Level do tiro
level_tiro = 1;

#endregion

#region
//Sistema de movimentação do jogador
//Metodo para controlar o player

controla_player = function()
{
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
	
	//Diminuindo o timer do tiro
	timer_tiro--;
	
	//Criar um tiro quando apertar a tecla e o timer ta zerado
	if(_atirar && timer_tiro <= 0)
	{
		tiro_2();
		
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
	_tiro.vspeed = -10;
}

//Metodo do tiro 2
tiro_2 = function()
{
	//Criando 2 tiros
	var _tiro = instance_create_layer(x - 10, y, "Tiros", obj_tiro_player);
	_tiro.vspeed = -10;
	_tiro = instance_create_layer(x + 10, y, "Tiros", obj_tiro_player);
	_tiro.vspeed = -10;
}

#endregion