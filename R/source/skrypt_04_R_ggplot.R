#Paczki
library(tidyverse)
library(tidyr)
library(ggplot2)

#dane hydrochemiczne
zab_hydrochemia <- read_csv("R/data/zab_hydrochemistry-lake.csv") |>
  mutate(date = lubridate::ymd(date))

# Wykres x = czas, y = wartosc Ca
ggplot(zab_hydrochemia, aes(date, ca)) +
  geom_line()

#pokolorowane glebokosc
ggplot(zab_hydrochemia, aes(date, ca, color = depth)) +
  geom_line()

#glebokosc jako wartosci dyskretne
ggplot(zab_hydrochemia, aes(date, ca, color = as.factor(depth))) +
  geom_line()

#facetowanie
ggplot(zab_hydrochemia, aes(date, ca, color = as.factor(depth))) +
  geom_line() +
  facet_wrap(dplyr::vars(depth))

#ncol
ggplot(zab_hydrochemia, aes(date, ca, color = as.factor(depth))) +
  geom_line() +
  facet_wrap(dplyr::vars(depth), ncol = 1)

#theme
ggplot(zab_hydrochemia, aes(date, ca, color = as.factor(depth))) +
  geom_line() +
  facet_wrap(dplyr::vars(depth), ncol = 1)+
  theme(panel.background = element_blank())

#skala kolor i lab
ggplot(zab_hydrochemia, aes(date, ca, color = as.factor(depth))) +
  geom_line() +
  scale_colour_viridis_d()+
  facet_wrap(dplyr::vars(depth), ncol = 1)+
  theme(panel.background = element_blank())+
  labs(x = "Datata", y = "Ca (mg/L)", title = "Fajny wykres", subtitle = "Nie do końca", color = "Głębokośc (m)")

#wczytaj temp_daily

zab_temp<-read_csv("R/data/zab_temperature-daily.csv")|>
  mutate(day = lubridate::ymd(day))

# wykres punktowy
ggplot(zab_temp, aes(day, temp_01))+
  geom_point()+
  geom_line(color = "red")

#wykres z seriami rozbitymi na panele, ws gleb
zab_temp |>
  pivot_longer(cols= -day, names_to = "glebokosc", values_to = "temperatura") |>
  ggplot(aes(day, temperatura))+
  geom_line()+
  facet_wrap(dplyr::vars(glebokosc), ncol = 1, scales = "free")
