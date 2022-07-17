library(tidyverse)
library(here)
library(vegan)
library(BiodiversityR)

df_richness <- read.csv(here::here("Data", "Data_diatoms_composition.csv"),
    header = TRUE, sep = ";", dec = ",")

View(df_richness)


