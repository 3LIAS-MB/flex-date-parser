# Validador de Fechas en FLEX

## 📋 Descripción

Analizador léxico desarrollado en FLEX (Fast Lexical Analyzer Generator) para validar fechas en formato `DD/MM/YYYY`. El programa no solo reconoce el formato correcto, sino que también aplica reglas del calendario para determinar si una fecha es válida, incluyendo la detección de años bisiestos.

## 🎯 Objetivos

### Objetivo General

Desarrollar un programa en FLEX capaz de analizar, validar y clasificar fechas ingresadas por el usuario, proporcionando retroalimentación específica sobre la validez de cada fecha.

### Objetivos Específicos

- ✅ Reconocer fechas que cumplan con el formato `DD/MM/YYYY`
- ✅ Validar estructura (2 dígitos para día, 2 para mes, 4 para año)
- ✅ Verificar rangos válidos (día: 01-31, mes: 01-12)
- ✅ Aplicar reglas del calendario según cada mes
- ✅ Detectar años bisiestos correctamente
- ✅ Proporcionar mensajes de error específicos

## 🚀 Características

- **Validación de formato:** Verifica que la fecha siga estrictamente el patrón DD/MM/YYYY
- **Validación de rangos:** Comprueba que días y meses estén dentro de valores válidos
- **Reglas de calendario:** Aplica correctamente los días de cada mes (28, 29, 30 o 31)
- **Años bisiestos:** Implementa la lógica completa para determinar años bisiestos
- **Mensajes descriptivos:** Indica el motivo específico del error cuando la fecha es inválida

## 📦 Requisitos

- **FLEX** (Fast Lexical Analyzer Generator)
- **GCC** (GNU Compiler Collection)
- Sistema operativo Linux/Unix o Windows con herramientas GNU

## 🔧 Instalación

### En Linux/Ubuntu:

```bash
sudo apt-get update
sudo apt-get install flex
sudo apt-get install gcc
```

### En Windows:

- Instalar MinGW o usar WSL (Windows Subsystem for Linux)

## 💻 Compilación y Ejecución

### 1. Generar el código C desde FLEX:

```bash
flex analex.l
```

### 2. Compilar el código generado:

```bash
gcc lex.yy.c -o validador -lfl
```

### 3. Ejecutar el programa:

```bash
./validador
```

### 4. Ingresar fechas para validar:

El programa esperará que ingreses fechas. Escribe una fecha y presiona Enter.

## 📝 Ejemplos de Uso

### Entrada y Salidas Esperadas:

| Entrada      | Salida                                            |
| ------------ | ------------------------------------------------- |
| `29/02/2024` | ✅ Fecha válida (año bisiesto)                    |
| `31/04/2022` | ❌ Error: abril tiene 30 días                     |
| `40/10/2023` | ❌ Error: día fuera de rango                      |
| `12-10-2022` | ❌ Error: formato inválido                        |
| `15/13/2023` | ❌ Error: mes inválido                            |
| `29/02/2023` | ❌ Error: febrero tiene 28 días (año no bisiesto) |

## 📂 Estructura del Proyecto

```
proyecto-flex-fechas/
├── analex.l          # Archivo fuente FLEX
├── README.md         # Este archivo
├── ejemplos.txt      # Archivo con casos de prueba
└── informe.pdf       # Informe técnico del proyecto
```

## 🧮 Lógica de Años Bisiestos

Un año es bisiesto si cumple:

- Es divisible por 4 **Y**
- (No es divisible por 100 **O** es divisible por 400)

### Ejemplos:

- ✅ 2024: divisible por 4 → **BISIESTO**
- ❌ 2023: no divisible por 4 → **NO BISIESTO**
- ❌ 1900: divisible por 100 pero no por 400 → **NO BISIESTO**
- ✅ 2000: divisible por 400 → **BISIESTO**

## 🛠️ Tecnologías

- **FLEX:** Generador de analizadores léxicos
- **C:** Lenguaje de programación de salida
- **GCC:** Compilador de GNU

## 📄 Licencia

Este proyecto es de uso académico.

