#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "kernel.h"
#include "rdtsc.h"

float* initialisation( float* a, int n);

void warmup(int n, float a[n], float b[n], float x,int tour);


#define TAILLE 10

int main(int argc, char **argv)
{
	float* a=NULL;
	float* b=NULL;
	int n=TAILLE;
	float x=0.5;
	int i=0;
	uint64_t somme;
	//unsigned long long start;
	uint64_t start64;
	//unsigned long long stop;
	uint64_t stop64;
	if(argc !=3 ) 
	{
		printf("Erreur: pas le nombre d'arguments");
		return 0;
	}
	a=initialisation(a,n);
	b=initialisation(b,n);
	
	warmup(n,a,b,x,atoi(argv[1]));
	
	for(i=0; i<atoi(argv[2]); i++)
	{
		start64=rdtsc();
		baseline (n,a,b,x);
		stop64=rdtsc();
		somme+=stop64-start64;
	}
	printf("%" PRIu64 "\n", somme/(uint64_t)atoi(argv[2]));
	
	free(a);
	free(b);
	return 0;
}
float* initialisation( float* a, int n)
{
	int i;
	srand ( time (NULL));
	a=(float*)malloc(sizeof(float)*n);
	for(i =0;i<n;i++)
	{
		do
		{
			a[i]=(float) (rand()) / (float) (RAND_MAX);
		}while(a[i]==0 || a[i]==1);
	}
	return a;
	
}

void warmup(int n, float a[n], float b[n], float x, int tour)
{
	int i=0;
	for(i =0;i<tour;i++)
	{
		baseline (n,a,b,x);
	}
	
}
