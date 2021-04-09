# Analisi delle serie temporali
# Groenlandia (Greenland) aumento della temperatura
# Dati e codici di Emanuela Cosma

# Codice per installare i pacchetti aggiuntivi raster (già installato)
#install.packages("raster")

# Funzione library per richiamare il pacchetto: raster
library(raster)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/greenland") # Windows

# Codice per installare pacchetto aggiuntivo "rasterVis": metodo di visualizzazione per i dati raster
#install.packages("rasterVis") #(già installato)

# Funzione library per richiamare il pacchetto: rasterVis
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

# Funzione par: imposta più parametri grafici nella stessa immagine
# Plot distribuzione "quadrata" di 4 bande
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# Importare tutte le immagini INSIEME
# Funzione list.files: crea lista di file per la funzione lapply
rlist <- list.files(pattern="lst") # pattern=scritta in comune file
rlist
# Funzione lapply: applica a lista di file una funzione (raster) 
import <- lapply(rlist,raster)
import
# Funzione stack: raggruppa e rinomina file raster separati
TGr <- stack(import)
# Funzione plot: del singolo file
plot(TGr)
# Funzione plotRGB: crea immagini sovrapposte 2000(1=rosso),2005(2=verdi),2010(3=blu)
plotRGB(TGr, 1, 2, 3, stretch="Lin") # a seconda del colore i valori di lst sono più alti
# Oppure:
plotRGB(TGr, 1, 2, 3, stretch="Lin")


#Estensione della fusione dello strato di ghiaccio
# Codice per installare i pacchetti aggiuntivi: raster (già installato)
#install.packages("raster")

# Funzione library per richiamare il pacchetto raster
library(raster)

# Codice per installare pacchetto aggiuntivo "rasterVis": metodo di visualizzazione per i dati raster
#install.packages("rasterVis") #(già installato)

# Funzione library per richiamare il pacchetto: rasterVis
library(rasterVis)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/greenland") # Windows

# Importare tutte le immagini INSIEME
# Funzione list.files: crea lista di file per la funzione lapply
rlist <- list.files(pattern="lst") # pattern=scritta in comune file
rlist

# Funzione lapply: applica a lista di file una funzione (raster) 
import <- lapply(rlist,raster)
import

# Funzione stack: raggruppa e rinomina file raster separati
TGr <- stack(import)
