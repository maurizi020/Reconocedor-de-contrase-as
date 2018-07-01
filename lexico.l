/*******DEFINICIONES********/

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sintactico.tab.h>

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

{minuscula} { cant_min++; yyval = cant_min; return MIN;};
{mayuscula} { cant_mayus++; yyval = cant_mayus; return MAY;};
{numero} { cant_num++; yyval = cant_num; return NUM;};
{simbolo} { cant_simb++; yyval = cant_simb; return SIM;};
{linea} { printf("\n"); return FIN; };
{invalido} { cant_inva++; yyval = cant_inva; return ERROR1;};
{minuscula}{4} { if( comprobar(yytext) ){ return ERRROR2; } else{cant_min = cant_min + 4; return MIN;} };
{numero}{4} { if( comprobar(yytext) ){ return ERRROR2; } else{cant_num = cant_num + 4; return NUM;} };
.   {printf("ERROR caracteres no validos");};

%%
 /**********FUNCIONES DEFINIDAS POR EL USUARIO**********/
int comprobar(char *c)
{
    char cadena[4];
    cadena = c;
    band = 1;
    int i;

    for(i = 0; i < 3; i++)
    {
        if(cadena[i] != cadena[i+1])
        {
            band = 0;
        }
    }

    return band;
}