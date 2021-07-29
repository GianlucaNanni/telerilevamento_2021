# R_code_exam_Amazonian derorestation.r
# Deforestazione Amazzonica avvenuta tra il 2001 e 2011

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/amazonian") # Windows

# Funzioni: library, necessarie per richiamare i pacchetti per la realizzazione del progetto
require(raster)
library(rasterdiv)
library(RStoolbox) # for vegetation indices calculation

# Importare i file tutti insieme (invece che singolarmente)
# Funzione list.files: crea lista di file per la funzione lapply 
alist <- list.files(pattern="amazon_deforestation") # pattern=scritta in comune nei file
# Funzione per avere le info sul file
alist
# Funzione lapply: applica alla lista dei file una funzione (raster) 
import <- lapply(alist,raster)
# Funzione per avere le info sul file
import
# Funzione stack: raggruppa e rinomina, in un unico pacchetto, i file raster separati
TGa <- stack(import)
# Funzione per avere le info sul file
TGa
# Funzione plot: del singolo file
plot(TGa)
# Funzione plotRGB: crea plot con immagini sovrapposte
plotRGB(TGa, 1, 2, 3, stretch="Lin") # a seconda del colore i valori sono più alti
# Funzione ggr: plotta file raster in differenti scale di grigio, migliorando la qualità dell'immagine e aggiungengo le coordinate spaziali sugli assi x e y
ggRGB(TGa, r=1, g=2, b=3, stretch="lin")
