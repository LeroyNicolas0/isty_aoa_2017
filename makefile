all : clean proggcc progicc

proggcc : 
	@gcc -Wall prog.c kernel.c rdtsc.c -o progG

clean :
	@rm -f progG progI

progicc : 
	@icc -w3 -diag-disable:remark prog.c kernel.c rdtsc.c -o progI

pwarmup :
	@gcc -Wall pWarmup.c kernel.c rdtsc.c -o pWarmup

	
