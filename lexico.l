/*******DEFINICIONES********/

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sintactico.tab.h"

%}

minuscula [a-z]
mayuscula [A-Z]
numero [0-9]
simbolo [=*-_.@&]
linea [\n]
invalido [!#$,/\:ˆ(){}’";%+?<>‘∼º¿¡áéíóúñÑ]

%%

 /**********REGLAS**********/

{minuscula} { yylval.carcter = yytext; return MIN;};
{mayuscula} { cant_mayus++; yylval.caracter = yytext; return MAY;};
{numero} { yylval.caracter = yytext; return NUM;};
{simbolo} { yylval.caracter = yytext; return SIM;};
{linea} {return END;}
{invalido} { yylval.caracter = yytext; return ERROR1;};

%%
 /**********FUNCIONES DEFINIDAS POR EL USUARIO**********/
