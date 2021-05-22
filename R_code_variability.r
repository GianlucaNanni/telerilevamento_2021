# R_code_variability.r

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Funzione library per richiamare il pacchetto: raster
library(raster) #oppure: require(raster)

# Funzione library per richiamare il pacchetto: RStoolbox
library(RStoolbox)

# Funzione library per richiamare il pacchetto: ggplot2
library(ggplot2)

# Funzione library per richiamare il pacchetto: gridExtra
library(gridExtra)

# Funzione brick per importare i dati/immagine
sent <- brick("sentinel.png")
# Funzione per avere le info sul file
sent

# NIR 1, RED 2 , GREEN 3
# r=1, g=2, B=3
# Funzione plotRGB: crea immagini multibanda
plotRGB(sent, stretch="lin") # è uguale a: plotRGB(sent, r=1, g=2, b=3, stretch="lin") perchè è la composizone di default
# Oppure: 
plotRGB(sent, r=2, g=1, b=3, stretch="lin")

# Compattare il dataset in: 1 strato
# Associare 1° banda a oggetto (nome): nir
nir <- sent$sentinel.1
# Associare 2° banda a oggetto (nome): red
red <- sent$sentinel.2

# Calcolo indice di vegetazione ndvi= (NIR-red) / (NIR+red)
ndvi <- (nir-red) / (nir+red)
# Plot:
plot(ndvi)
# Cambio di colori
cl <- colorRampPalette(c('black','white','red','magenta','green'))(100)
# Nuovo plot col cambio di colori
plot(ndvi,col=cl)

# Funzione: focal o rasterPCA per compattare i dati

# Funzione focal: calcola i valori vicini a una finestra mobile (es. mediea e/o deviazione standard)
# Funzione focal: calcolo deviazione standard (variabilità immagine)
ndvisd3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=sd)
# focal: del dato (ndvi) # w: finestra mobile=matrice di dati # fun(funzione): calcola la deviazione standard (sd)
# Plot:
plot(ndvisd3)
# Cambio di colori
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
# Nuovo plot col cambio di colori
plot(ndvisd3, col=clsd)

# Funzione focal: calcolo media
ndvimean3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=mean)
# focal: del dato (ndvi) # w: finestra mobile=matrice di dati # fun(funzione): calcola la media (mean)
# Cambio di colori
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
# Nuovo plot col cambio di colori
plot(ndvimean3, col=clsd)

# Cambio dimensioni griglia
# Funziona focal: calcolo deviazione standard (variabilità immagine)
ndvisd5 <- focal(ndvi, w=matrix(1/25, nrow=5, ncol=5), fun=sd) # N° tot.(25) dispari per avere pixel centrale per il valore
# Cambio di colori
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
# Nuovo plot col cambio di colori
plot(ndvisd5, col=clsd)


# Funzione rasterPCA: analizza i componenti principali raster
sentpca <- rasterPCA(sent)
# Plot PCA:
plot(sentpca$map)
# Funzione per avere le info sul file
sentpca
# Funzione summary: mostra la variabilità iniziale delle prime componenti
summary(sentpca$model)
#la 1° componente(PC1) ha il 0.6736804% di proporzione di variabilità rispetto all'informazione originale

# Associare 1° banda a oggetto (nome): PC1
pc1 <- sentpca$map$PC1
# Funzione focal: calcolo deviazione standard (variabilità immagine)
pc1sd5 <- focal(pc1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
# Cambio di colori
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
# Nuovo plot col cambio di colori
plot(pc1sd5, col=clsd)
