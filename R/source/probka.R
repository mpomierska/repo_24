library(tidyverse)
library(tidyr)
library(readxl)

staty_m<-read_excel("R/data/Zmienne.xlsx", sheet = "Muzyka")|>
  mutate(Data = lubridate::ymd(Data))
staty_s<-read_excel("R/data/Zmienne.xlsx", sheet = "Sen")|>
  mutate(Data = lubridate::ymd(Data))
staty_k<-read_excel("R/data/Zmienne.xlsx", sheet = "Kroki")|>
  mutate(Data = lubridate::ymd(Data))

ggplot(staty_m, aes(Data, Ilość))+
  geom_point()

srednia<-mean(staty_m[,2])
