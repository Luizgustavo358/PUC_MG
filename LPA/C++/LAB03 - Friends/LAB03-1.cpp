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

using namespace std;
#define N 30000;
#define M 500000;


class Vertice {
    // definir dados
    int distancia, pai;
    bool cor;

    public:
        Vertice() {
            this->distancia = 100;
            this->pai = 0;
            this->cor = false;
        }// end contrutor


        void setDistancia(int distancia) {
            this->distancia = distancia;
        }// end setDistancia()


        void setPai(int pai) {
            this->pai = pai;
        }// end setPai()


        void setCor(bool cor) {
            this->cor = cor;
        }// end setCor()


        int getDistancia() {
            return this->distancia;
        }// end getDistancia()


        int getPai() {
            return this->pai;
        }// end getPai()


        bool getCor() {
            return this->cor;
        }// end getCor()


    //    bool verificaCor(bool cor) {
    //        for(Vertice v: listaAdjacencia) {
    //            if(v.getCor() == cor) {
    //                return true;
    //            }// end if
    //        }// end for
    //        return false;
    //    }// end verificaCor()
};

class Aresta {

};

class Grafo {
    // definir dados
    int tamGrafo;
    int pai[];
    int cor[];
    Vertice** grafo;

    public:
        void criaGrafo(int n) {
            // definir dados
            int i, j;

            // pega o tamanho do grafo
            tamGrafo = n;

            for(i = 0; i < n; i++) {
                for(j = 0; j < n; j++) {
                    grafo[i][j] = new Vertice;
                }// end for
            }// end for

            for(i = 0; i < n; i++) {
                cor[i] = 0;
                pai[i] = -1;
            }// end for
        }// end criaGrafo()
};


int leTestCases() {
    // define a variavel
    int testCases;

    // le do teclado
    cin >> testCases;

    return testCases;
}// fim leTestCases()


int leAmizades() {

}


int** iniciaMatriz(int n) {
    // definir dados
    int i, j;
    int** matriz = new int*[n];

    for(i = 0; i < n; i++) {
        matriz[i] = new int[n];
    }// fim for

    // preenche matriz com 0
    for(i = 0; i < n; i++) {
        for(j = 0; j < n; j++) {
            matriz[i][j] = 0;
        }// fim for
    }// fim for

    return matriz;
}// fim iniciaMatriz()


/**
 * Metodo Main().
 * @return
 */
int main() {
    // definir dados
    int testCases = leTestCases();
    int cont = 0;

}// end main()