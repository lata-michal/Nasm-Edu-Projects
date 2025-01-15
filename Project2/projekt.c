#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <stdlib.h>

extern float logarithm2(float x);

int main()
{
    bool isRunning = true;
    char input[256];
    char *endPtr;
    float var;
    float res;
    int decimalPlaces;

    while(isRunning)
    {
        printf("Podaj liczbe z ktorej chcesz policzyc logarytm o podstawie 2. Wpisz q i kliknij ENTER, zeby zakonczyc program. \n");
        if(fgets(input, sizeof(input), stdin) == NULL)
        {
            printf("Niepoprawne dane wejsciowe! \n");
            continue;
        }

        input[strcspn(input, "\n")] = '\0';
        if(strcmp(input, "q") == 0)
        {
            isRunning = false;
            printf("Program zakonczony! \n");
            continue;
        }

        var  = strtof(input, &endPtr);
        if(*endPtr != '\0')
        {
            printf("Niepoprawne dane wejsciowe! \n");
            continue;
        } 
        if(var <= 0)
        {
            printf("Nie istnieje logarytm o podstawie 2 dla podanej liczby! \n");
            continue;
        }

        printf("Podaj liczbe miejsc po przecinku, do ktorej ma byc zaokraglony wynik. \n");
        if(fgets(input, sizeof(input), stdin) == NULL)
        {
            printf("Niepoprawne dane wejsciowe! \n");
            continue;
        }

        input[strcspn(input, "\n")] = '\0';
        decimalPlaces = strtol(input, &endPtr, 10);
        if(*endPtr != '\0' || decimalPlaces < 0 || decimalPlaces > 99)
        {
            printf("Niepoprawne dane wejsciowe! \n");
            continue;
        }

        res = logarithm2(var);
        printf("Logarytm o podstawie 2 z tej liczby wynosi: %.*f \n", decimalPlaces, res);

    }
    return 0;
}