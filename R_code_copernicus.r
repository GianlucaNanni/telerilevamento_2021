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

# Riclassifico colori immagine
lswt <- raster::reclassify(lswt, cbind(252:255, NA), right=TRUE)

# resampling (ricampionamento)
# Funzione aggregate per ridurre (aggregare) N° pixel immagine, quindi si visualizza meglio xkè ha N° ristretto di pixel
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
# Funzione aggregate per ridurre (aggregare) N° pixel immagine, quindi si visualizza meglio xkè ha N° ristretto di pixel
# Funzione: fact=100, ogni 100 pixel avrò 1 pixel (linearmente 100x100 pixel li trasformiamo in 1 pixel)
vegpres <- aggregate(vegp, fact=100)
# Nuovo plot col cambio di colori
plot(vegpres, col=cl)
