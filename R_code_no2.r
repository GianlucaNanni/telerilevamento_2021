# R_code_no2.r

# 1. Indicare la cartella da cui estrarre i dati (set working directory=setwd)
setwd("C:/lab/EN") # Windows

# Funzione library per richiamare il pacchetto: raster
library(raster) #oppure: require(raster)

# 2. Importare la prima immagine (singola banda)
# Funzione brick per importare dalla cartella i dati/immagine: importa tutte le bande
# Funzione raster per importare i singoli strati di dati: importa una singola banda (la 1°)
EN01 <- raster("EN_0001.png")
 
