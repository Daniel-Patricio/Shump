#region debug

if(keyboard_check_released(vk_tab))
{
	global.debug = !global.debug;
}

//Mudando o valor do level do tiro
if(keyboard_check_pressed(vk_escape))
{
	level_tiro--;
}

if(keyboard_check_pressed(vk_alt))
{
	level_tiro++;
}

if(keyboard_check_pressed(vk_enter))
{
	perde_vida();
}

if(keyboard_check_pressed(vk_add))
{
	usa_escudo();
}

show_debug_message(timer_invencivel);

#endregion

//Controlando o player
controla_player();

//Se existir a instancia do escudo ela segue o player
if(instance_exists(meu_escudo))
{
	meu_escudo.x = x;
	meu_escudo.y = y;
}
else //Não existe instancia do escudo
{
	meu_escudo = noone;
}