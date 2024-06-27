//Tremendo a tela
//Altera a psoição X e Y do viewport com base na variavel treme
if (treme > 0.1)
{
	var _x = random_range(-treme, treme);
	var _y = random_range(-treme, treme);
	
	//Altera a posição do voewport
	view_set_xport(view_current, _x);
	view_set_yport(view_current, _y);
}
else //Quando o valor chega perto de 0 ele zera o treme
{
	treme = 0;
	
	//Garante que a posição da view é zerada
	view_set_xport(view_current, 0);
	view_set_yport(view_current, 0);
}


//Parando de tremer aos poucos
treme = lerp(treme, 0, .1);