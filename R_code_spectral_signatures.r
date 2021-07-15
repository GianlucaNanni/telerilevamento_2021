# R_code_spectral_signatures.r

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Funzione library per richiamare il pacchetto raster
library(raster)

# Codice per installare pacchetto aggiuntivo "rgdal": metodo di visualizzazione per i dati raster
#install.packages("rgdal") #(già installato)
# Funzione library per richiamare il pacchetto: rgdal
library(rgdal)

# Funzione library per richiamare il pacchetto: ggplot2
library(ggplot2)

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
#   1 103.5 203.5 196562      192       11       28   # valori parte vegetata
#         x    y   cell defor2.1 defor2.2 defor2.3
#    1 399.5 89.5 278596       32       84      141   # valori parte fluviale


# Definire le colonne del dataset
band <- c(1,2,3)
forest <- c(192,11,28)
water <- c(32,84,141)
# 1°colonna: bande; 2°colonna valori parte vegetata (riflettanza); 3°colonna valori parte fluviale (riflettanza)
# Funzione data.frame: crea un dataframe (tabella)
spectrals <- data.frame(band, forest, water)
# Funzione per avere le info sul file
spectrals
#    band forest water
#  1    1    192    32
#  2    2     11    84
#  3    3     28   141

# Plot delle firme spettrali
# Funzione ggplot: determina l'estetica del grafico
# Funzione geom_line: connette le osservazioni a seconda del dato che è sulla X/Y
ggplot(spectrals, aes(x=band)) + geom_line(aes(y=forest), color="green")
ggplot(spectrals, aes(x=band)) + geom_line(aes(y=forest), color="green") + geom_line(aes(y=water), color="blue") 
# Funzione labs: modifica le etichette degli assi, le legende e il plottaggio
ggplot(spectrals, aes(x=band)) + geom_line(aes(y=forest), color="green") + geom_line(aes(y=water), color="blue") + labs(x="band", y="reflectance")





# Funzione brick per importare dalla cartella i dati/immagine: importa tutte le bande
defor1 <- brick("defor1.jpg")

# Funzione per avere le info sul file: nomi bande
defor1
# Ha 3 bande: defor 2.1 - 2.2 - 2.3
# Corrispondono a: NIR - RED - GREEN

# Comparazione defor1/defor2 su 5 punti
# Funzione plotRGB: defor1
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
# Bisogna avere la mappa fatta con plotRGB aperta sotto
# Funzione: click, usa immagine plotRGB per creare le firme spettrali # Serve pacchetto: rgdal
click(defor1, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")
# Cliccare sulla mappa nella parte ancora vegetata (rosso) e sul fiume, in R appaiono le info definite con la funzione: click (vedi riga sopra)
# Risultati:
#      x    y   cell defor1.1 defor1.2 defor1.3
#1 455.5 90.5 276774      208       13       29
#      x    y   cell defor1.1 defor1.2 defor1.3
#1 430.5 77.5 286031      190        8       20
#      x    y   cell defor1.1 defor1.2 defor1.3
#1 442.5 56.5 301037      158       26       39
#      x    y   cell defor1.1 defor1.2 defor1.3
#1 469.5 74.5 288212      216       19       39
#      x    y   cell defor1.1 defor1.2 defor1.3
#1 467.5 52.5 303918      155        0        5

# Funzione plotRGB: defor2
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
# Bisogna avere la mappa fatta con plotRGB aperta sotto
# Funzione: click, usa immagine plotRGB per creare le firme spettrali # Serve pacchetto: rgdal
click(defor2, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")
# Cliccare sulla mappa nella parte ancora vegetata (rosso) e sul fiume, in R appaiono le info definite con la funzione: click (vedi riga sopra)
# Risultati:
#      x    y   cell defor2.1 defor2.2 defor2.3
#1 423.5 94.5 275035      184      182      159
#      x     y   cell defor2.1 defor2.2 defor2.3
#1 453.5 103.5 268612      141      169      146
#      x    y   cell defor2.1 defor2.2 defor2.3
#1 459.5 89.5 278656      155      181      170
#      x    y   cell defor2.1 defor2.2 defor2.3
#1 435.5 80.5 285085      210      189      162
#      x    y   cell defor2.1 defor2.2 defor2.3
#1 451.5 73.5 290120       85      101       74

# Definire le colonne del dataset
band <- c(1,2,3)
time1 <- c(208,13,29)
time2 <- c(184,182,159)
 # Funzione data.frame: crea un dataframe (tabella)
spectralst <- data.frame(band, time1, time2)
# Funzione per avere le info sul file
spectralst
#  band time1 time2
#1    1   208   184
#2    2    13   182
#3    3    29   159

# Plot delle firme spettrali
# Funzione ggplot: determina l'estetica del grafico
# Funzione geom_line: connette le osservazioni a seconda del dato che è sulla X/Y 
# Funzione labs: modifica le etichette degli assi, le legende e il plottaggio
ggplot(spectrals, aes(x=band)) + geom_line(aes(y=time1), color="red") + geom_line(aes(y=time2), color="gray") + labs(x="band",y="reflectance")



