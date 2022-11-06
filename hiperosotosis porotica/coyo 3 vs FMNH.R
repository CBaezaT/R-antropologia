### H0 = no hay asociación de HP en coyo 3 y Peru FMNH MH
### H1 = Existe asociación de HP en coyo 3 y Peru FMNH MH
conhp2<-c(12, 13)
Nanl2<-c(22, 47)
cuadro2<-data.frame(conhp2, Nanl2)
row.names(cuadro2)<-c("Coyo 3", "FMNH HM")
View(cuadro2)
### Ya creada la tabla y nombrada aplicamos chi2
chisq.test(cuadro2)
### Revisamos n esperados
chisq.test(cuadro2)$expected
### valor esperado menor que 5, se aplica fisher y luego chi2 simulado
fisher.test(cuadro2)
chisq.test(cuadro2, simulate.p.value = T)