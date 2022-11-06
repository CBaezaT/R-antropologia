## Regresión linear
# En esta clase veremos de una manera aplicada como funciona un modelo de regresión lineal
# Veremos donde obtenemos los datos y como los seleccionamos
# Como pasamos desde un modelo teorico a un modelo matematico basado en medidas reales o simuladas.
# Aplicaremos un modelo de regresión linear basico en R, veremos como sacamos sus estadisticos y como lo aplicariamos en un dato nuevo.

# Paquetes a utilizar
library(tidyverse)
library(lahman)
library(broom)
library(HistData)

# usaremos nuestra anterior base de datos de Galton, que convertimos sus medidas en cm.*
# Usaremos medidas estandarizadas siempre!