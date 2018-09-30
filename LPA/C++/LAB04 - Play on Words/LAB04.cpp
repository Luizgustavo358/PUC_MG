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
using namespace std;


/**
 * Metodo leValor().
 * @return result.
 */
int leValor()
{
    // definir dados
    int result;

    // lendo do teclado
    cin >> result;

    return(result);
}// end leValor()


/**
 * Metodo leString().
 * @return str
 */
string leString()
{
    // definir dados
    string str;

    // lendo do teclado
    cin >> str;

    return(str);
}// end leString()


/**
 * Metodo letrasIguais().
 * @param str
 * @param i
 * @return isEqual
 */
bool letrasIguais(string str[100], int i)
{
    // definir dados
    bool isEqual = true;

    // verifica se e' falso
    if((str[i].at(str[i].size()-1) != str[i+1].at(0)))
    {
        isEqual = false;
    }// end if

    return(isEqual);
}// end letrasIguais()


/**
 * Metodo pegaLetra().
 * @param str
 * @param i
 * @param p
 * @return letra
 */
char pegaLetra(string str[100], int i, int p)
{
    // definir dados
    char letra;

    // pega letra em determinada posicao
    letra = str[i].at(p);

    return letra;
}// end pegaLetra()


/**
 * Metodo compara().
 * @param prim
 * @param ult
 */
bool compara(int p, string str[100])
{
    // definir dados
    bool igual = true;

    // primeiro e ultimo caracter
    char prim, ult;

    for(int i = 0; i < str->size()-1; i++, p++)
    {
        // testa se e' par
        if((i % 2 == 0) && (str[p+1] != ""))
        {
            // pega ultima
            ult = pegaLetra(str, p, (int)str[p].size()-1);

            // pega primeira letra
            prim = pegaLetra(str, p+1, 0);
        }
        else
        {
            // pega ultima
            ult = pegaLetra(str, p, (int)str[p].size()-1);

            // pega primeira letra
            prim = pegaLetra(str, p, 0);
        }// end if

        // verifica se a ultima e primeira letra sao diferentes
        if(prim != ult)
        {
            igual = false;
        }// end if
    }// end for

    return igual;
}// end compara()


/**
 * Metodo main().
 * @return
 */
int main()
{
    // definir dados
    int t;           // quanto valores lidos   / Test Cases
    int n;           // quantas palavras lidas / Plates
    int i, j;        // variaveis de controle
    int p;           // variavel auxiliar do array
    bool igual = true;
    string str[100]; // array de strings

    // lendo o valor de T
    t = leValor();

    for(i = 0; i < t; i++)
    {
        // lendo quantidade de palavras
        n = leValor();

        // lendo as strings
        for(j = 0; j < n; j++)
        {
            // lendo string
            str[j] = leString();
        }// end for

        // volta pra posicao 0 do array
        p = 0;

        // verifica se tem mais de duas strings
        if(str->size() >= 2)
        {
            // comparando strings
            igual = compara(p, str);
        }
        else
        {
            cout << "The door cannot be opened." << endl;
        }// end if

        // letras iguais
        if(igual)
        {
            cout << "Ordering is possible." << endl;
        }
        else
        {
            cout << "The door cannot be opened." << endl;
        }// end if
    }// end for
}// end main()