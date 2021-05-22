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

# Funziona focal: calcola i valori vicini a una finestra mobile (es. mediea e/o deviazione standard)
# Funziona focal: calcolo deviazione standard (variabilità immagine)
ndvisd3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=sd)
# focal: del dato (ndvi) # w: finestra mobile=matrice di dati # fun(funzione): calcola la deviazione standard (sd)
# Plot:
plot(ndvisd3)
# Cambio di colori
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
# Nuovo plot col cambio di colori
plot(ndvisd3, col=clsd)

# Funziona focal: calcolo media
ndvimean3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=mean)
# focal: del dato (ndvi) # w: finestra mobile=matrice di dati # fun(funzione): calcola la media (mean)
# Cambio di colori
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
# Nuovo plot col cambio di colori
plot(ndvimean3, col=clsd)
