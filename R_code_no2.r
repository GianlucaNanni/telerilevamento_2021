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
