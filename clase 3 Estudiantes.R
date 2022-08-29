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

# vemos como nos quedo...
view(galton)


# Ahora... ¿qué podemos sacar de esta información? 
# ¿Qué se les ocurre al ver las variables?
resumen_galton <- summary(galton) # guardamos como objeto
resumen_galton

# ahora, si queremos saber como se dispersan los datos de la media..

# calculamos desviación estandar 
sd(galton$father)


# Queremos crear una tabla para despues ponerla en un informe
resumen_fathers<-summary(galton$father) 
resumen_fathers

# estas serian los nombres
names(resumen_fathers)
# estas serian las medidas
as.numeric(resumen_fathers)
# ahora los unimos en un dataframe usando rbind para que cada valor este en una columna
tab_1 <- as.data.frame(rbind( as.numeric(resumen_fathers)))
colnames(tab_1) <- names(resumen_fathers) # cambiamos los colnames a los estadisticos
tab_1 # vemos como quedo

# ahora.. como creamos una tabla de todos?
# primero creamos un vector de las variables que ocuparemos..
var_resumen <-c("father", "mother", "childHeight")

res_mother <- summary(galton$mother) # summary de galton$mother como objeto
res_childs <- summary(galton$childHeight) # summary de galton$childHeight como objeto
tab_1 <- rbind(tab_1, as.numeric(res_mother), as.numeric(res_childs)) # unir los summary de las variables
tab_1<-round(tab_1, digits = 2) # redondear decimales a 2
tab_1 <- cbind(var_resumen, tab_1)
tab_1

# y lo podemos guardar en csv..
write_csv(tab_1, file = "estadisticos  galton.csv") 

### ###


# veremos la distribución de las alturas de manera gráfica...

g <- galton

# R base nos permite realizar gráficos, en este caso usaremos histogramas para ver la distribución y su  media
# padres
hist(g$father, main = "Padres", breaks = 30)
abline(v=mean(g$father), col=2, lwd=2)

hist(g$childHeight[g$sex=="male"], main = "Hijos", breaks = 30)
abline(v=mean(g$childHeight[g$sex=="male"]), col=2, lwd=2)

hist(c(g$childHeight[g$sex=="male"],g$father), main = "Padres e Hijos", breaks = 30)
abline(v=mean(c(g$childHeight[g$sex=="male"],g$father)), col=2, lwd=2)



# otros más... ####
# madres
hist(g$mother, main = "Madres", breaks = 30)
abline(v=mean(g$mother), col=2, lwd=2)

hist(g$childHeight[g$sex=="female"], main = "Hijas", breaks = 30)
abline(v=mean(g$childHeight[g$sex=="female"]), col=2,lwd=2)




hist(c(g$childHeight[g$sex=="female"],g$mother), main = "Madres e hijas", breaks = 30)
abline(v=mean(c(g$childHeight[g$sex=="female"],g$mother)), col=2, lwd=2)

#####




# todo el dataset
# configuramos la salida de graficos para tener 4 al mismo tiempo
par(mfrow=c(2,2)) # 2 graficos hacia abajo y dos hacia la izquierda
hist(g$father)
hist(g$mother)
hist(g$midparentHeight)
hist(g$childHeight)

# Gráficos de barra

# con la función plot
plot(g$sex, main = "Gráfico de barras sexo",
     xlab = "Sexo", ylab = "Frecuencia")

# con la función barplot
barplot(table(g$sex),main = "Gráfico de barras sexo",
        xlab = "Sexo", ylab = "Frecuencia")


# grafico de caja y bigote (boxplot)
par(mfrow=c(1,1)) # volvemos a dejar 1 solo gráfico de salida
# padres
boxplot(g$father,  main = "Gráfico de cajas Padres",
        xlab = "Padres", ylab = "Altura")

# distribuciones de hijos

boxplot(g$childHeight ~ g$sex,
        main = "Distribución hijos por sexo",
        xlab = "Sexo", ylab = "Altura")

# madres
# ??



# Ahora de todo el dataset...

boxplot( g$father,  g$mother,
         names = c("Padres", "Madres"),
         main = "Boxplot Alturas Padres y Madres",
         ylab= "Altura")


# Gráficos basicos...
# usaremos el dataset US Murders
library(dslabs)
data(murders)
summary(murders)
view(murders)
## Scatterplot
# Relación entre población y total de asesinatos
x <- murders$population / 10^6 # por 1 millón
y <- murders$total
plot(x, y)

# tambien puede ser 
with(murders, plot(population, total))

# e incluso...

plot(murders$population, murders$total)



# Histogramas
# muy utiles para describir la distribución de los datos númericos..
x <- with(murders, total / population * 100000)
hist(x)
# o tambien...

hist( murders$total/murders$population * 100000, 
      main = " Tasa de Asesinatos en EEUU ", # es el titulo, por cada 100000 habitantes
      xlab = "", # xlab es la etiqueta del eje X, "" lo deja vacio 
      ylab = "Tasa")  # ylab es la etiqueta de tasa

# vemos que sobresale
murders$state[which.max(x)]


#  boxplot
# tambien nos ayudan a ver distribuciones y comparaciones entre categorias..

# creamos la variable rate (tasa de asesinatos cada 100000 habitantes)
murders$rate <- with(murders, total / population * 100000) # rate es tasa

boxplot(rate~region, data = murders) # tasa por región de estados

# tambien podria ser...
boxplot(murders$rate~murders$region,
        xlab = "región",
        ylab = "Tasa",
        main = "Asesinatos EEUU")
# vemos que en el sur hay dos casos extremos, conocidos como outliers




# Ahora.. actividad! ####

summary(murders)
class(murders)
murders<- tibble(murders)
# crea la variable population_in_millions que contenga la población en millones


# resultado #####


population_in_millions <- murders$population/10^6
murders$population_in_millions <-  murders$population/10^6
murders <- murders %>% mutate(population_in_millions = population/10^6)




# Crea un histograma con la variable population_in_millions #####

# resultado #####

x <- with(murders,  population / 1000000)
x <- population_in_millions
hist(x)

hist(population_in_millions)

hist(murders$population_in_millions)

hist(with(murders, population_in_millions))

with(murders, hist(population_in_millions))





##### seguimos #####



# Recordar, hay varias formas de obtener un mismo resultado en R

# recordamos con el scatterplot vimos la relación entre asesinatos y población en millones
population_in_millions <- murders$population_in_millions # población en millones
total_gun_murders <- murders$total  # asesinatos totales

plot(population_in_millions, total_gun_murders) # scatterplot

# Vemos que existe una relación fuerte entre cantidad de población y asesinatos en los estados
# ¿Qué tan clara es?

# sabemos que hay estados con población menor a 5 millones de habitantes, entonces...

# transformamos ambas variables en escala logaritmica, usando la transformación en log10
# Esto solo con el fin de OBSERVACIÓN del comportamiento de ambas variables.
t_g_m <- log10(murders$total) 
p_i_m <- log10(murders$population_in_millions)

plot(p_i_m, t_g_m)


# Actividad

# Ahora usando dplyr filtra los estados que tengan población menor a 5 millones


# pistas: usar funciones de dplyr, cada observación es un estado

# resultado 



# Ahora, crea un grafico scatterplot entre population_in_millions y total
plot(m_m$population_in_millions, m_m$total)

# crea un histograma de rate


# crea un boxplot de rate y region



# calcula el los estadisticos basicos con summary 
# crea un objeto llamado tab_2 que contenga las variables "population", "total", "rate"
# Basate en el ejemplo de la clase!!



# luego ordenalas en orden decreciente y selecciona solo las 5 muestras (Estados) con mayor población
# crea un subset con esa selección




# Crea un grafico de barras o barplot de rate x estado 

barplot()