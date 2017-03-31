#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

//attention, s'assurer que le fichier ne contienne que des chiffres
int main(int argc, char **argv)
{
	FILE * res;
	char * line = NULL;
    size_t len = 0;
    ssize_t read;
    char nom[45]="";
    float moy=0;
    int nb_l=0;
    float var=0;
    float ec_ty;
    
    if(argc == 2 ) 
	{		
		strcat(nom,"./results/");
		strcat(nom,argv[1]);
		res=fopen(nom, "r");
		if(res == NULL) exit(EXIT_FAILURE);
		
		//on recupere les données pour la moyenne
		while ((read = getline(&line, &len, res)) != -1) 
		{
			//~ printf("Retrieved line of length %zu :\n", read);
			//printf("%d", atoi(line));
			moy+=(float)atoi(line);//on transforme en nombre
			nb_l++;			
		}
		//calcul de la moyenne
		moy=moy/(float)nb_l;
		
		//on remet le curseur au début
		rewind(res);
		
		//on récupère les données pour le calcul de l'ecart type
		while ((read = getline(&line, &len, res)) != -1) 
		{
			//printf("%d", atoi(line));
			var+=((float)atoi(line) - moy)*((float)atoi(line) - moy);		
		}
		fclose(res);// on a plus besoin du fichier
		
		var=var/(float)nb_l; 
		
		//calcul de l'écart type
		ec_ty=sqrtf(var);//racine carree float
		
		//affichage résultat
		printf("Moyenne : %.3f\nEcart-type : %.3f\n", moy, ec_ty);
		
	}
	else
	{
		printf("pas assez d'argument\n");
	}
	return 0;
}
