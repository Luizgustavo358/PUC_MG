#include "Graph.h"
#include <math.h>
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <time.h>

using namespace std;


double distanciaEuclidiana(int x, int y, int a, int b)
{
    double resposta;

    // pegando a distancia euclidiana
    resposta = sqrt(pow(x - a, 2) + pow(y - b, 2));

    return resposta;
}// fim distanciaEuclidiana


Graph contruirGrafo(int n)
{
    // definir dados
    int i, j;    // variavel de controle
    double x, y; // coordenadas
    double aux;

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
    int i, n;
    ofstream file;
    string caminho = "";
    string linha = "";
    vector<int> resposta;
    double caminhoTotal = 0;
    clock_t t0, tf;
    double tempoGasto;

    // le quantidade de cidades
    cin >> n;

    // criando o grafo
    Graph grafo = contruirGrafo(n);

    t0 = clock();

    // fazendo o forca bruta
    resposta = grafo.bruteForce();

    tf = clock();

    tempoGasto = ((double)(tf - t0)) / CLOCKS_PER_SEC;

    printf("Tempo gasto: %lf s\n", tempoGasto);

    // criando arquivo "forca-bruta.txt"
    file.open("forca-bruta.txt");

    for(i = 0; i < resposta.size(); i++)
    {
        // adicionar os caminhos
        caminhoTotal += grafo.adj[resposta[i]][resposta[i+1]];

        // mostra o caminho
        caminho = caminho + to_string(resposta[i] + 1) + " ";
    }// fim for

    // printa o tamanho percorrido
    file << (float)caminhoTotal << endl << caminho << endl;

    // fechando o arquivo
    file.close();
}// fim main