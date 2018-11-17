#ifndef _Route_CPP
#define _Route_CPP

#include "bibliotecas/Route.h"

// random generator function:
int myrandom(int i)
{
    return rand()%i;
}// fim myrandom()


Route::Route(int geneticAlgorithmSize)
{
    for(int i = 0; i < geneticAlgorithmSize; i++)
    {
        cities.push_back( NULL );
    }// fim for
}// fim contrutor


Route::Route(vector<City*> citiesP)
{
    this->isFitnessChanged = true;
    this->fitness = 0.0;

    // copia do vetor citiesP para o vetor cities
    cities.reserve(citiesP.size());
    copy(citiesP.begin(),citiesP.end(),back_inserter(cities));

    // devo fazer um shuffle aqui, embaralhar o vector de Rotas
    // ****** SHUFFLE ******

    // seed aleatoria para o random
    random_shuffle ( cities.begin(), cities.end(), myrandom );
    // ****** FIM SHUFFLE ******
}// fim construtor


/**
  * Calcula a distancia de um caminho
  */
double Route::calculateTotalDistance()
{
    int citiesSize = this->cities.size();

    double sum = 0;

    for(int x = 0; x < citiesSize; x++)
    {
        int cityIndex = x;

        if(cityIndex < citiesSize - 1)
        {
            sum += cities.at(x)->measureDistance(cities.at(cityIndex + 1));
        }// fim if
    }// fim for

    sum += cities.at(0)->measureDistance(cities.at(citiesSize-1));

    return sum;
}// fim calculateTotalDistance()


double Route::getFitness()
{
    if(isFitnessChanged)
    {
        fitness = (1.0/calculateTotalDistance())*10000;
        isFitnessChanged = false;
    }// fim if

    return this->fitness;
}// fim getFitness()


vector<City*> Route::getCities()
{
    return this->cities;
}// fim getCities()


string Route::toString()
{
    string toStr = "";

    for(int i = 0; i < this->cities.size(); i++)
    {
        toStr += cities.at(i)->toString()+" ";
    }// fim for

    return toStr;
}// fim toString()


/**
  * Conversao do 'toString'( string ), para char*
  */
char* Route::toCharPointer()
{
    char *resp = new char[toString().length() + 1];

    strcpy( resp, toString().c_str() );

    return resp;
}// fim toCharPointer()

#endif
