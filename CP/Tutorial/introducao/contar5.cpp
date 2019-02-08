// incluindo bibliotecas
#include <stdio.h>

int main()
{
    printf("Vamos contar de 1 a 4\n");

    #pragma omp parallel for // distribui entre as threads
    for(int i = 1; i <= 4; i++)
    {
        printf("%d\n", i);
    }// fim for

    return 0;
}// fim main()