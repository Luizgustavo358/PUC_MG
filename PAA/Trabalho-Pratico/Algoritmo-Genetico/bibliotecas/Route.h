#ifndef _ROUTE_H
#define _ROUTE_H

#include <vector>
#include <string.h>
#include <ctime>
#include <cstdlib>
#include <algorithm>

#include "City.h"

using namespace std;

class Route
{
    private:
        bool isFitnessChanged;
        double fitness;
        vector<City*> cities;

    public:
        // construtor
        Route(int);
        Route(vector<City*>);

        double calculateTotalDistance();
        vector<City*> getCities();
        double getFitness();
        char* toCharPointer();
        string toString();
}; // fim class Route

#endif // _ROUTE_H
