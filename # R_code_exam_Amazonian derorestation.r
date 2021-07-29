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
library(rgdal)

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
# Funzione plotRGB: crea plot con immagini sovrapposte
plotRGB(TGa, 1, 2, 3, stretch="Lin")
# Funzione ggr: plotta file raster in differenti scale di grigio, migliorando la qualità dell'immagine e aggiungengo le coordinate spaziali sugli assi x e y
ggRGB(TGa, r=1, g=2, b=3, stretch="lin") # "lin": lineare, amplia i valori

# Funzione levelplot: disegna più grafici di colore falso con una singola legenda
levelplot(TGa)
# Cambio di colori a piacimento (colorRampPalette si può usare solo su immagine singole, non su RGB)
cls<-colorRampPalette(c("white","dark green","yellow","red","black"))(100)
# Nuovo levelplot col cambio di colori, nome e titolo
levelplot(TGa,col.regions=cls, main="Variation forest cover in time", names.attr=c("July 2000","August 2004", "July 2008", "July 2012"))


# Importazione delle singole immagini per effettuare comparazioni
# Funzione: brick, importa i singoli file
# Funzione brick per importare i dati/immagine
a_d_2000 <- brick("amazon_deforestation_2000.jpg")
a_d_2012 <- brick("amazon_deforestation_2012.jpg")

# 12. spectral_signatures

# Funzione plotRGB: defor2
plotRGB(a_d_2000, r=1, g=2, b=3, stretch="lin") # "lin": lineare, amplia i valori

# Bisogna avere la mappa fatta con plotRGB aperta sotto
# Funzione: click, usa immagine plotRGB per creare le firme spettrali 
click(a_d_2000, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")

#       x     y   cell amazon_deforestation_2000.1 amazon_deforestation_2000.2 amazon_deforestation_2000.3
# 1 335.5 266.5 153696                          43                          64                          47   # valori parte forestale
#       x     y   cell amazon_deforestation_2000.1 amazon_deforestation_2000.2 amazon_deforestation_2000.3
# 1 430.5 255.5 161711                         134                         117                          89   # valori parte coltivata
                           

# Definire le colonne del dataset
bande <- c(1,2,3)
foresta <- c(43,64,47)
coltivazioni <- c(134,117,89)

# Funzione data.frame: crea un dataframe (tabella)
spectrals <- data.frame(bande, foresta, coltivazioni)
# Funzione per avere le info sul file
spectrals
#   bande foresta coltivazioni
# 1     1      43          134
# 2     2      64          117
# 3     3      47           89

# Plot delle firme spettrali
# Funzione ggplot: determina l'estetica del grafico
# Funzione geom_line: connette le osservazioni a seconda del dato che è sulla X/Y
# Funzione labs: modifica le etichette degli assi, le legende e il plottaggio
ggplot(spectrals, aes(x=bande)) + geom_line(aes(y=foresta), color="green") + geom_line(aes(y=coltivazioni), color="red") + labs(x="bande", y="reflectance")

















# Funzione: spectralIndices (Pacchetto: RStoolbox), per calcolare tutti gli indici
# Calcolo indici 1° immagine
vi1 <- spectralIndices(a_d_2000, green = 3, red = 2, nir = 1) #colori associati al N° della banda
# Cambio di colori
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(vi1, col=cl)

# Calcolo indici 2° immagine
vi2 <- spectralIndices(a_d_2012, green = 3, red = 2, nir = 1)
# Cambio di colori
cls <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(vi2, col=cls)





# Plot di tutte le correlazioni tra bande di un dataset (matrice di scatterplot di dati, non immagini)
# La tabella riporta in diagonale le bande (sono le variabili), l'indice di correlazione varia da 0(negativo) a 1 (positivo)
pairs(TGa)





# differenza copertura 2000-2012
# deviazione standard? dvi/ndvi?
# concludere con ggplot



---------------------------------------------------------------------------------------




# 8. R_code_vegetation_indices.r

###############
# Calcolo dell'indice di vegetazione dvi e comparazione tra immagine del 2000 e immagine del 2012 per vederne la differenza
# Calcolo 1° indice: dvi1=NIR - red
dvi1 <- a_d_2000$amazon_deforestation_2000.1 - a_d_2000$ amazon_deforestation_2000.2
# Cambio di colori
cl <- colorRampPalette(c('blue','yellow','red','black'))(100)
# Nuovo plot col cambio di colori e titolo
plot(dvi1, col=cl, main="DVI at time 1")

# Calcolo 2° indice: dvi1=NIR - red
dvi2 <- a_d_2012$amazon_deforestation_2012.1 - a_d_2012$amazon_deforestation_2012.2
# Plot:
plot(dvi2)
# Cambio di colori
clh <- colorRampPalette(c('blue','yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(dvi2, col=clh)
# Nuovo plot col cambio di colori e titolo
plot(dvi2, col=clh, main="DVI at time 2")

# Comparazione: analisi multitemporale dei 2 indici
# Funzione par: imposta più parametri grafici nella stessa immagine
# 2 righe; 1 colonna
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=clh, main="DVI at time 2")
##############################

# Differenza tra l°e 2° zona in tempi diverse
difdvi <- dvi1 - dvi2
# Cambio di colori per le differenze
cld <- colorRampPalette(c('blue','white','red'))(100)
# Nuovo plot col cambio di colori
plot(difdvi, col=cld)

