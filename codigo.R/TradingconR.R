install.packages("quantmod")
library(quantmod)
install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)

date <- "2019-1-15"           

#Obtener símbolos de yahoo. por ej Televisa
tv <- getSymbols.yahoo("TV", from = date)

TVClose <- getSymbols.yahoo("TV", from=date, auto.assign = F)[,6]
TVClose

TVRets <- na.omit(dailyReturn(TVClose, type="log")) 
chartSeries(TVRets)  

library(dplyr)
install.packages("caret")
library(caret)
library(tidyverse)     

FEMSA <- read.csv("~/Escritorio/ML/codigo.R/FEMSAUB.MX.csv")
View(FEMSA)

FEMSA <- mutate(FEMSA, Company= "Femsa", Company_Ticker="KOF") 

FEMSA_2 <- FEMSA[,c(9,8,1,2,3,4,5,6,7)] #[Filas,Columnas]

GFBANORTE.MX <- read.csv("~/Escritorio/ML/codigo.R/GFBANORTE.MX.csv")

#dataset GFBANORTE
GFBANORTE.MX <- mutate (GFBANORTE.MX, Company= "Grupo Financiero Banorte", 
                        Company_Ticker="GFNORTEO.MX") 
#cambiamos el orden de las variables (columnas) para tener primero
#la compañia
GFBANORTE.MX_2 <- GFBANORTE.MX[,c(9,8,1,2,3,4,5,6,7)]  

TELEVISA <- read.csv("~/Escritorio/ML/codigo.R/TELEVISA.csv")
#Televisa
TELEVISA <- mutate (TELEVISA, Company= "Televisa", 
                    Company_Ticker="TV") 
TELEVISA_2 <- TELEVISA[,c(9,8,1,2,3,4,5,6,7)] 

#walmart México
WALMEX.MX <- read.csv("~/Escritorio/ML/codigo.R/WALMEX.MX.csv")
WALMEX.MX <- mutate (WALMEX.MX, Company= "Walmart Méx", 
                     Company_Ticker="WALMEX.MX") 
WALMEX.MX_2 <- WALMEX.MX[,c(9,8,1,2,3,4,5,6,7)] 

#Bradesco. banco brasil
BBD.bradesco <- read.csv("~/Escritorio/ML/codigo.R/BBD-bradesco.csv")
BBD.bradesco <- mutate (BBD.bradesco, Company= "Banco Bradesco", 
                        Company_Ticker="BBD") 
BBD.bradesco_2 <- BBD.bradesco[,c(9,8,1,2,3,4,5,6,7)] 

Latam_GEI_Index <- rbind(FEMSA_2, GFBANORTE.MX_2, TELEVISA_2, WALMEX.MX_2, 
                         BBD.bradesco_2)  
#rbind unir filas