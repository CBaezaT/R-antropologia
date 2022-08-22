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


