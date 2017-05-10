#include <stdio.h>
 
extern int factorial(int n);
 
int main(void)
{
    int n = 5;
    printf("Die Fakultät von %d ist %d\n", n, factorial(n));
    return 0;
}