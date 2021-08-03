# R_code_exam.r
# Deforestazione Amazzonica tra il 2000 e 2012 (2000-2004-2008-2012)
# https://earthobservatory.nasa.gov/world-of-change/Deforestation

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/amazonian") # Windows

# Funzioni: library, necessarie per richiamare i pacchetti per la realizzazione del progetto
require(raster)
library(RStoolbox) # for vegetation indices calculation
library(ggplot2)
library(rasterVis)
library(rgdal)

# Importare i file tutti insieme (invece che singolarmente)
# Funzione list.files: crea lista di file per la funzione lapply 
alist <- list.files(pattern="amazon_deforestation") # pattern=scritta in comune nei file
# Funzione per avere le info sul file
alist
# Funzione lapply: applica alla lista dei file una funzione (raster) 
import <- lapply(alist,raster)
# Funzione per avere le info sul file
import
# Funzione stack: raggruppa e rinomina, in un unico pacchetto, i file raster separati
TGa <- stack(import)
# Funzione per avere le info sul file
TGa
# Funzione plot: del singolo file
plot(TGa)
# Funzione plotRGB: crea plot con immagini sovrapposte
plotRGB(TGa, 1, 2, 3, stretch="Lin")
# Funzione ggr: plotta file raster in differenti scale di grigio, migliorando la qualità dell'immagine e aggiungengo le coordinate spaziali sugli assi x e y
ggRGB(TGa, r=1, g=2, b=3, stretch="lin") # "lin": lineare, amplia i valori

# Funzione levelplot: disegna più grafici di colore falso con una singola legenda
levelplot(TGa)
# Cambio di colori a piacimento (colorRampPalette si può usare solo su immagine singole, non su RGB)
cls<-colorRampPalette(c("white","dark green","yellow","red","black"))(100)
# Nuovo levelplot col cambio di colori, nome e titolo
levelplot(TGa,col.regions=cls, main="Variation forest cover in time", names.attr=c("July 2000","August 2004", "July 2008", "July 2012"))


##


# Plot di tutte le correlazioni tra bande di un dataset (matrice di scatterplot di dati, non immagini)
# La tabella riporta in diagonale le bande (sono le variabili), l'indice di correlazione varia da 0(negativo) a 1 (positivo)
pairs(TGa)
# Indice di correlazione: più le bande sono correlate e maggiore sarà la dimensione dei caratteri

##

# Importazione delle singole immagini per effettuare comparazioni
# Funzione: brick, importa i singoli file
# Funzione brick per importare i dati/immagine
a_d_2000 <- brick("amazon_deforestation_2000.jpg")
a_d_2012 <- brick("amazon_deforestation_2012.jpg")

# 12. spectral_signatures


# Funzione plotRGB: a_d_2000
plotRGB(a_d_2000, r=1, g=2, b=3, stretch="lin") # "lin": lineare, amplia i valori

# Bisogna avere la mappa fatta con plotRGB aperta sotto
# Funzione: click, usa immagine plotRGB per creare le firme spettrali 
click(a_d_2000, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")

#       x     y   cell amazon_deforestation_2000.1 amazon_deforestation_2000.2 amazon_deforestation_2000.3
# 1 342.5 362.5  84583                          41                          64                          48 # valori parte forestale
# 2 341.5 257.5 160182                          38                          61                          43 # valori parte forestale
# 3 426.5 343.5  98347                          46                          70                          54 # valori parte forestale
  
# Definire le colonne del dataset
bande <- c(1,2,3)
area_foresta01 <- c(41,64,48)
area_foresta02 <- c(38,61,43)
area_foresta03 <- c(46,70,54)

# Funzione data.frame: crea un dataframe (tabella)
spectrals <- data.frame(bande, area_foresta01, area_foresta02, area_foresta03)
# Funzione per avere le info sul file
spectrals
#  bande area_foresta01 area_foresta02 area_foresta03
#      1             41             38             46
#      2             64             61             70
#      3             48             43             54

# Plot delle firme spettrali
# Funzione ggplot: determina l'estetica del grafico
# Funzione geom_line: connette le osservazioni a seconda del dato che è sulla X/Y
# Funzione labs: modifica le etichette degli assi, le legende e il plottaggio
ggplot(spectrals, aes(x=bande)) +
 geom_line(aes(y=area_foresta01), color="green") +
 geom_line(aes(y=area_foresta02), color="red") +
 geom_line(aes(y=area_foresta03), color="blue") +
 labs(x="bande",y="reflectance")





# Funzione plotRGB: a_d_2012
plotRGB(a_d_2012, r=1, g=2, b=3, stretch="lin") # "lin": lineare, amplia i valori

# Bisogna avere la mappa fatta con plotRGB aperta sotto
# Funzione: click, usa immagine plotRGB per creare le firme spettrali 
click(a_d_2012, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")    

#      x     y   cell amazon_deforestation_2012.1 amazon_deforestation_2012.2 amazon_deforestation_2012.3
#  347.5 359.5  86748                          41                          67                          40 # valori parte forestale
#  432.5 340.5 100513                         126                         112                          86 # valori parte coltivata
#  347.5 259.5 158748                          43                          66                          46 # valori parte forestale

# Definire le colonne del dataset
bande <- c(1,2,3)
area_foresta01 <- c(41,67,44)
area_foresta02 <- c(126,112,86)
area_foresta03 <- c(43,66,46)

# Funzione data.frame: crea un dataframe (tabella)
spectralsa <- data.frame(bande, area_foresta01, area_foresta02, area_foresta03)
# Funzione per avere le info sul file
spectralsa
#  bande area_foresta01 area_foresta02 area_foresta03
#      1             41            126             43
#      2             67            112             66
#      3             44             86             46

# Plot delle firme spettrali
# Funzione ggplot: determina l'estetica del grafico
# Funzione geom_line: connette le osservazioni a seconda del dato che è sulla X/Y
# Funzione labs: modifica le etichette degli assi, le legende e il plottaggio
ggplot(spectralsa, aes(x=bande)) +
 geom_line(aes(y=area_foresta01), color="green") +
 geom_line(aes(y=area_foresta02), color="black") +
 geom_line(aes(y=area_foresta03), color="blue") +
 labs(x="bande",y="reflectance")



# Definire le colonne del dataset
bande <- c(1,2,3)
area_foresta01_anno2000 <- c(41,64,48)
area_foresta01_anno2012 <- c(41,67,44)
area_foresta02_anno2000 <- c(38,61,43)
area_foresta02_anno2012 <- c(126,112,86)
area_foresta03_anno2000 <- c(46,70,54)
area_foresta03_anno2012 <- c(43,66,46)
# Funzione data.frame: crea un dataframe (tabella)
spectralst <- data.frame(bande, area_foresta01_anno2000, area_foresta01_anno2012, area_foresta02_anno2000, area_foresta02_anno2012, area_foresta03_anno2000, area_foresta03_anno2012)
# Funzione per avere le info sul file
spectralst
#  bande area_foresta01_anno2000 area_foresta01_anno2012 area_foresta02_anno2000 area_foresta02_anno2012 area_foresta03_anno2000 area_foresta03_anno2012
#      1                      41                      41                      38                     126                      46                      43
#      2                      64                      67                      61                     112                      70                      66
#      3                      48                      44                      43                      86                      54                      46
# Plot delle firme spettrali
# Funzione ggplot: determina l'estetica del grafico
# Funzione geom_line: connette le osservazioni a seconda del dato che è sulla X/Y 
# Funzione labs: modifica le etichette degli assi, le legende e il plottaggio
ggplot(spectralst, aes(x=bande)) +
 geom_line(aes(y=area_foresta01_anno2000), color="lightgreen") +
 geom_line(aes(y=area_foresta01_anno2012), color="green") +
 geom_line(aes(y=area_foresta02_anno2000), color="white") +
 geom_line(aes(y=area_foresta02_anno2012), color="black") +
 geom_line(aes(y=area_foresta03_anno2000), color="blue") +
 geom_line(aes(y=area_foresta03_anno2012), color="lightblue") +
 labs(x="bande",y="reflectance")

#nel grafico vediamo come il pixel del 'area_foresta02_anno2000' ha la tipica firma di un pixel vegetato, mentre nel 'area_foresta02_anno2012' è molto cambiato.
#questo procedimento normalmente si fa con moltissimi pixel. si usa una funzione per la generazione dei punti random e poi un'altra per estrarre da tutti i valori delle bande


##


# Funzione: spectralIndices, per calcolare gli indici multi-spettrali
# Calcolo indici 1° immagine
vi1 <- spectralIndices(a_d_2000, green = 3, red = 2, nir = 1) #colori associati al N° della banda
# Cambio di colori
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(vi1, col=cl)

# Calcolo indici 2° immagine
vi2 <- spectralIndices(a_d_2012, green = 3, red = 2, nir = 1)
# Cambio di colori
cls <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(vi2, col=cls)





##



# deviazione standard? dvi/ndvi?

# ordinare (##)


---------------------------------------------------------------------------------------
