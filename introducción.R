# Bienvenidos al electivo Introducción al análisis de datos en R para Antropología
# Profesor Cristian Baeza Torres
# Segundo semestre, cuarto año mención Física 

# Esto es un comentario
#¿Como instalar un paquete?
install.packages("tidyverse")

#llamamos un paquete a nuestro entorno
library(tidyverse)
library(HistData)

# nuestro entorno o directorio de trabajo
getwd()
ls()
list.files()

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

## Estructuras de datos ####

# vector: Contienen datos del mismo tipo, son atomicos, no se pueden mezclar lo datos que posee
vector_1 <- c(1, 2, 3, 4, 5)
is.vector(vector_1)
length(vector_1)

vector_2 <- c("humero", "radio", "ulna", "femur", "tibia", "fibula")
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
#  desde x a y :
vector_4 <- 1:20
vector_4

#dimensiones
dim(vector_4) # no tiene
# largo
length(vector_4) # 20
dim(vector_4) <- c(4,5)

vector_4


#  Matriz y Dataframe
class(vector_4)
attributes(vector_4)

# La diferencia es que una matriz guarda el mismo tipo de datos
# mientras que el dataframe guarda diversos tipos de datos

matrix_1 <- vector_4
matrix_1
?matrix

# creamos una matriz
matrix_2 <- matrix(1:20, nrow=4, ncol = 5)
matrix_2

identical(matrix_1, matrix_2)

# ahora que seria un dataframe...
alumnos <-c( "uno", "dos", "tres", "cuatro")
df_1 <- cbind(alumnos, matrix_1)
df_1
class(df_1)

df_2 <- data.frame(alumnos, matrix_1)
df_2
class(df_2)
# vemos que es otra clase, un dataframe
nombres <- c("alumno", "nota_1", "nota_2", "nota_3", "promedio", "examen")
colnames(df_2)
colnames(df_2)<- nombres
colnames(df_2)
df_2
class(df_2$alumno)
class(df_2$nota_1)
df_2$alumno
alumno <- df_2$alumno
alumno

# Bases de datos #####
# bases de datos en paquetes
library(datasets)
data(iris)
View(iris)
summary(iris)
str(iris)
str(iris$Sepal.Length)
nrow(iris)

# estadisticos 
help("mean")
help("stats")
help(package = "stats")
mean(iris$Sepal.Length)
median(iris$Sepal.Length)
quantile(iris$Sepal.Length)
density(iris$Sepal.Length)
c(iris$Sepal.Length)
summary(iris$Sepal.Length)

# ahora como guardamos una base de datos?
write.csv(iris, file= "iris.csv")

# otras formas de instalar paquetes
install.packages("devtools")
devtools::install_github("geanes/bioanth")
library(bioanth)
bioanth::goldman
View(goldman)
write.csv(goldman, file = "goldman.csv")

library(HistData)
data("GaltonFamilies")
galton <- GaltonFamilies
View(galton)
write.csv(galton, file = "galton.csv")


###