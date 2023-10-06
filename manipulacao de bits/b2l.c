#include <stdio.h>

unsigned int convertB2L(unsigned int x) {
  unsigned int a, b, c, d;
  a = x & 0xFF;
  b = (x & 0xFF00);
  c = (x & 0xFF0000);
  d = (x & 0xFF000000);
  return (a << 24) | (b << 16) | (c << 8) | d;
}

int main (void) {
  unsigned int b = 0x12AB34CD;
  unsigned int l = convertB2L(b);

  printf("b = 0x%08x\n", b);
  printf("l = 0x%08x\n", l);

  return 0;
}