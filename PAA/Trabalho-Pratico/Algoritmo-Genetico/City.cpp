#ifndef _City_CPP
#define _City_CPP

#include "bibliotecas/City.h"

using namespace std;

City::City()
{
    this->nome = "";
    this->latitude = -1;
    this->longitude = -1;
}// fim construtor

City::City(string nomeP, double latitudeP, double longitudeP)
{
    this->nome = nomeP;
    this->latitude = latitudeP;
    this->longitude = longitudeP;
}// fim construtor

bool City::equals(City* city)
{
    return((nome.compare(city->nome) == 0) &&
           (latitude == city->latitude)    &&
           (longitude == city->longitude));
}// fim equals()

string City::getNome()
{
    return this->nome;
}// fim getNome()

double City::getLatitude()
{
    return this->latitude;
}// fim getLatitude()

double City::getLongitude()
{
    return this->longitude;
}// fim getLongitude()

string City::toString()
{
    return this->nome;
}// fim toString()

char* City::toCharPointer()
{
    char* resp = new char[this->nome.length()+1];

    strcpy(resp, this->nome.c_str());

    return resp;
}// fim toCharPointer()

/**
 * Medir a distancia entre 2 vertices,
 * usando a distancia euclidiana
 */
double City:: measureDistance(City* city)
{
    double deltaX = (city->getLatitude() - getLatitude());
    double deltaY = (city->getLongitude() - getLongitude());

    double x = pow(deltaX, 2);
    double y = pow(deltaY, 2);

    return sqrt(x+y);
}// fim measureDistance()

#endif