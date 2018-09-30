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
#include <string>
#include <cstdlib>
#include <vector>

// definindo tamanho do array
#define N 2000

using namespace std;


/**
 * Metodo leString() - le string do teclado.
 * @return str
 */
string leString() {
    // definir dados
    string str;

    // lendo do teclado
    cin >> str;

    return str;
}// end leString()


/**
 * Metodo adicionaPalavrasAoArray() - adiciona palavras
 *                                    em um array.
 * @param string palavras[N]
 */
void adicionaPalavrasAoArray(string array[N]) {
    // definir dados
    int i;
    string str = leString();

    for(i = 0; str != "#"; i++) {
        if(str != "#") {
            // armazena
            array[i] = str;
        }// end if

        // lendo string
        str = leString();
    }// end for
}// end adicionaPalavrasAoArray()


void ordena(string vetor[N], string ordenado[N], int i) {
    // definir dados
    int j;

    for(j = 0; j < N; j++) {
        if(vetor[i].at(j) > vetor[i].at(j+1)) {
            ordenado[i].at(j) = vetor[i].at(j+1);
        } else {
            ordenado[i].at(j) = vetor[i].at(j);
        }// end if
    }// end for
}// end ordena()


/**
 * Metodo Main().
 * @return
 */
int main() {
    // definir dados
    int i;
    string dicionario[N];
    string dicionarioOrdenado[N];
    string palavras[N];

    // adicionando palavras ao dicionario
    adicionaPalavrasAoArray(dicionario);

    // lendo do teclado as palavras
    adicionaPalavrasAoArray(palavras);

    // ordenando dicionario
    for(i = 0; i < N; i++) {
        ordena(dicionario, dicionarioOrdenado, i);
    }// end for
}// end main()