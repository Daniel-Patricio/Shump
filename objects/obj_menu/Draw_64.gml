
var _meio_tela = display_get_gui_height() /2;


//alinhando o texto
draw_set_valign(1);

//desenhando o texto na tela
for (var _i = 0; _i < 3; _i++)
{
	//define uma cor vermelha para o selecionado
	var _cor = c_white;
	
	if (_i == atual)
	{
		//a opção atual fica vermelha
		_cor = c_red;
	}
	
	//desenha o menu
	draw_set_color(_cor);
	draw_text(20, _meio_tela + _i * 20, menu[_i]);
}

//resetando o alinhamento do texto
draw_set_valign(0);
draw_set_color(-1);