#include <iostream>
#include <vector>
#include <ctime>
#define INFINITE 999999/0.001

using namespace std;

/**
  * Classe utilizada como uma estrutura de dados para a resolução do PCV
  * Principais variáveis:
  *     (private) n - número de vértices(private)
  *     (public)  adj - matriz de adjacência/distancia. Se o valor for -1, os vértices não estão conectados
  *     (public)  coor - coordenadas das cidades
  */
class Graph {

private:

    int n;	// Número de vértices
    vector<int> bruteForceR(int a, double res, vector<int>cidades, vector<int> bestC); //determina o menor caminho Hamiltoniano do grafo utilizando o paradigma de força bruta
    vector<int> branchBoundR(int a, double res, vector<int>cidades, vector<int> bestC); //determina o menor caminho Hamiltoniano do grafo utilizando o paradigma de branch and bound
    bool isIn(int x, vector<int> v); //retorna se um elemento está ou não no vetor de inteiros
    double best; // Variável auxiliar utilizada para calcular o PCV utilizando os paradigmas de força bruta e branch and bound

public:

    time_t timeT;
    double **adj;	// matriz de adjacência/distancia. Se o valor for -1, os vértices não estão conectados
    double **coor;	// coordenadas das cidades
    Graph();		//Construtor
    Graph(int size);// Constructor
    ~Graph();		// Destrutor
    int getSize();	//Retorna o valor de n
    void addCoor(int pos, double x, double y); //adiciona coordendas da cidade
    void addEdge(int x, int y, double wt);	   // Adiciona uma aresta ao grafo
    bool isConnected(int x, int y);			   // Checa se dois vértices estão conectados
    vector<int> bruteForce();	//determina o menor caminho Hamiltoniano do grafo utilizando o paradigma de força bruta (chama a função recursiva)
    vector<int> branchBound();  //determina o menor caminho Hamiltoniano do grafo utilizando o paradigma de branch and bound (chama a função recursiva)
    void printAdj();	//imprime a matriz de adjacencia
    void printCoor();	//imprime matriz de coordenadas

};//fim class Graph;


/**
 * Construtor
 * @param	size	Quantidade de vértices
 */
Graph::Graph(int size) {
    if (size > 1) {
        n = size;
    } else {
        n = 2;
    }//fim if

    adj = new double*[n];
    coor = new double*[n];

    for (int i = 0; i < n; i++) {
        adj[i] = new double[n];	// Aloca memória para a matriz de adjacência
        coor[i] = new double[n];// Aloca memória para a matriz de coordenadas

        for (int j = 0; j < n; j++) {
            adj[i][j] = -1;	// Inicializa os vértices com -1
        }//fim for

        for (int j = 0; j < 2; j++) {
            coor[i][j] = -1; // Inicializa os vértices com -1
        }//fim for
    }//fim for

    this->best = INFINITE; //Inicializa a variável best com "infinito"
    this->timeT = 0;
}//fim construtor()

/**
 *  Construtor
 */
Graph::Graph() {

    n = 0;
    this->best = INFINITE;

}//fim construtor()


/**
 * Destrutor
 */
Graph::~Graph() {

}//fim destrutor()

/**
 * Retorna o valor da quantidade de vértices
 * @return  Várivel privada n, que correpsonde à quantidade de vértices do grafo
 */
int Graph::getSize() {
    return n;
}//fim getSize()

/**
 * Adiciona as coordendas de um vértice na matriz coor
 * @param pos	Identificação do vértice que terá as coordenadas inseridas
 * @param x	Coordenada x do vértice
 * @param y	Coordenada y do vértice
 */
void Graph::addCoor(int pos, double x, double y) {
    coor[pos][0] = x;
    coor[pos][1] = y;
}//fim addCoor()

/**
 * Adiciona uma aresta entre dois vértices, com um determinado peso (tamanho)
 * @param	x	Vértice no qual será adicionado a aresta
 * @param	y	Vértice no qual será adicionado a aresta
 * @param	wt	Peso da aresta
 */
void Graph::addEdge(int x, int y, double wt) {
    adj[x][y] = adj[y][x] = wt;
}//fim addEdge()

/**
 * Checa se dois vértices estão conectados
 * @param		x	Vértice que deseja saber a conectividade com y
 * @param		y	Vértice que desenja saber a conectividade com x
 * @return	res	True(1) caso tenham aresta entre si, False(0) caso contrário
 */
bool Graph::isConnected(int x, int y) {
    bool res = false;

    if (adj[x][y] >= 0) {
        res = true;
    }//fim if

    return res;
}//fim isConnected()

/**
 * Determina o menor caminho Hamiltoniano do grafo utilizando o paradigma de força bruta (chama a função recursiva)
 * @return	resposta	Vetor de inteiros que possui a ordem que os vértices devem ser visitados para obter o menor caminho
 */
vector<int> Graph::bruteForce() {
    vector<int> cidades;
    vector<int> resposta;
    cidades.push_back(0);
    this->best = INFINITE;

    resposta = bruteForceR(0, 0, cidades,resposta);

    return resposta;
}//fim bruteForce()

/**
 * Determina o menor caminho Hamiltoniano do grafo utilizando o paradigma de força bruta
 * @param	a		Vértice que estamos visitando
 * @param	res		Caminho total atual
 * @param	cidades	Vetor de inteiros com o caminho atual percorrido
 * @param	bestC	Atual vetor de inteiros que possui a ordem que os vértices devem ser visitados para obter o menor caminho
 * @return	bestC	Vetor de inteiros que possui a ordem que os vértices devem ser visitados para obter o menor caminho
 */
vector<int> Graph::bruteForceR(int a, double res, vector<int>cidades,  vector<int> bestC) {
    for (int i = 1; i < n; i++) {
        if (!isIn(i, cidades)) {
            res += adj[a][i];
            cidades.push_back(i);

            bestC = bruteForceR(i, res, cidades, bestC);

            if (cidades.size() == n && (res + adj[0][cidades[cidades.size() - 1]]) < this->best) {
                this->best = res + adj[0][cidades[cidades.size() - 1]];
                bestC = cidades;
            }//fim if

            res -= adj[a][i];
            cidades.pop_back();
        }//fim if
    }//fim for

    return bestC;
}//fim bruteForceR()

/**
 * Determina o menor caminho Hamiltoniano do grafo utilizando o paradigma de branch and bound(chama a função recursiva)
 * @return	resposta	Vetor de inteiros que possui a ordem que os vértices devem ser visitados para obter o menor caminho
 */
vector<int> Graph::branchBound() {
    time_t inicio, fim;
    vector<int> cidades;
    vector<int> resposta;
    cidades.push_back(0);
    this->best = INFINITE;

    inicio = clock();
    resposta = branchBoundR(0, 0, cidades, cidades);
    fim = clock();
    timeT = fim - inicio;

    cout << "Tempo: " << timeT << endl;

    return resposta;
}//fim branchBound()

/**
 *  Determina o menor caminho Hamiltoniano do grafo utilizando o paradigma de branch and bound
 *  @param	a		Vértice que estamos visitando
 *  @param	res		Caminho total atual
 *  @param	cidades	Vetor de inteiros com o caminho atual percorrido
 *  @param	bestC	Atual vetor de inteiros que possui a ordem que os vértices devem ser visitados para obter o menor caminho
 *  @return	bestC	Atual vetor de inteiros que possui a ordem que os vértices devem ser visitados para obter o menor caminho
 */
vector<int> Graph::branchBoundR(int a, double res, vector<int>cidades, vector<int> bestC) {
    for (int i = 0; i < n; i++) {
        if (!isIn(i, cidades)) {
            res += adj[a][i];
            cidades.push_back(i);

            if(res < this->best) {
                bestC = branchBoundR(i, res, cidades, bestC);

                if (cidades.size() == n && (res + adj[0][cidades[cidades.size() - 1]]) < this->best) {
                    this->best = res + adj[0][cidades[cidades.size() - 1]];
                    bestC = cidades;
                }//fim if
            }//fim if

            res -= adj[a][i];
            cidades.pop_back();
        }//fim if
    }//fim for

    return bestC;
}//fim branchBoundR()

/**
 *  Retorna se um elemento está ou não no vetor de inteiros
 *  @param x	Elemento que deseja checar se existe
 *  @param v	Vetor de inteiros usado para a checagem
 *  @return	res	True(1) se o elemento está no vetor, False(0) caso contrário
 */
bool Graph::isIn(int x, vector<int> v) {
    bool res = false;

    for (int i = 0; i < v.size(); i++) {
        if (v[i] == x) {
            res = true;
            i = v.size();
        }//fim if
    }//fim for

    return res;
}//fim isIn()

/**
 *  Função que imprime a matriz de adjacencia. Utilizada para debug
 */
void Graph::printAdj() {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if (isConnected(i, j)) {
                cout << i << " " << j << " " << adj[i][j] << endl;
            }//fim if
        }//fim for
    }//fim for
}//fim printAdj()

/**
 *  Função que imprime a matriz de coordendas. Utilizada para debug
 */
void Graph::printCoor() {
    for (int i = 0; i < n; i++) {
        cout << i << " " << coor[i][0] << " " << coor[i][1] << endl;
    }//fim for
}//fim printCoor()