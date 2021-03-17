# Il mio primo codice in R per il telerilevamento

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Codice per installare i pacchetti aggiuntivi raster (già installato)
#install.packages("raster")

#Funzione library per richiamare il pacchetto raster
library(raster)

#Funzione brick per importare i dati
p224r63_2011<-brick("p224r63_2011_masked.grd")

#Funzione per avere le info sul file
p224r63_2011

#Funzione plot immagini per visualizzare le varie bande
plot(p224r63_2011)
