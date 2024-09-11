%{
#include "parser.tab.h"
%}

%option noyywrap

%%

"salario_base"      { return SALARIO_BASE; }
"horas_trabajadas"  { return HORAS_TRABAJADAS; }
"tasa_impuestos"    { return TASA_IMPUESTOS; }
"deducciones"       { return DEDUCCIONES; }
"calcular"          { return CALCULAR; }
[0-9]+              { yylval.fval = atof(yytext); return NUMBER; }
"+"                 { return PLUS; }
"-"                 { return MINUS; }
"*"                 { return MULTIPLY; }
"/"                 { return DIVIDE; }
\n                  { return EOL; }
[ \t]               { /* ignorar espacios y tabulaciones */ }
.                   { printf("Carácter no reconocido: %s\n", yytext); }

%%  