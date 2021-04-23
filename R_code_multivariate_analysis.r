# R_code_multivariate_analysis.r

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Funzione library per richiamare il pacchetto: raster
library(raster)

# Funzione library per richiamare il pacchetto: RStoolbox
library(RStoolbox)

# Funzione brick per importare i dati/immagine
p224r63_2011 <- brick("p224r63_2011_masked.grd")

# Funzione per avere le info sul file
p224r63_2011

# Funzione plot: immagini per visualizzare le varie bande
plot(p224r63_2011)

# Plot della banda 1 contro la banda 2 (col=colore, pch=forma punti, cex=dimensione di punti)
plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)

# Plot di tutte le correlazioni tra bande di un dataset (matrice di scatterplot, di dati non immagini)
# La tabella riporta in diagonale le bande (sono le variabili), correlazione varia da 0(poco) a 1 (molto)
pairs(p224r63_2011)
