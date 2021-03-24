# Il mio primo codice in R per il telerilevamento

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Codice per installare i pacchetti aggiuntivi raster (già installato)
#install.packages("raster")

# Funzione library per richiamare il pacchetto raster
library(raster)

# Funzione brick per importare i dati
p224r63_2011<-brick("p224r63_2011_masked.grd")

# Funzione per avere le info sul file
p224r63_2011

# Funzione plot immagini per visualizzare le varie bande
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

# Funzione brick per importare i dati
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

# Funzione plot immagine per visualizzare una sola banda ($banda 1)
plot(p224r63_2011$B1_sre)

# Plot della banda 1 con colori predefiniti (colorRampPalette)
cls <- colorRampPalette(c("red","blue","green","purple")) (100)
# Nuovo plot col cambio di colori per una sola banda
plot(p224r63_2011$B1_sre, col=cls)

# dev.off() : ripulisce la finestra grafica corrente
dev.off()

# Funzione par: imposta più parametri nella stessa immagine
# 1 riga 2 colonne
par(mfrow=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
# 2 righe; 1 colonna 
par(mfrow=c(2,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
# N.B: fare doppio invio, uno per ogni plot
