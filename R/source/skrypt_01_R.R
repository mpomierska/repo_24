#Skrypt dzień pierwszy

#załaduj biblioteki/paczki
library(tidyverse)

# Dane z internetu
dane_internetowe <-readr::read_csv("https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv")

dane_dysk_01 <-readr::read_csv("C:/GitHub/Projekty/repo_24/R/data/annual-enterprise-survey-2023-financial-year-provisional.csv")

# dane z dysku - sciezka wzgledna
dane_dysk_02 <- readr::read_csv("R/data/annual-enterprise-survey-2023-financial-year-provisional.csv")

# zmiana kolumny tekst na liczbe

dane_dysk_02$Value<-as.numeric(dane_dysk_02$Value)

# Parsowanie tekstu na liczbę
dane_dysk_01$Value <- readr::parse_number(dane_dysk_01$Value)

#sprawdzenie wiersza 748
dane_internetowe[748, "Value"]

#dodanie nowej wartości
dane_internetowe[700, "Industry_aggregation_NZSIOC"]<-"Level 11"
