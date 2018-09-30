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
#include <cstdio>
#include <vector>
#include <map>

using namespace std;

// variavel global
vector<int> pai;

// definicoes
#define clear() pai.clear()
#define setMake() pai.push_back(pai.size())
#define setUnion(a, b) pai[find(a)] = find(b)


/**
 * Metodo find().
 * @param x
 * @return
 */
int find(int x) {
    // condicao de parada
    if(pai[x] == x) {
        return x;
    }// end if

    // recursividade
    return pai[x] = find(pai[x]);
}// end setFind()


/**
 * Main().
 * @return
 */
int main() {
    // definir dados
    int testCase, maxSize;
    int i, n, m, a, b;
    map<int, int> setSize;

    // lendo o test case
    scanf("%d", &testCase);

    while(testCase--) {
        // limpa
        clear();

        // le do teclado os valores N e M
        scanf("%d %d", &n, &m);

        for(i = 0; i < n; ++i) {
            setMake();
        }// end for

        for(i = 0; i < m; ++i) {
            // le valores
            scanf("%d %d", &a, &b);

            setUnion(a - 1, b - 1);
        }// end for

        maxSize = 0;

        for(i = 0; i < pai.size(); ++i) {
            maxSize = max(maxSize, ++setSize[find(i)]);
        }// end for

        printf("%d\n", maxSize);
    }// end while
}// end main()