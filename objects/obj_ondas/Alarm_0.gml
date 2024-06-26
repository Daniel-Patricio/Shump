/// @description Onda 1

//Criando a primeira onda
layer_sequence_create("Seq_inimigos", 0, 0, ondas[atual]);

//So aumenta o atual se não chegou no final do array
if (atual < array_length(ondas)-1)
{
	//Reinicia o alarme
	alarm[0] = 320;
	atual++;
}
