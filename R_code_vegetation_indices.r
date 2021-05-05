# R_code_vegetation_indices.r

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Codice per installare pacchetto aggiuntivo: rasterdiv (div= NIR-red)
# install.packages("rasterdiv") #già installato

# Funzione library per richiamare il pacchetto: raster
library(raster) #oppure: require(raster)

# Funzione library per richiamare il pacchetto: rasterdiv
library(rasterdiv)

# Funzione library per richiamare il pacchetto: RStoolbox
library(RStoolbox) # for vegetation indices calculation

# Funzione brick per importare i dati/immagine
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

# Funzione par: imposta più parametri grafici nella stessa immagine
# 2 righe; 1 colonna
# Funzione plotRGB: crea immagini multibanda con:
# banda1: NIR (infrarosso)
# banda2: red
# banda3: green
# par(mfrow=c(2,1))

# Funzione plotRGB: defor1
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
# Funzione plotRGB: defor2
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# Funzione per avere le info sul file: nomi bande
defor1
# Funzione per avere le info sul file: nomi bande
defor2

# Calcolo dell'indice di vegetazione dvi e comparazione tra l°e 2° immagine (defor1-defor2) per vederne la differenza
# Calcolo 1° indice: dvi1=NIR - red
dvi1 <- defor1$defor1.1 - defor1$defor1.2
# Plot:
plot(dvi1)
# Cambio di colori
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
# Nuovo plot col cambio di colori
plot(dvi1, col=cl)
# Nuovo plot col cambio di colori e titolo
plot(dvi1, col=cl, main="DVI at time 1")

# Calcolo 2° indice: dvi1=NIR - red
dvi2 <- defor2$defor2.1 - defor2$defor2.2
# Plot:
plot(dvi2)
# Cambio di colori
cls <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
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


# Calcolo dell'indice di vegetazione ndvi e comparazione tra l°e 2° immagine (defor1-defor2) per vederne la differenza
# Indice ndvi: normalizza i valori sulla somma delle variabili
# Calcolo 1° indice ndvi= (NIR-red) / (NIR+red)
ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)
# Cambio di colori
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(ndvi1, col=cl)

# Calcolo 2° indice ndvi= (NIR-red) / (NIR+red)
ndvi2 <- (defor2$defor2.1 - defor2$defor2.2) / (defor2$defor2.1 + defor2$defor2.2)
# Cambio di colori
cls <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(ndvi2, col=cls)


# Funzione: spectralIndices (Pacchetto: RStoolbox), per calcolare tutti gli indici
# Calcolo indici 1° immagine
vi1 <- spectralIndices(defor1, green = 3, red = 2, nir = 1) #colori associati al N° della banda
# Cambio di colori
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(vi1, col=cl)

# Calcolo indici 2° immagine
vi2 <- spectralIndices(defor2, green = 3, red = 2, nir = 1)
# Cambio di colori
cls <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(vi2, col=cls)

# Differenza tra l°e 2° zona in tempi diverse
difndvi <- ndvi1 - ndvi2
# Cambio di colori per le differenze
cld <- colorRampPalette(c('blue','white','red'))(100)
# Nuovo plot col cambio di colori
plot(difndvi, col=cld)


## # Worldwide NDVI
# Vediamo come l'indice di vegetaz., relazionato alle bande del NIR e red, varia nel pianeta

# Funzione library per richiamare il pacchetto: rasterdiv
library(rasterdiv)

# Plot NDVI
plot(copNDVI)
# Più biomassa c'è e maggiore sarà l'indice

# Funzione: cbind cambia dei valori (rimuovere l'acqua)
# Funzione reclassify: riclassifica colori immagine 
copNDVI <- reclassify(copNDVI, cbind(253:255, NA)) #significa che i pixel 253,255 sono trasformati in non valori (NA)
# Plot NDVI
plot(copNDVI)
