/**
 * @materia LPA
 * @professor
 * @author Luiz Gustavo Braganca dos Santos
 * ----------------------------------------------------------------------------
 * Compilar: g++ -std=c++11 LAB09-Saco_do_Papai_Noel.cpp -o saco_do_papai_noel
 */

#include <iostream>
#include <vector>
#include <stdio.h>
#include <iomanip>

using namespace std;


/**
 * Struct stc
 */
struct stc {
    int value = 0;
    int packs = 0;
};


// definir dados
stc t[301][51], a, b;
int maximumWeight, qtdPacks;


/**
 * Metodo mochila().
 * @param weight
 * @param value
 * @param arraySize
 * @param maximumWeight
 * @return
 */
stc mochila(int weight[], int value[], int arraySize, int maximumWeight)
{
    for(int col = 0; col <= maximumWeight; col++)
    {
        t[0][col].value = 0;

        for(int i = 1; i <= arraySize; i++)
        {
            a = t[i - 1][col];

            if (weight[i] > col)
            {
                b = t[0][col];
            }
            else
            {
                b = t[i-1][col-weight[i]];
                b.value += value[i];
            }// end if

            if(a.value >= b.value)
            {
                t[i][col] = a;
            }
            else
            {
                if(a.value < b.value)
                {
                    t[i][col] = b;
                    t[i][col].packs++;
                }// end if
            }// end if
        }// end for
    }// end for

    return t[arraySize][maximumWeight];
}// end mochila()


/**
 * Metodo achaMelhorPeso().
 * @return
 */
int achaMelhorPeso()
{
    // definir dados
    int best = -1;
    int pos = 0;

    for(int weight = 1; weight <= 50; weight++)
    {
        if(t[maximumWeight][weight].value > best)
        {
            best = t[maximumWeight][weight].value;
            pos = weight;
        }// end if
    }// end for

    return pos;
}// end achaMelhorPeso()


/**
 * Metodo mostraResposta().
 * @param packs
 * @param maximumWeight
 * @param resposta
 */
void mostraResposta(int packs, int maximumWeight, stc resposta)
{
    cout << "Peso: " << packs << " kg\n";
    cout << "sobra(m) " << maximumWeight - resposta.packs << " pacote(s)\n\n";
}// end mostraResposta()


int main() 
{
    // definir dados
    int n;

    // le caso de testes
    cin >> n;

    for(int i = 0; i < n; i++)
    {
        qtdPacks = 0;

        cin >> maximumWeight;

        int weight[maximumWeight + 1]; 
	    weight[0] = 0;
        
	    int value[maximumWeight  + 1]; 
	    value[0]  = 0;

        for(int i = 1; i <= maximumWeight; i++) 
        {
            cin >> value[i] >> weight[i];
        }// end for

        stc resposta = mochila(weight, value, maximumWeight, 50);

        cout << resposta.value << " brinquedos\n";

        int packs = achaMelhorPeso();

        mostraResposta(packs, maximumWeight, resposta);
    }// end for
}// end main()