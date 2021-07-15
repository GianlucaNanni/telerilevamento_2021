# R_code_spectral_signatures.r

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Funzione library per richiamare il pacchetto raster
library(raster)

# Funzione library per richiamare il pacchetto: rgdal
library(rgdal)

# Funzione brick per importare dalla cartella i dati/immagine: importa tutte le bande
defor2 <- brick("defor2.jpg")

# Funzione per avere le info sul file: nomi bande
defor2
# Ha 3 bande: defor 2.1 - 2.2 - 2.3
# Corrispondono a: NIR - RED - GREEN

# Funzione plotRGB: defor2
plotRGB(defor2, r=1, g=2, b=3, stretch="lin") # "lin": lineare, amplia i valori
# Significa che nella componente r(RED) c'è la 2.1(1°banda), ecc.
plotRGB(defor2, r=1, g=2, b=3, stretch="hist") # "hist": istogramma, usa curva logistica che aumenta artificialmente la pendenza della curva, aumentando le differenze tra i valori (colori)

# Funzione: click, usa immagine plotRGB per creare le firme spettrali # Serve pacchetto: rgdal
click(defor2, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")
