# R_code_spectral_signatures.r

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Funzione library per richiamare il pacchetto raster
library(raster)

# Codice per installare pacchetto aggiuntivo "rgdal": metodo di visualizzazione per i dati raster
#install.packages("rgdal") #(già installato)
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

# Bisogna avere la mappa fatta con plotRGB aperta sotto
# Funzione: click, usa immagine plotRGB per creare le firme spettrali # Serve pacchetto: rgdal
click(defor2, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")
# Cliccare sulla mappa nella parte ancora vegetata (rosso) e sul fiume, in R appaiono le info definite con la funzione: click (vedi riga sopra)
# Risultati:
#         x     y   cell defor2.1 defor2.2 defor2.3
#   1 103.5 203.5 196562      192       11       28
#         x    y   cell defor2.1 defor2.2 defor2.3
#    1 399.5 89.5 278596       32       84      141


