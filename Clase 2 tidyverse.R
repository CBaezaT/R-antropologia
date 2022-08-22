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



