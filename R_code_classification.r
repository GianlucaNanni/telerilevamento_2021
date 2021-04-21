# R_code_classification.r

# Funzione library per richiamare il pacchetto raster
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

# Funzione unsuperClass :opera la classificazione non supervisionata
soc <- unsuperClass(so, nClasses=3)
# Nuovo plot col cambio di colori
plot(soc$map)

# Funzione unsuperClass :opera la classificazione non supervisionata
# A 20 classi
sotw <- unsuperClass(so, nClasses=20)
# Nuovo plot col cambio di colori
plot(sotw$map)

