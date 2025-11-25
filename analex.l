%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// Función para verificar si un año es bisiesto
bool es_bisiesto(int anio) {
    return (anio % 400 == 0) || (anio % 4 == 0 && anio % 100 != 0);
}

// Función para obtener días del mes
int dias_del_mes(int mes, int anio) {
    int dias[] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    if (mes == 2 && es_bisiesto(anio)) {
        return 29;
    }
    return dias[mes];
}

// Función para validar fecha completa
void validar_fecha(char *fecha) {
    int dia, mes, anio;
    const char* nombres_mes[] = {
        "", "enero", "febrero", "marzo", "abril", "mayo", "junio",
        "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"
    };
    
    // Extraer día, mes y año
    sscanf(fecha, "%d/%d/%d", &dia, &mes, &anio);
    
    // Validar mes
    if (mes < 1 || mes > 12) {
        printf("Entrada: %s  INVALIDA - Motivo: mes invalido (debe estar entre 01 y 12).\n", fecha);
        return;
    }
    
    // Validar día en rango básico
    if (dia < 1) {
        printf("Entrada: %s  INVALIDA - Motivo: dia invalido (debe ser mayor a 0).\n", fecha);
        return;
    }
    
    if (dia > 31) {
        printf("Entrada: %s  INVALIDA - Motivo: dia invalido (ningun mes tiene mas de 31 dias).\n", fecha);
        return;
    }
    
    // Validar día según el mes
    int max_dias = dias_del_mes(mes, anio);
    if (dia > max_dias) {
        if (mes == 2 && dia == 29) {
            printf("Entrada: %s  INVALIDA - Motivo: el anio %d no es bisiesto (febrero solo tiene 28 dias).\n", fecha, anio);
        } else if (mes == 2) {
            printf("Entrada: %s  INVALIDA - Motivo: febrero solo tiene %d dias en el anio %d.\n", fecha, max_dias, anio);
        } else {
            printf("Entrada: %s  INVALIDA - Motivo: %s solo tiene %d dias.\n", fecha, nombres_mes[mes], max_dias);
        }
        return;
    }
    
    // Fecha válida
    if (mes == 2 && dia == 29 && es_bisiesto(anio)) {
        printf("Entrada: %s  VALIDA (anio bisiesto - febrero tiene 29 dias).\n", fecha);
    } else {
        printf("Entrada: %s  VALIDA.\n", fecha);
    }
}
%}

DIGITO      [0-9]
DIA_PATRON  {DIGITO}{DIGITO}
MES_PATRON  {DIGITO}{DIGITO}
ANIO_PATRON {DIGITO}{DIGITO}{DIGITO}{DIGITO}
PATRON_FECHA    {DIA_PATRON}"/"{MES_PATRON}"/"{ANIO_PATRON}

%%

{PATRON_FECHA}              { validar_fecha(yytext); }
[0-9]+[-/][0-9]+[-/][0-9]+  { printf("Entrada: %s  INVALIDA - Motivo: formato incorrecto (use DD/MM/YYYY con dos digitos para dia y mes, cuatro para anio).\n", yytext); }
[ \t\n]+                    { }
.                           { printf("Entrada: %s  INVALIDA - Motivo: caracter no reconocido o formato incorrecto.\n", yytext); }

<<EOF>>                     { return 0; }

%%

int yywrap() {
    return 1;
}

int main(void) {
    printf("Ingrese fechas linea por linea en formato DD/MM/YYYY (Ctrl+D para terminar):\n");
    yylex();
    return 0;
}

// Compilación:
// flex validador_fechas.l
// gcc lex.yy.c -o validador_fecha
// ./validador_fecha