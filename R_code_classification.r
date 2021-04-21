# R_code_classification.r

# Funzione library per richiamare il pacchetto raster
library(raster)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/") # Windows

# Funzione brick per importare i dati/immagine
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# Funzione per avere le info sul 
so

# Funzione plotRGB: crea immagini multibanda
plotRGB(so, 1, 2, 3, stretch="lin")
