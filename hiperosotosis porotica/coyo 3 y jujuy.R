###Creamos base de datos de coyo 3 y jujuy
frec1<-c(12, 22, 4, 11)
coyvsjuj<- matrix(frec1, nrow = 2)
View(coyvsjuj)
### Ahora calculamos chi-cuadrado
chisq.test(coyvsjuj)
###Produce error por que valor esperado es menor que 5
chisq.test(coyvsjuj)$expected
###valores observado menor que 5, confirmado
### Usaremos test de fisher
fisher.test(coyvsjuj)
### aplicamos chi-cuadrado con p simulado
chisq.test(coyvsjuj, simulate.p.value = T)
