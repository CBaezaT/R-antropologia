# Golems: no parametricos
library(tidyverse)
# Chi cuadrado y test de fisher
# Caso: comparación de presencia de Hiperostosis porotica 
# en poblaciónes coetaneas del horizonte medio



# Caso 1

### H0 = no hay asociación de HP en coyo 3 y jujuy MH
### H1 = Existe asociación de HP en coyo 3 y jujuy MH
conhp<-c(12, 4)
Nanl<-c(22, 11)
cuadro1<-data.frame(conhp, Nanl)
row.names(cuadro1)<-c("Coyo 3", "Jujuy")
cuadro1
### Ya creada la tabla y nombrada aplicamos chi2
chisq.test(cuadro1)
### Revisamos n esperados
chisq.test(cuadro1)$expected
### valor esperado menor que 5, se aplica fisher y luego chi2 simulado
fisher.test(cuadro1)
chisq.test(cuadro1, simulate.p.value = T)

# En este caso se acepta la hipótesis nula y se rechaza la hipótesis alternativa,
# ya que ambas poblaciones presentan independencia clara.



# Caso 2

### H0 = no hay asociación de HP en coyo 3 y Peru FMNH MH
### H1 = Existe asociación de HP en coyo 3 y Peru FMNH MH
conhp2<-c(12, 13)
Nanl2<-c(22, 47)
cuadro2<-data.frame(conhp2, Nanl2)
row.names(cuadro2)<-c("Coyo 3", "FMNH HM")
cuadro2
### Ya creada la tabla y nombrada aplicamos chi2
chisq.test(cuadro2)
### Revisamos n esperados
chisq.test(cuadro2)$expected
### valor esperado menor que 5, se aplica fisher y luego chi2 simulado
fisher.test(cuadro2)
chisq.test(cuadro2, simulate.p.value = T)

# En este caso se acepta la hipótesis nula y se rechaza la hipótesis alternativa,
# ya que ambas poblaciones presentan una leve independencia.

# Caso 3

### H0 = no hay asociación de HP en Jujuy y Peru FMNH MH
### H1 = Existe asociación de HP en Jujuy y Peru FMNH MH
conhp3<-c(4, 13)
Nanl3<-c(11, 47)
cuadro3<-data.frame(conhp3, Nanl3)
row.names(cuadro3)<-c("Jujuy", "FMNH HM")
cuadro3
### Ya creada la tabla y nombrada aplicamos chi2
chisq.test(cuadro3)
### Revisamos n esperados
chisq.test(cuadro3)$expected
### valor esperado menor que 5, se aplica fisher y luego chi2 simulado
fisher.test(cuadro3)
chisq.test(cuadro3, simulate.p.value = T)

# En este caso se acepta la hipótesis nula y se rechaza la hipótesis alternativa,
# ya que ambas poblaciones presentan independencia.




# Caso 4

### H0 = no hay asociación de HP en infantes en Coyo 3 y Peru FMNH MH
### H1 = Existe asociación de HP en infantes en  Coyo 3 y Peru FMNH MH
conhp4<-c(4, 5)
Nanl4<-c(22, 47)
cuadro4<-data.frame(conhp4, Nanl4)
row.names(cuadro4)<-c("infantes coyo 3", "infantes FMNH HM")
cuadro4
### Revisamos n esperados
chisq.test(cuadro4)$expected
### valor esperado menor que 5, se aplica fisher y luego chi2 simulado
fisher.test(cuadro4)
chisq.test(cuadro4, simulate.p.value = T)


#  En este caso se acepta la hipótesis nula y se rechaza la hipótesis alternativa,
# ya que ambas poblaciones presentan independencia.



# Caso 5

### H0 = no hay asociación de HP en Coyo 3, Jujuy y Peru FMNH MH
### H1 = Existe asociación de HP en Coyo 3 Jujuy y Peru FMNH MH
conhp5<-c(12, 4, 13)
Nanl5<-c(22, 11, 47) # notese
cuadro5<-data.frame(conhp5, Nanl5)
row.names(cuadro5)<-c("Coyo 3", "Jujuy", "FMNH HM")
cuadro5
### Ya creada la tabla y nombrada aplicamos chi2
chisq.test(cuadro5)
### Revisamos n esperados
chisq.test(cuadro5)$expected
### valor esperado menor que 5, se aplica fisher y luego chi2 simulado
fisher.test(cuadro5)
chisq.test(cuadro5, simulate.p.value = T)

#  En este caso se acepta la hipótesis nula y se rechaza la hipótesis alternativa,
# ya que ambas poblaciones presentan independencia.




# ¿Qué hubiera hecho distinto?

# Crear el Dataset

nom<-c("Coyo 3", "Jujuy", "FMNH_HM")
hp<-c(12, 4, 13)
tots<-c(22, 11, 47)
df<-data.frame(hp, tots)
row.names(df)<-nom
df
# Coyo 3 y Jujuy
chisq.test(slice(df, 1:2))$expected
chisq.test(slice(df, 1:2))
# X-squared = 0.069193, df = 1, p-value = 0.7925
fisher.test(slice(df, 1:2)) # p-value = 0.7434

# Jujuy y FMNH
chisq.test(slice(df, 2:3))$expected
chisq.test(slice(df, 2:3))
#X-squared = 0.0047541, df = 1, p-value = 0.945
fisher.test(slice(df, 2:3)) # p-value = 0.734

# Coyo 3 y FMNH
chisq.test(slice(df, -2))$expected
chisq.test(slice(df, -2))
# X-squared = 1.4254, df = 1, p-value = 0.2325
fisher.test(slice(df, -2)) # p-value = 0.2239

# todos 
chisq.test(df)$expected
chisq.test(df)
# X-squared = 2.064, df = 2, p-value = 0.3563
fisher.test(df) # p-value = 0.3349



######

# datos discretos o categoricos:

# frecuencias mayor a 5
?chisq.test

# frecuencias menor a 5
?fisher.test
## Agresti (1990, p. 61f; 2002, p. 91) Fisher's Tea Drinker
## A British woman claimed to be able to distinguish whether milk or
##  tea was added to the cup first.  To test, she was given 8 cups of
##  tea, in four of which milk was added first.  The null hypothesis
##  is that there is no association between the true order of pouring
##  and the woman's guess, the alternative that there is a positive
##  association (that the odds ratio is greater than 1).
TeaTasting <-matrix(c(3, 1, 1, 3),
         nrow = 2,
         dimnames = list(Guess = c("Milk", "Tea"),
                         Truth = c("Milk", "Tea")))
TeaTasting
fisher.test(TeaTasting, alternative = "greater")
## => p = 0.2429, association could not be established

# datos continuos
# Preguntas sobre diferencias...

# diferencias en multiples medias de una sola variable...

# Dos grupos
# es lo mismo que U de Mann-Whitney
?wilcox.test

require(graphics)
## One-sample test.
## Hollander & Wolfe (1973), 29f.
## Hamilton depression scale factor measurements in 9 patients with
##  mixed anxiety and depression, taken at the first (x) and second
##  (y) visit after initiation of a therapy (administration of a
##  tranquilizer).
x <- c(1.83,  0.50,  1.62,  2.48, 1.68, 1.88, 1.55, 3.06, 1.30)
y <- c(0.878, 0.647, 0.598, 2.05, 1.06, 1.29, 1.06, 3.14, 1.29)
wilcox.test(x, y, paired = TRUE, alternative = "greater")
wilcox.test(y - x, alternative = "less")    # The same.
wilcox.test(y - x, alternative = "less",
            exact = FALSE, correct = FALSE) # H&W large sample
# approximation

## Formula interface to one-sample and paired tests

depression <- data.frame(first = x, second = y, change = y - x)
depression
wilcox.test(change ~ 1, data = depression)
wilcox.test(Pair(first, second) ~ 1, data = depression)
Pair(depression$first, depression$second)
?Pair
# Más de dos grupos
?kruskal.test

## Hollander & Wolfe (1973), 116.
## Mucociliary efficiency from the rate of removal of dust in normal
##  subjects, subjects with obstructive airway disease, and subjects
##  with asbestosis.
x <- c(2.9, 3.0, 2.5, 2.6, 3.2) # normal subjects
y <- c(3.8, 2.7, 4.0, 2.4)      # with obstructive airway disease
z <- c(2.8, 3.4, 3.7, 2.2, 2.0) # with asbestosis
kruskal.test(list(x, y, z))
?list
## Equivalently,
x <- c(x, y, z)
x
g <- factor(rep(1:3, c(5, 4, 5)),
            labels = c("Normal subjects",
                       "Subjects with obstructive airway disease",
                       "Subjects with asbestosis"))
g
kruskal.test(x, g)

## Formula interface.
require(graphics)
boxplot(Ozone ~ Month, data = airquality)
kruskal.test(Ozone ~ Month, data = airquality)

