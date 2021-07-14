# R_code_complete.r - Telerilevamento Geo-Ecologico
# Riepilogo di tutti i codici fatti durante il corso


# Sommario:

# 1. R_code_remote_sensing_first.r
# 2. R_code_time_series.r
# 3. R_code_copernicus.r
# 4. R_code_knitr.r
# 5. R_code_multivariate_analysis.r
# 6. R_code_classification.r


# ----------------------------------------------------------------------------------------------------------------------------------

# 1. R_code_remote_sensing_first.r

# Il mio primo codice in R per il telerilevamento

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Codice per installare i pacchetti aggiuntivi raster (già installato)
#install.packages("raster")

# Funzione library per richiamare il pacchetto raster
library(raster)

# Funzione brick per importare i dati/immagine
p224r63_2011<-brick("p224r63_2011_masked.grd")

# Funzione per avere le info sul file
p224r63_2011

# Funzione plot: immagini per visualizzare le varie bande
plot(p224r63_2011)

# Cambio di colori
cl<-colorRampPalette(c("black","grey","light grey"))(100)
# Nuovo plot col cambio di colori
plot(p224r63_2011, col=cl)

# Cambio di colori a piacimento 
clp<-colorRampPalette(c("black","blue","pink","green","yellow"))(100)
# Nuovo plot col cambio di colori
plot(p224r63_2011, col=clp)


# NUOVA IMMAGINE
# Funzione library per richiamare il pacchetto raster
library(raster)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Funzione brick per importare i dati/immagine
p224r63_2011 <- brick("p224r63_2011_masked.grd")

# Cambio di colori
cls <- colorRampPalette(c("red","pink","orange","purple")) (100)
plot(p224r63_2011, col=cls)

# Funzione per avere le info sul file
p224r63_2011

# Spiegazione delle bande di LANDSAT
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

# dev.off() : ripulisce la finestra grafica corrente, se non è già stata chiusa manualmente
dev.off()

# Funzione plot: immagine per visualizzare una sola banda ($banda 1)
plot(p224r63_2011$B1_sre)

# Plot della banda 1 con colori predefiniti (colorRampPalette)
cls <- colorRampPalette(c("red","blue","green","purple")) (100)
# Nuovo plot col cambio di colori per una sola banda
plot(p224r63_2011$B1_sre, col=cls)

# dev.off() : ripulisce la finestra grafica corrente
dev.off()

# Funzione par: imposta più parametri grafici nella stessa immagine
# 1 riga 2 colonne
par(mfrow=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
# 2 righe; 1 colonna 
par(mfrow=c(2,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
# 1 colonna; 2 righe (par(mfcol=...))
par(mfcol=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
# N.B: fare doppio invio, uno per ogni plot

# Plot delle prime 4 bande di Landsat
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

# Plot distribuzione "quadrata" delle 4 bande Landsat
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

# Plot distribuzione "quadrata" delle 4 bande Landsat
# con colorRampPalette per ogni banda
# Banda del BLU
par(mfrow=c(2,2))
clb <- colorRampPalette(c("dark blue","blue","light blue")) (100)
plot(p224r63_2011$B1_sre, col=clb)
# Banda del VERDE
clg <- colorRampPalette(c("dark green","green","light green")) (100)
plot(p224r63_2011$B2_sre, col=clg)
# Banda del ROSSO
clr <- colorRampPalette(c("dark red","red","pink")) (100)
plot(p224r63_2011$B3_sre, col=clr)
# Banda dell'INFRAROSSO
clnir <- colorRampPalette(c("red","orange","yellow")) (100)
plot(p224r63_2011$B4_sre, col=clnir)


# Visualizzazione di dati in PLOT RGB
# Funzione library per richiamare il pacchetto raster
library(raster)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Funzione brick per importare i dati/immagine
p224r63_2011 <- brick("p224r63_2011_masked.grd")

# Spiegazione delle bande di LANDSAT
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

# Funzione plotRGB: crea immagini multibanda (colori naturali)
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
# Funzione plotRGB con infrarosso
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# Plot multibanda RGB 2x2
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# Salvare immagine pdf in C:lab
pdf("il_mio_primo_pdf_con_R.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
dev.off()

# Funzione plotRGB: crea immagini multibanda ad alto contrasto
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

# Plot multibanda RGB: Lin/hist
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")  #colori naturali
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")  #colori falsi
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist") #colori falsi con istogramma allungato (hanno più contrasto)

# Codice per installare pacchetto aggiuntivo
install.packages("RStoolbox")

# Funzione library per richiamare il pacchetto
library(RStoolbox)


#IMMAGINE p224r63_1988 - Set multitemporale
# Funzione library per richiamare il pacchetto raster
library(raster)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Funzione brick per importare i dati/immagine
p224r63_2011 <- brick("p224r63_2011_masked.grd")

# Funzione per avere le info sul file
p224r63_2011

# Funzione brick per importare i dati/immagine
p224r63_1988 <- brick("p224r63_1988_masked.grd")

# Funzione per avere le info sul file 
# è la stessa immagine per dimensioni, ma con valori di pixel diversi perchè è di un momento diverso (1988)
p224r63_1988

# Funzione plot: immagini per visualizzare le varie bande
plot(p224r63_1988)

# Funzione plotRGB: crea immagini multibanda (colori naturali)
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin")
# Funzione plotRGB con infrarosso
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")

# Plot multibanda RGB 2x2 (immagini 1998-2011)
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")

# Salvare immagine pdf in C:lab
pdf("multitemporale.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
dev.off()

# ----------------------------------------------------------------------------------------------------------------------------------

# 2. R_code_time_series.r

# Analisi delle serie temporali
# Groenlandia (Greenland) aumento della temperatura
# Dati e codici di Emanuela Cosma

# Codice per installare pacchetto aggiuntivo raster (già installato)
#install.packages("raster")

# Funzione library per richiamare il pacchetto: raster
library(raster)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/greenland") # Windows

# Codice per installare pacchetto aggiuntivo "rasterVis": metodo di visualizzazione per i dati raster
#install.packages("rasterVis") #(già installato)

# Funzione library per richiamare il pacchetto: rasterVis
library(rasterVis)

# Funzione raster per importare singoli strati di dati
lst_2000 <- raster("lst_2000.tif")
# Funzione plot: immagini per visualizzare le varie bande
plot(lst_2000)
# Nome immagine: visualizza valori min/max
lst_2000

# Funzione raster per importare singoli strati di dati
lst_2005 <- raster("lst_2005.tif")
# Funzione plot: immagini per visualizzare le varie bande
plot(lst_2005)

# Funzione raster per importare singoli strati di dati
lst_2010 <- raster("lst_2010.tif")
# Funzione plot: immagini per visualizzare le varie bande
plot(lst_2010)

# Funzione raster per importare singoli strati di dati
lst_2015 <- raster("lst_2015.tif")
# Funzione plot: immagini per visualizzare le varie bande
plot(lst_2015)

# Funzione par: imposta più parametri grafici nella stessa immagine
# Plot distribuzione "quadrata" di 4 bande
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# Importare tutte le immagini INSIEME
# Funzione list.files: crea lista di file per la funzione lapply
rlist <- list.files(pattern="lst") # pattern=scritta in comune nei file
# Funzione per avere le info sul file
rlist
# Funzione lapply: applica a lista di file una funzione (raster) 
import <- lapply(rlist,raster)
# Funzione per avere le info sul file
import
# Funzione stack: raggruppa e rinomina file raster separati
TGr <- stack(import)
# Funzione per avere le info sul file
TGr
# Funzione plot: del singolo file
plot(TGr)
# Funzione plotRGB: crea immagini sovrapposte 2000(1=rosso),2005(2=verdi),2010(3=blu)
plotRGB(TGr, 1, 2, 3, stretch="Lin") # a seconda del colore i valori di lst sono più alti
# Oppure:
plotRGB(TGr, 1, 2, 3, stretch="Lin")


#Estensione della fusione dello strato di ghiaccio
# Codice per installare pacchetto aggiuntivo: raster (già installato)
#install.packages("raster")

# Funzione library per richiamare il pacchetto raster
library(raster)

# Codice per installare pacchetto aggiuntivo "rasterVis": metodo di visualizzazione per i dati raster
#install.packages("rasterVis") #(già installato)

# Funzione library per richiamare il pacchetto: rasterVis
library(rasterVis)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/greenland") # Windows

# Importare tutte le immagini INSIEME
# Funzione list.files: crea lista di file per la funzione lapply
rlist <- list.files(pattern="lst") # pattern=scritta in comune file
rlist

# Funzione lapply: applica a lista di file una funzione (raster) 
import <- lapply(rlist,raster)
import

# Funzione stack: raggruppa e rinomina file raster separati
TGr <- stack(import)
TGr

# Funzione levelplot: disegna grafici di colore falso e di contorno
levelplot(TGr)
# Funzione levelplot $: considera ogni file interno
levelplot(TGr$lst_2000)

# Cambio di colori
# N.B: colorRampPalette si può usare solo su immagine singole, non su RGB
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
# Nuovo levelplot col cambio di colori
levelplot(TGr, col.regions=cl)
# Nuovo levelplot col cambio di colori e nome
levelplot(TGr,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
# Nuovo levelplot col cambio di colori, nome e titolo
levelplot(TGr,col.regions=cl, main="LST variation in time", names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))


#Melt
# Differenza nello strato di ghiaccio 1979-2007

# Importare tutte le immagini INSIEME
# Funzione list.files: crea lista di file per la funzione lapply
meltlist <- list.files(pattern="melt") # pattern=scritta in comune nei file

# Funzione lapply: applica a lista di file una funzione (raster)
melt_import <- lapply(meltlist,raster)

# Funzione stack: raggruppa e rinomina file raster separati
melt <- stack(melt_import)

# Funzione per avere le info sul file
melt

# Funzione levelplot: disegna grafici di colore falso e di contorno
levelplot(melt) #valore dello scoglimento ghiacci, più alto valore=più scoglimento

# Nome associato a sottrazione tra dati (valori un immagine meno valori altra immagine)
melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt

# Cambio di colori  
clb <- colorRampPalette(c("blue","white","red"))(100)
# Plot col cambio di colori
plot(melt_amount, col=clb)

# Nuovo levelplot col cambio di colori
levelplot(melt_amount, col.regions=clb)

# ----------------------------------------------------------------------------------------------------------------------------------

# 3. R_code_copernicus.r

# R_code_copernicus.r
# Visualizzazione dati Copernicus
# Lake Surface Water Temperature - NON FUNZIONA PLOT

# Funzione library per richiamare il pacchetto: raster
library(raster)

# Codice per installare pacchetto aggiuntivo: ncdf4
# install.packages("ncdf4") #già installato

# Funzione library per leggere file: .nc
library(ncdf4)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Nome dataset: lswt (Lake Surface Water Temperature)
# Funzione raster per importare un singolo layer (strato)
lswt <- raster("c_gls_LSWT_202104010000_GLOBE_SLSTRAB_v1.1.0.nc")

# Funzione per avere le info sul file
lswt

# Cambio di colori
cl <- colorRampPalette(c('light blue','green','red','yellow'))(100)
# Plot col cambio di colori
plot(lswt, col=cl)

# Funzione reclassify: riclassifica colori immagine
lswt <- raster::reclassify(lswt, cbind(252:255, NA), right=TRUE)

# resampling (ricampionamento)
# Funzione aggregate per ridurre (aggregare) N° pixel immagine e diminuire la risoluzione, quindi si visualizza meglio xkè ha N° ristretto di pixel
# Funzione: fact=100, ogni 100 pixel avrò 1 pixel (linearmente 100x100 pixel li trasformiamo in 1 pixel)
lswtres <- aggregate(lswt, fact=100)
# Nuovo plot col cambio di colori
plot(lswtres, col=cl)


## Visualizzazione dati Copernicus
## Vegetation Properties - FCOVER 1km Global V1

# Funzione library per richiamare il pacchetto: raster
library(raster)

# Codice per installare pacchetto aggiuntivo: ncdf4
# install.packages("ncdf4") #già installato

# Funzione library per leggere file: .nc
library(ncdf4)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Nome dataset: albedo (Vegetation Properties)
# Funzione raster per importare un singolo layer (strato)
vegp <- raster("c_gls_FCOVER_202006130000_GLOBE_PROBAV_V1.5.1.nc")

# Funzione per avere le info sul file
vegp

# Cambio di colori
cl <- colorRampPalette(c('light blue','green','red','yellow'))(100)
# Plot col cambio di colori
plot(vegp, col=cl)

# resampling (ricampionamento)
# Funzione aggregate per ridurre (aggregare) N° pixel immaginee diminuire la risoluzione, quindi si visualizza meglio xkè ha N° ristretto di pixel
# Funzione: fact=100, ogni 100 pixel avrò 1 pixel (linearmente 100x100 pixel li trasformiamo in 1 pixel)
vegpres <- aggregate(vegp, fact=100)
# Nuovo plot col cambio di pixel
plot(vegpres, col=cl)

# ----------------------------------------------------------------------------------------------------------------------------------

# 4. R_code_knitr.r

# R_code_knitr.r

# USIAMO UN CODICE RINOMINATO (template) PER FARE FILE FINALE
# Codice per installare pacchetto aggiuntivo: knitr
# install.packages("knitr") #già installato
# Funzione library per richiamare il pacchetto: knitr
# library o require sono uguali
library(knitr)

# Codice per installare pacchetto aggiuntivo: RStoolbox
# install.packages("RStoolbox") #già installato
# Funzione library per richiamare il pacchetto: RStoolbox
library(RStoolbox)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/greenland") # Windows

# Codice per installare pacchetto aggiuntivo: tinytex
# install.packages("tinytex") #già installato
# Funzione library per richiamare il pacchetto: tinytex
library(tinytex)
tinytex::install_tinytex()

# Copiare un codice (Greenland) in Documento di testo (.txt) e copiare in (C:lab)
# OVERLEAF: genera output completamente compilato
# Funzione stitch: creare automaticamente un report basato su uno script di R
stitch("R_code_greenland.r.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))

# ----------------------------------------------------------------------------------------------------------------------------------

# 5. R_code_multivariate_analysis.r

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

# è importante fare analisi multivariata per ridurre la correlazione tra le variabili: es. ridurre un set di variabili

# ----------------------------------------------------------------------------------------------------------------------------------

# 6. R_code_classification.r

# R_code_classification.r

# Funzione library per richiamare il pacchetto: raster
library(raster)

# Funzione library per richiamare il pacchetto: RStoolbox
library(RStoolbox)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Funzione brick per importare i dati/immagine
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# Funzione per avere le info sul file
so

# Funzione plotRGB: crea immagini multibanda
plotRGB(so, 1, 2, 3, stretch="lin")

# Funzione unsuperClass: opera la classificazione non supervisionata (3 classi)
soc <- unsuperClass(so, nClasses=3)
# Funzione per avere le info sul file
soc
# Cambio di colori
cl <- colorRampPalette(c('yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(soc$map,col=cl) # Oppure plot(soc$map) se NON c'è la colorRampPalette prima

# Funzione unsuperClass: opera la classificazione non supervisionata (20 classi)
# A 20 classi
sotw <- unsuperClass(so, nClasses=20)
# Funzione per avere le info sul file
sotw
# Cambio di colori
cls <- colorRampPalette(c('yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(sotw$map,col=cls) 


## Download immagine da: https://www.esa.int/ESA_Multimedia/Missions/Solar_Orbiter/(result_type)/images
# Funzione brick per importare i dati/immagine
sun <- brick("sun.png")

# Funzione unsuperClass: opera la classificazione non supervisionata
sunc <- unsuperClass(sun, nClasses=3)
# Funzione per avere le info sul file
sunc
# Plot:
plot(sunc$map)


### Grand Canyon
# https://landsat.visibleearth.nasa.gov/view.php?id=80948

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Funzione library per richiamare il pacchetto: raster
library(raster)

# Funzione library per richiamare il pacchetto: RStoolbox
library(RStoolbox)

# Funzione brick per importare i dati/immagine
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")

# Funzione per avere le info sul file
gc

# Funzione plotRGB: crea immagini multibanda
plotRGB(gc, r=1, g=2, b=3, stretch="lin")
# Funzione plotRGB: crea immagini multibanda ad alto contrasto
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

# Funzione unsuperClass: opera la classificazione non supervisionata (2 classi)
gcc2 <- unsuperClass(gc, nClasses=2)
# Funzione per avere le info sul file
gcc2
# Plot:
plot(gcc2$map)

# Funzione unsuperClass: opera la classificazione non supervisionata (4 classi)
gcc4 <- unsuperClass(gc, nClasses=4)
# Funzione per avere le info sul file
gcc4
# Cambio di colori
clrpp <- colorRampPalette(c('red','purple','orange','pink'))(100)
# Nuovo plot col cambio di colori
plot(gcc4$map,col=clrpp) 

# ----------------------------------------------------------------------------------------------------------------------------------

# 7. 

