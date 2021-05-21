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

# Funzione plotRGB: crea immagini multibanda
plotRGB(sent, r=2, g=1, b=3, stretch="lin")
 
