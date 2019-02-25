/**
 * @materia LPA
 * @professor Felipe
 * @author Luiz Gustavo Braganca dos Santos
 */

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

class Brinquedo
{
	public:
		// definir dados
		int D, P, div;

		/**
		 * Construtor.
		 * @param D
		 * @param P
		 */
		Brinquedo(int D, int P)
		{
			this->D = D;
			this->P = P;
			div = (double)P / D;
		}// end
};


/**
 * Metodo comparacao().
 * @param x
 * @param y
 * @return
 */
bool comparacao(Brinquedo const & x, Brinquedo const & y)
{
	return x.div > y.div;
}// comparacao()


/**
 * Metodo mostraResultado().
 * @param h
 * @param pontuacao_total
 */
void mostraResultado(int h, int pontuacao_total)
{
	cout << "Instancia " << h << endl;
	cout << pontuacao_total << "\n\n";
}// end mostraResultado()


int main()
{
	// definir dados
	int n, t, d, p, i;
	int aux_tempo_total;
	int pontuacao_total;
	int tempo_total;
	int h = 1;

	// lendo dados
	cin >> n;
	cin >> t;

	while(n != 0)
	{
		vector<Brinquedo> brinquedos;

		for(int j = 0; j < n; j++)
		{
			cin >> d;
			cin >> p;

			Brinquedo brinquedo(d, p);
			brinquedos.push_back(brinquedo);
		}// end for

		sort(brinquedos.begin(), brinquedos.end(), comparacao);

		pontuacao_total = 0;
		tempo_total = 0;

		i = 0;

		while(i < n)
		{
			aux_tempo_total = tempo_total + brinquedos[i].D;

			if(aux_tempo_total <= t)
			{
				pontuacao_total += brinquedos[i].P;
				tempo_total = aux_tempo_total;
			}
			else
			{
				i++;
			}// end if
		}// end while

		mostraResultado(h++, pontuacao_total);

		// lendo dados
		cin >> n;
		cin >> t;
	}// end while

	return 0;
}// end main