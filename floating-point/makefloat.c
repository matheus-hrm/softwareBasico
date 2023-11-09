#define getsig(i) ((i) >> 31 & 1)

#define getexp(i) ((i) >> 23 & 0xff)

#define getfrac(i) ((i)&0x7fffff)

#define makefloat(s, e, f) (((s)&1) << 31 | (((e)&0xff) << 23) | ((f)&0x7fffff))

typedef union
{

  float f;

  unsigned int i;

} U;

int main()
{

  U u;

  unsigned int s = 0; // 1 bit de sinal     (0 positivo, 1 negativo)

  unsigned int e = 0; // 8 bits de expoente (menos significativos)

  unsigned int f = 0; // 23 bits da fração  (menos significativos)

  u.f = 10.125;

  s = getsig(u.i); // extrai o sinal    (passando o inteiro da union)

  e = getexp(u.i); // extrai o expoente (passando o inteiro da union)

  f = getfrac(u.i); // extrai a fração   (passando o inteiro da union)

  u.i = makefloat(s, e, f); // compõe um float, mas retorna 'unsigned int'

  printf("%f\n", u.f); // agora podemos usar a parte float da union
}