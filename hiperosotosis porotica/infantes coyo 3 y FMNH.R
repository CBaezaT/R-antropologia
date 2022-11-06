### H0 = no hay asociación de HP en infantes en Coyo 3 y Peru FMNH MH
### H1 = Existe asociación de HP en infantes en  Coyo 3 y Peru FMNH MH
conhp4<-c(4, 5)
Nanl4<-c(22, 47)
cuadro4<-data.frame(conhp4, Nanl4)
row.names(cuadro4)<-c("infantes coyo 3", "infantes FMNH HM")
View(cuadro4)
### Revisamos n esperados
chisq.test(cuadro4)$expected
### valor esperado menor que 5, se aplica fisher y luego chi2 simulado
fisher.test(cuadro4)
chisq.test(cuadro4, simulate.p.value = T)