# Clase 8: Ggplot2

# Descripción corta: Es un paquete para realizar gráficos de distintos tipos.
# ggplot2 funciona llevando una profunda filosofía de la visualización. 
# Tiene ya 10 años de historia y sigue estando en auge, no solo en R, si no tambien en Python.
# El paquete es
# library(ggplot2) o tambien lo podemos encontrar en:
library(tidyverse)
# dentro de su codigo, generalmente comienza con ggplot() 
# y los graficos se dividen por componentes que podemos ensamblar.
# Un limitante es que es necesario utilizar Tidy data, es decir, 
# bases de datos donde columnas son variables y filas son casos u observaciones
# Recomiendo el gran manual, "The R Graphics Cookbook de Winston Chang
# https://r-graphics.org/index.html

# Comenzamos instalando el paquete de ejemplos de gcookbook
install.packages("gcookbook")
library(gcookbook)
# revisemos la documentación oficial
?`ggplot2-package`
?ggplot2
?ggplot 

# partiremos con iris tibble
iris
iris <- iris %>% mutate( num = 1)
cuencas <- cuencas1
cuencas2 <- cuencas %>% slice( -45)
cuen_v<- cuencas %>% slice(45)
cuen_v <- cuen_v %>% mutate(Region =  "Valparaiso")
cuencas <- bind_rows(cuencas2, cuen_v)
cuencas


# Scatter plot

# estructura
ggplot(data = iris) + # base de datos
  aes(x = Petal.Length, y = Petal.Width) + # ejes x e y (tambíen puede haber un z)
  geom_point(aes(color = Species, shape = Species)) + # estilo de grafico
 ggtitle("Asociación de largo y ancho de petalo de iris")+ #nombre del grafico
 xlab("Largo del petalo")+ # Nombre eje x
 ylab("Ancho del petalo")+ # nombre eje y
 theme_bw()+  # tema de fondo
 labs(color = "Especies", shape = "Especies") # nombre de las etiquetas!!
 #theme(axis.text.x = element_text(angle = 45, hjust = 1)) #ajustar texto de los ejes y otras cosas

# Ahora, como guardamos los gráficos...
# Por el interfaz...
# O con codigo para tener resultados reproducibles:
# puede ser png, tiff, jepg...
png("Asociación de largo y ancho de petalo.png", width = 12, height = 10, units = "cm", res = 300, pointsize = 20)
ggplot(data = iris) + # base de datos
  aes(x = Petal.Length, y = Petal.Width) + # ejes x e y (tambíen puede haber un z)
  geom_point(aes(color = Species, shape = Species)) + # estilo degrafico
  ggtitle("Asociación de largo y ancho de petalo de iris")+ #nombre del grafico
  xlab("Largo del petalo")+ # Nombre eje x
  ylab("Ancho del petalo")+ # nombre eje y
  theme_bw()+  # tema de fondo
  labs(color = "Especies", shape = "Especies")+ # nombre de las etiquetas!!
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) #ajustar texto de los ejes y otras cosas
dev.off()

# Los ggplots pueden ser guardados como objetos!!

plot_1 <- ggplot(data = iris) + # base de datos
  aes(x = Petal.Length, y = Petal.Width) + # ejes x e y (tambíen puede haber un z)
  geom_point(aes(color = Species, shape = Species)) + # estilo degrafico
  ggtitle("plot 1")+ #nombre del grafico
  xlab("Largo del petalo")+ # Nombre eje x
  ylab("Ancho del petalo")+ # nombre eje y
  theme_bw()+  # tema de fondo
  labs(color = "Especies", shape = "Especies")+ # nombre de las etiquetas!!
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) #ajustar texto de los ejes y otras cosas
plot_1

# graficos de barra
?geom_bar # hace la altura de la barra proporcinal al numero de casos en cada grupo 
?geom_col # Si quieres que la altura de las barras represente los valores en los datos, usar esta

ggplot( data = iris, aes(x = Species))+
  geom_bar()

ggplot(cuencas, aes(x =Cuenca))+
  geom_bar()

ggplot(pg_mean, aes(x= group, y = weight))+
  geom_col(fill = "lightblue", colour = "black")

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "dodge")

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "dodge", colour = "black") +
  scale_fill_brewer(palette = "Pastel1")

# por ejemplo, geom col nos serviria en el caso que tuvieramos una variable que nos dijera la cantidad

ggplot( data = iris, aes(x = Species, y= num))+
  geom_col()

# geom_bar para contar frecuencias
ggplot(diamonds, aes(x = cut)) +
  geom_bar()

# graficos de barra montados o stacked

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col()

# graficos de proporción
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "fill")
# lo mismo lo podemos ver en porcentajes
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "fill") +
  scale_y_continuous(labels = scales::percent)

# ejemplo con cuencas
ggplot(cuencas, aes(x = Region, y = Estatura, fill = Sexo)) +
  geom_col(position = "fill") +
  scale_y_continuous(labels = scales::percent)

# Graficos de densidad

ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line()


# Stacked density plot:
p <- ggplot(data=diamonds, aes(x=price, group=cut, fill=cut)) +
  geom_density(adjust=1.5, position="fill") +
  theme_minimal()
p

mpg
# podemos crear un objeto ggplot y sumarle cosas
c <- ggplot(mpg, aes(hwy))
# histograma
c+geom_histogram(binwidth = 5)

c+ geom_area(stat = "bin")

c+ geom_density(kernel = "gaussian")
c+ geom_dotplot()  
c+ geom_freqpoly()
 
# Dos variables
# continuas
e <- ggplot(mpg, aes(cty, hwy))  
  
e + geom_label(aes(label = cty), nudge_x = 1, nudge_y = 1)

e + geom_point()

e + geom_quantile()

e + geom_rug(sides = "bl")

e + geom_smooth(method = lm)

e + geom_text(aes(label = cty), nudge_x = 1, nudge_y = 1) 


# una discreta y otra continua

f <- ggplot(mpg, aes(class, hwy))

f + geom_col()

f + geom_boxplot()

f + geom_dotplot(binaxis = "y", stackdir = "center")

f + geom_violin(scale = "area")


# distribución bivariada continua

h <- ggplot(diamonds, aes(carat, price))

h + geom_bin2d(binwidth = c(0.25, 500))

h + geom_density_2d()

h + geom_hex()

# funcion continua

i <- ggplot(economics, aes(date, unemploy))

i + geom_area()

i + geom_line()

i + geom_step(direction = "hv")


ggplot(cuencas, aes(x = Cuenca, y = Estatura))+
  stat_boxplot(geom = "errorbar", width = 0.2)+
  geom_boxplot()+
  scale_y_continuous(breaks = c(110, 120, 130, 140, 150, 160, 170, 180))+
  stat_summary(fun = "mean", geom = "point", shape = 23, size = 3, fill = "blue")+
  theme_minimal()+
  ggtitle("Estatura por Cuenca")


