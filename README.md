# NominaLexYacc


## Casos de Uso

1. Input

salario_base FLOAT,

horas_trabajadas FLOAT,

tasa_impuestos FLOAT,

Deducciones FLOAT

Calcular (Aparecen el total de Salario Bruto, Impuestos, Deducciones y Salario Neto)


2. Formulas

float salario_bruto = salario_base * horas_trabajadas;

float impuestos = salario_bruto * tasa_impuestos / 100; 

float salario_neto = salario_bruto - impuestos - deducciones;


3. Ejemplo

```cmd
salario_base 50

Configuración actualizada

horas_trabajadas 160

Configuración actualizada

tasa_impuestos 0.15

Configuración actualizada

deducciones 200

Configuración actualizada

calcular

Salario Bruto: 8000.00
Impuestos: 1200.00
Deducciones: 200.00
Salario Neto: 6600.00

```