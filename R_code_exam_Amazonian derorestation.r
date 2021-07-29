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
rlist <- list.files(pattern="amazon_deforestation") # pattern=scritta in comune nei file
