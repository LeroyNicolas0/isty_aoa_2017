#include "rdtsc.h"

//pas utilisée
unsigned long long tick() 
{
        unsigned long long d;
        __asm__ __volatile__ ("rdtsc" : "=A" (d) );
        return d;
}

#ifdef __i386
extern __inline__ uint64_t rdtsc(void) {
  uint64_t x;
  __asm__ volatile ("rdtsc" : "=A" (x));
  return x;
}
#elif defined __amd64
extern __inline__ uint64_t rdtsc(void) {
  uint64_t a, d;
  __asm__ volatile ("rdtsc" : "=a" (a), "=d" (d));
  return (d<<32) | a;
}
#endif
