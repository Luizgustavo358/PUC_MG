#ifndef _GeneticAlgorithm_CPP
#define _GeneticAlgorithm_CPP

#include "bibliotecas/GeneticAlgorithm.h"

using namespace std;

void set(int x, vector<Route*> routes, Route* novo)
{
    // iterator para andar no vetor
    vector<Route*>::iterator it;

    // anda para a posicao x
    it = routes.begin() + x;

    // apaga a posicao x
    routes.erase(it);

    // anda de novo para a posicao x
    it = routes.begin() + x;

    // adiciona nova rota
    routes.insert(it, novo);
}// fim set()

void set(int x, vector<City*> cities, City* novo)
{
    // iterator para andar no vetor
    vector<City*>::iterator it;

    // anda para a posicao x
    it = cities.begin() + x;

    // apaga a posica x
    cities.erase(it);

    // anda de novo para a posicao x
    it = cities.begin() + x;

    // adiciona a nova rota
    cities.insert(it, novo);
}// fim set()

/**
 * Gera um numero aleatorio entre 0 e 9.
 * @return random
 */
int gerarAleatorio()
{
    // definir dados
    int random;

    // gera uma seed aleatoria
    srand(time(NULL));

    // gera numero aleatorio
    random = rand() % 10;

    return random;
}// fim gerarAleatorio()

/**
 * Verifica se uma cidade existe no vetor.
 * @param cities
 * @param city
 * @return
 */
bool contains(vector<City*> cities, City* city)
{
    // definir dados
    int i;

    if(city == NULL)
    {
        for(i = 0; i < cities.size(); i++)
        {
            if(cities.at(i) == NULL)
            {
                return true;
            }// fim if
        }// fim for
    } else {
        for(i = 0; i < cities.size(); i++)
        {
            if((cities.at(i) != NULL) && (cities.at(i)->equals(city)))
            {
                return true;
            }// fim if
        }// fim for
    }// fim if
    return false;
}// fim contains()

int indexOf(City* city, vector<City*> cities)
{
    for(int x = 0; x < cities.size(); x++)
    {
        if(contains(cities, city))
        {
            return x;
        }// fim if
    }// fim for
    return -1;
}// fim indexOf()


GeneticAlgorithm::GeneticAlgorithm(vector<City*> initialRouteP)
{
    // copia do vetor initialRouteP para o vetor initalRoute
    initialRoute.reserve(initialRouteP.size());

    copy(initialRouteP.begin(), initialRouteP.end(), back_inserter(initialRoute));
}// fim contrutor


Population* GeneticAlgorithm::crossoverPopulation(Population* population)
{
    // definir dados
    int x;
    // criando uma nova populacao
    Population* crossoverPopulation = new Population(population->getRoutes().size(), getInitialRoute());

    for(x = 0; x < NUMB_OF_ELITE_ROUTE; x++)
    {
        set(x, crossoverPopulation->getRoutes(), population->getRoutes().at(x));
    }// fim for

    for(x = NUMB_OF_ELITE_ROUTE; x < crossoverPopulation->getRoutes().size(); x++)
    {
        Route* route1 = selectTournamentPopulation(population)->getRoutes().at(0);

        Route* route2 = selectTournamentPopulation(population)->getRoutes().at(0);

        set(x, crossoverPopulation->getRoutes(), crossoverRoute(route1, route2));
    }// fim for
    return crossoverPopulation;
}// fim crossoverPopulation()


Route* GeneticAlgorithm::crossoverRoute(Route* route1, Route* route2)
{
    // definir dados
    int x;

    Route* crossoverRoute = new Route(getInitialRoute().size());
    Route* tempRoute1 = route1;
    Route* tempRoute2 = route2;

    if(gerarAleatorio() < 5)
    {
        tempRoute1 = route2;
        tempRoute2 = route1;
    }// fim if

    for(x = 0; x < crossoverRoute->getCities().size()/2; x++)
    {
        set(x, crossoverRoute->getCities(), tempRoute1->getCities().at(x));
    }// fim for

    return fillNullsInCrossoverRoute(crossoverRoute, tempRoute2);
}// fim crossoverRoute()


Population* GeneticAlgorithm::evolve(Population* population)
{
    Population* pop = crossoverPopulation(population);

    return mutatePopulation(pop);
}// fim evolve()


Route* GeneticAlgorithm::fillNullsInCrossoverRoute(Route* crossoverRoute, Route* route)
{
    // definir dados
    int x, y;
    int sizeRoute = route->getCities().size();

    for(x = 0; x < sizeRoute; x++)
    {
        City* cityX = crossoverRoute->getCities().at(x);

        if(!contains(crossoverRoute->getCities(), cityX))
        {
            for(y = 0; y < sizeRoute; y++)
            {
                if(crossoverRoute->getCities().at(y) == NULL)
                {
                    set(y, crossoverRoute->getCities(), cityX);
                    break;
                }// fim if
            }// fim for
        }// fim if
    }// fim for

    return crossoverRoute;
}// fim fillNullsInCrossoverRoute()


vector<City*> GeneticAlgorithm::getInitialRoute()
{
    return this->initialRoute;
}// fim getInitialRoute()


Population* GeneticAlgorithm::mutatePopulation(Population* population)
{
    // definir dados
    int x;

    for(x = NUMB_OF_ELITE_ROUTE; x < population->getRoutes().size(); x++)
    {
        mutateRoute(population->getRoutes().at(x));
    }// fim for

    return population;
}// fim mutatePopulation()


Route* GeneticAlgorithm::mutateRoute(Route* route)
{
    // definir dados
    int x, y;

    int sizeRoute = route->getCities().size();

    for(x = 0; x < sizeRoute; x++)
    {
        City* cityX = route->getCities().at(x);

        if(gerarAleatorio() < MUTATION_RATE)
        {
            y = (int)(route->getCities().size() * (gerarAleatorio()/10.0));

            City* cityY = route->getCities().at(y);

            set(indexOf(cityX, route->getCities()), route->getCities(), cityY);

            set(y, route->getCities(), cityX);
        }// fim if
    }// fim for

    return route;
}// fim mutateRoute()


Population* GeneticAlgorithm::selectTournamentPopulation(Population* population)
{
    // definir dados
    int x;

    Population* tournamentPopulation = new Population(TOURNAMENT_SELECTION_SIZE, getInitialRoute());

    for(x = 0; x < TOURNAMENT_SELECTION_SIZE; x++)
    {
        set(x, tournamentPopulation->getRoutes(), population->getRoutes().at((int)((gerarAleatorio()/10.0) * population->getRoutes().size())));
    }// fim for

    tournamentPopulation->sortRoutesByFitness();

    return tournamentPopulation;
}// fim selectTournamentPopulation()

#endif