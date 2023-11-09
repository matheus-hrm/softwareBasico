#include <stdio.h>
#include <math.h>

#define getsig(i)        ((i)>>31 & 1)
#define getexp(i)        ((i)>>23 & 0xff)
#define getfrac(i)       ((i) & 0x7fffff)
#define makefloat(s,e,f) ( (((s) & 1) << 31) | (((e) & 0xff) << 23) | ((f) & 0x7fffff) )

typedef union {

  float f;

  unsigned int i;

} U;

float float2(float value){
  U u;
  u.f = value;

  unsigned int sig = getsig(u.i);
  unsigned int exp = getexp(u.i);
  unsigned int frac = getfrac(u.i);

  if (exp != 0 && exp != 255) {
    exp++;
    if (exp == 255) {
      frac = 0; 
    }
  }

  u.i = makefloat(sig, exp, frac);
  return u.f;
}

int main (void) {
  printf("%f\n", float2(0.75));
}