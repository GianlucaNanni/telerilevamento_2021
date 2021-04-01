# Il mio primo codice in R per il telerilevamento

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Codice per installare i pacchetti aggiuntivi raster (già installato)
#install.packages("raster")

# Funzione library per richiamare il pacchetto raster
library(raster)

# Funzione brick per importare i dati/immagine
p224r63_2011<-brick("p224r63_2011_masked.grd")

# Funzione per avere le info sul file
p224r63_2011

# Funzione plot: immagini per visualizzare le varie bande
plot(p224r63_2011)

# Cambio di colori
cl<-colorRampPalette(c("black","grey","light grey"))(100)
# Nuovo plot col cambio di colori
plot(p224r63_2011, col=cl)

# Cambio di colori a piacimento 
clp<-colorRampPalette(c("black","blue","pink","green","yellow"))(100)
# Nuovo plot col cambio di colori
plot(p224r63_2011, col=clp)


# NUOVA IMMAGINE
# Funzione library per richiamare il pacchetto raster
library(raster)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Funzione brick per importare i dati/immagine
p224r63_2011 <- brick("p224r63_2011_masked.grd")

# Cambio di colori
cls <- colorRampPalette(c("red","pink","orange","purple")) (100)
plot(p224r63_2011, col=cls)

# Funzione per avere le info sul file
p224r63_2011

# Spiegazione delle bande di LANDSAT
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

# dev.off() : ripulisce la finestra grafica corrente, se non è già stata chiusa manualmente
dev.off()

# Funzione plot: immagine per visualizzare una sola banda ($banda 1)
plot(p224r63_2011$B1_sre)

# Plot della banda 1 con colori predefiniti (colorRampPalette)
cls <- colorRampPalette(c("red","blue","green","purple")) (100)
# Nuovo plot col cambio di colori per una sola banda
plot(p224r63_2011$B1_sre, col=cls)

# dev.off() : ripulisce la finestra grafica corrente
dev.off()

# Funzione par: imposta più parametri grafici nella stessa immagine
# 1 riga 2 colonne
par(mfrow=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
# 2 righe; 1 colonna 
par(mfrow=c(2,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
# 1 colonna; 2 righe (par(mfcol=...))
par(mfcol=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
# N.B: fare doppio invio, uno per ogni plot

# Plot delle prime 4 bande di Landsat
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

# Plot distribuzione "quadrata" delle 4 bande Landsat
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

# Plot distribuzione "quadrata" delle 4 bande Landsat
# con colorRampPalette per ogni banda
# Banda del BLU
par(mfrow=c(2,2))
clb <- colorRampPalette(c("dark blue","blue","light blue")) (100)
plot(p224r63_2011$B1_sre, col=clb)
# Banda del VERDE
clg <- colorRampPalette(c("dark green","green","light green")) (100)
plot(p224r63_2011$B2_sre, col=clg)
# Banda del ROSSO
clr <- colorRampPalette(c("dark red","red","pink")) (100)
plot(p224r63_2011$B3_sre, col=clr)
# Banda dell'INFRAROSSO
clnir <- colorRampPalette(c("red","orange","yellow")) (100)
plot(p224r63_2011$B4_sre, col=clnir)


# Visualizzazione di dati in PLOT RGB
# Funzione library per richiamare il pacchetto raster
library(raster)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Funzione brick per importare i dati/immagine
p224r63_2011 <- brick("p224r63_2011_masked.grd")

# Spiegazione delle bande di LANDSAT
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

# Funzione plotRGB: crea immagini multibanda (colori naturali)
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
# Funzione plotRGB con infrarosso
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# Plot multibanda RGB 2x2
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# Salvare immagine pdf in C:lab
pdf("il_mio_primo_pdf_con_R.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
dev.off()

# Funzione plotRGB: crea immagini multibanda ad alto contrasto
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

# Plot multibanda RGB: Lin/hist
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")  #colori naturali
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")  #colori falsi
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist") #colori falsi con istogramma allungato (hanno più contrasto)

# Codice per installare pacchetto aggiuntivo
install.packages("RStoolbox")

# Funzione library per richiamare il pacchetto
library(RStoolbox)


#IMMAGINE p224r63_1988 - Set multitemporale
# Funzione library per richiamare il pacchetto raster
library(raster)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Funzione brick per importare i dati/immagine
p224r63_2011 <- brick("p224r63_2011_masked.grd")

# Funzione per avere le info sul file
p224r63_2011

# Funzione brick per importare i dati/immagine
p224r63_1988 <- brick("p224r63_1988_masked.grd")

# Funzione per avere le info sul file 
# è la stessa immagine per dimensioni, ma con valori di pixel diversi perchè è di un momento diverso (1988)
p224r63_1988

# Funzione plot: immagini per visualizzare le varie bande
plot(p224r63_1988)

# Funzione plotRGB: crea immagini multibanda (colori naturali)
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin")
# Funzione plotRGB con infrarosso
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")

# Plot multibanda RGB 2x2 (immagini 1998-2011)
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")

# Salvare immagine pdf in C:lab
pdf("multitemporale.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
dev.off()
