all : clean proggcc pwarmup pbouclein

proggcc : 
	@gcc -Wall prog.c kernel.c rdtsc.c -o progG -O2

clean :
	@rm -f progG progI pwarmup pBoucleIn

progicc : 
	@icc -w3 -diag-disable:remark prog.c kernel.c rdtsc.c -o progI

pwarmup :
	@gcc -Wall pWarmup.c kernel.c rdtsc.c -o pWarmup -O2

pbouclein : 
	@gcc -Wall pBoucleIn.c kernel.c rdtsc.c -o pBoucleIn -O2
	
