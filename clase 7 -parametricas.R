## Pruebas paramétricas.

# Supuestos parametricos:
# -Muestras independientes
# -Distribución normal (o conocida)
# -Mismas Varianzas


# crear una distrubución normal:
#  función rnorm() crea una distribución normal entregandole una media y una desviación estandar
#  Como hacer muestras al azar que puedan ser replicadas?: con una "semilla"
set.seed(1234) # correr con el codigo aleaorio
v_1<-rnorm(100, mean = 5, sd = 3) # 100 casos
v_2<-rnorm(1000, mean = 5, sd = 3) # 1.000 casos
v_3<-rnorm(10000, mean = 5, sd = 3) # 10.000 casos
# un vector de medidas de frijoles 
mf<- c(18,11,17,10,20,25,13,16,25,20,19,20)
# test de normalidad de Shapiro-Wilk (o simetria)
# Ya sabemos con el ejemplo anterior que las estaturas de las cuencas no tiene una distribucion normal..
shapiro.test(cuencas1$Estatura) # mientras mas bajo el valor p, menos normalidad posee..

# nuestro vector de una distribución normal...
shapiro.test(v_1) 
# las vainas de frijol...
shapiro.test(mf)
# H0= Los datos provienen de una distribución normal
#  H1: Los datos presentan una distribución asimétrica.

# La curtosis (kurtosis) en una distribución normal, teoricamente deberia estar cerca de 0
# La simetria (Skewness) debería estar lo más cerca de 0, si es positiva significa 
# que va hacia la derecha, si es negativa, que va hacia la izquierda

numSummary(mf, 
           statistics=c("mean", "sd", "quantiles", "skewness", "kurtosis", "n")
           , type=c("1"))

hist(mf)
plot(density(mf))
hist(v_1)
plot(density(v_1))
hist(v_2)
plot(density(v_2))
hist(v_3)
plot(density(v_3))

?numSummary # Es como la función Summary pero customizable
numSummary(v_1, 
           statistics=c("mean", "sd", "skewness", "kurtosis", "n"),
          type = c("1" ))

numSummary(v_2, 
           statistics=c("mean", "sd",  "skewness", "kurtosis", "n"),
           type=c("1"))

numSummary(v_3, 
           statistics=c("mean", "sd",  "skewness", "kurtosis", "n"),
           type=c("1"))

# Ahora continuamos con la prueba T de student 
# Estimamos un intervalo de confianza al 95% para el rendimiento promedio
# del numero de vainas producidas por cada mata de frijol
# RECORDAR: El intervalo de confianza al 95% corresponde a la validez de la prueba, 
# corresponde a un alpha del  <= 0.05

# H0 = media igual a 0
# H1 = media diferente de 0

# t test
?t.test
t.test(mf)
# vemos que el intervalo de confianza al 95% es de 14.78 a 20.88, 
# representando el intervalo de la media de la población. 
# el valor de t = 12.86 y un valor p menor a 0.05, siendo significativo.

# Nosotros igual podemos decirle que construya el intervalo de confianza al porcentaje que queramos
t.test(mf, conf.level = 0.99)

# tambien podemos plantear la prueba con un Mu
# por ejemplo, el numero de vainas producidas por mata es diferente de 23, al 99% de confianza.

t.test(mf, mu = 23, alternative = "two.sided", conf.level = 0.99)
# si se fijan, va con alternativa two.sided, ya que comparamos dos medias.

# Ahora.. ¿El numero de vainas promedio producidas por mata es mayor a 23 a un 99% de confianza?

t.test(mf, mu=23, alternative="greater", conf.level = 0.99)
# el valor p es muy alto... casi 1, se acepta hipotesis nula.

## Ahora, recuerdan que hablamos de normalidad (distribución normal) y la prueba de Shapiro-Wilk
## esta prueba es util y sensitiva cuando hay menos de 50 casos, para mayor cantidad,
## se recomienda utilizar la prueba Kolmogorov-Smirnov 

# supongamos que se tomaron indicadores de personas, en este caso el peso (P1) 
# y luego de tres meses se tomo otra vez a las mismas personas (P2)

P1<-c(111,128,111,117,119,90,115,118,109,115,118,113,92,79,75,93,86,99,118)
P2<-c(88,118,100,107,119,87,105,121,111,117,108,103,96,82,72,90,91,92,115)

numSummary(P1, 
           statistics=c("mean", "sd",  "skewness", "kurtosis", "n"),
           type=c("1"))
plot(density(P1))
numSummary(P2, 
           statistics=c("mean", "sd",  "skewness", "kurtosis", "n"),
           type=c("1"))
plot(density(P2))

shapiro.test(P1) # p-value = 0.04239
# no tiene normalidad

m<- mean(P1)
s_d <- sd(P1)
?ks.test()
ks.test(P1, "pnorm", mean = mean(P1), sd=sd(P1)) # 0.3174
# una leve normalidad... pero recuerden!
glimpse(P1) # P1 solo tiene 19 casos!!!

ks.test(P1, P2) # p-value = 0.2798
# una leve normalidad


# test de bartlett de homoigeniedad de Varianzas
### bartlett.test(P1, P2)
 ?bartlett.test


# ANOVA analisis de varianzas
# H0: las medias son iguales en todas las poblaciones
# H1: hay alguna media distinta

# primero hay que crear un modelo
insectos <- c(16,11,20,21,14,7,37,32,15,25,39,41,21,12,14,17,13,17,45,59,48,46,38,47)
colores <- as.factor(c(rep(c("azul", "verde", "blanco", "amarillo"), each =6)))
boxplot(insectos ~ colores, col = c("yellow", "blue", "white","green"), ylab = "Número de insectos atrapados")

tapply(insectos, colores, mean)
?aov
fm = aov( lm(insectos ~ colores) )
fm
summary(fm$residuals)
anova(fm)
?anova









