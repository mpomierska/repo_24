#załadowanie paczek
library(tidyverse)
library(readxl)

#wczytanie danych
data <- iris

#dodaj id
data <- data |>
  dplyr::mutate(id = 1:dplyr::n())

#zmien nazwy na male
data <- dplyr::rename_with(.data = data, .cols = everything(), \(a) tolower(a))

#pivotowanie ####
#Długi format
data_long <- data |>
  tidyr::pivot_longer(-c(id, species), names_to = "nazwy", values_to = "wartosc", )

#szeroki format
data_wide <- data_long |>
  tidyr::pivot_wider(names_from = nazwy, values_from = wartosc)

#ggplot2
#kolorowanie wg kolumny
data |>ggplot2::ggplot(aes(id, petal.length, color = species)) +
  geom_line() +
  facet_wrap(vars(species), scales = "free")

# Puste wartości ####
# Dodaj wartość NA w 49 i 68 wierszu, w 3 kolumnie, zapisz nową ramkę danych
data_na <- data

data_na[c(49, 68), 3]<- NA

#Porzuć wiersze z wartościami NA
data_na <- data_na |>
  tidyr::drop_na()

#Joins - operacje na ramkach ####
#wylistowanie dostępnych arkuszy w pliku excel
readxl::excel_sheets("R/data/data_msu.xlsx")

data_1 <- readxl::read_excel("R/data/data_msu.xlsx", sheet = "loi")

data_2 <- readxl::read_excel("R/data/data_msu.xlsx", sheet = "elemental")

data_3 <- readxl::read_excel("R/data/data_msu.xlsx", sheet = "bsi")

#Łączenie ramek (mutating join)
#Left join
data_4 <- left_join(data_1, data_2)

data_5 <- left_join(data_1, data_3)

data_6 <- left_join(data_1, data_3, by = join_by(sample.id == sample.id))

#łączenie do prawej ramki
data8<- right_join(data_2, data_3)

#łączenie wszystkiego - inner
data9<- full_join(data_3, data_1)

#inner
data10<- inner_join(data_1,data_2)

#semi join
data11<- semi_join(data_1,data_2, by = join_by(sample.id))

#anti join

data12<- anti_join(data_1, data_2, by = join_by(sample.id))


