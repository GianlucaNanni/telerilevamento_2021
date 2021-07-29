# R_code_exam_Amazonian derorestation.r
# Cambiamento della forestazione Amazzonica tra il 2000 e 2012 (2000-2004-2008-2012)
# https://earthobservatory.nasa.gov/world-of-change/Deforestation

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/amazonian") # Windows

# Funzioni: library, necessarie per richiamare i pacchetti per la realizzazione del progetto
require(raster)
library(RStoolbox) # for vegetation indices calculation
library(ggplot2)
library(rasterVis)

# Importare i file tutti insieme (invece che singolarmente)
# Funzione list.files: crea lista di file per la funzione lapply 
alist <- list.files(pattern="amazon_deforestation") # pattern=scritta in comune nei file
# Funzione per avere le info sul file
alist
# Funzione lapply: applica alla lista dei file una funzione (raster) 
import <- lapply(alist,raster)
# Funzione per avere le info sul file
import
# Funzione stack: raggruppa e rinomina, in un unico pacchetto, i file raster separati
TGa <- stack(import)
# Funzione per avere le info sul file
TGa
# Funzione plot: del singolo file
plot(TGa)


# Funzione plotRGB: crea immagini multibanda con:
# banda1: NIR (infrarosso)
# banda2: red
# banda3: green

# Funzione plotRGB: crea plot con immagini sovrapposte
plotRGB(TGa, 1, 2, 3, stretch="Lin")
# Funzione ggr: plotta file raster in differenti scale di grigio, migliorando la qualità dell'immagine e aggiungengo le coordinate spaziali sugli assi x e y
ggRGB(TGa, r=1, g=2, b=3, stretch="lin") # "lin": lineare, amplia i valori
ggRGB(TGa, r=1, g=2, b=3, stretch="hist")  # "hist": istogramma, usa curva logistica che aumenta artificialmente la pendenza della curva, aumentando le differenze tra i valori (colori)


# Funzione levelplot: disegna grafici di colore falso e di contorno con una singola legenda
levelplot(TGa)
# Cambio di colori a piacimento
cls<-colorRampPalette(c("white","dark green","yellow","red","black"))(100)
# Nuovo levelplot col cambio di colori, nome e titolo
levelplot(TGa,col.regions=cls, main="Variation forest cover in time", names.attr=c("July 2000","August 2004", "July 2008", "July 2012"))


# Funzione freq: calcolare la frequenza dei pixel di una certa classe (d1c)
freq(TGa$map)
#value  count
# [1,]     1 305319
# [2,]     2  35973






# differenza copertura 2000-2012





---------------------------------------------------------------------------------------




# 8. R_code_vegetation_indices.r

# Funzione brick per importare i dati/immagine
a_d_2001 <- brick("amazon_deforestation_2001.jpg")
a_d_2011 <- brick("amazon_deforestation_2011.jpg")

# Funzione plotRGB: a_d_2001
par(mfrow=c(2,1))
plotRGB(a_d_2001, r=1, g=2, b=3, stretch="lin")
# Funzione plotRGB: defor2
plotRGB(a_d_2011, r=1, g=2, b=3, stretch="lin")

# Funzione per avere le info sul file: nomi bande
a_d_2001
# Funzione per avere le info sul file: nomi bande
a_d_2011


# Calcolo dell'indice di vegetazione dvi e comparazione tra immagine del 2001 e immagine del 2011 per vederne la differenza
# Calcolo 1° indice: dvi1=NIR - red
dvi1 <- a_d_2001$amazon_deforestation_2001.1 - a_d_2001$ amazon_deforestation_2001.2
# Cambio di colori
cl <- colorRampPalette(c('blue','yellow','red','black'))(100)
# Nuovo plot col cambio di colori e titolo
plot(dvi1, col=cl, main="DVI at time 1")

# Calcolo 2° indice: dvi1=NIR - red
dvi2 <- a_d_2011$amazon_deforestation_2011.1 - a_d_2011$amazon_deforestation_2011.2
# Plot:
plot(dvi2)
# Cambio di colori
cls <- colorRampPalette(c('blue','yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(dvi2, col=cls)
# Nuovo plot col cambio di colori e titolo
plot(dvi2, col=cls, main="DVI at time 2")

# Comparazione: analisi multitemporale dei 2 indici
# Funzione par: imposta più parametri grafici nella stessa immagine
# 2 righe; 1 colonna
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cls, main="DVI at time 2")

# Differenza tra l°e 2° zona in tempi diverse
difdvi <- dvi1 - dvi2
# Cambio di colori per le differenze
cld <- colorRampPalette(c('blue','white','red'))(100)
# Nuovo plot col cambio di colori
plot(difdvi, col=cld)

