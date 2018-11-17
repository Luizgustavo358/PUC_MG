#include "Graph.h"
#include "math.h"
#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

double distanciaEuclidiana(int x, int y, int a, int b)
{
    double resposta;

    // pegando a distancia euclidiana
    resposta = sqrt(pow(x - a, 2) + pow(y - b, 2));

    return resposta;
}// fim distanciaEuclidiana


Graph contruirGrafo()
{
    // definir dados
    int i, j;    // variavel de controle
    int n;       // quantidade de cidades
    double x, y; // coordenadas
    double aux;

    // le a quantidade de cidades
    cin >> n;

    // cria o grafo
    Graph grafo(n);

    // le as coordenadas
    for(i = 0; i < n; i++)
    {
        cin >> x; // coordenada X
        cin >> y; // coordenada Y

        // adiciona as coordenadas
        grafo.addCoor(i, x, y);
    }// fim for

    for(i = 0; i < n; i++)
    {
        for(j = 0; j < n; j++)
        {
            if(i != j)
            {
                // pega a distancia euclidiana do grafo nas coordenadas
                // [i][0],  [i][1],
                // [j][0] e [j][1]
                aux = distanciaEuclidiana(grafo.coor[i][0], grafo.coor[i][1],
                                          grafo.coor[j][0], grafo.coor[j][1]);

                // adiciona aresta no grafo, na posica i, j com o valor de aux
                grafo.addEdge(i, j, aux);
            }// fim if
        }// fim for
    }// fim for

    return grafo;
}// fim construirGrafo()


int main()
{
    // definir dados
    int i;
    ofstream file;
    string caminho = "";
    vector<int> resposta;
    double caminhoTotal = 0;

    // criando o grafo
    Graph grafo = contruirGrafo();

    // fazendo o branch and bound
    resposta = grafo.branchBound();

    // criando arquivo "branch-and-bound.out"
    file.open("branch-and-bound.txt");

    for(i = 0; i < resposta.size(); i++)
    {
        // adiciona os caminhos
        caminhoTotal += grafo.adj[resposta[i]][resposta[i+1]];

        // mostra o caminho
        caminho += to_string(resposta[i] + 1) + " ";
    }// fim for

    // printa o tamanho percorrido
    file << caminhoTotal << endl << caminho << endl;

    // fechando arquivo
    file.close();
}// fim main()