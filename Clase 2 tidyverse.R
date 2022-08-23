# Introducción al manejo de datos
# en la clase pasada instalamos un paquete llamado "Tidyverse"
# Este es en realidad un conjunto de paquetes, quizá los más utilizados en R
install.packages("tidyverse") # recordar, siempre al instalar usar comillas dobles

# ahora lo llamaremos
library(tidyverse) # ahora sin comillas

# Tidyverse contiene:
# dplyr: manejo de bases de datos
# ggplot2: elaboración de gráficos
# tibble: nueva forma de entender las bases de datos
# readr: leer diversos archivos de bases de datos
# purr: mejoramiento en la forma de desarrollar con funciones
#stingr: trabajo con strings, cadenas de texto
#forcats: trabajo con factores

# este paquete nos entrega todas las herramientas necesarias para realizar nuestro trabajo

# ahora... ¿Qué diferencia un data.frame a un tibble?

# un tible es una forma de almacenar bases de datos:
help("tibble-package")
# hace una revisión estricta, es decir, no cambia los datos automaticamente
# el tibble vendria ser en realidad S3 tbl_df, un caso especial de un dataframe
# que soluciona los problemas comunes de trabajo con dataframes

# caracteristicas principales:
# no utiliza rownames (nombres de fila)

vignette("invariants")

a<- tibble(c(1,2,3,4,5))
a<- tibble( 1,2,3,4,5)
a <- c(1,2,3,4,5)
a<-as_tibble(a)
a
is.data.frame(a)

# entonces iris...
iris
str(iris)
iris_t <- as_tibble(iris)
iris_t
str(iris_t)
?str()

# entonces si queremos manejar y transformar bases de datos (data wrangling & data transformation )
# el paquete dplyr y tidyr son nuestras herramientas:

iris_t
glimpse(iris_t) # lo mismo que str  
?glimpse()
view(iris_t) # se dan cuenta que ya no es necesario usar View() con mayuscula?

arrange(iris_t,Sepal.Length ) # cambiar orden ascendente desde Sepal.Length
iris_t
arrange(iris_t,desc(Sepal.Length )) # cambiar orden descendente desde Sepal.Length
iris_t
# Si revisan despues de aplicar la función, iris_t no cambia...
# esto es porque debemos guardas el cambio, y eso se hace..
iris_arrange<- arrange(iris_t,Sepal.Length )
iris_arrange

# subset... dividir nuestro dataset según las filas o casos

# filtrar por...
filter(iris_t, Species == "setosa")

# distintas de...
distinct(iris_t, Species) # o

# manteniendo las demas columnas...
distinct(iris_t, Sepal.Width, .keep_all = TRUE)

# cortando segun posición, util sobre todo si tenemos ordenado nuestro dataset

slice(iris_t, 10:15) # del 10 al 15

slice_sample(iris_t, n = 10) # corta 10 muestras al azar

# corta las 25% muestras con Sepal.Length más bajo
slice_min(iris_t, Sepal.Length, prop = 0.25)

# corta las 25% muestras con Sepal.Length más alto
slice_max(iris_t, Sepal.Length, prop = 0.25)

#corta la cabeza (primeros casos) según el n que pongamos 
slice_head(iris_t, n=5)
# es lo mismo que 
head(iris_t)

# lo mismo con el tail (cola), es decir los ultimos casos
slice_tail(iris_t, n=5)
tail(iris_t)


# seleccionando casos al azar

# por fracción de la muestra
sample_frac(iris_t, 0.5, replace = TRUE) # 0.5 de la muestra total

# por numero de muestras
sample_n(iris_t, 10, replace = TRUE) # 10 muestras al azar




# y según sus columnas..

select(iris_t, Sepal.Width, Petal.Length, Species)

select(iris_t, contains("."))
#Selecciona columnas en que su nombre contiene un character string 

select(iris_t, ends_with("Length"))
#Selecciona columnas que su nombre termine en 

select(iris_t, everything()) # Selecciona todas las columnas 

select(iris_t, matches(".t."))
#selecciona columnas que su nombre coincida con una expresión 

select(iris, num_range("x", 1:5)) #selecciona columnas con nombres  x1, x2, x3, x4, x5.

select(iris_t, one_of(c("Species", "Genus")))
#Selecciona columnas que sus nombres esten en ese grupo de nombres 

select(iris_t, starts_with("Sepal"))
#selecciona columnas que sus nombres empiecen con Sepal 

select(iris_t, Sepal.Length:Petal.Width)
#selecciona todas las columnas entre Sepal.Length y Petal.Width 

select(iris_t, -Species)
#selecciona todas las columnas excepto Species 


# como vector

pull(iris_t, Species) 



# comando summarise... resumiendo información
iris_t

summarise(iris_t, mean( Sepal.Width), mean(Sepal.Length))

summarise(iris_t,across(everything(), mean))
summarise(iris_t, quantile(Sepal.Width), mean (Sepal.Width) )
summarise



# mutar... crear nuevas variables o cambiar las existentes

mutate( iris_t ,across(c(Sepal.Length, Sepal.Width), round))

mutate(iris_t, across(c(1, 2), round))

mutate(iris_t, sl_x_sw = Sepal.Length*Sepal.Width )

# trasmute hace lo mismo pero solo mantiene la variable nueva
transmute(iris_t, sl_x_sw = Sepal.Length*Sepal.Width )

summarise

# pero como aplicamos más de una función a la vez?
# Tidyverse y dplyr aprovecha el uso del pipe o pipa.. %>% 
# %>% control + shift + M 
# %>% cmd + shift + M

# por ejemplo quiero saber las medias de cada especie de iris y su cantidad..

iris_t %>% group_by(Species) %>% summarise(mean = mean(Sepal.Width), n=n())


iris_t %>% group_by(Species) %>% summarise(mean = mean(Sepal.Width), n=n())

setosa <- iris_t %>% filter(Species == "setosa") %>% summarise(mean = mean(Sepal.Width), n=n())
setosa


# rename nos permite cambiar el nombre de una columna o variable
library(readr)
galton <- read_csv("bases de datos/galton.csv")
View(galton)

galton <- galton %>% rename(sex = gender)
galton

write.csv(galton, file = "bases de datos/galton.csv")

# se actualiza el archivo anterior 



galton %>% group_by(family) %>% count(sex)
           




set.seed(1989, sample.kind = "Rounding")
female_heights<- galton %>% filter(sex =="female") %>%  group_by(family) %>% sample_n(1) %>% 
  ungroup() %>% select(mother, childHeight) %>% rename(daughter = childHeight)
female_heights



