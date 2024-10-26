//textos do menu
//jogar, tutorial, sair

//opções do menu
menu = ["Jogar", "Tutorial", "Sair"];

atual = 0;

margem = 20;

controla_menu = function()
{
	//semrpe que apertar para baixo desce no menu
	if (keyboard_check_pressed(vk_down))
	{
		atual +=1;
	
		//tocando o som do zap
		efeito_som(sfx_zap, .1);
	
		margem = 0;
	}

	if (keyboard_check_pressed(vk_up))
	{
		atual -=1;
		//tocando o som do zap
		efeito_som(sfx_zap, .1);
	
		margem = 0;
	}
	atual = clamp(atual, 0, array_length(menu)-1);

	margem = lerp(margem, 40, .1);
	
	//checando se apertou enter
	if (keyboard_check_pressed(vk_enter))
	{
		ativa_menu();
	}
}

ativa_menu = function()
{
	//fazendo o menu funcionar
	switch(atual)
	{
		//jogar
		case 0:
		break;
		
		//tutorial
		case 1:
		break;
		
		//sair
		case 2:
			game_end();
		break;
	}
}

desenha_menu = function()
{
	var _meio_tela = display_get_gui_height() /3;

	//alinhando o texto
	draw_set_valign(1);

	//definindo a fonta
	draw_set_font(fnt_menu);

	//pega a altura da fonte
	var _alt = string_height("I");

	//desenhando o texto na tela
	for (var _i = 0; _i < array_length(menu); _i++)
	{
		//define uma cor vermelha para o selecionado
		var _cor = c_white;
	
		//variavel da margem
		var _marg = 0;
	
		if (_i == atual)
		{
			//a opção atual fica vermelha e pra frente
			_cor = c_red;
			_marg = margem;
		}
	
		//desenha o menu
		draw_set_color(_cor);
		draw_text(20 + _marg, _meio_tela + _i * _alt * 1.2, menu[_i]);
	}

	//resetando o alinhamento do texto
	draw_set_valign(0);
	draw_set_color(-1);
	draw_set_font(-1);
}