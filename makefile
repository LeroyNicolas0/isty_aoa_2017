all : clean proggcc pwarmup pbouclein

icc : clean progicc pwarmupicc pboucleinicc

proggcc : 
	@gcc -Wall prog.c kernel.c rdtsc.c -o progG -O2 -funroll-loops

clean :
	@rm -f progG progI pwarmup pBoucleIn

progicc : 
	@icc -w3 -diag-disable:remark prog.c kernel.c rdtsc.c -o progI -O3

pwarmup :
	@gcc -Wall pWarmup.c kernel.c rdtsc.c -o pWarmup -O2 -funroll-loops

pbouclein : 
	@gcc -Wall pBoucleIn.c kernel.c rdtsc.c -o pBoucleIn -O2 -funroll-loops

pwarmupicc :
	@icc -w3 -diag-disable:remark pWarmup.c kernel.c rdtsc.c -o pWarmup -O3

pboucleinicc :
	@icc -w3 -diag-disable:remark pBoucleIn.c kernel.c rdtsc.c -o pBoucleIn -O3
	
