#include <iostream>
#include <vector>
#include <ctime>
#define INFINITE 999999/0.001

using namespace std;

class Graph {

private:

    int n;	// Number of vertices
    vector<int> bruteForceR(int a, double res, double bestR,  vector<int>cidades, vector<int> bestC); //determina o menor caminho Hamiltoniano do grafo utilizando o paradigma de força bruta
    vector<int> branchBoundR(int a, double res, double bestR, vector<int>cidades, vector<int> bestC); //determina o menor caminho Hamiltoniano do grafo utilizando o paradigma de branch and bound
    bool isIn(int x, vector<int> v); //retorna se um elemento está ou não no vetor de inteiros
    double best; //

public:

    time_t timeT;
    double **adj;	                           // matriz de adjacência/distancia. Se o valor for -1, os vértices não estão conectados
    double **coor;                             // coordenadas das cidades
    Graph();
    Graph(int size);	                       // Constructor
    ~Graph();	                               // Destructor
    int getSize();
    void addCoor(int pos, double x, double y); //adiciona coordendas da cidade
    void addEdge(int x, int y, double wt);     // Add an edge to the graph
    bool isConnected(int x, int y);	           // Check if two vertices are connected
    vector<int> bruteForce();                  //determina o menor caminho Hamiltoniano do grafo utilizando o paradigma de força bruta (chama a função recursiva)
    vector<int> branchBound();                 //determina o menor caminho Hamiltoniano do grafo utilizando o paradigma de branch and bound (chama a função recursiva)
    void printAdj();                           //imprime a matriz de adjacencia
    void printCoor();                          //imprime matriz de coordenadas

};


// Constructor
Graph::Graph(int size) {

    if (size > 1) {

        n = size;

    }//fim if

    else {

        n = 2;

    }//fim else

    adj = new double*[n];
    coor = new double*[n];

    for (int i = 0; i < n; i++) {

        adj[i] = new double[n];	// Allocate memory for adjacency matrix
        coor[i] = new double[n];

        for (int j = 0; j < n; j++) {

            adj[i][j] = -1;	// Initialize the vertices to -1

        }//fim for

        for (int j = 0; j < 2; j++) {

            coor[i][j] = -1;	// Initialize the vertices to -1

        }//fim for

    }//fim for

    this->best = INFINITE;
    this->timeT = 0;

}//fim construtor

Graph::Graph() {

    n = 0;
    this->best = INFINITE;

}


// Destructor
Graph::~Graph() {
    /*
    for (int i = 0; i < n; i++) {

        delete[] adj[i];

    }//fim for

    delete[] adj;
    */
}//fim destrutor


int Graph::getSize() {

    return n;

}//fim getSize

// Add an edge to the graph, with with weigth
void Graph::addCoor(int pos, double x, double y) {

    coor[pos][0] = x;
    coor[pos][1] = y;

}//fim addCoor

void Graph::addEdge(int x, int y, double wt) {

    adj[x][y] = adj[y][x] = wt;

}//fim addEdge

bool Graph::isConnected(int x, int y) {

    bool res = false;

    if (adj[x][y] >= 0) {

        res = true;

    }//fim if

    return res;

}//fim isConnected


vector<int> Graph::bruteForce() {

    time_t inicio, fim;
    vector<int> cidades;
    vector<int> resposta;

    cidades.push_back(0);
    this->best = INFINITE;

    inicio = clock();
    resposta = bruteForceR(0, 0, 0, cidades, cidades);
    fim = clock();
    timeT = fim - inicio;

    return resposta;
}//fim bruteForce

vector<int> Graph::bruteForceR(int a, double res, double bestR, vector<int>cidades,  vector<int> bestC) {

    for (int i = 0; i < n; i++) {

        if (!isIn(i, cidades)) {

            //cout << a << " " << res << " " << i << " " ;

            res += adj[a][i];
            cidades.push_back(i);

            //cout << res << endl;

            bestC = bruteForceR(i, res, bestR, cidades, bestC);
            bestR = res;

            if (cidades.size() == n && (bestR + adj[0][cidades[cidades.size() - 1]]) < this->best) {

                this->best = bestR + adj[0][cidades[cidades.size() - 1]];
                bestC = cidades;

            }//fim if

            res -= adj[a][i];
            cidades.pop_back();

        }//fim if

    }//fim for

    return bestC;

}//fim bruteForceR

vector<int> Graph::branchBound() {

    time_t inicio, fim;
    vector<int> cidades;
    vector<int> resposta;
    cidades.push_back(0);
    this->best = INFINITE;

    inicio = clock();
    resposta = branchBoundR(0, 0, 0, cidades, cidades);
    fim = clock();
    timeT = fim - inicio;

    return resposta;

}//fim branchBound

vector<int> Graph::branchBoundR(int a, double res, double bestR, vector<int>cidades, vector<int> bestC) {

    for (int i = 0; i < n; i++) {

        if (!isIn(i, cidades)) {

            //cout << a << " " << res << " " << i << " " ;

            res += adj[a][i];
            cidades.push_back(i);

            //cout << res << endl;

            if(res < this->best) {

                bestC = branchBoundR(i, res, bestR, cidades, bestC);
                bestR = res;

                if (cidades.size() == n && (bestR + adj[0][cidades[cidades.size() - 1]]) < this->best) {

                    this->best = bestR + adj[0][cidades[cidades.size() - 1]];
                    bestC = cidades;

                }//fim if

            }//fim if

            res -= adj[a][i];
            cidades.pop_back();

        }//fim if

    }//fim for

    return bestC;

}//fim branchBoundR

bool Graph::isIn(int x, vector<int> v) {

    bool res = false;

    for (int i = 0; i < v.size(); i++) {

        if (v[i] == x) {

            res = true;
            i = v.size();

        }//fim if

    }//fim for

    return res;

}//fim isIn


void Graph::printAdj() {

    for (int i = 0; i < n; i++) {

        for (int j = 0; j < n; j++) {

            if (isConnected(i, j)) {

                cout << i << " " << j << " " << adj[i][j] << endl;

            }//fim if

        }//fim for

    }//fim for

}//fim print

void Graph::printCoor() {

    for (int i = 0; i < n; i++) {


        cout << i << " " << coor[i][0] << " " << coor[i][1] << endl;


    }//fim for

}//fim void