# Bienvenidos al electivo Introducción al análisis de datos en R para Antropología
# Profesor Cristian Baeza Torres
# Segundo semestre, cuarto año mención Física 

# Esto es un comentario


# Cuando hablamos de un objeto, es cualquier cosa que podamos manipular en R
hola <- "Hola Mundo" # creamos un objeto llamado Hola que contiene el texto "Hola Mundo"
hola 

# En R existen diversos tipos de datos que podemos usar 

1   # numeros enteros // integer
1.3 # numerico // numeric o float
"uno" # cadena de texto // character
uno # factor
TRUE # lógico // logical boolean
NA # perdido // NA
NULL # vacio // null

2022-09-13 # fecha // date

# podemos saber que tipo es con el comando class()

class(1)
class(1.3)
class("uno")


# R nos permite hacer calculos aritméticos
 4 + 3 # suma
 4 - 3 # resta
 4 * 3 # multiplicación
 4 / 3 # división
 4^3 # potencia 
 4 %% 3 # división entera

# Operadores relacionales
 4 < 3 # menor que
 4 <= 3 # menor o igual 
 4 > 3 # mayor que
 4 >= 3 # mayor o igual
 4 == 3 # igual
 4 != 3 # no es igual, distinto de
   
 
 # Operaciones de asignación
   
estatura <- 1.73
estatura
estatura<- 1.72
estatura

## Estructuras de datos

# vector: Contienen datos del mismo tipo, son atomicos, no se pueden mezclar lo datos que posee
vector_1 <- c(1, 2, 3, 4, 5)
is.vector(vector_1)
length(vector_1)

vector_2 <- c("humero", "randio", "ulna", "femur", "tibia", "fibula")
is.vector(vector_2)
length(vector_2)


# podemos hacer operaciones con los vectores
v_3 <- c(1, 2, 3)
v_4<- c(4, 5, 6)

vector_3 <- c(v_3, v_4) # unir dos vectores
vector_3 <- v_3 + v_4 # suma de vectores
vector_3 <- v_3 - v_4 # resta de vectores
# resultado
vector_3



