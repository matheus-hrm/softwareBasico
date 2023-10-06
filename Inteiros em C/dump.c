#include <stdio.h>

void dump(void *addr, int n)
{
  unsigned char *p = (unsigned char *)addr;

  while (n--)
  {
    printf("%p - %02x\n", p, *p);
    p++;
  }
}
int main()
{
  char i = 200;

  dump(&i, sizeof(i));

  return 0;
}
/*
Testando com uma string, não há ordenação no endereçamento de memória pois não há notação big endian e little endian para varíaveis do tipo char que consome um byte de memória

int main() {

  char p[] = "7509";

  dump(p, sizeof(p));

  return 0;

}
*/