/**********DEFINICIONES DE C**********/

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex(void);
extern char yytext[];
void yyerror(char *s);
void valida();

int cant_min_y = 0;
int cant_mayus_y = 0;
int cant_num_y = 0;
int cant_simb_y = 0;
int cant_inva_y = 0;
int band_1 = 1;

%}

 /**********DEFINICIONES DE BISON*********/

%token MIN
%token MAY
%token NUM
%token SIM
%token ERROR1
%start clave

 /**********REGLAS*********/

%%

clave: MIN clave { cant_min_y = $1;}
|
    MAY clave {cant_mayus_y = $1;}
|
    NUM clave {cant_num_y = $1;}
|
    SIM clave {cant_simb_y = $1;}
|
    ERROR1 clave {cant_inva_y = $1;}
|
    '\n' {valida();}
;

%%

/**********FUNIONES ADICIONALES*********/

void valida()
{
    int total;

    total = cant_min_y + cant_num_y + cant_simb_y + cant_mayus_y;
    if(total > 15)
    {
        printf("la contraseña no puede ser mayor a 15 caracteres\n");
        band_1 = 0;
    }
    if(cant_inva_y)
    {
        printf("la contraseña no puede tener simbolos que no sean =,&,-,_,.,*\n");
        band_1 = 0;
    }
    if(total < 8)
    {
        printf("la contraseña no puede ser menor a 8 caracteres\n");
        band_1 = 0;
    }
    if(!cant_min_y)
    {
        printf("la contraseña tiene que tener al menos una letra minuscula\n");
        band_1 = 0;
    }
    if(!cant_num_y)
    {
        printf("la contraseña tiene que tener al menos un numero\n");
        band_1 = 0;
    }
    if(!cant_simb_y)
    {
        printf("la contraseña tiene que tener al menos uno de los siguientes simbolos: =,&,-,_,.,*\n ");
        band_1 = 0;
    }
    if(!cant_mayus_y)
    {
        printf("la contraseña tiene que tener al menos una letra mayuscula\n");
        band_1 = 0;
    }
    if(band_1)
    {
        printf("contraseña aceptada\n");
    }
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