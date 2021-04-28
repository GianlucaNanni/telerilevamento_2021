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
# La tabella riporta in diagonale le bande (sono le variabili), l'indice di correlazione varia da 0(negativo) a 1 (positivo)
pairs(p224r63_2011)

# resampling (ricampionamento)
# Funzione aggregate per ridurre (aggregare) N° pixel immagine e diminuire la risoluzione, quindi si visualizza meglio xkè ha N° ristretto di pixel
# Funzione: fact=10, ogni 10 pixel avrò 1 pixel (linearmente 10x10 pixel li trasformiamo in 1 pixel)
p224r63_2011res <- aggregate(p224r63_2011, fact=10)
# Quindi il pixel da 30mx30m diventa 300mx300m, se aumenta grandezza pixel e diminuisce la risoluzione. Maggiore è il dettaglio e minore è la risolzuione
# Funzione per avere le info sul file
p224r63_2011res

# Funzione par: imposta più parametri grafici nella stessa immagine
# 2 righe; 1 colonna
# Funzione plotRGB crea immagini multibanda: con infrarosso
par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
# Nuovo plot col cambio di pixel
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")

# Funzione rasterPCA: compatta il pacchetto di dati in un N° minore di bande
p224r63_2011res_pca <- rasterPCA(p224r63_2011res)

# Funzione summary: sommario del modello
summary(p224r63_2011res_pca$model)

# Funzione per avere le info sul file
p224r63_2011res_pca

# Plot della mappa
plot(p224r63_2011m_pca$map)

# Funzione plotRGB (della mappa) con 3 componenti principali
plotRGB(p224r63_2011res_pca$map, r=1, g=2, b=3, stretch="lin")

# Funzione plot: di una banda rispetto ad un'altra
plot(p224r63_2011res_pca$map$PC1,p224r63_2011res_pca$map$PC2)
#Tra la 1°(PC1) componente e la 2°(PC2) non c'è correlazione
