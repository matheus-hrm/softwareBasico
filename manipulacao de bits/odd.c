#include <stdio.h>

int odd_ones(unsigned int x) {
  int count = 0;
  unsigned int mask = 0x00000001;
  for (int i = 0; i < 32; i++) {
    if (x & mask) {
      count++;
    }
    mask = mask << 1;
  }
  
  return count & 1;
}

int main (void) {
  unsigned int v;

  v  = 0x01010101;

  printf("%X tem numero %s de bits\n", v, odd_ones(v) ? "impar" : "par");

  v  = 0x01030101;

  printf("%X tem numero %s de bits\n", v, odd_ones(v) ? "impar" : "par");

  return 0;
}