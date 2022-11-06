### H0 = no hay asociación de HP en Coyo 3, Jujuy y Peru FMNH MH
### H1 = Existe asociación de HP en Coyo 3 Jujuy y Peru FMNH MH
conhp5<-c(12, 4, 13)
Nanl5<-c(12, 11, 47)
cuadro5<-data.frame(conhp5, Nanl5)
row.names(cuadro5)<-c("Coyo 3", "Jujuy", "FMNH HM")
View(cuadro5)
### Ya creada la tabla y nombrada aplicamos chi2
chisq.test(cuadro5)
### Revisamos n esperados
chisq.test(cuadro5)$expected
### valor esperado menor que 5, se aplica fisher y luego chi2 simulado
fisher.test(cuadro5)
chisq.test(cuadro5, simulate.p.value = T)
