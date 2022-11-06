### Wilcoxon test en R
library(tidyverse)
library(RcmdrMisc)
library(rstatix)
library(descr)
cuenca_inf<- Cuenca_media_inferior_
cuenca_sup<- Cuenca_media_superior
cuenca_inf$Cuenca
cuenca_sup$Estatura

cuenca_inf <- cuenca_inf %>% mutate(Cuenca = "inferior")
cuenca_sup <- cuenca_sup %>% mutate(Cuenca = "superior")
cuenca_inf$Cuenca
cuencas <- rbind(cuenca_inf, cuenca_sup)
cuencas
cuencas1<- rbind(c_inf_test,cuenca_sup )
summary(cuencas)

# Quitar la variable ...7
cuencas <- select(cuencas,  -"...7") # eliminamos la variable que sobró
cuencas
# Quitar la variable ...7
cuencas1 <- select(cuencas1,  -"...7") 
cuencas1


# Boxplot
boxplot(data = cuencas, Estatura~Cuenca,
        xlab = "Cuenca",
        main = "Estatura por cuencas")
# vimos un caso extremo de un metro..
cuencas$Estatura[which.min(cuencas$Estatura)]
# Veamos en orden creciente 
arrange(cuencas, Estatura)
# Distribución de ambas ignorando aquel caso extremo
boxplot(data = cuencas, Estatura~Cuenca,
        ylim = c(130, 180),
        xlab = "Cuenca",
        main = "Estatura por cuencas")


ggplot(cuencas, aes(x = Cuenca, y = Estatura))+
  stat_boxplot(geom = "errorbar", width = 0.2)+
  geom_boxplot()+
  scale_y_continuous(breaks = c(110, 120, 130, 140, 150, 160, 170, 180))+
stat_summary(fun = "mean", geom = "point", shape = 23, size = 3, fill = "red")+
  theme_bw()+
  ggtitle("Estatura por Cuenca")


## experimento.. distribución de cuenca inferior:
c_inf_test<- slice(cuenca_inf, -1)
c_inf_test
boxplot(data= c_inf_test, Estatura~Cuenca)

# desde ahora trabajamos con cuenca1, debido que esta no tiene el caso extremo.

## un tip: La linea del mdio de las cajas es la mediana, es decir, la mitad a nivel de distribución,
## el punto rojo, por otra parte, corresponde a la media (mean), 
## si la media es igual a la mediana, es probable una distribución normal.

ggplot(cuencas1, aes(x = Cuenca, y = Estatura))+
  stat_boxplot(geom = "errorbar", width = 0.2)+
  geom_boxplot()+
  scale_y_continuous(breaks = c(140, 145, 150, 155, 160, 165, 170))+
  stat_summary(fun = "mean", geom = "point", shape = 23, size = 3, fill = "red")+
  theme_bw()+
  ggtitle("Estatura por Cuenca")

## ver distribución con histograma y curva de densidad
# histogramas
hist(cuencas1$Estatura) # en general (ambas cuencas)
hist(c_inf_test$Estatura) # cuenca inferior
hist(cuenca_sup$Estatura) # cuenca superior

## density plots
plot(density(cuencas1$Estatura)) # en general (ambas cuencas)
plot(density(c_inf_test$Estatura))  # cuenca inferior
plot(density(cuenca_sup$Estatura)) # cuenca superior

## Ahora usando ggplot2

ggplot(cuencas1, aes(x = Estatura, y = ..density..))+
  geom_histogram(fill = "grey", colour = "grey60", size = .1, bins = 18) +
  geom_density() +
  theme_bw()+
  ggtitle("Estatura por Cuenca")

ggplot(c_inf_test, aes(x = Estatura, y = ..density..))+
  geom_histogram(fill = "grey", colour = "grey60", size = 0.1, bins = 18) +
  geom_density() +
  theme_bw()+
  ggtitle("Estatura de Cuenca inferior")

ggplot(cuenca_sup, aes(x = Estatura, y = ..density..))+
  geom_histogram(fill = "grey", colour = "grey60", bins = 18) +
  geom_density() +
  theme_bw()+
  ggtitle("Estatura de Cuenca superior")


# Ambas en dos facetas

  ggplot( cuencas1, aes(Estatura, ..density..)) +
  geom_histogram(binwidth = 1.5, color="black") +
    geom_density() +
    theme_bw()+
    ggtitle("Estatura de Cuencas")+
  facet_grid(cuencas1$Cuenca~.)

  
# Ahora por sexo
  
  ggplot( cuencas1, aes(Estatura, ..density..)) +
    geom_histogram(binwidth = 1.5, color="black") +
    geom_density() +
    theme_bw()+
    ggtitle("Estatura de Cuencas")+
    facet_grid(cuencas1$Sexo~.) 
  
  # cuenca inferior por sexo

  ggplot( c_inf_test, aes(Estatura, ..density..)) +
    geom_histogram(binwidth = 1.5, color="black") +
    geom_density() +
    theme_bw()+
    ggtitle("Estatura de Cuencas")+
    facet_grid(c_inf_test$Sexo~.)   
  
  # cuenca superior por sexo
  ggplot( cuenca_sup, aes(Estatura, ..density..)) +
    geom_histogram(binwidth = 1.5, color="black") +
    geom_density() +
    theme_bw()+
    ggtitle("Estatura de Cuencas")+
    facet_grid(cuenca_sup$Sexo~.)   
  
numSummary(cuencas1$Estatura, 
           statistics=c("mean", "sd", "quantiles", "skewness", "kurtosis", "n")
           , type=c("1"))
numSummary(c_inf_test$Estatura, 
           statistics=c("mean", "sd", "quantiles", "skewness", "kurtosis", "n")
           , type=c("1"))
numSummary(cuenca_sup$Estatura, 
           statistics=c("mean", "sd", "quantiles", "skewness", "kurtosis", "n")
           , type=c("1"))

# En este caso vamos a aplicar test de Wilcoxon, en realidad seria el de "Mann-Whitney"
# la diferencia esta en que wilcoxon es para una muestra pareada y Mann-Whitney para dos muestras.
glimpse(cuenca_sup$Estatura) # 41 observaciones
glimpse(c_inf_test$Estatura) # 31 observaciones

male <- cuencas1 %>% filter(Sexo == "M")
female <- cuencas1 %>% filter(Sexo == "F")
male_s<- male %>% filter(Cuenca == "superior")
male_i<- male %>% filter(Cuenca == "inferior") 
female_s<- female %>% filter(Cuenca == "superior")
female_i<- female %>% filter(Cuenca == "inferior")

## por cuenca
wilcox.test(cuenca_sup$Estatura, c_inf_test$Estatura,
            exact = FALSE, correct = FALSE)


## por sexo y cuenca
# masculinos
wilcox.test(male_s$Estatura, male_i$Estatura, 
            exact = FALSE, correct = FALSE)
# femeninos
wilcox.test(female_s$Estatura, female_i$Estatura, 
            exact = FALSE, correct = FALSE)


# Ahora de manera resumida
wilcox.test(Estatura~Cuenca, data = cuencas1, exact = FALSE)
# vemos que no hay significante y se acepta la hipotesis nula, no existe una gran diferencia 
# asociada a la estatura entre las cuencas

#Ahora usando el paquete rstatix podemos tener este resultado en tabla:
cuencas_u <- cuencas1 %>%
  wilcox_test(Estatura~Cuenca, paired = FALSE, exact = FALSE) %>%
  print()

# Test de Kruskall Wallis
kruskal.test(Estatura ~ Cuenca, data = cuencas1)
## El test de Kruskall Wallis tampoco encuentra una diferencia significante entre 
## las medianas de los grupos

?wilcox.test


