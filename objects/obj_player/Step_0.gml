#region debug

if(keyboard_check_released(vk_tab))
{
	global.debug = !global.debug;
}

#endregion

//Controlando o player
controla_player();

//Mudando o valor do level do tiro
if(keyboard_check_pressed(vk_escape))
{
	level_tiro--;
}

if(keyboard_check_pressed(vk_alt))
{
	level_tiro++;
}