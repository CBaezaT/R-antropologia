### H0 = no hay asociación de HP en Jujuy y Peru FMNH MH
### H1 = Existe asociación de HP en Jujuy y Peru FMNH MH
conhp3<-c(4, 13)
Nanl3<-c(11, 47)
cuadro3<-data.frame(conhp3, Nanl3)
row.names(cuadro3)<-c("Jujuy", "FMNH HM")
View(cuadro3)
### Ya creada la tabla y nombrada aplicamos chi2
chisq.test(cuadro3)
### Revisamos n esperados
chisq.test(cuadro3)$expected
### valor esperado menor que 5, se aplica fisher y luego chi2 simulado
fisher.test(cuadro3)
chisq.test(cuadro3, simulate.p.value = T)