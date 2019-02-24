/**********************************************
 *       Materia: Computacao Paralela         *
 * Professor: Luis Fabricio Wanderley Goes    *
 * ========================================== *
 * @author Luiz Gustavo Braganca dos Santos   *
 **********************************************/

// incluindo bibliotecas
#include <stdio.h>
#include <omp.h>

int main()
{
    // criando variavel de controle
    int i;

    #pragma omp parallel num_threads(2) // seta o número de threads em 2
    {
        int tid = omp_get_thread_num(); // lê o identificador da thread

        #pragma omp for private(i) ordered // paraleliza o for com a variavel i privada pra cada thread
        for(i = 1; i <= 3; i++)
        {
            printf("[PRINT1] T%d = %d \n", tid, i);
            printf("[PRINT2] T%d = %d \n", tid, i);
        }// fim for
    }// fim pragma
}// fim main()