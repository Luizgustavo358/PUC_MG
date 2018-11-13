#include <iostream>
using namespace std;

class Retangulo
{
    int lado1, lado2;

    public:
        void set_values(int, int);
        
        int area()
        {
            return lado1 * lado2;
        }
};

void Retangulo::set_values(int x, int y)
{
    lado1 = x;
    lado2 = y;
}

int main()
{
    int lado1, lado2;
    Retangulo retangulo;
    
    cout << "Largura do retangulo = ";
    cin >> lado1;

    cout << "Altura do retangulo = ";
    cin >> lado2;

    retangulo.set_values(lado1, lado2);

    cout << "Area do Retangulo = " << retangulo.area() << endl;

    return 0;
}
