# R_code_vegetation_indices.r

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Codice per installare pacchetto aggiuntivo: rasterdiv (div= NIR-red)
# install.packages("rasterdiv") #già installato

# Funzione library per richiamare il pacchetto: rasterdiv
library(raster) #oppure: require(raster)

# Funzione library per richiamare il pacchetto: raster
library(rasterdiv)

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

# Calcolo dell'indice di vegetazione e comparazione tra l°e 2° immagine (defor1-defor2) per vederne la differenza
# 1° indice: dvi1=NIR - red
dvi1 <- defor1$defor1.1 - defor1$defor1.2
