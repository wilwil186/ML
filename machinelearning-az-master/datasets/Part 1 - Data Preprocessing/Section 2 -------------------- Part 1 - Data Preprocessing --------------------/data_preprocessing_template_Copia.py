#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Apr  8 08:29:23 2022

@author: wilson
"""

# Plantilla de Pre Procesado

# Cómo importar las librerías
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importar el data set
dataset = pd.read_csv('Data.csv') #cargar el datasets
X = dataset.iloc[:, :-1].values # i de index loc de locazación
y = dataset.iloc[:, 3].values

#tratamientos de los nan o limpieza de 
#from sklearn.preprocessing import Imputer
from sklearn.impute import SimpleImputer
#calculo de datos que faltan
#utilizar menos recursos 
#imputer = Imputer(missing_values = np.nan, strategy = "mean", axis = 0)
imputer = SimpleImputer(missing_values= np.nan, strategy='mean')
imputer.fit(X[:,1:3]) #tomado indices 1 y 2 el limite superior no se incluye
#sobreescribir
X[:,1:3] = imputer.transform(X[:,1:3])

#codificar Datos Categoricos
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
from sklearn.compose import ColumnTransformer

labelencoder_X = LabelEncoder()
X[:, 0] = labelencoder_X.fit_transform(X[:, 0])

ct = ColumnTransformer(
    [('one_hot_encoder', OneHotEncoder(categories='auto'), [0])],   
    remainder='passthrough'                        
)

X = np.array(ct.fit_transform(X), dtype=np.float)
labelencoder_y = LabelEncoder()
y = labelencoder_y.fit_transform(y)

# Dividir el data set en conjunto de entrenamiento y en conjunto de testing
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y,test_size = 0.2, random_state = 0)

# Escalado de variables
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)