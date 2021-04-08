# Analisi delle serie temporali
# Groenlandia (Greenland) aumento della temperatura
# Dati e codici di Emanuela Cosma

# Codice per installare i pacchetti aggiuntivi raster (già installato)
#install.packages("raster")

# Funzione library per richiamare il pacchetto raster
library(raster)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/greenland") # Windows

# Codice per installare pacchetto aggiuntivo
#install.packages("rasterVis") (Installato)
# Funzione library per richiamare il pacchetto
library(rasterVis)

# Funzione raster per importare singoli strati di dati
lst_2000 <- raster("lst_2000.tif")
# Funzione plot: immagini per visualizzare le varie bande
plot(lst_2000)
# Nome immagine: visualizza valori min/max
lst_2000

# Funzione raster per importare singoli strati di dati
lst_2005 <- raster("lst_2005.tif")
# Funzione plot: immagini per visualizzare le varie bande
plot(lst_2005)

# Funzione raster per importare singoli strati di dati
lst_2010 <- raster("lst_2010.tif")
# Funzione plot: immagini per visualizzare le varie bande
plot(lst_2010)

# Funzione raster per importare singoli strati di dati
lst_2015 <- raster("lst_2015.tif")
# Funzione plot: immagini per visualizzare le varie bande
plot(lst_2015)

