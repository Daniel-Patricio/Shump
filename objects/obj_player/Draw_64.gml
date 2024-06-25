//Debug lvl do tiro
if (global.debug)
{
	draw_text(20, 20, "Level tiro: " + string(level_tiro));
}

//Pega a altura da tela
var _gui_height = display_get_gui_height();

//Desenhando a vida do player
desenha_icone(spr_icone_escudo, escudos, _gui_height - 20);

desenha_icone(spr_icone_vida, vidas, _gui_height - 50);