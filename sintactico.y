/**********DEFINICIONES DE C**********/

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex(void);
extern char yytext[];
void yyerror(char *s);
void valida();

char cadena[30] = {'\0'};
int indice = 0;
int band_1 = 1;

%}

 /**********DEFINICIONES DE BISON*********/
%union{
 char cad;
}
%token<cad> MIN MAY NUM SIM ERROR1
%start inicio

 /**********REGLAS*********/

%%

inicio:
| clave {   valida(cadena);  memset(cadena,'\0',29); indice = 0;} inicio

clave: MIN clave {cadena[indice] = $1; inidice++;}
|
    MAY clave {cadena[indice] = $1; inidice++;}
|
    NUM clave {cadena[indice] = $1; inidice++;}
|
    SIM clave {cadena[indice] = $1; inidice++;}
|
    ERROR1 clave {cadena[indice] = $1; inidice++;}
|
    END {}
;

%%

/**********FUNIONES ADICIONALES*********/

void valida()
{

}

void yyerror(char *s)
{
  printf("%s esto es un error ni idea de cuando ocurre\n", s);
}

int main()
{
  if (yyparse())
    fprintf(stderr, "Successful parsing.\n");
  else
    fprintf(stderr, "error found.\n");
} 
