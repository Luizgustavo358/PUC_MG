#ifndef _POPULATION_H
#define _POPULATION_H

#include <vector>
#include <algorithm>
#include <iostream>

#include "Route.h"

class Population
{
    private:
        vector<Route*> routes;

    public:
        Population(int, vector<City*>);

        vector<Route*> getRoutes();
        void show();
        void sortRoutesByFitness();
}; // fim class Population

#endif // _POPULATION_H
