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
