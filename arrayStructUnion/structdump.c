#include <stdio.h>

struct X {

  int   a;
  int   c;
  short b;
  

};
//       campos: a           b       c
struct X varx = {0xA1A2A3A4, 0xC1C2C3C4, 0xB1B2};

void dump(void *p, int n) {
  unsigned char *p1 = p;

  while (n--) {
    printf("%p - 0x%02X\n", p1, *p1);
    p1++;
  }
}
int main() {
   dump(&varx, sizeof(varx));

   return 0;

}