%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
void calcular_nomina(void);

float salario_base = 0;
float horas_trabajadas = 0;
float tasa_impuestos = 0;
float deducciones = 0;
%}

%union {
    float fval;
}

%token <fval> NUMBER
%token SALARIO_BASE HORAS_TRABAJADAS TASA_IMPUESTOS DEDUCCIONES CALCULAR
%token PLUS MINUS MULTIPLY DIVIDE
%token EOL

%%

input:
    /* vacío */
    | input line
    ;

line:
    setting EOL { printf("Configuración actualizada\n"); }
    | CALCULAR EOL { calcular_nomina(); }
    ;

setting:
    SALARIO_BASE NUMBER { salario_base = $2; }
    | HORAS_TRABAJADAS NUMBER { horas_trabajadas = $2; }
    | TASA_IMPUESTOS NUMBER { tasa_impuestos = $2; }
    | DEDUCCIONES NUMBER { deducciones = $2; }
    ;

%%

void calcular_nomina(void) {
    float salario_bruto = salario_base * horas_trabajadas;
    float impuestos = salario_bruto * tasa_impuestos / 100; // Asegúrate de que la tasa de impuestos se maneje como porcentaje
    float salario_neto = salario_bruto - impuestos - deducciones;
    printf("Salario Bruto: %.2f\n", salario_bruto);
    printf("Impuestos: %.2f\n", impuestos);
    printf("Deducciones: %.2f\n", deducciones);
    printf("Salario Neto: %.2f\n", salario_neto);
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    return yyparse();
}

