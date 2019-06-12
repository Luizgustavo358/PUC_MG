/****************************************************************	
 * CAMINHO MAIS CURTO EM UM GRAFO COM ARESTA DE PESO NEGATIVO   *
 *                                                              *
 * Disciplina: Projeto e Análise de Algoritmo                   *
 * Professora: Raquel Mini			                                *
 *--------------------------------------------------------------*
 * Grupo: Luiz Gustavo Bragança dos Santos                      *
 *        Pedro Augusto Prosdocimi Resende                      *
 *	      Pedro Henrique Silva Xavier                           *
 ****************************************************************/

/*
 * Segue abaixo os codigos para encontrar o caminho minimo:
 * Partindo de um vertice inicial, para tdos os outros (USANDO DIJKSTRA).
 * 
 * Utilizando Bellman-Ford, para grafos com arestas de peso 
 * negativo.
 * Utilizando Bellman-Ford para verificar existencia de Ciclos.
 * 
*/
#include <vector>
#include <iostream>
#include <sstream>
#include <stdio.h>
#include <limits.h>
#include <cstring>
#include <string.h>


using namespace std;
/*
 Segue a baixo a classe Grafo, que possui os atributos grafo(Matriz de adjacencia) e numVertice.
numVertice serve para saber a dimensão da matriz.
O construtor abaixo é utilizado para construir a matriz de Adjacencia.
O desconstrutor,para liberar o espaço que foi alocado.
*/
class Grafo {	
	private:
    int numVertice; 
	  int **grafo; 
  
	public:
	  bool negAresta;
	  
		Grafo(int n){  		
	  	negAresta = false;
	    numVertice = n;
	    grafo = new int*[numVertice];
	    
			for(int i=0; i<numVertice; i++){
		  	grafo[i] = new int[numVertice];
	    }	
	  }
		
		~Grafo(){
			for(int i=0; i<numVertice; i++){
		  	delete grafo[i];
		 	}

		  delete grafo;
    }

	//Métodos para retornar atributos:
	int getnumVertice(){ 
		return numVertice; 
	}
		
	bool aresta(int x, int y){ 
		return (grafo[x][y] != 0);
	}
		
	int getPeso(int x, int y){
		return grafo[x][y];
	}
	
	//Métodos para preencher a matriz conforme entrada:
	void criarGrafo(){
		int tmp = 0;
		
		for(int i=0; i<numVertice; i++){
			for(int j=0; j<numVertice; j++){
				scanf("%d,", &(tmp));
				grafo[i][j] = tmp;
				
				if(tmp < 0) negAresta = true;
			}
		}
	}
};

//Finalizada a classe Grafo.
//O método printF,serve para exibir a distancia e caminho de um vertice origem a todos.
void printF(int dist[], int n, int prox[])
{
	int n_v = n; 
	//n_v recebe o numero de vertices
       
  printf("\nVertice \t Distancia \t Caminho\n");	
	
	for(int i=0; i<n_v; i++){
		printf("%d \t\t %d\t\t ", i, dist[i]); 
		int tmp_p;
		cout <<  i;
		tmp_p = prox[i];
		
		while(tmp_p != -1){ 
			cout << " < para " << tmp_p;
			tmp_p = prox[tmp_p];
		}
		cout << endl;
	}
	
	printf("\n\n");
}

/*
Segue abaixo:
O algoritmo de Dijkastra.
Função para encontrar o vertice de menor distancia no conjunto ainda não visitado.
*/
int minDistance(int dist[], bool visited[], int V)
{
   // inicializar o min
	int min = INT_MAX, min_index;
 
	for (int v = 0; v < V; v++)
		if (visited[v] == false && dist[v] <= min)
			min = dist[v], min_index = v;
 
	return min_index;
}

/*
O algoritmo de Dijkstra,utilizando 3 vetores.
O primeiro vetor informa se o vertice foi visitado ou não.
O segundo vetor para armazenar o proximo para obter o menos caminho.
O terceiro vetor armazena as distancias dos vertices ate o vertce inicial
*/
void dijkstra(int verticeIni,Grafo* grafo) {	
	int n_v = grafo->getnumVertice();
  bool visitado[n_v];			
	int prox[n_v];		
	int distancia[n_v];     			
			
	// inicializando os vetores.
	for(int i=0;i<n_v;i++)
		distancia[i] = INT_MAX, visitado[i] = false, prox[i] = -1;
 
	// Distancia de "verticeIni" ate ele mesmo é 0
	distancia[verticeIni] = 0;
 
	// procurar o menor caminho para cada vertice
	for (int count = 0; count < n_v -1; count++) {
	  //procurar a menor distancia , apos encontrar marca o vertice como visitado
		int x = minDistance(distancia, visitado, n_v);
		visitado[x] = true;
 
 		// atualizar a distancia dos vizinhos do vertices "u" 
		for (int M = 0; M < n_v; M++){
 			int peso = grafo->getPeso(x, M);

			// atualizar a distancia se encontrar outro caminho menor
			// atualizar so os vertices nao visitados, pois no caso seu menor caminho ja esta definido
			if (!visitado[M] && grafo->aresta(x, M) && distancia[x] != INT_MAX && distancia[x]+ grafo->getPeso(x, M) < distancia[M]){
				distancia[M] = distancia[x] + grafo->getPeso(x, M);
        prox[M] = x;
			}
		}
	}

	printF(distancia, n_v, prox);    
}

//--------------------------------------------------------------//finalizado o algoritmo de Dijkstra.
//-------------------------------------Algoritmo de Bellman-ford 
/*

O algoritmo de BellmanFord baixo,utiliza programação dinamica.
inicalmente toda operação é feita supondo que não existe ciclo negativo.É feito o relaxamento (VERTICES - 1) vezes,
para garantir o menor caminho entre o ponto inicial ate outro qualquer.Não existindo ciclo negativo,o menor caminho no maximo passará por todos os vertices.
 Utilizando 2 vetores.
O primeiro vetor para armazenar o proximo, o predecessor.
O segundo vetor armazena as distancias dos vertices ate o vertce inicial
*/

bool bellmanFord(int verticeIni,Grafo* grafo){
	int n_v = grafo->getnumVertice();	
  int prox[n_v];			
	int distancia[n_v];						
  bool resposta = false;
	
	// inicializando vetor de distancia :			
  for(int i=0;i <n_v ;i++)						
		distancia[i] = INT_MAX, prox[i] = -1;

	//distancia do vertice inicial a ele mesmo é 0
	distancia[verticeIni] = 0;						

  for( int i=0; i< n_v-1;i++){
		for( int j=0 ; j <n_v; j++){
			for(int k=0; k<n_v ;k++){
				int x, v, peso;
			  x = j, v = k, peso = grafo->getPeso(j, k);
				
				// verifica se existe aresta direcionada j->k,
				//caso tenha menor distancia passando por estas arestas atualiza vetor distancia.
				if( grafo->aresta(j, k) && distancia[x] != INT_MAX && distancia[x] + peso < distancia[v]){
					distancia[v] = distancia[x] + peso;
					prox[v] = x;
			  }
		  }
		}
	}

	//verificando se existe ciclo negativo,
	//a cada passagem sera obtido um valor menor.
	for(int j=0; j<n_v;j++){
		for(int k=0; k<n_v;k++){
			int x = j, v = k, peso = grafo->getPeso(j, k);
			
			if( grafo->aresta(j, k) && distancia[x] != INT_MAX && distancia[x] + peso < distancia[v]){
				resposta =  true;
			}
		}
	}
	
	if(!resposta) {
		printF(distancia, n_v, prox);
	}
  else{
    printf(" Existe ciclo negativo!!\n\t");
  }		
	
	return resposta;
}

// ====================================== bellman ==========================================




/*
A função abaixo, recebe um grafo como parametro
faz a leitura da entrada padrão e retorna o vertice inicial.
A função main inicia todo o processo.
*/
int inicializar(Grafo*& grafo){
	int n_v, verticeIni;

	scanf("%d", &n_v); 
	scanf("%d", &verticeIni);

	grafo = new Grafo(n_v);

	grafo->criarGrafo();

	return verticeIni;
}

/*
no main é inicializado o vertice inicial peal função inicializar 
verifica a existencia de peso negativo,caso nao exista é aplicado Dijkastra e bellmanFord.
Caso exista peso negativo é utilizando bellman e se houver ciclo negativo é informado.
iniciando todo o processo:
*/
int main(){
	Grafo* grafo; 
	int verticeIni = inicializar(grafo); 
  
	if(grafo->negAresta == false){
    printf("\tDijkstra\n");
    dijkstra(verticeIni,grafo);
    printf("\tBellman-Ford\n");
    bellmanFord(verticeIni,grafo);
  }
  else{
    printf(" Para Dijkstra existe peso negativo!\n\n\n");
    printf("\tBellman-Ford\n");
    
		if(bellmanFord(verticeIni,grafo) == true){
    }
  }

	// utilizando o desnconstrutor para liberar espaço:
  delete grafo;
}

