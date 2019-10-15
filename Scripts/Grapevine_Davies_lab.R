#load packages

library(tidyverse)#for tidy stuff
library(cowplot)# for graphing stuff
library(readxl)#for reading Excel files


#assign primary data files to variables
Brix_Nuriootpa <- read_xlsx("Data/Nuri_Mothers_CordinateCrossReference.xlsx")
Brix_Irymple <- read_xlsx("Data/1st_gen_varieties_development_dates_and_ripening_Irymple_site.xlsx")
