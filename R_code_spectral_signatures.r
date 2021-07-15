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
ggplot(spectrals, aes(x=band)) +
 geom_line(aes(y=time1), color="red") +
 geom_line(aes(y=time2), color="gray") +
 labs(x="band",y="reflectance")

# Definire le colonne del dataset
band <- c(1,2,3)
time1pixel1 <- c(208,13,29)
time1pixel2 <- c(190,8,20)
time2pixel1 <- c(184,182,159)
time2pixel2 <- c(141,169,146)
# ecc.. fino time1/2pixel5 -------> meglio rinominare cosi quando si deve fare comparazione, è più chiaro
# Funzione data.frame: crea un dataframe (tabella)
spectralst <- data.frame(band, time1, time2, time1pixel2, time2pixel2)
# Funzione per avere le info sul file
spectralst
#  band time1 time2 time1pixel2 time2pixel2
#1    1   208   184         190         141
#2    2    13   182           8         169
#3    3    29   159          20         146
# Plot delle firme spettrali
# Funzione ggplot: determina l'estetica del grafico
# Funzione geom_line: connette le osservazioni a seconda del dato che è sulla X/Y 
# Funzione labs: modifica le etichette degli assi, le legende e il plottaggio
# plot the sepctral signatures
# plot the sepctral signatures
ggplot(spectralst, aes(x=band)) +
 geom_line(aes(y=time1), color="red") +
 geom_line(aes(y=time1pixel2), color="red") +
 geom_line(aes(y=time2), color="gray") +
 geom_line(aes(y=time2pixel2), color="gray") +
 labs(x="band",y="reflectance")

#nel grafico vediamo come il pixel del time1(time1pixel1) c'è la tipica firma di un pixel vegetato, mentre nel time2(time2pixel1) è molto cambiata.
#questo procedimento normalmente si fa con moltissimi pixel. si usa una funzione per la generazione dei punti random e poi un'altra per estrarre da tutti i valori delle bande



# Ripetiamo lo stesso esercizio con immagine prese dall'Earth observatory
# https://earthobservatory.nasa.gov/blogs/earthmatters/2021/06/15/june-puzzler-7/

# Funzione brick per importare dalla cartella i dati/immagine: importa tutte le bande
eo <- brick("june_puzzler.jpg")

# Funzione plotRGB: eo
plotRGB(eo, r=1, g=2, b=3, stretch="hist")

# Bisogna avere la mappa fatta con plotRGB aperta sotto
# Funzione: click, usa immagine plotRGB per creare le firme spettrali # Serve pacchetto: rgdal
click(eo, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")
# Risultati:
#      x     y  cell june_puzzler.1 june_puzzler.2 june_puzzler.3
#1 248.5 423.5 40569            215            184              5
#      x     y   cell june_puzzler.1 june_puzzler.2 june_puzzler.3
#1 234.5 178.5 216955              8            136              0
#      x     y   cell june_puzzler.1 june_puzzler.2 june_puzzler.3
#1 229.5 193.5 206150             17              7              6

# Definire le colonne del dataset
band <- c(1,2,3)
stratum1 <- c(215,184,5)
stratum2 <- c(8,136,0)
stratum3 <- c(17,7,6)
# Funzione data.frame: crea un dataframe (tabella)
spectralsg <- data.frame(band, stratum1, stratum2, stratum3)
# Funzione per avere le info sul file
spectralsg
#  band stratum1 stratum2 stratum3
#1    1      215        8       17
#2    2      184      136        7
#3    3        5        0        6

# Plot delle firme spettrali
# Funzione ggplot: determina l'estetica del grafico
# Funzione geom_line: connette le osservazioni a seconda del dato che è sulla X/Y 
# Funzione labs: modifica le etichette degli assi, le legende e il plottaggio
ggplot(spectralsg, aes(x=band))+
geom_line(aes(y=stratum1), col="yellow")+
geom_line(aes(y=stratum2), col="green")+
geom_line(aes(y=stratum3), col="blue")+
labs(x="band", y="reflectance")

#tutto questo processo serve ad identificare delle classi con sui dividere/classificare la nostra immagine.
