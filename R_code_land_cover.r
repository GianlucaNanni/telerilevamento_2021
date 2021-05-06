# R_code_land_cover.r

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Funzione library per richiamare il pacchetto: raster
library(raster) #oppure: require(raster)

# Funzione library per richiamare il pacchetto: RStoolbox
library(RStoolbox)

# Codice per installare pacchetto aggiuntivo: ggplot2
# install.packages("ggplot2") #già installato
# Funzione library per richiamare il pacchetto: ggplot2
library(ggplot2)

# Funzione brick per importare i dati/immagine
defor1 <- brick("defor1.jpg")
# Funzione plotRGB: crea immagini multibanda
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

# Funzione brick per importare i dati/immagine
defor2 <- brick("defor2.jpg")
# Funzione plotRGB: crea immagini multibanda
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

