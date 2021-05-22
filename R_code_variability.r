# R_code_variability.r

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Funzione library per richiamare il pacchetto: raster
library(raster) #oppure: require(raster)

# Funzione library per richiamare il pacchetto: RStoolbox
library(RStoolbox)

# Funzione library per richiamare il pacchetto: ggplot2
library(ggplot2)

# Funzione library per richiamare il pacchetto: gridExtra
library(gridExtra)

# Funzione brick per importare i dati/immagine
sent <- brick("sentinel.png")
# Funzione per avere le info sul file
sent

# NIR 1, RED 2 , GREEN 3
# r=1, g=2, B=3
# Funzione plotRGB: crea immagini multibanda
plotRGB(sent, stretch="lin") # è uguale a: plotRGB(sent, r=1, g=2, b=3, stretch="lin") perchè è la composizone di default
# Oppure: 
plotRGB(sent, r=2, g=1, b=3, stretch="lin")

# Compattare il dataset in: 1 strato
# Calcolo 1° indice: nir
nir <- sent$sentinel.1
# Calcolo 2° indice: red
red <- sent$sentinel.2

# Calcolo indice di vegetazione ndvi= (NIR-red) / (NIR+red)
ndvi <- (nir-red) / (nir+red)
