# Clase 3 Parte 1: trabajando con datos

# vimos en la clase anterior algunas funciones de tidyverse, el día de hoy las aplicaremos

library(tidyverse)
#leemos el archivo  galton del paquete HistData
library(HistData)
help("HistData") # ¿Qué es el paquete HistData?
data("GaltonFamilies")
galton <- GaltonFamilies
class(galton) # es un dataframe
view(galton) 
# convertiremos galton en tibble
galton <- as_tibble(galton)
class(galton) # ahora es un dataframe

view(galton)
glimpse(galton)
summary(galton)
galton$gender

# Ahora haremos algunos cambios a nuestro dataset, algunos tips.
# Recomiendo mantener el lenguaje en ingles en los datasets
# Las traducciones estan bien para las tablas y los graficos
# Usaremos conversiones y medidas estandarizadas

# en este caso, ¿qué problemas vemos en galton?

##### Primeros cambios ####

# Primero utiliza el termino gender, cambiemoslo por sex 
galton <- galton %>% rename(sex = gender)
galton

# Ahora, sabemos que las medidas estan en pulgadas..
# sabemos tambien que midparentHeight es calculado como (father + 1.08*mother)/2

# una pulgada es igual a 2.54 cm

# transformemos las variables en cm

# father
galton <- mutate(galton, father = round(father*2.54, digits = 2))

# podemos ver que usamos la función round dentro, para redondear a 2 digitos
view(galton_2)

#mother
galton <- mutate(galton, mother = round(mother*2.54, digits = 2))

#midparentHeight
galton <- mutate(galton, midparentHeight = round(midparentHeight*2.54, digits = 2))

#childHeight
galton <- mutate(galton, childHeight = round(childHeight*2.54, digits = 2))



