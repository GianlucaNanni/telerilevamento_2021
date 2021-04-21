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

# Funzione unsuperClass: opera la classificazione non supervisionata
soc <- unsuperClass(so, nClasses=3)
# Cambio di colori
cl <- colorRampPalette(c('yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(soc$map,col=cl) # Oppure plot(soc$map) se NON c'è la colorRampPalette prima


# Funzione unsuperClass: opera la classificazione non supervisionata
# A 20 classi
sotw <- unsuperClass(so, nClasses=20)
# Cambio di colori
cls <- colorRampPalette(c('yellow','red','black'))(100)
# Nuovo plot col cambio di colori
plot(sotw$map,col=cls) 


## Download immagine da: https://www.esa.int/ESA_Multimedia/Missions/Solar_Orbiter/(result_type)/images
# Funzione brick per importare i dati/immagine
sun <- brick("sun.png")

# Funzione unsuperClass: opera la classificazione non supervisionata
sunc <- unsuperClass(sun, nClasses=3)
# Plot:
plot(sunc$map)


