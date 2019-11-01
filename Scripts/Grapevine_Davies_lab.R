#load packages

library(tidyverse)#for tidy stuff
library(cowplot)# for graphing stuff
library(readxl)#for reading Excel files


#assign primary data files to variables
Brix_Nuriootpa <- read_xlsx("Data/Nuri_Mothers_CordinateCrossReference.xlsx", skip = 1)
Brix_Irymple <- read_xlsx("Data/1st_gen_varieties_development_dates_and_ripening_Irymple_site.xlsx")
head(Brix_Nuriootpa)

view(Brix_Nuriootpa)
Brix_Nuriootpa %>% 
 



Brix_Nuriootpa[5] <- as.character(as.numeric(Brix_Nuriootpa[5]))

head(Brix_Nuriootpa)




test <- Brix_Nuriootpa %>% 
  ggplot(aes(x = "Current Panel Position", y = c(5:15)))+
  geom_line()

view(test)
