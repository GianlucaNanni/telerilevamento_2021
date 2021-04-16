# R_code_copernicus.r
# Visualizzazione dati Copernicus

# Funzione library per richiamare il pacchetto: raster
library(raster)

# Codice per installare pacchetto aggiuntivo: ncdf4
# install.packages("ncdf4") #già inserito

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
# Funzione aggregate per ridurre linearmente N° pixel immagine (=100), quindi si visualizza meglio
lswtres <- aggregate(lswt, fact=100)
# Nuovo plot col cambio di colori
plot(lswtres, col=cl)

#
# Codice per installare pacchetto aggiuntivo: knitr
install.packages("knitr")
# Funzione library per richiamare il pacchetto: knitr
library(knitr)

# Codice per installare pacchetto aggiuntivo: RStoolbox
install.packages("RStoolbox")
# Funzione library per richiamare il pacchetto: RStoolbox
library(RStoolbox)
