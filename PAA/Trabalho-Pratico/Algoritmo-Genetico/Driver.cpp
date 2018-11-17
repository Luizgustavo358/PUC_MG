#ifndef _Driver_CPP
#define _Driver_CPP

#include <stdio.h>
#include <string>

#include "bibliotecas/GeneticAlgorithm.h"
#include "bibliotecas/City.h"

vector<City*> initialRoute;

using namespace std;

void printHeading(int generationNumber)
{
    // definir dados
    int x;
    int cityNamesLength = 0;
    string headingColumn1 = "Rota";
    string remainingHeadingColumns = "Eficiencia | Distancia (em KM)";

    cout << "> Geracao # " << generationNumber << endl;

    for(x = 0; x < initialRoute.size(); x++)
    {
        cityNamesLength += initialRoute.at(x)->getNome().length();
    }// fim for

    int arrayLength = cityNamesLength + initialRoute.size()*2;
    int partialLength = (arrayLength - headingColumn1.length())/2;

    for(x = 0; x < partialLength-4; x++)
    {
        cout << " ";
    }// fim for

    cout << headingColumn1.c_str();

    for(x = 0; x < partialLength-4; x++)
    {
        cout << " ";
    }// fim for

    cout << " | " << remainingHeadingColumns.c_str();

    cityNamesLength += remainingHeadingColumns.length() + 3;

    for(x = 0; x < cityNamesLength + initialRoute.size()*2; x++)
    {
        cout << "-";
    }// fim for

    cout << endl;
}// fim printHeading()

void leGrafo()
{
    // definir dados
    int i, x, y;
    int nCidades;

    cin >> nCidades;

    for(i = 0; i < nCidades; i++)
    {
        cin >> x; // coordenada X
        cin >> y; // coordenada Y

        string nome = "";
        nome += (char)(i+65);

        initialRoute.push_back(new City(nome, x, y));
    }// fim for
}// fim leGrafo()

int main()
{
    srand(time(NULL));

    leGrafo();

    Population *population = new Population(POPULATION_SIZE, initialRoute);
    population->sortRoutesByFitness();

    GeneticAlgorithm *geneticAlgorithm = new GeneticAlgorithm(initialRoute);

    int generationNumber = 0;

    generationNumber++;

    while(generationNumber < NUMB_OF_GENERATIONS)
    {
        generationNumber++;

        population = geneticAlgorithm->evolve(population);
    }// fim while

    cout << population->getRoutes().at(0)->calculateTotalDistance() << endl;
    cout << population->getRoutes().at(0)->toCharPointer() << endl;
}// fim main()

#endif