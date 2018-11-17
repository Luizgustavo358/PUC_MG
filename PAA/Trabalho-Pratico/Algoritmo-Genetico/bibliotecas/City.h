#ifndef _CITY_H
#define _CITY_H

#include <iostream>
#include <string.h>
#include <math.h>

using namespace std;

class City
{
    private:
        double latitude;
        double longitude;
        string nome;

    public:
        // construtor
        City();
        City(string, double, double);

        // gets
        double getLatitude();
        double getLongitude();
        string getNome();

        bool equals(City*);
        double measureDistance(City*);
        char* toCharPointer();
        string toString();
};// fim class City

#endif //PAA_CITY_H
