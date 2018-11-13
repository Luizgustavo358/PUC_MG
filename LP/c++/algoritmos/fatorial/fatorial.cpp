#include <iostream>
using namespace std;

float fatorial(int x)
{
    if(x == 0 || x ==  1)
    {
        return 1;
    }
    else
    {
        return (x * fatorial(x-1));
    }// end if
}// end fatorial()

int main()
{
    // declarando variavel
    int x;
    
    // escrevendo na tela
    cout << "X = ";

    // lendo do teclado
    cin >> x;

    // mostrando o fatorial do numero
    cout << "Fatorial de X = " << fatorial(x) << endl;

    return 0;
}// end main()
