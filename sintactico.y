/**********Definiciones**********/

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int cant_min = 0;
int cant_mayus = 0;
int cant_num = 0;
int cant_simb = 0;
int cant_inva = 0;
int band = 1;

%}

%token MIN
%token MAY
%token NUM
%token SIM
%token ERROR1
%token ERROR2
%token FIN
%start inicio

%%


inicio: FIN
|
    clave FIN {valida();};

clave: MIN clave { cant_min = $1;}
|
    MAY clave {cant_mayus = $1;}
|
    NUM clave {cant_num = $1;}
|
    SIM clave {cant_simb = $1;}
|
    ERROR1 clave {cant_inva = $1;}
|
    ERROR2 clave {printf("no pueden estar mas de 3 veces el mismo numero o letra juntos\n");}
;

%%

void valida()
{
    int total;

    total = cant_min + cant_num + cant_simb + cant_mayus;
    if(total > 15)
    {
        printf("la contraseña no puede ser mayor a 15 caracteres\n");
        band = 0;
    }
    if(cant_inva)
    {
        printf("la contraseña no puede tener simbolos que no sean =,&,-,_,.,*\n");
        band = 0;
    }
    if(total < 8)
    {
        printf("la contraseña no puede ser menor a 8 caracteres\n");
        band = 0;
    }
    if(!cant_min)
    {
        printf("la contraseña tiene que tener al menos una letra minuscula\n");
        band = 0;
    }
    if(!cant_num)
    {
        printf("la contraseña tiene que tener al menos un numero\n");
        band = 0;
    }
    if(!cant_simb)
    {
        printf("la contraseña tiene que tener al menos uno de los siguientes simbolos: =,&,-,_,.,*\n ");
        band = 0;
    }
    if(!cant_mayus)
    {
        printf("la contraseña tiene que tener al menos una letra mayuscula\n");
        band = 0;
    }
    if(band)
    {
        printf("contraseña aceptada\n");
    }
}

