#!/usr/bin/env bash

g++ -o main *.cpp
for j in {3..13};
do
    echo "$j";

    for i in {11..30};
    do
        for k in {1..$j};
        do
            echo "$j $i";
        done
    done
    echo -e "\n";
done
