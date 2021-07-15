# R_code_no2.r

# 1. Indicare la cartella da cui estrarre i dati (set working directory=setwd)
setwd("C:/lab/EN") # Windows

# Funzione library per richiamare il pacchetto: raster
library(raster) #oppure: require(raster)

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




