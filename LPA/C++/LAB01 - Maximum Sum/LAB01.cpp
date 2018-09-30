/*--------------------------------------------+
 |               Trabalho de LPA              |
 +--------------------------------------------+
 | Professor: Felipe                          |
 | Universidade: PUC Minas                    |
 +--------------------------------------------+
 | Nome: Luiz Gustavo Braganca dos Santos     |
 | Matricula: 524507                          |
 +--------------------------------------------*/

// incluindo bibliotecas
#include <iostream>
#include <stdlib.h>

using namespace std;

/**
 * Metodo leTamanho().
 */
int leTamanho() {
    // definir dados
    int n;

    // lendo tamanho da matriz
    cin >> n;

    // retorna valor lido
    return(n);
}// end leTamanho()


/**
 * Metodo preencheMatriz().
 * @param n
 * @return matriz
 */
int** preencheMatriz(int n) {
    // definir dados
    int i, j;
    int** matriz = new int*[n];

    for(i = 0; i < n; i++) {
        matriz[i] = new int[n];
    }// end for

    // preenchendo a matriz
    for(i = 0; i < n; i++) {
        for(j = 0; j < n; j++) {
            cin >> matriz[i][j];
        }// end for
    }// end for

    return matriz;
}// end preencheMatriz()


/**
 * Metodo maxSum().
 * @param matriz
 * @param n
 */
void maxSum(int** matriz, int n) {
    // definir dados
    int i, j, k;
    int maxsum, auxV, auxH;

    // coloca o valor inicial
    maxsum = matriz[0][0];
    auxH   = matriz[0][0];
    auxV   = matriz[0][0];

    // faz o maxsum
    for(i = 0; i < n; i++) {
        // retorna ao inicial
        auxV = matriz[0][0];
        auxH = matriz[0][0];

        for(j = 0; j < n; j++) {
            for(k = i; k < n; k++) {
                auxV += matriz[k][j];
                auxH += matriz[j][k];
            }// end for

            if(auxV > maxsum) {
                maxsum = auxV;
            }// end if

            if(auxH > maxsum) {
                maxsum = auxH;
            }// end if
        }// end for
    }// end for

    // subtraindo 1 da soma para matrizes impares
    if(n % 2 != 0) {
        maxsum = maxsum - 1;
    }// end if

    cout << maxsum << endl;
}// end maxSum


/**
 * Metodo Main().
 * @return
 */
int main() {
    // le o tamanho da matriz n x n
    int n = leTamanho();

    // preenche a matriz
    int** matriz = preencheMatriz(n);

    // chama metodo para fazer o maxsum
    maxSum(matriz, n);
}// end main