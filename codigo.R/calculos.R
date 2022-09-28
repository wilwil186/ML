4+8
20-8
4^2

x =86
x
y <- 25 
y 
Oficina <- 7
Platzi <- 1
Transporte <-1.5
Tiempo_al_dia <- Oficina + Platzi + Transporte
Tiempo_al_dia

Corte_1 <- 0.3
Corte_2 <- 0.3
Corte_3 <- 0.4

Nota_1 <- 4.0
Nota_2 <- 4.6
Nota_3 <- 3.0

Nota_c_1 <- Nota_1 * Corte_1
Nota_c_1
Nota_c_2 <- Nota_2 * Corte_2
Nota_c_2
Nota_c_3 <- Nota_3 * Corte_3
Nota_c_3

Nota_final <- Nota_c_1+Nota_c_2+Nota_c_3
Nota_final

str(mtcars)
class(mtcars$vs)

mtcars$vs = as.logical(mtcars$vs)
mtcars$am = as.logical(mtcars$am)

str(orangeec)

summary(orangeec)

summary(mtcars)

wt <- (mtcars$wt*1000)/2
wt

summary(mtcars)

#transformación 
 mtcars.new <- transform(mtcars, wt=wt*1000/2)
 mtcars.new
 summary(mtcars.new)
#vectores
 tiempo_platzi <- c(25,5,10,15,10)
 tiempo_lectura <- c(30,10,5,10,15)
 tiempo_aprendizaje <- tiempo_platzi + tiempo_lectura
 
 # vector caracteres 
 dias_aprendizaje <- c("Lunes","Martes", "Miercoles", "Jueves", "Viernes")
 dias_aprendizaje
 
 #vector booleano
 dias_mas_20min <- c(TRUE,FALSE,FALSE,TRUE,TRUE)
dias_mas_20min
#suma 
total_tiempo_platzi <- sum(tiempo_platzi)
total_tiempo_platzi
total_tiempo_lectura <- sum(tiempo_lectura)
total_tiempo_lectura
total_tiempo_adicional <- total_tiempo_platzi + total_tiempo_lectura
total_tiempo_adicional
#matrices
tiempo_matrix <- matrix(c(tiempo_platzi, tiempo_lectura), 
                        nrow = 2, byrow = TRUE)

dias <- c("Lunes","Martes", "Miercoles", "Jueves", "Viernes")
Tiempo <- c("tiempo platzi", "tiempo lecturas")

colnames(tiempo_matrix) <- dias
rownames(tiempo_matrix) <- Tiempo 

tiempo_matrix

colSums(tiempo_matrix)
#agregar una fila
final_matrix <- rbind(tiempo_matrix,c(10,1,30,5,0))
final_matrix

colSums(final_matrix)
final_matrix <- cbind(final_matrix, Sabado = c(1, 2, 3))

final_matrix[1,5]
#Operadores
# igual a ==
# No igual != 
# menor que <
# menor igual <= 
# mayor > 
# | o
#! no 
# %in% que este en el dataset
mtcars[mtcars$cyl<6,]

#importar dataset

orangeec <- read.csv("~/Escritorio/ML/codigo.R/orangeec.csv")
#explorar el dataset de economia naranja
orangeec[orangeec$GDP.PC>=15000,]
orangeec[orangeec$Creat.Ind...GDP<=2,] 

neworangeec <- subset(orangeec, Internet.penetration...population > 80
                      & Education.invest...GDP >= 4.5)

neworangeec


neworangeec <- subset(orangeec, Internet.penetration...population > 80
                      & Education.invest...GDP >= 4.5, 
                      select = Creat.Ind...GDP)

neworangeec

rename(orangeec , c("Creat.Ind...GDP"="ApoerteEcNja"))

Nivel_Curso <- c("Básico","Intermedio","Avanzado")
Nivel_Curso
#comienzo
head(mtcars)
head(orangeec)
#final
tail(mtcars) #para la cola :3
tail(orangeec)

glimpse(orangeec)

my_vector <- 1:8 
my_vector
my_matrix <- matrix(1:9, ncol = 3)
my_matrix
my_df <- mtcars[1:4,]
my_df
my_list <- list(my_vector,my_matrix,my_df)
my_list

#EDA Scatter plot mtcars 
plot(mtcars$mpg ~ mtcars$cyl,
     xlab="cilindros", ylab = "millas por galón",
     main="Relación cilindros y millas por galón")
plot(mtcars$mpg ~ mtcars$hp ,
     xlab="caballos de fuerza", ylab = "millas por galón",
     main="Relación caballos de fuerza y millas por galón")
#EDA orangeec
plot(orangeec$Unemployment ~ orangeec$Education.invest...GDP,
     xlab = "Inversión en educación(%PIB)",
     ylab = "Desempleo", 
     main= "Relación inversión en educaión y desempleo")
plot(orangeec$GDP.PC ~ orangeec$Creat.Ind...GDP,
     xlab = "Aporte economia naranja al PIB(%)",
     ylab = "PIB per cápita", 
     main= "Relación economia naranja y pib per cápita")
#histograma mtcars qplot
hist(mtcars$hp,
      geom="histogram", 
      xlab="caballos de fuerza",
      main = "Carros segun caballos de fuerza")
ggplot(mtcars, aes(x=hp))+
  geom_histogram(binwidth = 30)+
  labs(x="caballos de fuerza", y="Cantidad de carros", 
       title = "Caballos de fuerza en carros seleccionados")+
  theme(legend.position = "none")+
  theme(panel.background = element_blank(),panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
#hist mtcars
ggplot()+geom_histogram(data = mtcars,
                        aes(x=hp),fill="blue",color="red",
                        binwidth = 20)+
  labs(x="caballos de fuerza", y="Cantidad de carros", 
       title = "Caballos de fuerza en carros seleccionados")+
  xlim(c(80,280))+theme(legend.position = "none")+
  theme(panel.background = element_blank(),panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

#hist orangeec
ggplot()+geom_histogram(data = orangeec,
                        aes(x=GDP.PC),fill="blue",color="red",
                        binwidth = 2000)+
  labs(x="pib per cápita", y="Cantidad de paises", 
       title = "PIB per cápita en paises latam")+
  theme(legend.position = "none")+
  theme(panel.background = element_blank(),panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
#
ggplot()+geom_histogram(data = orangeec,
                        aes(x=Creat.Ind...GDP),fill="blue",color="red",
                        binwidth = 1)+
  labs(x="Aporte economia naranja al pib(%)", y="Cantidad de paises", 
       title = "Contribucción economia  naraja al PIB en paises latam")+
  theme(legend.position = "none")+
  theme(panel.background = element_blank(),panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
#
ggplot()+geom_histogram(data = orangeec,
                        aes(x=Internet.penetration...population),fill="red",color="yellow",
                        binwidth = 5)+
  labs(x="Penetración internet(%) población", y="Cantidad de paises", 
       title = "Penetración de internet en paises latam")+
  theme(legend.position = "none")+
  theme(panel.background = element_blank(),panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
#boxplot
boxplot(mtcars$hp, 
        ylab="caballos de fuerza",
        main="Caballos de fuerza en caros mtcars")
#
library(ggplot2)
ggplot(mtcars,aes(x=as.factor(cyl),y=hp,fill=cyl))+
  geom_boxplot(alpha=0.6)+
  labs(x="cilindros",y="caballos de fuerza",
       title="Caballos de fuerza según cilindros en mtcars")+
  theme(legend.position = "none")+
  theme(panel.background = element_blank(),panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
#
ggplot(mtcars,aes(x=am,y=mpg,fill=am))+
  geom_boxplot()+
  labs(x="tipo de caja", y="millas por galón",
       title="Millas por galón según tupo de caja-mtcars")+
  theme(legend.position = "none")+
  theme(panel.background = element_blank(),panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
#
mtcars$am <- factor(mtcars$am, levels=c(TRUE,FALSE),
                    labels = c("Manual","Automático"))
#
economy <- mean((orangeec$GDP.PC))
economy
library(dplyr)
# 
orangeec <- orangeec %>% mutate(Strong_economy = ifelse(GDP.PC < economy,
                                                  "por debajo promedio pib per capita",
                                                  "sobre-Arriba promedio pib per cápita"))
#
ggplot(orangeec,aes(x=Strong_economy, y=Creat.Ind...GDP, 
                    fill=Strong_economy))+
  geom_boxplot(alpha=0.4)+
  labs(x="Tipo de país",y="Aporte economia naranja al pib",
       title="Aporte economia naraja en pib paises latam con alto 
       y bajo pib per cápita")+
  theme(legend.position = "none")+
  theme(panel.background = element_blank(),panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

# scatter plot con ggplot en mtcars - dos variables
ggplot(mtcars, aes(hp,mpg))+
  geom_point()+
  labs(x="caballos de fuerza",y="millas por galón",
       title = "Relación caballos de fuerza y millas por galón")+
  theme(legend.position = "none")+
  theme(panel.background = element_blank(),panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
#
mtcars$vs = as.logical(mtcars$vs)
mtcars$am = as.logical(mtcars$am)
#
ggplot(orangeec,aes(hp,qsec))+
  geom_point(aes(color=am, size=cyl))+
  labs(s="caballos de fuerza", y="tiempo en 1/4 milla",
       title="caballos-velocidad según cilindraje y tipo de caja")
#
pairs(mtcars[,2:6])

# 
summary(mtcars)
# calcular la desviación
desv <- sd(mtcars$mpg)
#calular el promedio
mean(mtcars$mpg)
# 
prom <- mean(mtcars$mpg)
CoefVar <-  (desv/prom)*100

# remover na
mean(orangeec$Creat.Ind...GDP)
mean(orangeec$Creat.Ind...GDP, na.rm = TRUE)

# Ajustando datos para mejorar visualizaciones
eficientes <- mean(mtcars$mpg)
eficientes
library(dplyr)
# para usar %>% se necita la libreria dplyr 
mtcars <- mtcars %>% 
  mutate(Mas_eficientes = ifelse(mpg<eficientes,
                                 "bajo promedio","en ó sobre promedio"))

Mas_veloces <- mtcars[mtcars$qsec<16,]
Mas_veloces

mtcars <- mtcars%>% 
  mutate(Velocidad_Cuarto_milla=ifelse(qsec < 16,
                                       "Menos 16 segs",
                                       "mas 16 segs"))

# 
mtcars <- mtcars %>% 
  mutate(Peso_Kilos = (wt/2)*1000)

mtcars <- mtcars %>% 
  mutate(Peso=ifelse(Peso_kilos <= 1500,
                     "Livianos","Pesados"))

#
orangeec <- orangeec %>% 
  mutate(Crecimiento_GDP = ifelse(GDP.Growth.. >= 2.5,
                                  "2.5 % o más", "Menos 2.5 %"))

orangeec <- orangeec %>% 
  mutate(Anaranjados = ifelse(Creat.Ind...GDP >= 2.5 , "Mas anaranjados","Menos anaranjados"))
# 
orangeec %>% 
  arrange(desc(Creat.Ind...GDP))

TopNaranjas <- orangeec %>% 
  filter(Country %in% c("Mexico","Panama", "Paraguay", "Argentina", "Colombia","Brazil"))

TopNaranjas %>% 
  arrange(desc(Creat.Ind...GDP))

#
mtcars %>% 
  arrange(desc(Peso_Kilos))

Mas_pesados <- mtcars %>% 
  filter(model %in% c("Lincoln Continental","Chrysler Imperial", "Cadillac Fleetwood"))

#
ggplot(Mas_pesados, aes(x=hp,y=mpg))+
  geom_point()+
  facet_wrap(~model)

