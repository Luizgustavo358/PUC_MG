#include <iostream>
using namespace std;

int main()
{
    int t1 = 0;
    int t2 = 1;
    int nextTerm = 0;
    int n;

    cout << "Entre com um numero positivo = ";

    cin >> n;

    cout << "Serie Fibonacci: " << t1 << ", " << t2 << ", ";

    nextTerm = t1 + t2;

    while(nextTerm <= n)
    {
        cout << nextTerm << ", ";

        t1 = t2;

        t2 = nextTerm;

        nextTerm = t1 + t2;
    }// end while
    cout << "\n";
}// end main()
