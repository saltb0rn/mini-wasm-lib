#include <stdio.h>

extern int example(int, int);

int main(int argc, char* args[]) {
  printf("The result of example(2, 3) is %d.\n", example(2, 3));
  return 0;
}
