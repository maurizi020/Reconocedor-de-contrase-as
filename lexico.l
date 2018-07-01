/*******DEFINICIONES********/

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sintactico.tab.h"

void comprobar(char *c);

int cant_min = 0;
int cant_mayus = 0;
int cant_num = 0;
int cant_simb = 0;
int cant_inva = 0;
%}

minuscula [a-z]
mayuscula [A-Z]
numero [0-9]
simbolo [=*-_.@&]
linea [\n]
invalido [^{{minuscula}{mayuscula}{numero}{simbolo}{linea}\t" "}]

%%

 /**********REGLAS**********/

{minuscula} { cant_min++; yylval = cant_min; return MIN;};
{mayuscula} { cant_mayus++; yylval = cant_mayus; return MAY;};
{numero} { cant_num++; yylval = cant_num; return NUM;};
{simbolo} { cant_simb++; yylval = cant_simb; return SIM;};
{linea} { printf("\n");};
{invalido} { cant_inva++; yylval = cant_inva; return ERROR1;};
{minuscula}{4} { comprobar(yytext); };
{numero}{4} { comprobar(yytext); };
.   {printf("ERROR caracteres no validos");};

%%
 /**********FUNCIONES DEFINIDAS POR EL USUARIO**********/
void comprobar(char *c)
{
    int i,bandera;
    bandera = 1;
    char *cadena,*aux;

    for(cadena = c; cadena < cadena + 4; cadena++)
    {
        aux = cadena+1;
        if(*cadena != *aux)
        {
            bandera = 0;
        }
    }
    if(bandera)
    {
        printf("no pueden estar mas de 3 veces el mismo numero o letra juntos\n");
    }
}