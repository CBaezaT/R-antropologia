### H0 = no hay asociación de HP en coyo 3 y jujuy MH
### H1 = Existe asociación de HP en coyo 3 y jujuy MH
conhp<-c(12, 4)
Nanl<-c(22, 11)
cuadro1<-data.frame(conhp, Nanl)
row.names(cuadro1)<-c("Coyo 3", "Jujuy")
View(cuadro1)
### Ya creada la tabla y nombrada aplicamos chi2
chisq.test(cuadro1)
### Revisamos n esperados
chisq.test(cuadro1)$expected
### valor esperado menor que 5, se aplica fisher y luego chi2 simulado
fisher.test(cuadro1)
chisq.test(cuadro1, simulate.p.value = T)
