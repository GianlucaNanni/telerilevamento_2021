# R_code_knitr.r

# USIAMO UN CODICE RINOMINATO (template) PER FARE FILE FINALE
# Codice per installare pacchetto aggiuntivo: knitr
# install.packages("knitr") #già installato
# Funzione library per richiamare il pacchetto: knitr
# library o require sono uguali
library(knitr)

# Codice per installare pacchetto aggiuntivo: RStoolbox
# install.packages("RStoolbox") #già installato
# Funzione library per richiamare il pacchetto: RStoolbox
library(RStoolbox)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/greenland") # Windows

# Codice per installare pacchetto aggiuntivo: tinytex
# install.packages("tinytex") #già installato
# Funzione library per richiamare il pacchetto: tinytex
library(tinytex)
tinytex::install_tinytex()

# Copiare un codice (Greenland) in Documento di testo (.txt) e copiare in (C:lab)
# OVERLEAF: genera output completamente compilato
# Funzione stitch: creare automaticamente un report basato su uno script di R
stitch("R_code_greenland.r.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
