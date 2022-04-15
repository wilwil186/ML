# Plantilla para el Pre Porcesado de Datos
#Importar el dataset 
dataset = read.csv('Data.csv')
#Tratamineto de los valores NA
# vector
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)

#ave subconjunto de valores de x promediados a partir de las observaciones 
# FUN a cada numero x lo remplaza con la media sin inluir los na 

dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Salary)

#codificar datos categoricos
dataset$Country = factor(dataset$Country,
                         levels = c("France", "Spain", "Germany"),
                         labels= c(1,2,3))
dataset$Purchased = factor(dataset$Purchased,
                           levels = c("No", "Yes"),
                           labels = c(0,1))
#
install.packages("caTools")
library(caTools )
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

