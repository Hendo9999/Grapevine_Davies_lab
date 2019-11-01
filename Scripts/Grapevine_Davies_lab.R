#load packages
install.packages("janitor")

library(janitor)#help Excel manipulation e.g. has clean_names function useful for dodgy excel column names
library(tidyverse)#for tidy stuff
library(cowplot)# for graphing stuff
library(readxl)#for reading Excel files
library(lubridate)#good package for working with data/time data

#assign primary data files to variables
brix_nuriootpa <- read_xlsx("Data/Nuri_Mothers_CordinateCrossReference.xlsx", skip = 1)
  
#Brix_Irymple <- read_xlsx("Data/1st_gen_varieties_development_dates_and_ripening_Irymple_site.xlsx")


#clean dataframe ie. sort out column names
brix_nuri_clean <- brix_nuriootpa %>% 
  clean_names() %>%
  mutate_at(vars(x16_01_2018_preveraison_or_brix:x26_03_2018_brix), as.numeric)

#convert harvest_date from excel numerical to date format
brix_nuri_clean$harvest_date <- excel_numeric_to_date(as.numeric(as.character(brix_nuri_clean$harvest_date)), date_system = "modern")
brix_nuri_clean <- mutate(brix_nuri_clean, harvest_date = as.character(as.Date(harvest_date, "%m/%d/%Y"),"%d/%m/%y"))


glimpse(brix_nuri_clean)

#rename columns to make them easier to read
brix_nuri_rename <- brix_nuri_clean %>%
  rename(x160118 = x16_01_2018_preveraison_or_brix, x230118 = x23_01_2018_preveraison_or_brix, x300118 = x30_01_2018_preveraison_or_brix, x070218 = x07_02_2018_preveraison_or_brix, x120218 = x12_02_2018_preveraison_or_brix, x190218 = x19_02_2018_preveraison_or_brix, x260218 = x26_02_2018_preveraison_or_brix, x050318 = x5_03_2018_preveraison_or_brix, x130318 = x13_03_18_brix, x190318 = x19_03_2018_brix, x260318 = x26_03_2018_brix)


#use gather to 'tidy' data 
brix_nuri_tidy <- brix_nuri_rename %>% 
  gather(key = "Date", value = "Brix", x160118:x260318)


#use mutate to remove x from date values
brix_nuri_tidy1 <- brix_nuri_tidy %>% 
  mutate(Date = str_remove(Date, "x"))

#graphing dates
brix_nuri_tidy2 <- brix_nuri_tidy1 %>% 
  mutate(Date = dmy(Date)) #functioin from lubridate package to enable conversion of values in Date column into a format for graphing


plot_nuri <- brix_nuri_tidy2 %>% 
  ggplot(aes(x=Date, y=Brix, colour = colour))+
  geom_line()
  

plot_nuri


#temp$x16_01_2018_preveraison_or_brix <- as.numeric(temp$x16_01_2018_preveraison_or_brix) converting single column to numeric


