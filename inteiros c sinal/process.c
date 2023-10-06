#include <stdio.h>

char process(char x) {

  return ~x + 1;

}

int main(void) {

  printf("%d\n", process(1));

  printf("%d\n", process(-5));

  printf("%d\n", process(35));

  printf("%d\n", process(-42));

  printf("%d\n", process(127));

  printf("%d\n", process(-128));

  return 0;

}