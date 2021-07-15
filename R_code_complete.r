# R_code_complete.r - Telerilevamento Geo-Ecologico
# Riepilogo di tutti i codici fatti durante il corso


# Sommario:

# 1. R_code_remote_sensing_first.r
# 2. R_code_time_series.r
# 3. R_code_copernicus.r
# 4. R_code_knitr.r
# 5. R_code_multivariate_analysis.r
# 6. R_code_classification.r
# 7. ggplot (Contenuto in: # 9. R_code_land_cover.r)
# 8. R_code_vegetation_indices.r
# 9. R_code_land_cover.r
# 10. R_code_variability.r
# 11. R_code_no2.r
# 12. R_code_spectral_signatures.r

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

# 7. ggplot
# Contenuto in: # 9. R_code_land_cover.r


library(raster)
library(RStoolbox)
library(ggplot2)
library(gridExtra)

setwd("~/lab/")

p224r63 <- brick("p224r63_2011_masked.grd")

ggRGB(p224r63,3,2,1, stretch="lin")
ggRGB(p224r63,4,3,2, stretch="lin")

p1 <- ggRGB(p224r63,3,2,1, stretch="lin")
p2 <- ggRGB(p224r63,4,3,2, stretch="lin")

grid.arrange(p1, p2, nrow = 2) # this needs gridExtra

# ----------------------------------------------------------------------------------------------------------------------------------

# 8. R_code_vegetation_indices.r

# R_code_vegetation_indices.r

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Codice per installare pacchetto aggiuntivo: rasterdiv (div= NIR-red)
# install.packages("rasterdiv") #già installato

# Funzione library per richiamare il pacchetto: raster
library(raster) #oppure: require(raster)

# Funzione library per richiamare il pacchetto: rasterdiv
library(rasterdiv)

# Funzione library per richiamare il pacchetto: RStoolbox
library(RStoolbox) # for vegetation indices calculation

# Funzione brick per importare i dati/immagine
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

# Funzione par: imposta più parametri grafici nella stessa immagine
# 2 righe; 1 colonna
# Funzione plotRGB: crea immagini multibanda con:
# banda1: NIR (infrarosso)
# banda2: red
# banda3: green
# par(mfrow=c(2,1))

# Funzione plotRGB: defor1
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
# Funzione plotRGB: defor2
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# Funzione per avere le info sul file: nomi bande
defor1
# Funzione per avere le info sul file: nomi bande
defor2

# Calcolo dell'indice di vegetazione dvi e comparazione tra l°e 2° immagine (defor1-defor2) per vederne la differenza
# Calcolo 1° indice: dvi1=NIR - red
dvi1 <- defor1$defor1.1 - defor1$defor1.2
# Plot:
plot(dvi1)
# Cambio di colori
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
# Nuovo plot col cambio di colori
plot(dvi1, col=cl)
# Nuovo plot col cambio di colori e titolo
plot(dvi1, col=cl, main="DVI at time 1")

# Calcolo 2° indice: dvi1=NIR - red
dvi2 <- defor2$defor2.1 - defor2$defor2.2
# Plot:
plot(dvi2)
# Cambio di colori
cls <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
# Nuovo plot col cambio di colori
plot(dvi2, col=cls)
# Nuovo plot col cambio di colori e titolo
plot(dvi2, col=cls, main="DVI at time 2")

# Comparazione: analisi multitemporale dei 2 indici
# Funzione par: imposta più parametri grafici nella stessa immagine
# 2 righe; 1 colonna
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cls, main="DVI at time 2")

# Differenza tra l°e 2° zona in tempi diverse
difdvi <- dvi1 - dvi2
# Cambio di colori per le differenze
cld <- colorRampPalette(c('blue','white','red'))(100)
# Nuovo plot col cambio di colori
plot(difdvi, col=cld)


# Calcolo dell'indice di vegetazione ndvi e comparazione tra l°e 2° immagine (defor1-defor2) per vederne la differenza
# Indice ndvi: normalizza i valori sulla somma delle variabili
# Calcolo 1° indice ndvi= (NIR-red) / (NIR+red)
ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)
# Cambio di colori
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(ndvi1, col=cl)

# Calcolo 2° indice ndvi= (NIR-red) / (NIR+red)
ndvi2 <- (defor2$defor2.1 - defor2$defor2.2) / (defor2$defor2.1 + defor2$defor2.2)
# Cambio di colori
cls <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(ndvi2, col=cls)


# Funzione: spectralIndices (Pacchetto: RStoolbox), per calcolare tutti gli indici
# Calcolo indici 1° immagine
vi1 <- spectralIndices(defor1, green = 3, red = 2, nir = 1) #colori associati al N° della banda
# Cambio di colori
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(vi1, col=cl)

# Calcolo indici 2° immagine
vi2 <- spectralIndices(defor2, green = 3, red = 2, nir = 1)
# Cambio di colori
cls <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(vi2, col=cls)

# Differenza tra l°e 2° zona in tempi diverse
difndvi <- ndvi1 - ndvi2
# Cambio di colori per le differenze
cld <- colorRampPalette(c('blue','white','red'))(100)
# Nuovo plot col cambio di colori
plot(difndvi, col=cld)


## # Worldwide NDVI
# Vediamo come l'indice di vegetaz., relazionato alle bande del NIR e red, varia nel pianeta

# Funzione library per richiamare il pacchetto: rasterdiv
library(rasterdiv)

# Funzione library per richiamare il pacchetto: rasterVis
library(rasterVis) #per la Funzione levelplot

# Plot NDVI
plot(copNDVI)
# Più biomassa c'è e maggiore sarà l'indice

# Funzione: cbind cambia dei valori (rimuovere l'acqua), significa che i pixel 253,254,255 sono trasformati in non valori (NA)
# Funzione reclassify: riclassifica colori immagine 
copNDVI <- reclassify(copNDVI, cbind(253:255, NA)) #i : di 253:255 significa da 253 a 255, quindi 253,254,255 sono NA
# Plot NDVI
plot(copNDVI)

# Funzione levelplot: disegna grafici di colore falso e di contorno
levelplot(copNDVI)

# ----------------------------------------------------------------------------------------------------------------------------------

# 9. R_code_land_cover.r

# R_code_land_cover.r
# Vedi CODICE (più specifico)

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

# defor1 (e2)
# names: defor1_.1, defor1_.2, defor1_.3 
# defor1_.1 = NIR
# defor1_.2 = red
# defor1_.3 = green

# Funzione brick per importare i dati/immagine
defor1 <- brick("defor1.jpg")
# Funzione plotRGB: crea immagini multibanda
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

# Funzione brick per importare i dati/immagine
defor2 <- brick("defor2.jpg")
# Funzione plotRGB: crea immagini multibanda
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# Funzione ggr: plotta file raster in differenti scale di grigio
ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
# Funzione ggr: plotta file raster in differenti scale di grigio
ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

# Funzione par: imposta più parametri grafici nella stessa immagine
par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# Multiframe con ggplot e gridExtra

# Codice per installare pacchetto aggiuntivo: gridExtra (permette di utilizzare ggplot per dati raster)
# install.packages("gridExtra") #già installato
# Funzione library per richiamare il pacchetto: gridExtra
library(gridExtra)

# Plot defor1:
p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
# Plot defor2:
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
# Funzione grid.arrange: determina N° di righe
grid.arrange(p1, p2, nrow=2)


## Proseguimento
# defor1
# Funzione unsuperClass: opera la classificazione non supervisionata (2 classi)
d1c <- unsuperClass(defor1, nClasses=2)
# Funzione per avere le info sul file
d1c
# Plot
plot(d1c$map)
# Funzione: set.seed(), permettere di ottenere risultati grafici (colori) inversi nel plot precedente (se serve)
# classe 1: agricoltura
# classe 2: forestra

# defor2
# Funzione unsuperClass: opera la classificazione non supervisionata (2 classi)
d2c <- unsuperClass(defor2, nClasses=2)
# Funzione per avere le info sul file
d2c
# Plot
plot(d2c$map)
# Funzione: set.seed(), permettere di ottenere risultati grafici (colori) inversi nel plot precedente (se serve)
# classe 1: agricoltura
# classe 2: forestra

# Funzione unsuperClass: opera la classificazione non supervisionata (3 classi)
d2c3 <- unsuperClass(defor2, nClasses=3)
# Plot
plot(d2c3$map)

# Funzione freq: calcolare la frequenza dei pixel di una certa classe (d1c)
freq(d1c$map)
#value  count
# [1,]     1 305319
# [2,]     2  35973

# Funzione: somma ( totale delle frequenze)
s1 <- 305319 + 35973
# Funzione per avere le info sul file
s1 # = 341292

# Funzione prop: calcolare la percentuale % (totale)
prop1 <- freq(d1c$map)/s1 #(freq./totale)
# Funzione per avere le info sul file
prop1
# value     count
# [1,] 0.8945976 (% foresta: 0.8945976*100=89.45976)
# [2,] 0.1054024 (% agricoltura)

# Stesso procedimento per: d2c
# Funzione freq: calcolare la frequenza dei pixel di una certa classe (d1c)
freq(d2c$map)
#value  count
# [1,]     1 163495
# [2,]     2 179231

# Funzione: somma ( totale delle frequenze)
s2 <- 163495 + 179231
# Funzione per avere le info sul file
s2 # = 342726

# Funzione prop: calcolare la percentuale % (totale)
prop2 <- freq(d2c$map)/s2 #(freq./totale)
# Funzione per avere le info sul file
prop2
# value     count
# [1,] 0.4770429 (% foresta)
# [2,] 0.5229571 (% agricoltura)



# Generare Dataframe
# Cover= prima colonna(variabile) fattori (valori categoriche: foresta, agricoltura)
# Percent_1992= seconda colonna (valori percetuale 1992)
# Percent_2006= terza colonna (valori percentuale 2006)
cover <- c("Forest","Agriculture") #sono i dati della colonna cover
percent_1992 <- c(89.45, 10.54) #nome 2°colonna, con % di prop1
percent_2006 <- c(52.29, 47.70) #nome 3°colonna, con % di prop2

# Funzione data.frame: crea un dataframe (tabella)
percentages <- data.frame(cover, percent_1992, percent_2006)
# Funzione per avere le info sul file
percentages
# cover percent_1992 percent_2006
# 1      Forest        89.45        52.29
# 2 Agriculture        10.54        47.70

# Funzione ggplot: grafico
# Funzione geom_bar: tipo di grafico
p1 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
# Funzione per avere le info grafiche sul file
p1

# Funzione ggplot: grafico
# Funzione geom_bar: tipo di grafico
p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")
# Funzione per avere le info grafiche sul file
p2

# Funzione grid.arrange: grafici multipli in 1 pag.
grid.arrange(p1, p2, nrow=1) #utile cambiare colori grafico a barre

# ----------------------------------------------------------------------------------------------------------------------------------

# 10. R_code_variability.r

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


# Funzione source: carica una parte di codice dall'esterno
source("source_test_lezione.r.txt")

# Ricordarsi di immettere le medesime library
library(raster)
library(RStoolbox)
library(ggplot2) # for ggplot plotting
library(gridExtra) # for plotting ggplots together
# Codice per installare pacchetto aggiuntivo: viridis
# install.packages("viridis") #già installato
library(viridis) # per mappa a colori ggplot
# Funzione source: richiama una parte di codice già creato
source("source_ggplot.r.txt")


# Plot dati ggplot
# https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html
# https://www.rdocumentation.org/packages/viridis/versions/0.6.1/topics/scale_fill_viridis

# Funzione ggplot: crea una nuova finestra (vuota) e aggiunge dei blocchi (+)
p1 <- ggplot() +
# Funzione geom: definisce il tipo di geometria
# Funzione geom_raster:noi usiamo dei pixel, quindi geometria raster
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) + #mapping= cosa mappare(x,y,valore)
# Funzione per usare la legenda standard viridis
scale_fill_viridis() + 
# Funzione ggtitle: per aggiungere il titolo
ggtitle("Standard deviation of PC1 by viridis colour scale")
# Funzione per avere le info grafiche sul file
p1

# Funzione ggplot: crea una nuova finestra (vuota) e aggiunge dei blocchi (+)
p2 <- ggplot() +
# Funzione geom: definisce il tipo di geometria
# Funzione geom_raster:noi usiamo dei pixel, quindi geometria raster
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) + #mapping= cosa mappare(x,y,valore)
# Funzione per usare la legenda standard viridis
scale_fill_viridis(option = "magma")  + 
# Funzione ggtitle: per aggiungere il titolo
ggtitle("Standard deviation of PC1 by magma colour scale")
# Funzione per avere le info grafiche sul file
p2

# Funzione ggplot: crea una nuova finestra (vuota) e aggiunge dei blocchi (+)
p3 <- ggplot() +
# Funzione geom: definisce il tipo di geometria
# Funzione geom_raster:noi usiamo dei pixel, quindi geometria raster
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) + #mapping= cosa mappare(x,y,valore)
# Funzione per usare la legenda standard viridis
scale_fill_viridis(option = "turbo")  +
# Funzione ggtitle: per aggiungere il titolo
ggtitle("Standard deviation of PC1 by turbo colour scale")
# Funzione per avere le info grafiche sul filep3
p3

# Funzione grid.arrange: grafici multipli in 1 pag.
grid.arrange(p1, p2, p3, nrow = 1)

# ----------------------------------------------------------------------------------------------------------------------------------

# 11. R_code_no2.r

# R_code_no2.r


# 1. Indicare la cartella da cui estrarre i dati (set working directory=setwd)
setwd("C:/lab/EN") # Windows

# Funzione library per richiamare il pacchetto: raster
library(raster) #oppure: require(raster)

# Funzione library per richiamare il pacchetto: RStoolbox
library(RStoolbox) # Per usare rasterPCA

# Funzione library per richiamare il pacchetto: RStoolbox
library(RStoolbox) # Per usare focal


# 2. Importare la prima immagine (singola banda)
# Funzione brick per importare dalla cartella i dati/immagine: importa tutte le bande
# Funzione raster per importare i singoli strati di dati: importa una singola banda (la 1°)
EN01 <- raster("EN_0001.png")
 

# 3. Plot della prima immagine importata con ColorRampPalette
# Cambio di colori N.B: colorRampPalette si può usare solo su immagine singole, non su RGB
cls <- colorRampPalette(c("red","pink","orange","yellow")) (200)
plot(EN01, col=cls)


# 4. Importare l'ultima immagine (la 13°) e plottare con ColorRampPalette
# Funzione raster per importare i singoli strati di dati: importa una singola banda (la 13°)
EN13 <- raster("EN_0013.png")

# Cambio di colori (ColorRampPalette)
cls <- colorRampPalette(c("red","pink","orange","yellow")) (200)
plot(EN13, col=cls)


# 5. Vedere la differenza tra le 2 immagini e fare il plot
# Se faccio la differenza tra mappa di marzo (valore basso) e gennaio (valore alto) la differenza sarà negativa (viceversa sarà positivo)
ENdif <- EN13 - EN01
# Se faccio la differenza tra mappa di gennaio (valore alto) e marzo (valore basso) la differenza sarà positiva (viceversa sarà negativa)
ENdif <- EN01 - EN13
# Plot
plot(ENdif, col=cls)


# 6. Plot di tutte le immagini insieme
# Funzione par: imposta più parametri grafici nella stessa immagine
par(mfrow=c(3,1))
plot(EN01, col=cls, main="NO2 in January")
plot(EN13, col=cls, main="NO2 in March")
plot(ENdif, col=cls, main="Difference (January - March)")


# 7. Importare intero set (13 immagini)
# Importare tutte le immagini INSIEME
# Funzione list.files: crea lista di file per la funzione lapply
rlist <- list.files(pattern="EN")
# Funzione per avere le info sul file
rlist
# Funzione lapply: applica a lista di file una funzione (raster) 
import <- lapply(rlist,raster)
# Funzione per avere le info sul file
import
# Funzione stack: raggruppa e rinomina file raster separati
EN <- stack(import)
# Funzione per avere le info sul file
EN
# Plot ColorRampPalette
plot(EN, col=cls)


# 8. Replicare il plot dell'immagine 1 e 13 usando lo: stack
# Funzione per avere le info sul file
EN
# Funzione par: imposta più parametri grafici nella stessa immagine
# $: lega il dataset con le singole bande
par(mfrow=c(2,1))
plot(EN$EN_0001, col=cls)
plot(EN$EN_0013, col=cls)
# In questo modo le immagini sono prese dallo 'stack' e non dall'importazione iniziale


# 9. Calcolare la PCA per le 13 immagini
# Funzione rasterPCA: compatta il pacchetto di dati in un N° minore di bande
ENpca <- rasterPCA(EN)

# Funzione summary: sommario del modello
summary(ENpca$model)

# Funzione per avere le info sul file
ENpca

# Plot della mappa
plot(ENpca$map)

# Funzione plotRGB (della mappa) con 3 componenti principali
plotRGB(ENpca$map, r=1, g=2, b=3, stretch="lin")


# 10. Calcolare la variabilità (deviazione standard locale) della 1° PCA
# Funzione focal: calcolo deviazione standard (variabilità immagine)
PC1sd <- focal(ENpca$map$PC1, w=matrix(1/9, nrow=3, ncol=3), fun=sd)
# Plot ColorRampPalette
plot(PC1sd, col=cls)

# ----------------------------------------------------------------------------------------------------------------------------------

# 12. R_code_spectral_signatures.r

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
