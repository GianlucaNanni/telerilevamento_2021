# R_code_copernicus.r
# Visualizzazione dati Copernicus

# Funzione library per richiamare il pacchetto: raster
library(raster)

# Codice per installare pacchetto aggiuntivo: ncdf4
install.packages("ncdf4")

# Funzione library per leggere file: .nc
library(ncdf4)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Nome dataset: lswt (Lake Surface Water Temperature)
# Funzione raster per importare un singolo layer (strato)
lswt <- raster("c_gls_LSWT_202104010000_GLOBE_SLSTRAB_v1.1.0.nc")
