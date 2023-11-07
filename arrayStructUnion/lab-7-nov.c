#include <stdio.h>

struct X {

  long l;
  char c;  
};



//       campos: a           b       c
struct X varx;

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