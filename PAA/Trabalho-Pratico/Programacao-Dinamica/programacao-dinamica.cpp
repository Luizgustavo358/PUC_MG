#include <stdio.h>
#include <limits.h>
#include <math.h>
#include <iostream>
#include <string>
#include <string.h>
#include <time.h>

using namespace std;



//#define INT_MAX 999999
#define sizePOW 8192


int n, npow;
int g[sizePOW][sizePOW];
int p[sizePOW][sizePOW];
int adj[sizePOW][sizePOW];
int x[sizePOW],y[sizePOW];

int distanciaSubProblemas(int start,int set){

    int masked, mask, temp, i;
    int resultado = INT_MAX; //guarda o mínimo

    if(g[start][set]!=-1)// verifica se tem subproblema que já foi resolvido

        return g[start][set];

    for(i = 0; i < n;i++){
        // npow agora é -1 porq começamos do vértice 0
        //remove um vértice
        mask = (npow-1) - ( 1 << i );

        masked = set&mask;

        if(masked != set)//caso um mesmoc conjunto seja gerado, então a mascara tem q ser diferente.
        {
            temp = adj[start][i] + distanciaSubProblemas(i,masked);//calcula o conjunto com o vértice já removido

            if(temp < resultado)

                resultado = temp,p[start][set] = i;
        }
    }
    return g[start][set] = resultado;//return minimum
}

void getpath(int start,int set){

    if(p[start][set]==-1) return;//reached null set
    int x = p[start][set] ;
    int mask = (npow-1)-(1<<x);
    int masked = set&mask;//remove p from set
    printf("%d ",(x + 1));
    getpath(x,masked);
}

void TSP(){

    int i,j;
    //g(i,S) caminho mais curto entre S e i
    for(i = 0;i < n;i++)
        for(j = 0;j < npow ;j++)
            g[i][j] = p[i][j]= -1;

    for(i = 0;i < n;i++)
        g[i][0] = adj[i][0];//g(i,nullset)= aresta entre il

    int resultado = distanciaSubProblemas (0,npow-2);

    printf("Custo : %d\n",resultado);

    printf("Caminho:\n1 ");
    getpath(0,npow-2);
    printf("1\n");

}

double distancia(int i, int j){

    return sqrt(pow((x[i]-x[j]),2) + pow((y[i] - y[j]),2));
}

int main(void) {

    clock_t t0, tf;
    double tempo_gasto;

    int i,j,temp;

    scanf("%d",&n);

    npow = (int)pow(2,n);// "mascara" para representar todas as cidades da árvore

    g[n][sizePOW];

    p[n][sizePOW];

    adj[n][n];


    for(i = 0;i < n;i++){ //preenche os vetores x e y de coordenadas

        scanf("%d %d",&x[i],&y[i]);
    }

    for(int k = 0; k < n; k++){ // preenche a matriz com as distâncias

        adj[k][k] = 0;

        for(int l = k+1; l < n; l++){
            temp = distancia(k,l);
            if(temp > 0){

                adj[k][l] = temp;
                adj[l][k] = temp;
            }
        }

    }
    //CHAMA TSP;
    t0 = clock();
    TSP();
    tf = clock();
    tempo_gasto = ( (double) (tf - t0) ) / CLOCKS_PER_SEC;
    printf("Tempo gasto: %lf s\n", tempo_gasto);


    return 0;

}