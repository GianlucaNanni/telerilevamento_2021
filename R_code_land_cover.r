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
# Funzione library per richiamare il pacchetto:
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

# dataframe
