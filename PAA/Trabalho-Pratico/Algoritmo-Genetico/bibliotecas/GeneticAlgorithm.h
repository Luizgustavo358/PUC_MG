#ifndef _GeneticAlgorithm_H
#define _GeneticAlgorithm_H

#ifndef CONS_GENETIC
#define MUTATION_RATE 2
#define TOURNAMENT_SELECTION_SIZE 3
#define POPULATION_SIZE 8
#define NUMB_OF_ELITE_ROUTE 1
#define NUMB_OF_GENERATIONS 30
#endif

#include <vector>
#include <stdlib.h>
#include <time.h>
#include <iostream>

#include "City.h"
#include "Route.h"
#include "Population.h"

class GeneticAlgorithm
{
    private:
        vector<City*> initialRoute;

    public:
        GeneticAlgorithm(vector<City*>);

        Population* crossoverPopulation(Population*);
        Route* crossoverRoute(Route*, Route*);
        Population* evolve(Population*);
        Route* fillNullsInCrossoverRoute(Route*, Route*);
        vector<City*> getInitialRoute();
        Population* mutatePopulation(Population*);
        Route* mutateRoute(Route*);
        Population* selectTournamentPopulation(Population*);
};// fim class GeneticAlgorithm

#endif