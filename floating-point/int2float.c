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


float int2float(int i){
  U u;
  
  if (i == 0) {
    u.i = makefloat(0, 0, 0);
    return u.f;
  }
  unsigned int s = 0;
  if (i < 0) {
    s = 1;
    i = 1;
  }

  unsigned int mask = 0x80000000;
  int count = 0;

  while ((i & mask) == 0) {
    count++;
    mask = mask >> 1;
  }

  unsigned int e = 31 - count;
  unsigned int E = e + 127;

  unsigned int f = 0;
  if (e == 23) f = i;
  if (e <  23) f = i << (23 - e);
  if (e >  23) f = i >> (e - 23);
  
  u.i = makefloat(s, E, f);
  return u.f;
}


int main() {

   int i;


   printf("\n******** int2float ****************\n");


   i = 0;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));


   i = 1;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));


   i = -1;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));


   i = 12345;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));


   i = -12345;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));


   i = 13631488;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));


   i = 1879048192;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));


   i = 0x7fffffff;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));


   i = -i;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));


   return 0;

}