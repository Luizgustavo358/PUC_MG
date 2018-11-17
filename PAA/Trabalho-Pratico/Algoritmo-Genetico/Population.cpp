#ifndef _Population_CPP
#define _Population_CPP

#include "bibliotecas/Population.h"

using namespace std;

Population::Population(int populationSize, vector<City*> cities)
{
    for(int i = 0; i < populationSize; i++)
    {
        routes.push_back(new Route(cities));
    }// fim for
}// fim construtor


vector<Route*> Population::getRoutes()
{
    return this->routes;
}// fim getRoutes()


/**
 * Compara se uma rota e' melhor que outra para a ordenacao.
 * @param route1
 * @param route2
 * @return true or false
 */
bool compare(Route* route1, Route* route2)
{
    return(route1->getFitness() > route2->getFitness());
}// fim compare()


/**
 * Mostra uma populacao na tela.
 */
void Population::show()
{
    int numberRoutes = getRoutes().size();
    vector<Route*> routes = getRoutes();

    // para cada rota
    for(int x = 0; x < numberRoutes; x++)
    {
        cout << routes.at(x)->toCharPointer() << " |  " << routes.at(x)->getFitness() << "   | " << routes.at(x)->calculateTotalDistance();
    }// fim for
}// fim show()


void Population::sortRoutesByFitness()
{
    // ordenar usando mergeSort usando a funcao compare como comparador
    sort(routes.begin(), routes.end(), compare);
}// fim sortRoutesByFitness()

#endif