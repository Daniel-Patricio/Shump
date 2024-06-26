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

//show_debug_message(timer_invencivel);

#endregion

//Controlando o player
controla_player();
