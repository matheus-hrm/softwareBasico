#include <ctype.h>
#include <stdio.h>

int string2num(char *s, int base) 
{
  int a = 0;
  
  for ( ; *s; s++){

    if (isdigit(*s))
      a = a * base + *s - '0';
    else if (isalpha(*s))
      a = a * base + toupper(*s) - 'A' + 10;
    else
      break;
  }

  return a;
}
int main () 
{
  printf("%d\n", string2num("1a", 16));
  printf("%d\n", string2num("a09b", 16));
  printf("%d\n", string2num("k09b", 36));

  return 0;
}